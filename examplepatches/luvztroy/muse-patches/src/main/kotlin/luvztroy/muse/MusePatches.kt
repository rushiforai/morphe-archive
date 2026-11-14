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
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.dexbacked.DexBackedDexFile
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableTypeReference
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
    if (metadata.packageName != ORIGINAL || !(
        metadata.versionName == "13.0.0.4.159" && metadata.versionCode == "1061801514" ||
        metadata.versionName == "14.0.0.4.149" && metadata.versionCode == "1061901406" ||
        metadata.versionName == "15.0.0.3.156" && metadata.versionCode == "1062001464" ||
        metadata.versionName == "15.0.0.9.156" && metadata.versionCode == "1062001524" ||
        metadata.versionName == "16.0.0.2.159" && metadata.versionCode == "1062101702"
    )) {
        throw PatchException("Requires a supported original Muse APK.")
    }
}
private val museCompatibility = Compatibility(
    packageName = ORIGINAL, name = "Muse", apkFileType = ApkFileType.APK_REQUIRED,
    targets = listOf(
        AppTarget(version = "13.0.0.4.159", versionCode = 1061801514, minSdk = 29),
        AppTarget(version = "14.0.0.4.149", versionCode = 1061901406, minSdk = 29),
        AppTarget(version = "15.0.0.3.156", versionCode = 1062001464, minSdk = 29),
        AppTarget(version = "15.0.0.9.156", versionCode = 1062001524, minSdk = 29),
        AppTarget(version = "16.0.0.2.159", versionCode = 1062101702, minSdk = 29)
    )
)
private fun BytecodePatchContext.method(type: String, id: String): MutableMethod =
    mutableClassDefBy(type).methods.singleOrNull { it.id() == id }
        ?: throw PatchException("Expected exactly one $type->$id; unsupported build")
private fun ref(instruction: Any): String? =
    ((instruction as? ReferenceInstruction)?.reference)?.toString()
private fun MutableMethod.parameterRegister(index: Int): Int {
    val implementation = implementation ?: throw PatchException("Missing implementation: ${id()}")
    val isStatic = accessFlags and 0x8 != 0
    val parameterWords = parameterTypes.sumOf { if (it.toString() in setOf("J", "D")) 2 else 1 }
    val receiverWords = if (isStatic) 0 else 1
    return implementation.registerCount - parameterWords - receiverWords + index
}
private fun MutableMethod.addStaticObjectCall(
    index: Int,
    reference: ImmutableMethodReference,
    registers: IntArray,
    resultRegister: Int
) {
    if (registers.size !in 1..5) throw PatchException("Unsupported invoke register count")
    val implementation = implementation ?: throw PatchException("Missing implementation: ${id()}")
    val padded = registers + IntArray(5 - registers.size)
    implementation.addInstruction(index, BuilderInstruction35c(
        Opcode.INVOKE_STATIC, registers.size, padded[0], padded[1], padded[2], padded[3], padded[4], reference
    ))
    implementation.addInstruction(index + 1, BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, resultRegister))
}


private val validateMuse = bytecodePatch {
    execute {
        requireInput(packageMetadata)
        val guardFile = when (packageMetadata.versionName) {
            "16.0.0.2.159" -> "guards-16.0.0.2.159.tsv"
            "15.0.0.9.156" -> "guards-15.0.0.9.156.tsv"
            "15.0.0.3.156" -> "guards-15.tsv"
            "14.0.0.4.149" -> "guards-14.tsv"
            else -> "guards.tsv"
        }
        asset(guardFile).bufferedReader().useLines { lines ->
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

val museLocalTrust = buildMuseLocalTrust()

val museClone = bytecodePatch(
    name = "Side-by-side clone",
    description = "Change package and app name; fix standalone install.",
    default = true
) {
    compatibleWith(museCompatibility)
    dependsOn(museLocalTrust)
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
        val expectedFields = if (packageMetadata.versionName in setOf("15.0.0.3.156", "15.0.0.9.156", "16.0.0.2.159")) 4 else 3
        if (fields != expectedFields || strings == 0) throw PatchException("Unexpected identity occurrences: $strings strings, $fields fields")
        println("Changed $strings identity strings and $fields fields.")
    }
}



private fun BytecodePatchContext.replaceBodies(group: String, allowNewMethods: Set<String> = emptySet()) {
    val replacements = asset("$group.dex").buffered().use {
        DexBackedDexFile.fromInputStream(Opcodes.forApi(33), it)
    }
    replacements.classes.forEach { c ->
        val target = mutableClassDefBy(c.type)
        c.methods.forEach { replacement ->
            val old = target.methods.singleOrNull { it.id() == replacement.id() }
            if (old == null) {
                if ("${c.type}->${replacement.id()}" !in allowNewMethods) {
                    throw PatchException("Expected existing method: ${c.type}->${replacement.id()}; unsupported build")
                }
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

private fun BytecodePatchContext.wireMuse16JsonActions() {
    val screen = method("Lcom/facebook/aura/settings/HatchSettingsScreenKt\$InternalSettingsSection\$1\$1\$1\$1;",
        "invoke(LX/0pL;LX/4KG;I)V")
    val implementation = screen.implementation ?: throw PatchException("Missing Internal Settings callback")
    val callbackLoad = implementation.instructions.indices.single {
        ref(implementation.instructions[it]) == "Lcom/facebook/aura/settings/HatchSettingsScreenKt\$InternalSettingsSection\$1\$1\$1\$1;->\$onInternalSettingsClick:Lkotlin/jvm/functions/Function0;"
    }
    val callbackPass = implementation.instructions.indices.single { index ->
        index > callbackLoad && implementation.instructions[index].opcode == Opcode.MOVE_OBJECT_FROM16 &&
            (implementation.instructions[index] as? TwoRegisterInstruction)?.let { it.registerA == 34 && it.registerB == 0 } == true
    }
    implementation.replaceInstruction(callbackPass, BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, 34, 47))
    val activityGetter = ImmutableMethodReference("LX/005;", "A0I", listOf("LX/4KG;"), "Landroidx/activity/ComponentActivity;")
    val actionType = "Lcom/facebook/aura/settings/internal/mcdebug/AuraMCDebugJsonBridge\$SettingsAction;"
    val constructor = ImmutableMethodReference(actionType, "<init>",
        listOf("Landroid/content/Context;", "Lkotlin/jvm/functions/Function0;"), "V")
    val injected = listOf(
        BuilderInstruction22x(Opcode.MOVE_OBJECT_FROM16, 49, 0),
        BuilderInstruction35c(Opcode.INVOKE_STATIC, 1, 1, 0, 0, 0, 0, activityGetter),
        BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, 48),
        BuilderInstruction21c(Opcode.NEW_INSTANCE, 47, ImmutableTypeReference(actionType)),
        BuilderInstruction3rc(Opcode.INVOKE_DIRECT_RANGE, 47, 3, constructor)
    )
    injected.forEachIndexed { offset, instruction -> implementation.addInstruction(callbackLoad + 1 + offset, instruction) }
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
    execute {
        val group = when (packageMetadata.versionName) {
            "16.0.0.2.159" -> "jsonhooks16"
            "15.0.0.9.156" -> "jsonhooks15_9"
            "15.0.0.3.156" -> "jsonhooks15"
            "14.0.0.4.149" -> "jsonhooks14"
            else -> "jsonhooks"
        }
        replaceBodies(group, setOf("Lcom/facebook/aura/main/AuraMainActivity;->onActivityResult(IILandroid/content/Intent;)V"))
        if (packageMetadata.versionName == "16.0.0.2.159") wireMuse16JsonActions()
    }
}

private fun buildMuseLocalTrust() = bytecodePatch(
    name = "Local trust",
    description = "Relax local caller checks. Reduces caller protection.",
    default = true
) {
    compatibleWith(museCompatibility)
    dependsOn(validateMuse)
    execute {
        val is14 = packageMetadata.versionName == "14.0.0.4.149"
        val is15 = packageMetadata.versionName == "15.0.0.3.156"
        val is159 = packageMetadata.versionName == "15.0.0.9.156"
        val is16 = packageMetadata.versionName == "16.0.0.2.159"
        replaceBodies(when {
            is16 -> "trust16"
            is159 -> "trust15_9"
            is15 -> "trust15"
            is14 -> "trust14"
            else -> "trust"
        })
        if (is14) {
            val cwMethod = method("LX/CWm;", "ABB(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;LX/CVI;)Ljava/util/ArrayList;")
            val cwImpl = cwMethod.implementation!!
            val localKey = cwImpl.instructions.indices.single { ref(cwImpl.instructions[it]) == "LX/CWw;->A02:Ljava/lang/String;" }
            val containsKey = cwImpl.instructions.indices.single { it > localKey && ref(cwImpl.instructions[it]) == "Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z" }
            val cwGate = containsKey + 3
            val cwBranch = cwImpl.instructions[cwGate] as? BuilderInstruction22t ?: throw PatchException("CWm precheck branch changed")
            if (cwBranch.opcode != Opcode.IF_NE) throw PatchException("CWm branch is not IF_NE")
            cwImpl.replaceInstruction(cwGate, BuilderInstruction30t(Opcode.GOTO_32, cwImpl.newLabelForIndex(cwGate + 1)))

            val cwl = method("LX/CWl;", "A00(Landroid/content/Context;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;Lkotlin/jvm/functions/Function0;LX/CWl;LX/CXI;LX/CVI;I)LX/CXg;")
            val cwlImpl = cwl.implementation!!
            val cwlCall = cwlImpl.instructions.indices.single { ref(cwlImpl.instructions[it]) == "LX/AOC;->A04(Landroid/content/Context;Ljava/lang/String;)Z" }
            val cwlInvoke = cwlImpl.instructions[cwlCall] as? FiveRegisterInstruction ?: throw PatchException("CWl trust call format changed")
            val contextReg = cwlInvoke.registerC
            val packageReg = cwlInvoke.registerD
            cwlImpl.removeInstruction(cwlCall)
            cwlImpl.addInstruction(cwlCall, BuilderInstruction35c(
                Opcode.INVOKE_VIRTUAL, 1, contextReg, 0, 0, 0, 0,
                ImmutableMethodReference("Landroid/content/Context;", "getPackageName", emptyList(), "Ljava/lang/String;")
            ))
            cwlImpl.addInstruction(cwlCall + 1, BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, contextReg))
            cwlImpl.addInstruction(cwlCall + 2, BuilderInstruction35c(
                Opcode.INVOKE_VIRTUAL, 2, contextReg, packageReg, 0, 0, 0,
                ImmutableMethodReference("Ljava/lang/String;", "equals", listOf("Ljava/lang/Object;"), "Z")
            ))

            val wa = method("Lcom/facebook/aura/login/nativeflow/NativeLoginAccountResolver;",
                "readWhatsAppAccount(Landroid/content/Context;)Lcom/facebook/aura/login/nativeflow/NativeLoginSsoAccount;")
            val wi = wa.implementation!!
            val owner = wi.instructions.indices.single { ref(wi.instructions[it]) == "Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;" }
            val equalsCall = wi.instructions.indices.firstOrNull { it > owner && ref(wi.instructions[it]) == "Ljava/lang/String;->equals(Ljava/lang/Object;)Z" }
                ?: throw PatchException("WhatsApp provider package comparison changed")
            val ownerBranchIndex = equalsCall + 2
            val ownerBranch = wi.instructions[ownerBranchIndex] as? BuilderInstruction21t ?: throw PatchException("WhatsApp provider check branch changed")
            if (ownerBranch.opcode != Opcode.IF_EQZ) throw PatchException("WhatsApp provider check is not IF_EQZ")
            val query = wi.instructions.indices.single { ref(wi.instructions[it]) == "Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;" }
            if (query <= ownerBranchIndex) throw PatchException("WhatsApp query moved before provider check")
            wi.replaceInstruction(ownerBranchIndex, BuilderInstruction30t(Opcode.GOTO_32, wi.newLabelForIndex(query)))
        } else if (is159) {
            val ceC = method("LX/CeC;", "ABI(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;LX/CdO;)Ljava/util/ArrayList;")
            val ceCImpl = ceC.implementation!!
            val containsKey = ceCImpl.instructions.indices.single { ref(ceCImpl.instructions[it]) == "Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z" }
            val gate = containsKey + 3
            val branch = ceCImpl.instructions[gate] as? BuilderInstruction22t ?: throw PatchException("CeC permission preflight branch changed")
            if (branch.opcode != Opcode.IF_NE) throw PatchException("CeC permission branch is not IF_NE")
            ceCImpl.replaceInstruction(gate, BuilderInstruction30t(Opcode.GOTO_32, branch.target))

            val d3y = method("LX/D3y;", "A00(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;Ljava/util/List;)Landroid/content/Intent;")
            val d3yImpl = d3y.implementation!!
            val trustCall = d3yImpl.instructions.indices.single { ref(d3yImpl.instructions[it]) == "LX/D2w;->A04(Landroid/content/Context;Ljava/lang/String;)Z" }
            val trustInvoke = d3yImpl.instructions[trustCall] as? FiveRegisterInstruction ?: throw PatchException("D3y trust call format changed")
            val contextReg = trustInvoke.registerC
            val packageReg = trustInvoke.registerD
            d3yImpl.removeInstruction(trustCall)
            d3yImpl.addInstruction(trustCall, BuilderInstruction35c(
                Opcode.INVOKE_VIRTUAL, 1, contextReg, 0, 0, 0, 0,
                ImmutableMethodReference("Landroid/content/Context;", "getPackageName", emptyList(), "Ljava/lang/String;")
            ))
            d3yImpl.addInstruction(trustCall + 1, BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, contextReg))
            d3yImpl.addInstruction(trustCall + 2, BuilderInstruction35c(
                Opcode.INVOKE_VIRTUAL, 2, contextReg, packageReg, 0, 0, 0,
                ImmutableMethodReference("Ljava/lang/String;", "equals", listOf("Ljava/lang/Object;"), "Z")
            ))

            val wa = method("Lcom/facebook/aura/login/nativeflow/NativeLoginAccountResolver;",
                "readWhatsAppAccount(Landroid/content/Context;)Lcom/facebook/aura/login/nativeflow/NativeLoginSsoAccount;")
            val wi = wa.implementation!!
            val owner = wi.instructions.indices.single { ref(wi.instructions[it]) == "Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;" }
            val equalsCall = wi.instructions.indices.firstOrNull { it > owner && ref(wi.instructions[it]) == "Ljava/lang/String;->equals(Ljava/lang/Object;)Z" }
                ?: throw PatchException("WhatsApp provider package comparison changed")
            val ownerBranchIndex = equalsCall + 2
            val ownerBranch = wi.instructions[ownerBranchIndex] as? BuilderInstruction21t ?: throw PatchException("WhatsApp provider check branch changed")
            if (ownerBranch.opcode != Opcode.IF_EQZ) throw PatchException("WhatsApp provider check is not IF_EQZ")
            val query = wi.instructions.indices.single { ref(wi.instructions[it]) == "Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;" }
            if (query <= ownerBranchIndex) throw PatchException("WhatsApp query moved before provider check")
            wi.replaceInstruction(ownerBranchIndex, BuilderInstruction30t(Opcode.GOTO_32, wi.newLabelForIndex(query)))
        } else if (is15) {
            val dpMethod = method("LX/DpF;", "ABI(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/Set;LX/DqZ;)Ljava/util/ArrayList;")
            val dpImpl = dpMethod.implementation!!
            val containsKey = dpImpl.instructions.indices.single { ref(dpImpl.instructions[it]) == "Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z" }
            val gate = containsKey + 3
            val branch = dpImpl.instructions[gate] as? BuilderInstruction22t ?: throw PatchException("DpF permission preflight branch changed")
            if (branch.opcode != Opcode.IF_NE) throw PatchException("DpF permission branch is not IF_NE")
            dpImpl.replaceInstruction(gate, BuilderInstruction30t(Opcode.GOTO_32, branch.target))

            val deK = method("LX/DEk;", "A00(Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;Ljava/util/List;)Landroid/content/Intent;")
            val deKImpl = deK.implementation!!
            val trustCall = deKImpl.instructions.indices.single { ref(deKImpl.instructions[it]) == "LX/DEW;->A04(Landroid/content/Context;Ljava/lang/String;)Z" }
            val trustInvoke = deKImpl.instructions[trustCall] as? FiveRegisterInstruction ?: throw PatchException("DEk trust call format changed")
            val contextReg = trustInvoke.registerC
            val packageReg = trustInvoke.registerD
            deKImpl.removeInstruction(trustCall)
            deKImpl.addInstruction(trustCall, BuilderInstruction35c(
                Opcode.INVOKE_VIRTUAL, 1, contextReg, 0, 0, 0, 0,
                ImmutableMethodReference("Landroid/content/Context;", "getPackageName", emptyList(), "Ljava/lang/String;")
            ))
            deKImpl.addInstruction(trustCall + 1, BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, contextReg))
            deKImpl.addInstruction(trustCall + 2, BuilderInstruction35c(
                Opcode.INVOKE_VIRTUAL, 2, contextReg, packageReg, 0, 0, 0,
                ImmutableMethodReference("Ljava/lang/String;", "equals", listOf("Ljava/lang/Object;"), "Z")
            ))

            val wa = method("Lcom/facebook/aura/login/nativeflow/NativeLoginAccountResolver;",
                "readWhatsAppAccount(Landroid/content/Context;)Lcom/facebook/aura/login/nativeflow/NativeLoginSsoAccount;")
            val wi = wa.implementation!!
            val owner = wi.instructions.indices.single { ref(wi.instructions[it]) == "Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;" }
            val equalsCall = wi.instructions.indices.firstOrNull { it > owner && ref(wi.instructions[it]) == "Ljava/lang/String;->equals(Ljava/lang/Object;)Z" }
                ?: throw PatchException("WhatsApp provider package comparison changed")
            val ownerBranchIndex = equalsCall + 2
            val ownerBranch = wi.instructions[ownerBranchIndex] as? BuilderInstruction21t ?: throw PatchException("WhatsApp provider check branch changed")
            if (ownerBranch.opcode != Opcode.IF_EQZ) throw PatchException("WhatsApp provider check is not IF_EQZ")
            val query = wi.instructions.indices.single { ref(wi.instructions[it]) == "Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;" }
            if (query <= ownerBranchIndex) throw PatchException("WhatsApp query moved before provider check")
            wi.replaceInstruction(ownerBranchIndex, BuilderInstruction30t(Opcode.GOTO_32, wi.newLabelForIndex(query)))
        } else if (is16) {
            val serviceMethod = method("LX/DFM;", "A01(Landroid/content/Context;Ljava/lang/String;)Z")
            val serviceImpl = serviceMethod.implementation ?: throw PatchException("Missing Muse 16 service trust method")
            val serviceStrings = serviceImpl.instructions.mapNotNull {
                ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
            }.toSet()
            if (!setOf("com.facebook.services", "com.facebook.services.dev").all { it in serviceStrings } ||
                serviceImpl.instructions.none { ref(it)?.contains("getApplicationInfo") == true } ||
                serviceImpl.instructions.none { ref(it)?.contains("ApplicationInfo;->enabled") == true }) {
                throw PatchException("Muse 16 service trust replacement lost its allowlist or enabled check")
            }
        } else {
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
            cpyImpl.removeInstruction(call)
            cpyImpl.addInstruction(call, BuilderInstruction35c(
                Opcode.INVOKE_VIRTUAL, 1, contextReg, 0, 0, 0, 0,
                ImmutableMethodReference("Landroid/content/Context;", "getPackageName", emptyList(), "Ljava/lang/String;")
            ))
            cpyImpl.addInstruction(call + 1, BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, contextReg))
            cpyImpl.addInstruction(call + 2, BuilderInstruction35c(
                Opcode.INVOKE_VIRTUAL, 2, contextReg, packageReg, 0, 0, 0,
                ImmutableMethodReference("Ljava/lang/String;", "equals", listOf("Ljava/lang/Object;"), "Z")
            ))

            val wa = method("Lcom/facebook/aura/login/nativeflow/NativeLoginAccountResolver;",
                "readWhatsAppAccount(Landroid/content/Context;)Lcom/facebook/aura/login/nativeflow/NativeLoginSsoAccount;")
            val wi = wa.implementation!!
            val owner = wi.instructions.indices.single { ref(wi.instructions[it]) == "Landroid/content/pm/PackageItemInfo;->packageName:Ljava/lang/String;" }
            val query = wi.instructions.indices.single { ref(wi.instructions[it]) == "Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;" }
            wi.replaceInstruction(owner, BuilderInstruction30t(Opcode.GOTO_32, wi.newLabelForIndex(query)))
        }
        println("Local trust applied; server checks unchanged.")
    }
}
