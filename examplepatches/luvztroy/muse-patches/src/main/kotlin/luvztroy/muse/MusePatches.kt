package luvztroy.muse

import app.morphe.patcher.PackageMetadata
import app.morphe.patcher.patch.*
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableEncodedValue.Companion.toMutable
import app.morphe.patcher.resource.ResourceType
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue
import org.w3c.dom.Element
import java.security.MessageDigest

private const val ORIGINAL = "com.facebook.aura"
private const val DEFAULT_PACKAGE = "com.facebook.aura.mcdebug"
private const val DEFAULT_APP_NAME = "Muse"
private val packageNameOption = stringOption(
    key = "packageName", default = DEFAULT_PACKAGE, title = "Package name",
    description = "Unique app ID, different from com.facebook.aura.",
    required = true,
    validator = { value -> value != null && value != ORIGINAL && value.length <= 160 &&
        Regex("[a-zA-Z][a-zA-Z0-9_]*(\\.[a-zA-Z][a-zA-Z0-9_]*)+").matches(value) }
)
private val appNameOption = stringOption(
    key = "appName", default = DEFAULT_APP_NAME, title = "App name",
    description = "Name shown in the launcher and share menu.",
    required = true,
    validator = { value -> value != null && value.isNotBlank() && value.length <= 80 &&
        value == value.trim() && value.none { it.code < 32 || it.code == 127 } }
)
private val clonePackage get() = packageNameOption.value!!
private val cloneAppName get() = appNameOption.value!!
private const val ANDROID = "http://schemas.android.com/apk/res/android"
private object Assets
private fun asset(path: String) = Assets::class.java.classLoader!!.getResourceAsStream("muse/$path")
    ?: throw PatchException("Missing bundle resource: $path")
private val identityKeys by lazy {
    asset("identity-map.tsv").bufferedReader().useLines { lines ->
        lines.filter { it.isNotBlank() }.map { it.substringBefore('\t') }.toSet()
    }
}
private fun identity(value: String?): String? =
    if (value in identityKeys) clonePackage + value!!.removePrefix(ORIGINAL) else null
private fun sha256(bytes: ByteArray) = MessageDigest.getInstance("SHA-256").digest(bytes)
    .joinToString("") { "%02x".format(it.toInt() and 255) }
private fun Method.id() = name + "(" + parameterTypes.joinToString("") + ")" + returnType
private fun requireInput(metadata: PackageMetadata) {
    if (metadata.packageName != ORIGINAL || metadata.versionName != "13.0.0.4.159" || metadata.versionCode != "1061801514") {
        throw PatchException("Requires original APK: com.facebook.aura 13.0.0.4.159 (1061801514).")
    }
}
private val museCompatibility = Compatibility(
    packageName = ORIGINAL, name = "Muse", apkFileType = ApkFileType.APK_REQUIRED,
    targets = listOf(AppTarget(version = "13.0.0.4.159", versionCode = 1061801514, minSdk = 29))
)
private fun BytecodePatchContext.method(type: String, id: String): MutableMethod =
    mutableClassDefBy(type).methods.singleOrNull { it.id() == id }
        ?: throw PatchException("Expected exactly one $type->$id; unsupported build")
private fun ref(instruction: Any): String? =
    ((instruction as? ReferenceInstruction)?.reference)?.toString()


private val validateMuse = bytecodePatch {
    execute {
        requireInput(packageMetadata)
        asset("guards.tsv").bufferedReader().useLines { lines ->
            lines.filter { it.isNotBlank() }.forEach { line ->
                val p = line.split('\t')
                val m = classDefBy(p[0]).methods.singleOrNull { it.id() == p[1] }
                    ?: throw PatchException("Missing method: ${p[0]}->${p[1]}")
                val impl = m.implementation ?: throw PatchException("Missing implementation: ${p[1]}")
                val ops = impl.instructions.toList()
                val hash = sha256(ops.joinToString("\n") { it.opcode.name.uppercase().replace('-', '_').replace('/', '_') }.toByteArray())
                if (impl.registerCount != p[2].toInt() || ops.size != p[3].toInt() || hash != p[4]) {
                    throw PatchException("Original-method fingerprint mismatch: ${p[0]}->${p[1]}; do not force this APK")
                }
            }
        }
    }
}

private fun Element.replaceIdentityAttributes() {
    for (i in 0 until attributes.length) {
        val attr = attributes.item(i)
        identity(attr.nodeValue)?.let { attr.nodeValue = it }
    }
}
private val cloneResources = resourcePatch {
    dependsOn(validateMuse)
    execute {
        requireInput(packageMetadata)
        document("AndroidManifest.xml").use { doc ->
            val manifest = doc.documentElement
            if (manifest.getAttribute("package") != ORIGINAL) throw PatchException("Input is already renamed")
            val nodes = doc.getElementsByTagName("*")
            for (i in 0 until nodes.length) (nodes.item(i) as Element).replaceIdentityAttributes()
            manifest.setAttribute("package", clonePackage)

            manifest.removeAttributeNS(ANDROID, "requiredSplitTypes")
            manifest.removeAttributeNS(ANDROID, "splitTypes")
            manifest.setAttributeNS(ANDROID, "android:isSplitRequired", "false")
            val app = doc.getElementsByTagName("application").item(0) as Element
            app.setAttributeNS(ANDROID, "android:label", cloneAppName)
            app.removeAttributeNS(ANDROID, "requiredSplitTypes")
            app.removeAttributeNS(ANDROID, "splitTypes")
            app.setAttributeNS(ANDROID, "android:isSplitRequired", "false")
            val metadata = doc.getElementsByTagName("meta-data")
            for (i in metadata.length - 1 downTo 0) {
                val node = metadata.item(i) as Element
                val name = node.getAttributeNS(ANDROID, "name")
                if (name.startsWith("com.android.stamp.") || name.startsWith("com.android.vending.splits") || name == "com.android.vending.derived.apk.id") {
                    node.parentNode.removeChild(node)
                }
            }
        }
        var accountTypes = 0
        decode("res/xml").filter { it.endsWith(".xml") }.forEach { path ->
            document(path).use { doc ->
                val nodes = doc.getElementsByTagName("*")
                for (i in 0 until nodes.length) {
                    val e = nodes.item(i) as Element
                    if (e.getAttributeNS(ANDROID, "accountType") == "$ORIGINAL.accesslibrary") accountTypes++
                    e.replaceIdentityAttributes()
                }
            }
        }
        if (accountTypes != 1) throw PatchException("Expected one account-authenticator, got $accountTypes")
        var labels = 0
        decode("res/values*/strings.xml").forEach { path ->
            document(path).use { doc ->
                val strings = doc.getElementsByTagName("string")
                for (i in 0 until strings.length) {
                    val e = strings.item(i) as Element
                    if (resourceIds.getOrNull(ResourceType.STRING, e.getAttribute("name")) == 0x7f120006L) {
                        e.textContent = cloneAppName
                        labels++
                    }
                }
            }
        }
        if (labels == 0) throw PatchException("Share-target label resource 0x7f120006 not found")
        listOf("stamp-cert-sha256", "META-INF/code_transparency_signed.jwt",
            "assets/dexopt/baseline.prof", "assets/dexopt/baseline.profm").forEach { delete(it) }
        println("Updated account type and $labels labels.")
    }
}

val museClone = bytecodePatch(
    name = "Side-by-side clone",
    description = "Change package and app name; fix standalone install.",
    default = true
) {
    compatibleWith(museCompatibility)
    packageNameOption()
    appNameOption()
    dependsOn(cloneResources)
    execute {
        var strings = 0
        var fields = 0
        classDefForEach { cls ->
            if (cls.type !in setOf("LX/FV2;", "LX/FV3;", "LX/FV4;")) {
                cls.fields.forEach { field ->
                    val value = (field.initialValue as? StringEncodedValue)?.value
                    identity(value)?.let { replacement ->
                        mutableClassDefBy(cls.type).fields.single { it.name == field.name && it.type == field.type }
                            .setInitialValue(ImmutableStringEncodedValue(replacement).toMutable())
                        fields++
                    }
                }
                cls.methods.forEach { m ->
                    m.implementation?.instructions?.forEachIndexed { index, instruction ->
                        val value = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
                        identity(value)?.let { replacement ->
                            val reg = (instruction as OneRegisterInstruction).registerA
                            val newRef = ImmutableStringReference(replacement)
                            val newInstruction = if (instruction.opcode == Opcode.CONST_STRING_JUMBO)
                                BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, reg, newRef)
                            else BuilderInstruction21c(Opcode.CONST_STRING, reg, newRef)
                            method(cls.type, m.id()).implementation!!.replaceInstruction(index, newInstruction)
                            strings++
                        }
                    }
                }
            }
        }
        if (fields != 3 || strings == 0) throw PatchException("Unexpected identity occurrences: $strings strings, $fields fields")
        println("Changed $strings identity strings and $fields fields.")
    }
}



private fun BytecodePatchContext.replaceBodies(group: String) {
    val replacements = asset("$group.dex").buffered().use {
        DexBackedDexFile.fromInputStream(Opcodes.forApi(33), it)
    }
    replacements.classes.forEach { c ->
        val target = mutableClassDefBy(c.type)
        c.methods.forEach { replacement ->
            val old = target.methods.singleOrNull { it.id() == replacement.id() }
            if (old == null) {
                target.methods.add(replacement.toMutable())
            } else {
                val patched = ImmutableMethod(old.definingClass, old.name, old.parameters, old.returnType,
                    old.accessFlags, old.annotations, old.hiddenApiRestrictions, replacement.implementation).toMutable()
                target.methods.remove(old)
                target.methods.add(patched)
            }
        }
    }
}

val museMcDebug = bytecodePatch(
    name = "Enable MC Debug",
    description = "Enable internal settings.",
    default = true
) {
    compatibleWith(museCompatibility)
    dependsOn(museClone)
    execute { replaceBodies("mcdebug") }
}

val museJsonFlags = bytecodePatch(
    name = "Import/export Mobile Config overrides",
    description = "Copy the app's mc_overrides.json file in and out.",
    default = true
) {
    compatibleWith(museCompatibility)
    dependsOn(museMcDebug)
    extendWith("muse/jsonbridge.dex")
    extendWith("muse/jsonhooks.dex")
    execute { replaceBodies("jsonhooks") }
}

val museLocalTrust = bytecodePatch(
    name = "Local trust",
    description = "Relax local caller checks. Reduces caller protection.",
    default = true
) {
    compatibleWith(museCompatibility)
    dependsOn(museMcDebug)
    execute {
        replaceBodies("trust")
        val cpz = method("LX/CPz;", "ABD(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;LX/COo;)Ljava/util/ArrayList;")
        val cpzIns = cpz.implementation!!.instructions
        val gate = cpzIns.indices.single { ref(cpzIns[it]) == "LX/CQ5;->A02:Ljava/lang/String;" } + 1
        val branch = cpzIns[gate] as? BuilderInstruction21t ?: throw PatchException("CPz precheck branch changed")
        if (branch.opcode != Opcode.IF_EQZ) throw PatchException("CPz branch is not IF_EQZ")
        cpz.implementation!!.replaceInstruction(gate, BuilderInstruction30t(Opcode.GOTO_32, branch.target))

        val cpy = mutableClassDefBy("LX/CPy;").methods.single { m ->
            m.implementation?.instructions?.any { ref(it) == "LX/CRQ;->A04(Landroid/content/Context;Ljava/lang/String;)Z" } == true
        }
        val cpyImpl = cpy.implementation!!
        val call = cpyImpl.instructions.indices.single { ref(cpyImpl.instructions[it]) == "LX/CRQ;->A04(Landroid/content/Context;Ljava/lang/String;)Z" }
        val invoke = cpyImpl.instructions[call] as FiveRegisterInstruction
        val contextReg = invoke.registerC
        val packageReg = invoke.registerD

        cpy.addInstructions(call + 1, """
            invoke-virtual {v$contextReg}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
            move-result-object v$contextReg
            invoke-virtual {v$contextReg, v$packageReg}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
        """.trimIndent())
        cpyImpl.removeInstruction(call)

        val wa = method("Lcom/facebook/aura/login/nativeflow/NativeLoginAccountResolver;",
            "readWhatsAppAccount(Landroid/content/Context;)Lcom/facebook/aura/login/nativeflow/NativeLoginSsoAccount;")
        val wi = wa.implementation!!
        val owner = wi.instructions.indices.single { ref(wi.instructions[it]) == "Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;" }
        val query = wi.instructions.indices.single { ref(wi.instructions[it]) == "Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;" }
        val target = wi.newLabelForIndex(query)

        wi.replaceInstruction(owner, BuilderInstruction30t(Opcode.GOTO_32, target))
        println("Local trust applied; server checks unchanged.")
    }
}
