import com.android.apksig.ApkVerifier
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.io.File
import java.security.MessageDigest
import java.util.zip.ZipFile
import java.nio.ByteBuffer
import java.nio.ByteOrder
import com.android.apksig.apk.ApkUtils
import com.android.apksig.util.DataSources
import com.android.apksig.internal.apk.AndroidBinXmlParser
import java.io.RandomAccessFile

fun main(args: Array<String>) {
    require(args.isNotEmpty()) { "Usage: VerifyApkKt patched.apk [signed] [--some]   (--some: not every patch was selected)" }
    val apk = File(args[0])
    ZipFile(apk).use { zip ->
        val script = zip.getInputStream(zip.getEntry("assets/venus/bootstrap.js")).bufferedReader().readText()
        check("/*__FEATURES__*/" !in script) { "Unresolved feature selection placeholder" }
        check(Regex("const features\\s*=\\s*\\{picker:").containsMatchIn(script))
        val metadata = zip.getInputStream(zip.getEntry("assets/venus/injection.json")).bufferedReader().readText()
        // The recorded revision must match the runtime that was actually injected.
        val revision = Regex("const revision\\s*=\\s*\"([^\"]+)\"").find(script)!!.groupValues[1]
        check("\"revision\":\"$revision\"" in metadata) { "injection.json revision does not match the runtime" }
        // Every feature the runtime knows is in the selection object; with every patch on, all of them are true.
        // Read from the APK itself, so the list never goes stale when a feature is added.
        val selection = Regex("const features\\s*=\\s*\\{([^}]*)\\}").find(script)!!.groupValues[1]
        val chosen = selection.split(",").map { it.split(":") }.associate { it[0].trim() to it.getOrNull(1)?.trim() }
        check(chosen.size >= 30 && chosen.values.all { it == "true" || it == "false" }) { "Malformed feature selection: $selection" }
        if ("--some" !in args.drop(1)) check(chosen.values.all { it == "true" }) { "Not selected: ${chosen.filterValues { it != "true" }.keys}" }
        check("VenusRoot" !in script && "RN.Modal" !in script && "registerRoot" !in script)
        check("SETTING_RENDERER_CONFIG" in script && "VENUS_FREENITRO" in script)
        fun number(key: String) = Regex("\"$key\":([0-9]+)").find(metadata)!!.groupValues[1].toInt()
        val hbc = zip.getInputStream(zip.getEntry("assets/index.android.bundle")).readBytes()
        val header = ByteBuffer.wrap(hbc).order(ByteOrder.LITTLE_ENDIAN)
        check(header.getInt(8) == 98 && header.getInt(32) == hbc.size && header.getInt(36) == 0)
        val large = (((header.getInt(132) ushr 14) and 255) shl 24) or (header.getInt(128) and 0x1ffffff)
        val offset = header.getInt(large)
        check(offset == number("codeOffset"))
        check(header.getInt(large + 12) == number("prefixSize") + number("originalCodeSize"))
        check(hbc[large + 36].toInt() and 8 != 0 && hbc[large + 36].toInt() and 16 == 0)
        check(header.getInt(large + 40) == 1)
        // The prelude ends: JmpLong +7 over Catch r14, then LoadConstUndefined r15 and r16 that both paths run, so the
        // exception range ends at the jump and the handler is the Catch.
        val prefix = number("prefixSize")
        val tail = offset + prefix - 11
        check(header.getInt(large + 44) == 0 && header.getInt(large + 48) == prefix - 11) { "Exception range doesn't end at the prelude's jump" }
        check(header.getInt(large + 52) == prefix - 6) { "Exception handler isn't the prelude's Catch" }
        check(hbc[tail].toInt() and 255 == 175 && ByteBuffer.wrap(hbc, tail + 1, 4).order(ByteOrder.LITTLE_ENDIAN).getInt() == 7 &&
            hbc[tail + 5].toInt() and 255 == 119 && hbc[tail + 7].toInt() and 255 == 147 && hbc[tail + 9].toInt() and 255 == 147) { "Prelude tail changed" }
        val hash = MessageDigest.getInstance("SHA-256")
        hash.update(hbc, offset + number("prefixSize"), number("originalCodeSize"))
        check(hash.digest().joinToString("") { "%02x".format(it) } ==
            app.venus.patches.HbcPrelude.GLOBAL_SHA256) { "Discord's own global code changed under the prelude" }
        val footer = MessageDigest.getInstance("SHA-1")
        footer.update(hbc, 0, hbc.size - 20)
        check(footer.digest().contentEquals(hbc.copyOfRange(hbc.size - 20, hbc.size)))
    }
    val dex = DexFileFactory.loadDexContainer(apk, Opcodes.getDefault())
    val instances = dex.dexEntryNames.flatMap { name ->
        dex.getEntry(name)!!.dexFile.classes.filter { it.type == "Lcom/facebook/react/runtime/ReactInstance;" }
    }
    check(instances.size == 1) { "Expected one ReactInstance definition, got ${instances.size}" }
    val owner = instances.single()
    val method = owner.methods.single { it.name == "loadJSBundle" }
    val implementation = method.implementation!!
    val instructions = implementation.instructions.toList()
    check(implementation.registerCount == 4)
    for (instruction in instructions) {
        val registers = when (instruction) {
            is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD,
                instruction.registerE, instruction.registerF, instruction.registerG).take(instruction.registerCount)
            is ThreeRegisterInstruction -> listOf(instruction.registerA, instruction.registerB, instruction.registerC)
            is TwoRegisterInstruction -> listOf(instruction.registerA, instruction.registerB)
            is OneRegisterInstruction -> listOf(instruction.registerA)
            else -> emptyList()
        }
        check(registers.all { it < implementation.registerCount }) { "Out of range DEX register" }
    }
    val refs = instructions.mapNotNull { (it as? ReferenceInstruction)?.reference }
    val assets = refs.filterIsInstance<StringReference>().map { it.string }
    check("assets://venus/bootstrap.js" !in assets && "assets://index.android.bundle" in assets)
    val calls = refs.filterIsInstance<MethodReference>().map { it.name }
    check(calls.count { it == "createAssetLoader" } == 1)
    check(calls.none { it == "loadJSBundleFromAssets" || it == "loadJSBundleFromFile" }) {
        "Private native loader must not be invoked from the patched entry point"
    }
    check(calls.count { it == "loadScript" } == 1) { "Expected one main bundle load" }
    val abiErrors = mutableListOf<String>()
    val allClasses = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }.associateBy { it.type }
    fun resolve(reference: MethodReference, type: String = reference.definingClass, seen: MutableSet<String> = mutableSetOf()): Method? {
        if (!seen.add(type)) return null
        val definition = allClasses[type] ?: return null
        return definition.methods.firstOrNull {
            it.name == reference.name && it.parameterTypes == reference.parameterTypes && it.returnType == reference.returnType
        } ?: definition.superclass?.let { resolve(reference, it, seen) }
            ?: definition.interfaces.firstNotNullOfOrNull { resolve(reference, it, seen) }
    }
    // A successful D8 build does not prove that an obfuscated host supplies Kotlin helper ABIs.
    // Check real definitions (including inherited methods), not the compiler's stock stdlib.
    val extensionClasses = allClasses.values.filter {
        it.type.startsWith("Lapp/venus/extension/") || it.type.startsWith("Lapp/venus/chat/")
    }
    val references = extensionClasses.flatMap { definition -> definition.methods.flatMap { method ->
        method.implementation?.instructions?.mapNotNull { (it as? ReferenceInstruction)?.reference }?.toList() ?: emptyList()
    } }.distinct()
    fun resolveField(reference: FieldReference, type: String = reference.definingClass, seen: MutableSet<String> = mutableSetOf()): Field? {
        if (!seen.add(type)) return null
        val definition = allClasses[type] ?: return null
        return definition.fields.firstOrNull { it.name == reference.name && it.type == reference.type }
            ?: definition.superclass?.let { resolveField(reference, it, seen) }
            ?: definition.interfaces.firstNotNullOfOrNull { resolveField(reference, it, seen) }
    }
    fun isHost(type: String) = type.startsWith("Lkotlin/") || type.startsWith("Lapp/venus/") ||
        type.startsWith("Lcom/facebook/react/")
    for (reference in references) {
        when (reference) {
            is MethodReference -> if (isHost(reference.definingClass)) {
                val resolved = resolve(reference)
                if (resolved == null) abiErrors.add("Unresolved extension dependency: $reference")
                else if (!reference.definingClass.startsWith("Lapp/venus/") && resolved.accessFlags and 0x1 == 0)
                    abiErrors.add("Non-public host dependency: $reference")
            }
            is FieldReference -> if (isHost(reference.definingClass)) {
                val resolved = resolveField(reference)
                if (resolved == null) abiErrors.add("Unresolved extension field: $reference")
                else if (!reference.definingClass.startsWith("Lapp/venus/") && resolved.accessFlags and 0x1 == 0)
                    abiErrors.add("Non-public host field: $reference")
            }
            is TypeReference -> if (isHost(reference.type) && reference.type !in allClasses)
                abiErrors.add("Unresolved extension type: $reference")
        }
    }
    check(abiErrors.isEmpty()) { abiErrors.joinToString("\n") }
    // Quest Completer: Discord's User-Agent interceptor lets a Windows desktop agent through, and only that.
    val interceptors = dex.dexEntryNames.flatMap { name ->
        dex.getEntry(name)!!.dexFile.classes.filter { it.type == "Lcom/discord/client_info/ClientUserAgent\$DiscordUserAgentInterceptor;" }
    }
    check(interceptors.size == 1) { "Expected one User-Agent interceptor" }
    val intercept = interceptors.single().methods.single { it.name == "intercept" }.implementation!!
    val interceptCode = intercept.instructions.toList()
    val agentStrings = interceptCode.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
    check(intercept.registerCount == 5 && interceptCode.size == 29) { "Unexpected interceptor size ${interceptCode.size}" }
    check(agentStrings.first() == "User-Agent" &&
        agentStrings[1] == "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) discord/") { "Desktop agent guard missing" }
    check(interceptCode[12].opcode == Opcode.RETURN_OBJECT && interceptCode[13].opcode == Opcode.NOP)
    // Discord's own code after the guard still forces Discord-Android on every other request.
    check(interceptCode.drop(14).any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
        ref.definingClass == "Lokhttp3/Request\$Builder;" && ref.name == "a" } == true })
    val fileModules = dex.dexEntryNames.flatMap { name ->
        dex.getEntry(name)!!.dexFile.classes.filter { it.type == "Lcom/discord/file_manager/FileModule;" }
    }
    check(fileModules.size == 1) { "Expected one FileModule definition" }
    val bridge = fileModules.single().methods.single { it.name == "getSize" }
    val bridgeRefs = bridge.implementation!!.instructions.mapNotNull { (it as? ReferenceInstruction)?.reference }
    val bridgeInstructions = bridge.implementation!!.instructions.toList()
    val prefixGuard = bridgeInstructions.indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
            ref.definingClass == "Ljava/lang/String;" && ref.name == "startsWith"
        } == true
    }
    val dispatchCall = bridgeInstructions.indexOfFirst {
        ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass == "Lapp/venus/extension/VoiceProcessor;"
    }
    check(prefixGuard >= 0 && prefixGuard < dispatchCall) { "Ordinary getSize calls must bypass extension linkage" }
    check(bridgeInstructions.subList(prefixGuard + 1, dispatchCall).any { it.opcode == Opcode.IF_EQZ })
    check(bridgeRefs.filterIsInstance<MethodReference>().any {
        it.definingClass == "Lapp/venus/extension/VoiceProcessor;" && it.name == "dispatch"
    }) { "Native conversion dispatch missing from getSize" }
    val processors = dex.dexEntryNames.flatMap { name ->
        dex.getEntry(name)!!.dexFile.classes.filter { it.type == "Lapp/venus/extension/VoiceProcessor;" }
    }
    check(processors.size == 1) { "Expected one native conversion extension" }
    check(processors.single().methods.any { it.name == "dispatch" })
    val promises = dex.dexEntryNames.sumOf { name ->
        dex.getEntry(name)!!.dexFile.classes.count { it.type == "Lcom/facebook/react/bridge/Promise;" }
    }
    check(promises == 1) { "Compile-only Promise stub leaked into the APK" }
    // Every branch, try range and handler in every patched or added method lands on an instruction start.
    // ART refuses a class with a bad branch, so one broken guard (1.5.0's double getSize guard) freezes Discord at boot.
    for (name in dex.dexEntryNames) for (cls in dex.getEntry(name)!!.dexFile.classes) for (method in cls.methods) {
        val implementation = method.implementation ?: continue
        val code = implementation.instructions.toList()
        val starts = HashSet<Int>(); val at = IntArray(code.size); var pc = 0
        for ((i, instruction) in code.withIndex()) { at[i] = pc; starts += pc; pc += instruction.codeUnits }
        for ((i, instruction) in code.withIndex()) if (instruction is com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction)
            check(at[i] + instruction.codeOffset in starts) { "$name ${cls.type}->${method.name}: branch at ${at[i]} lands inside an instruction" }
        for (block in implementation.tryBlocks) {
            check(block.startCodeAddress in starts) { "$name ${cls.type}->${method.name}: try block inside an instruction" }
            block.exceptionHandlers.forEach { check(it.handlerCodeAddress in starts) { "$name ${cls.type}->${method.name}: handler inside an instruction" } }
        }
    }
    // Force system font, when selected: its reopen request owns fileExists, never getSize.
    val fontBridge = fileModules.single().methods.single { it.name == "fileExists" }
    val fontCalls = fontBridge.implementation!!.instructions.mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass }
    if ("Lapp/venus/font/SystemFont;" in fontCalls)
        check(bridgeRefs.filterIsInstance<MethodReference>().none { it.definingClass == "Lapp/venus/font/SystemFont;" }) { "Font bridge must not share getSize" }
    // Force system emojis, when selected: its reopen request owns getVideoDimensions, never a bridge another feature uses.
    val videoBridge = fileModules.single().methods.single { it.name == "getVideoDimensions" }
    val videoCalls = videoBridge.implementation!!.instructions.mapNotNull { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass }
    if ("Lapp/venus/emoji/SystemEmoji;" in videoCalls) {
        check(videoCalls.count { it.startsWith("Lapp/venus/") } == 1) { "getVideoDimensions has more than one Venus guard" }
        check(fontCalls.none { it == "Lapp/venus/emoji/SystemEmoji;" } && bridgeRefs.filterIsInstance<MethodReference>().none { it.definingClass == "Lapp/venus/emoji/SystemEmoji;" }) { "Emoji bridge must not share another FileModule method" }
    }
    val some = "--some" in args.drop(1)
    ZipFile(apk).use { zip -> checkPackaging(zip, some) }
    checkManifest(apk)
    // Every Venus extension the .mpp carries made it into the APK's DEX.
    for (pkg in listOf("audio", "chat", "emoji", "extension", "font", "i18n", "monet"))
        check(allClasses.keys.any { it.startsWith("Lapp/venus/$pkg/") }) { "No app.venus.$pkg classes in the APK" }
    if ("signed" in args.drop(1)) {
        val verification = ApkVerifier.Builder(apk).setMinCheckedPlatformVersion(26).build().verify()
        check(verification.isVerified) { "APK signature invalid: ${verification.errors}" }
        println("APK signing certificate and signature verified")
    }
    println("PASS: privacy stubs in place, language files, manifest and providers renamed together, 16 KB aligned native libraries, every extension, no private startup invocation, one main bundle load, guarded HBC98 prelude and footer, preserved original global instructions, host extension method/field/type linkage, ordinary-size bypass, instruction-aligned branches in every method, unique classes, valid registers, stubs excluded")
}

/**
 * What the APK carries besides code: the privacy stubs really overwrote their targets, the language files are the ones in
 * the repository, and native libraries can be mapped straight from the APK (extractNativeLibs=false).
 */
fun checkPackaging(zip: ZipFile, some: Boolean) {
    // Privacy: the prelude only appends to the bundle, so every target is still at its pinned offset. Each group is all
    // stubbed (selected) or all original (not selected); a mix means a stub went to the wrong place.
    val hbc = zip.getInputStream(zip.getEntry("assets/index.android.bundle")).readBytes()
    val groups = mapOf("analytics" to app.venus.patches.HbcPrivacy.analytics, "telemetry" to app.venus.patches.HbcPrivacy.telemetry,
        "crash" to app.venus.patches.HbcPrivacy.crash)
    for ((group, targets) in groups) {
        val stubbed = targets.count { target ->
            val body = hbc.copyOfRange(target.offset, target.offset + target.size)
            val stub = app.venus.patches.HbcPrivacy.stub(target)
            body.copyOfRange(0, stub.size).contentEquals(stub) && body.drop(stub.size).all { it.toInt() == 0 }
        }
        val original = targets.count { app.venus.patches.HbcPrivacy.digest(hbc.copyOfRange(it.offset, it.offset + it.size)) == it.sha256 }
        check(stubbed == targets.size || (some && original == targets.size)) {
            "Privacy $group: $stubbed of ${targets.size} stubbed, $original original"
        }
        // Their compact headers are untouched: a stub never changes a function's size or frame.
        for (target in targets) check(hbc.copyOfRange(128 + target.id * 12, 140 + target.id * 12)
            .contentEquals(app.venus.patches.HbcPrivacy.hex(target.header))) { "Privacy $group: header of ${target.name} #${target.id} changed" }
    }
    // Languages: exactly the files the repository lists, byte for byte.
    val folder = File("patches/src/main/resources/venus/i18n")
    val codes = File(folder, "index.txt").readLines().map { it.trim() }.filter { it.isNotEmpty() }
    check(codes.size >= 10) { "Language index looks empty" }
    for (code in codes) {
        val entry = zip.getEntry("assets/venus/i18n/$code.json") ?: error("assets/venus/i18n/$code.json missing")
        check(zip.getInputStream(entry).readBytes().contentEquals(File(folder, "$code.json").readBytes())) { "assets/venus/i18n/$code.json differs from the repository" }
    }
    val shipped = zip.entries().asSequence().map { it.name }.filter { it.startsWith("assets/venus/i18n/") && it.endsWith(".json") }.count()
    check(shipped == codes.size) { "$shipped language files in the APK, ${codes.size} in index.txt" }
    // Native libraries: stored and 16 KB aligned, so Android maps them from the APK on 4 KB and 16 KB page devices alike.
    RandomAccessFile(zip.name, "r").use { raf ->
        var libraries = 0
        for (entry in zip.entries()) {
            if (!entry.name.startsWith("lib/") || !entry.name.endsWith(".so")) continue
            libraries++
            check(entry.method == java.util.zip.ZipEntry.STORED) { "${entry.name} is compressed" }
            val local = localHeaderOffset(raf, entry.name)
            raf.seek(local + 26)
            val nameLength = raf.readUnsignedByte() or (raf.readUnsignedByte() shl 8)
            val extraLength = raf.readUnsignedByte() or (raf.readUnsignedByte() shl 8)
            val data = local + 30 + nameLength + extraLength
            check(data % 16384 == 0L) { "${entry.name} starts at $data, not 16 KB aligned" }
        }
        check(libraries > 0) { "No native libraries" }
    }
}

/** Local header offsets from the ZIP's central directory (java.util.zip doesn't expose them). */
private var centralDirectory: Map<String, Long>? = null
fun localHeaderOffset(raf: RandomAccessFile, name: String): Long {
    centralDirectory?.let { return it[name] ?: error("$name not in the central directory") }
    val length = raf.length()
    val tail = ByteArray(minOf(length, 65557L).toInt())
    raf.seek(length - tail.size); raf.readFully(tail)
    val end = (tail.size - 22 downTo 0).first { ByteBuffer.wrap(tail, it, 4).order(ByteOrder.LITTLE_ENDIAN).int == 0x06054b50 }
    val eocd = ByteBuffer.wrap(tail).order(ByteOrder.LITTLE_ENDIAN)
    val size = eocd.getInt(end + 12).toLong() and 0xffffffffL
    val start = eocd.getInt(end + 16).toLong() and 0xffffffffL
    val directory = ByteArray(size.toInt()).also { raf.seek(start); raf.readFully(it) }
    val buffer = ByteBuffer.wrap(directory).order(ByteOrder.LITTLE_ENDIAN)
    val map = HashMap<String, Long>()
    var at = 0
    while (at + 46 <= directory.size && buffer.getInt(at) == 0x02014b50) {
        val nameLength = buffer.getShort(at + 28).toInt() and 0xffff
        val extra = buffer.getShort(at + 30).toInt() and 0xffff
        val comment = buffer.getShort(at + 32).toInt() and 0xffff
        map[String(directory, at + 46, nameLength, Charsets.UTF_8)] = buffer.getInt(at + 42).toLong() and 0xffffffffL
        at += 46 + nameLength + extra + comment
    }
    centralDirectory = map
    return map[name] ?: error("$name not in the central directory")
}

/**
 * The manifest still describes the Discord build Venus targets, and every provider authority and app permission uses the
 * APK's own package name. Custom branding renames them together; one left behind stops the copy installing next to Discord.
 */
fun checkManifest(apk: File) {
    RandomAccessFile(apk, "r").use { raf ->
        val parser = AndroidBinXmlParser(ApkUtils.getAndroidManifest(DataSources.asDataSource(raf)))
        fun attr(name: String) = (0 until parser.attributeCount).firstOrNull { parser.getAttributeName(it) == name }
            ?.let { runCatching { parser.getAttributeStringValue(it) }.getOrNull() }
        var pkg: String? = null
        val stray = mutableListOf<String>()
        var event = parser.eventType
        while (event != AndroidBinXmlParser.EVENT_END_DOCUMENT) {
            if (event == AndroidBinXmlParser.EVENT_START_ELEMENT) when (parser.name) {
                "manifest" -> {
                    pkg = attr("package")
                    check(attr("versionCode") == "350008" && attr("versionName") == "350.8 - Stable") {
                        "Manifest is ${attr("versionName")} (${attr("versionCode")}), not Discord 350.8 - Stable"
                    }
                }
                "provider" -> attr("authorities")?.split(";")?.filter { !it.startsWith("$pkg.") }?.let { stray += it }
                "permission" -> attr("name")?.let { if (!it.startsWith("$pkg.")) stray += it }
            }
            event = parser.next()
        }
        check(pkg != null && Regex("^[a-z][a-z0-9_]*(\\.[a-z][a-z0-9_]*)+$").matches(pkg)) { "Bad package name $pkg" }
        check(stray.isEmpty()) { "Not renamed to $pkg: $stray" }
        println("Manifest: $pkg, Discord 350.8 - Stable, providers and permissions under $pkg")
    }
}
