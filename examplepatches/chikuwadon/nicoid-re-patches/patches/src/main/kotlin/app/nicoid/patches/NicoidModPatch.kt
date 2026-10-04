package app.nicoid.patches

import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.util.FieldUtil
import com.android.tools.smali.dexlib2.util.MethodUtil
import java.io.BufferedInputStream
import java.security.MessageDigest
import java.util.zip.ZipInputStream

private object Payload {
    fun open(name: String) = checkNotNull(javaClass.getResourceAsStream("/nicoid/$name")) {
        "Missing nicoid patch payload: $name"
    }
}

private val nicoid649 = Compatibility(
    name = "nicoid",
    packageName = "com.sauzask.nicoid",
    apkFileType = ApkFileType.APK,
    targets = listOf(AppTarget(version = "6.49"))
)

// Raw compiled resource differences preserve the exact IDs referenced by the original smali.
// Input DEX, manifest and resource table must match the supplied original before any write.
private val nicoidResources = rawResourcePatch {
    compatibleWith(nicoid649)
    execute {
        // RAW_ONLY stages compiled resources differently from decoded resource patches.
        val root = get("classes.dex").parentFile
        val workspace = root.parentFile
        fun original(path: String) = when (path) {
            "AndroidManifest.xml" -> workspace.resolve("AndroidManifest.xml.bin")
            "resources.arsc" -> workspace.resolve(path)
            else -> root.resolve(path)
        }
        Payload.open("input-hashes.txt").bufferedReader().useLines { lines ->
            lines.filter { it.isNotBlank() }.forEach { line ->
                val (expected, path) = line.split(" ", limit = 2)
                val digest = MessageDigest.getInstance("SHA-256")
                original(path).inputStream().use { input ->
                    val buffer = ByteArray(8192)
                    while (true) {
                        val size = input.read(buffer)
                        if (size < 0) break
                        digest.update(buffer, 0, size)
                    }
                }
                val actual = digest.digest().joinToString("") { "%02x".format(it.toInt() and 255) }
                check(actual == expected) { "Unsupported input APK: $path differs from the tested nicoid 6.49." }
            }
        }
        ZipInputStream(Payload.open("resources.zip")).use { zip ->
            while (true) {
                val entry = zip.nextEntry ?: break
                val path = entry.name
                check(!path.contains("..") && !path.startsWith("/") &&
                    (path == "AndroidManifest.xml" || path == "resources.arsc" || path.startsWith("res/")))
                // Root entries are the files Morphe carries into the rebuilt APK.
                // The raw decoder's .bin manifest is a read-only input for verification.
                val output = root.resolve(path)
                output.parentFile.mkdirs()
                val bytes = zip.readBytes()
                output.writeBytes(bytes)
                zip.closeEntry()
            }
        }
    }
}


@Suppress("unused")
val nicoidModPatch = bytecodePatch(
    name = "nicoid Re",
    description = "Morphe patch for nicoid. Supports the current NicoNico video service, dark mode, and Android 16, with additional feature improvements.",
    default = true
) {
    compatibleWith(nicoid649)
    dependsOn(nicoidResources)
    extendWith("nicoid/helpers.mpe")
    execute {
        BufferedInputStream(Payload.open("method-delta.dex")).use { stream ->
            val delta = DexBackedDexFile.fromInputStream(Opcodes.getDefault(), stream)
            for (source in delta.classes) {
                val target = mutableClassDefBy(source.type)
                check(target.superclass == source.superclass) { "Unexpected class hierarchy: ${source.type}" }
                // Materialize all views before editing so lazy direct/virtual views stay in sync.
                val methods = target.methods
                val direct = target.directMethods
                val virtual = target.virtualMethods
                for (method in source.methods) {
                    val prior = methods.filter { it.name == method.name &&
                        it.parameterTypes == method.parameterTypes && it.returnType == method.returnType }
                    methods.removeAll(prior.toSet())
                    direct.removeAll(prior.toSet())
                    virtual.removeAll(prior.toSet())
                    val replacement = method.toMutable()
                    methods.add(replacement)
                    if (MethodUtil.isDirect(method)) direct.add(replacement) else virtual.add(replacement)
                }
                val fields = target.fields
                val static = target.staticFields
                val instance = target.instanceFields
                fields.clear(); static.clear(); instance.clear()
                for (field in source.fields) {
                    val replacement = field.toMutable()
                    fields.add(replacement)
                    if (FieldUtil.isStatic(field)) static.add(replacement) else instance.add(replacement)
                }
                target.setAccessFlags(source.accessFlags)
            }
        }
        val cache = mutableClassDefBy("Le/e/a/CacheHls;")
        val download = cache.methods.single { it.name == "download" }
        val firstParameter = checkNotNull(download.implementation).registerCount - 4
        val cookieParameter = firstParameter + 3
        // Snapshot the delivery token once for this download, rather than reading a
        // mutable global token for every segment while another video may be playing.
        download.addInstructions(0, """
            invoke-static {v$firstParameter, v$cookieParameter}, Le/e/a/CacheSupport;->cookieFor(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
            move-result-object v$cookieParameter
        """.trimIndent())
        val connect = cache.methods.single { it.name == "connect" }
        val connectInstructions = checkNotNull(connect.implementation).instructions.toList()
        val response = connectInstructions.indexOfFirst {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Ljava/net/HttpURLConnection;" && ref.name == "getResponseCode"
        }
        check(response >= 0) { "Cache response-code hook was not found" }
        val connectionRegister = (connectInstructions[response] as FiveRegisterInstruction).registerC
        val statusRegister = (connectInstructions[response + 1] as OneRegisterInstruction).registerA
        connect.addInstructions(response + 2, """
            invoke-static {v$connectionRegister, v$statusRegister}, Le/e/a/CacheSupport;->http(Ljava/net/HttpURLConnection;I)V
        """.trimIndent())
        connect.addInstructions(response, """
            invoke-static {v$connectionRegister}, Le/e/a/CacheSupport;->beforeRequest(Ljava/net/HttpURLConnection;)V
        """.trimIndent())
        val cacheInstructions = checkNotNull(download.implementation).instructions.toList()
        val failure = cacheInstructions.indexOfFirst {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.name == "printStackTrace"
        }
        check(failure >= 0) { "Cache error hook was not found" }
        val exceptionRegister = (cacheInstructions[failure] as FiveRegisterInstruction).registerC
        download.addInstructions(failure, """
            invoke-static {v$exceptionRegister}, Le/e/a/CacheSupport;->failed(Ljava/lang/Throwable;)V
        """.trimIndent())
        val top = mutableClassDefBy("Lcom/sauzask/nicoid/NicoidTopActivity;")
        val create = top.methods.single { it.name == "onCreate" }
        var migrationChecks = 0
        for ((index, instruction) in checkNotNull(create.implementation).instructions.toList().withIndex()) {
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            if (ref?.definingClass == "Ljava/io/File;" && ref.name == "exists") {
                val register = (instruction as FiveRegisterInstruction).registerC
                create.replaceInstruction(index,
                    "invoke-static {v$register}, Le/e/a/CacheSupport;->needsMigration(Ljava/io/File;)Z")
                migrationChecks++
            }
        }
        check(migrationChecks == 4) { "Unexpected legacy storage migration checks: $migrationChecks" }
        val menu = top.methods.single {
            it.name == "a" && it.parameterTypes == listOf("Landroid/content/Context;", "Landroid/widget/ListView;", "Z")
        }
        val code = checkNotNull(menu.implementation)
        val bind = code.instructions.indexOfFirst {
            val reference = (it as? ReferenceInstruction)?.reference as? MethodReference
            reference?.definingClass == "Landroid/widget/ListView;" && reference.name == "setAdapter"
        }
        check(bind >= 0) { "nicoid menu adapter binding was not found" }
        // The supported method-delta keeps Context in v0 and its complete row list in v7.
        menu.addInstructions(bind + 1, """
            invoke-static {v0, v7}, Le/e/a/ModernShorts;->finishMenu(Landroid/content/Context;Ljava/util/ArrayList;)V
            invoke-virtual {v8}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V
        """.trimIndent())
        // Bind after the legacy Spanned-to-String conversion, so icon spans survive.
        // The supported adapter keeps the count TextView in v12 (post time is v1).
        val rows = mutableClassDefBy("Le/e/a/b0;").methods.single { it.name == "getView" }
        var countBindings = 0
        for ((index, instruction) in checkNotNull(rows.implementation).instructions.toList().withIndex()) {
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            val call = instruction as? FiveRegisterInstruction ?: continue
            if (ref?.definingClass == "Landroid/widget/TextView;" && ref.name == "setText" &&
                ref.parameterTypes == listOf("Ljava/lang/CharSequence;") && call.registerC == 12) {
                rows.replaceInstruction(index,
                    "invoke-static {v${call.registerC}, v${call.registerD}}, Le/e/a/VideoCounts;->setText(Landroid/widget/TextView;Ljava/lang/CharSequence;)V")
                countBindings++
            }
        }
        check(countBindings == 1) { "Unexpected video count bindings: $countBindings" }
        val info = mutableClassDefBy("Lcom/sauzask/nicoid/NicoidVideoInfoFragment;")
            .methods.single { it.name == "a" && it.parameterTypes == listOf(
                "Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;") }
        val infoInstructions = checkNotNull(info.implementation).instructions.toList()
        val registrationText = infoInstructions.indices.filter {
            (infoInstructions[it] as? NarrowLiteralInstruction)?.narrowLiteral == 0x7f0f01ef
        }.single()
        val registrationBind = (registrationText + 1 until infoInstructions.size).first { index ->
            val ref = (infoInstructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Landroid/widget/TextView;" && ref.name == "setText" &&
                ref.parameterTypes == listOf("Ljava/lang/CharSequence;")
        }
        val registrationCall = infoInstructions[registrationBind] as FiveRegisterInstruction
        info.replaceInstruction(registrationBind,
            "invoke-static {v${registrationCall.registerC}, v${registrationCall.registerD}}, Le/e/a/VideoInfoUi;->hideRegistration(Landroid/widget/TextView;Ljava/lang/CharSequence;)V")
        val infoCreate = mutableClassDefBy("Lcom/sauzask/nicoid/NicoidVideoInfoActivity;")
            .methods.single { it.name == "onCreate" }
        val infoCreateCode = checkNotNull(infoCreate.implementation)
        val infoCreateInstructions = infoCreateCode.instructions.toList()
        val contentView = infoCreateInstructions.indices.single { index ->
            val ref = (infoCreateInstructions[index] as? ReferenceInstruction)?.reference as? MethodReference
            ref?.name == "setContentView" && ref.parameterTypes == listOf("I")
        }
        val activityRegister = infoCreateCode.registerCount - 2
        infoCreate.addInstructions(contentView + 1,
            "invoke-static/range {v$activityRegister .. v$activityRegister}, Le/e/a/VideoInfoUi;->hideDivider(Landroid/app/Activity;)V")
        // Only known UI text is translated. URLs, IDs and preference values are preserved.
        val translatedStrings = Payload.open("ui-strings.txt").bufferedReader().useLines { lines ->
            lines.map { it.replace("\\n", "\n") }.toSet()
        }
        fun isUiResource(ref: MethodReference) = ref.name == "getString" &&
            ref.returnType == "Ljava/lang/String;" &&
            (ref.definingClass.startsWith("Landroid/content/") || ref.definingClass.startsWith("Landroid/app/") ||
                ref.definingClass.startsWith("Landroid/preference/") || ref.definingClass.startsWith("Lcom/sauzask/nicoid/"))
        val uiClasses = mutableListOf<String>()
        classDefForEach { cls ->
            if ((cls.type.startsWith("Lcom/sauzask/nicoid/") || cls.type.startsWith("Le/e/a/")) &&
                !cls.type.startsWith("Le/e/a/UiStrings") && !cls.type.startsWith("Le/e/a/UiText") &&
                !cls.type.startsWith("Le/e/a/VideoCount")) {
                if (cls.methods.any { method -> method.implementation?.instructions?.any { insn ->
                    val ref = (insn as? ReferenceInstruction)?.reference
                    (ref is StringReference && ref.string in translatedStrings) ||
                        (ref is MethodReference && isUiResource(ref))
                } == true }) uiClasses.add(cls.type)
            }
        }
        for (type in uiClasses) for (method in mutableClassDefBy(type).methods) {
            val instructions = method.implementation?.instructions?.toList() ?: continue
            for (index in instructions.indices.reversed()) {
                val insn = instructions[index]
                val ref = (insn as? ReferenceInstruction)?.reference
                val register = when {
                    ref is StringReference && ref.string in translatedStrings ->
                        (insn as? OneRegisterInstruction)?.registerA
                    insn.opcode == Opcode.MOVE_RESULT_OBJECT && index > 0 -> {
                        val call = (instructions[index - 1] as? ReferenceInstruction)?.reference as? MethodReference
                        if (call != null && isUiResource(call))
                            (insn as OneRegisterInstruction).registerA else null
                    }
                    else -> null
                } ?: continue
                method.addInstructions(index + 1, """
                    invoke-static/range {v$register .. v$register}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;
                    move-result-object v$register
                """.trimIndent())
            }
        }
    }
}
