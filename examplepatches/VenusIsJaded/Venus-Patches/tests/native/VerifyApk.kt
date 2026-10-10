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

fun main(args: Array<String>) {
    require(args.isNotEmpty()) { "Usage: VerifyApkKt patched.apk [signed]" }
    val apk = File(args[0])
    ZipFile(apk).use { zip ->
        val script = zip.getInputStream(zip.getEntry("assets/venus/bootstrap.js")).bufferedReader().readText()
        check("/*__FEATURES__*/" !in script) { "Unresolved feature selection placeholder" }
        check(Regex("const features\\s*=\\s*\\{picker:").containsMatchIn(script))
        val metadata = zip.getInputStream(zip.getEntry("assets/venus/injection.json")).bufferedReader().readText()
        // The recorded revision must match the runtime that was actually injected.
        val revision = Regex("const revision\\s*=\\s*\"([^\"]+)\"").find(script)!!.groupValues[1]
        check("\"revision\":\"$revision\"" in metadata) { "injection.json revision does not match the runtime" }
        for (feature in listOf("copyBios", "dashless", "favouriteAnything", "freeNitro", "noTyping", "quickDelete", "noDelete", "jumpToTop", "hiddenChannels", "pastelize", "platformIndicators", "reviewDB", "readAll", "quests"))
            check("$feature:true" in script) { "Missing selected feature: $feature" }
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
        check(header.getInt(large + 44) == 0 && header.getInt(large + 48) == number("prefixSize") - 7)
        check(header.getInt(large + 52) == number("prefixSize") - 2)
        val hash = MessageDigest.getInstance("SHA-256")
        hash.update(hbc, offset + number("prefixSize"), number("originalCodeSize"))
        check(hash.digest().joinToString("") { "%02x".format(it) } ==
            "2194f87abbb4382c4c4a8955501fe2d6db1f1d74702ff7b8fc87200d5196c74a")
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
    val extensionClasses = allClasses.values.filter { it.type.startsWith("Lapp/venus/extension/") }
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
    if (args.getOrNull(1) == "signed") {
        val verification = ApkVerifier.Builder(apk).setMinCheckedPlatformVersion(26).build().verify()
        check(verification.isVerified) { "APK signature invalid: ${verification.errors}" }
        println("APK signing certificate and signature verified")
    }
    println("PASS: no private startup invocation, one main bundle load, guarded HBC98 prelude and footer, preserved original global instructions, host extension method/field/type linkage, ordinary-size bypass, unique classes, valid registers, stubs excluded")
}
