package app.badfella.patches.boldvoice

import app.badfella.patches.util.commitAll
import app.badfella.patches.util.loadDexHandles
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.resourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.MethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.w3c.dom.Element
import java.io.File
import java.nio.file.Files
import java.util.Base64

private const val ANDROID = "http://schemas.android.com/apk/res/android"

private val VOID_TARGETS = setOf(
    "Lcom/pairip/StartupLauncher;->launch()V",
    "Lcom/pairip/VMRunner;-><clinit>()V",
    "Lcom/pairip/SignatureCheck;->verifyIntegrity(Landroid/content/Context;)V",
    "Lcom/pairip/licensecheck/LicenseClient;->initializeLicenseCheck()V",
    "Lcom/pairip/licensecheck/LicenseClient;->checkLicense(Landroid/content/Context;)V",
    "Lcom/pairip/licensecheck/LicenseClient;->startErrorDialogActivity()V",
    "Lcom/pairip/licensecheck/LicenseClient;->scheduleAppShutdown()V",
)

/** Minimal method body: single return-void instruction with 1 register. */
private val RETURN_VOID_IMPL = ImmutableMethodImplementation(
    1, listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), emptyList(), emptyList(),
)

private fun methodId(m: MethodReference): String =
    m.definingClass + "->" + m.name + "(" + m.parameterTypes.joinToString("") + ")" + m.returnType

/** Pinned Hermes 99 gates and PairIP full devirtualization; restores startup, strings, and callbacks. */
@Suppress("unused")
val boldVoiceSubscriptionPatch = resourcePatch(
    name = "BoldVoice subscription features",
    description = "Enables client-side subscriber features and lessons in BoldVoice 5.1.3. Restores devirtualized startup lifecycle methods, hoisted strings, and notification callbacks; neutralizes PairIP VM and licensing checks; restores pristine ARM64 native libraries; disables Expo OTA bundle replacement. Server-controlled features retain their existing requirements.",
) {
    compatibleWith(Compatibility(
        name = "BoldVoice",
        packageName = "com.wellocution.androidapp",
        apkFileType = ApkFileType.APKS,
        targets = listOf(
            AppTarget(
                version = "5.1.3",
                versionCodes = mapOf(SupportedAbi.ARM64_V8A to 470),
                description = "Version 5.1.3, build 470 (ARM64 split).",
            ),
        ),
    ))
    execute {
        // --- 1. Native libraries: restore pristine ARM64 libraries via BFP ---
        val arm64Dir = get("lib/arm64-v8a")
        if (arm64Dir.exists() && arm64Dir.isDirectory) {
            restoreBoldVoiceNative(arm64Dir)
        }

        // --- 2. Hermes bundle: unlock subscription gates ---
        val bundle = get("assets/index.android.bundle")
        bundle.writeBytes(patchBoldVoiceBundle(bundle.readBytes()))

        // --- 3. DEX devirtualization & restoration ---
        val dexes = loadDexHandles(this)
        val allApkMethods = mutableMapOf<String, Method>()
        for (dex in dexes) {
            for (cls in dex.classes) {
                for (m in cls.methods) {
                    allApkMethods[methodId(m)] = m
                }
            }
        }

        // A. Load startup.dex from resource to restore the 5 startup lifecycle methods
        val methodRestorations = mutableMapOf<String, MethodImplementation>()
        val startupTemp = Files.createTempFile("bv-startup", ".dex").toFile()
        try {
            val startupStream = checkNotNull(object {}.javaClass.getResourceAsStream("/boldvoice/startup.dex")) {
                "Missing /boldvoice/startup.dex resource"
            }
            startupTemp.writeBytes(startupStream.use { it.readBytes() })
            val startupDex = DexFileFactory.loadDexFile(startupTemp, null)

            for (cls in startupDex.classes) {
                for (m in cls.methods) {
                    val owner = cls.type.replaceFirst(Regex("""\${'$'}c[0-9]+;"""), ";")
                    val params = m.parameterTypes
                    check(params.isNotEmpty() && params[0] == owner) { "Unexpected lifted method: ${methodId(m)}" }
                    val target = owner + "->" + m.name + "(" + params.drop(1).joinToString("") + ")" + m.returnType
                    check(target in allApkMethods) { "Original target method missing in APK: $target" }

                    val impl = checkNotNull(m.implementation) { "Startup method missing implementation: $target" }
                    val code = mutableListOf<Instruction>()
                    for (ins in impl.instructions) {
                        var instruction = ins
                        if (ins is ReferenceInstruction) {
                            val ref = ins.reference as? MethodReference
                            if (ref != null && ref.definingClass == owner) {
                                val wrapper = allApkMethods[methodId(ref)]
                                val wrapperBody = wrapper?.implementation?.instructions?.toList()
                                if (wrapperBody != null && wrapperBody.isNotEmpty()) {
                                    val firstOp = wrapperBody[0].opcode
                                    if (firstOp == Opcode.INVOKE_SUPER || firstOp == Opcode.INVOKE_SUPER_RANGE) {
                                        check(wrapperBody.size == 2 && wrapperBody[1].opcode == Opcode.RETURN_VOID) {
                                            "Unexpected super wrapper body: ${wrapper.name}"
                                        }
                                        val superRef = (wrapperBody[0] as ReferenceInstruction).reference
                                        instruction = when (ins) {
                                            is FiveRegisterInstruction -> ImmutableInstruction35c(
                                                Opcode.INVOKE_SUPER, ins.registerCount,
                                                ins.registerC, ins.registerD, ins.registerE, ins.registerF, ins.registerG,
                                                superRef,
                                            )
                                            is RegisterRangeInstruction -> ImmutableInstruction3rc(
                                                Opcode.INVOKE_SUPER_RANGE, ins.startRegister, ins.registerCount, superRef,
                                            )
                                            else -> error("Unexpected invoke format in super inlining")
                                        }
                                    }
                                }
                            }
                        }
                        code.add(instruction)
                    }
                    methodRestorations[target] = ImmutableMethodImplementation(
                        impl.registerCount, code, impl.tryBlocks, impl.debugItems,
                    )
                }
            }
            check(methodRestorations.size == 5) { "Expected 5 startup restorations, got ${methodRestorations.size}" }
        } finally {
            startupTemp.delete()
        }

        // B. Load callbacks.dex from resource: extra class NotificationTask + 2 callback methods
        val extraClasses = mutableListOf<ClassDef>()
        val callbacksTemp = Files.createTempFile("bv-callbacks", ".dex").toFile()
        try {
            val callbacksStream = checkNotNull(object {}.javaClass.getResourceAsStream("/boldvoice/callbacks.dex")) {
                "Missing /boldvoice/callbacks.dex resource"
            }
            callbacksTemp.writeBytes(callbacksStream.use { it.readBytes() })
            val callbacksDex = DexFileFactory.loadDexFile(callbacksTemp, null)

            for (cls in callbacksDex.classes) {
                if (cls.type.startsWith("Lapp/badfella/")) {
                    extraClasses.add(cls)
                } else {
                    for (m in cls.methods) {
                        val target = methodId(m)
                        methodRestorations[target] = checkNotNull(m.implementation) {
                            "Callback method missing implementation: $target"
                        }
                    }
                }
            }
            check(extraClasses.size == 1 && methodRestorations.size == 7) {
                "Expected 1 extra class and 7 total method restorations, got ${extraClasses.size} and ${methodRestorations.size}"
            }
        } finally {
            callbacksTemp.delete()
        }

        // C. Parse fields.tsv (1,417 hoisted static strings)
        val fieldValues = mutableMapOf<String, MutableMap<String, String>>()
        val fieldsStream = checkNotNull(object {}.javaClass.getResourceAsStream("/boldvoice/fields.tsv")) {
            "Missing /boldvoice/fields.tsv resource"
        }
        var totalFields = 0
        fieldsStream.bufferedReader(Charsets.UTF_8).useLines { lines ->
            for (line in lines) {
                if (line.isEmpty()) continue
                val parts = line.split('\t', limit = 3)
                check(parts.size == 3) { "Malformed line in fields.tsv: $line" }
                val decoded = String(Base64.getDecoder().decode(parts[2]), Charsets.UTF_8)
                fieldValues.computeIfAbsent(parts[0]) { mutableMapOf() }[parts[1]] = decoded
                totalFields++
            }
        }
        check(totalFields == 1417) { "Expected 1417 hoisted fields, got $totalFields" }

        // D. Apply method restorations, string <clinit> injection, and PairIP neutralization
        var stringsInitialized = 0
        var voidMethodsNeutralized = 0

        for (dex in dexes) {
            val isClassesDex = dex.name == "classes.dex"
            for (cls in dex.classes.toList()) {
                var classEdited = false
                val methods = cls.methods.map { method ->
                    val id = methodId(method)
                    val restoredImpl = methodRestorations[id]
                    when {
                        restoredImpl != null -> {
                            classEdited = true
                            ImmutableMethod(
                                method.definingClass, method.name, method.parameters, method.returnType,
                                method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                                restoredImpl,
                            )
                        }
                        id in VOID_TARGETS -> {
                            classEdited = true
                            voidMethodsNeutralized++
                            ImmutableMethod(
                                method.definingClass, method.name, method.parameters, method.returnType,
                                method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                                RETURN_VOID_IMPL,
                            )
                        }
                        else -> method
                    }
                }.toMutableList()

                // Inject <clinit> if this class has hoisted string constants
                val classFieldMap = fieldValues[cls.type]
                if (classFieldMap != null) {
                    val code = mutableListOf<Instruction>()
                    for (f in cls.fields) {
                        val value = classFieldMap[f.name] ?: continue
                        check(f.type == "Ljava/lang/String;" && f.initialValue == null) {
                            "Unexpected hoisted field definition: ${f.name} in ${cls.type}"
                        }
                        code.add(ImmutableInstruction31c(Opcode.CONST_STRING_JUMBO, 0, ImmutableStringReference(value)))
                        code.add(ImmutableInstruction21c(Opcode.SPUT_OBJECT, 0, ImmutableFieldReference(cls.type, f.name, f.type)))
                        stringsInitialized++
                    }
                    check(methods.none { it.name == "<clinit>" }) {
                        "Class ${cls.type} already contains a <clinit> method"
                    }
                    code.add(ImmutableInstruction10x(Opcode.RETURN_VOID))
                    val clinitFlags = AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value
                    methods.add(ImmutableMethod(
                        cls.type, "<clinit>", emptyList(), "V",
                        clinitFlags, emptySet(), emptySet(),
                        ImmutableMethodImplementation(1, code, emptyList(), emptyList()),
                    ))
                    classEdited = true
                }

                if (classEdited) {
                    dex.replaceClass(
                        cls,
                        ImmutableClassDef(
                            cls.type, cls.accessFlags, cls.superclass, cls.interfaces,
                            cls.sourceFile, cls.annotations, cls.fields, methods,
                        ),
                    )
                }
            }

            if (isClassesDex && extraClasses.isNotEmpty()) {
                for (extra in extraClasses) {
                    dex.addClass(extra)
                }
            }
        }

        check(stringsInitialized == 1417) { "Expected 1417 strings initialized, got $stringsInitialized" }
        check(voidMethodsNeutralized == VOID_TARGETS.size) {
            "Expected ${VOID_TARGETS.size} void methods neutralized, got $voidMethodsNeutralized"
        }

        dexes.commitAll()

        // --- 4. Manifest: retain Application wrapper; remove license UI and stamps; disable Expo OTA ---
        document("AndroidManifest.xml").use { manifest ->
            val app = manifest.getElementsByTagName("application").item(0) as Element
            check(app.getAttributeNS(ANDROID, "name") == "com.pairip.application.Application") {
                "BoldVoice application wrapper changed; this app needs review"
            }
            app.setAttributeNS(ANDROID, "android:extractNativeLibs", "true")

            val removeTags = setOf("activity", "meta-data")
            val nodes = manifest.getElementsByTagName("*")
            for (i in nodes.length - 1 downTo 0) {
                val node = nodes.item(i) as Element
                val name = node.getAttributeNS(ANDROID, "name")
                if (node.tagName in removeTags) {
                    if (name.startsWith("com.pairip.") || name.startsWith("com.android.stamp.")) {
                        node.parentNode.removeChild(node)
                    }
                }
            }

            val metaNodes = manifest.getElementsByTagName("meta-data")
            val metadata = (0 until metaNodes.length).mapNotNull { metaNodes.item(it) as? Element }
            val enabled = metadata.firstOrNull { it.getAttributeNS(ANDROID, "name") == "expo.modules.updates.ENABLED" }
            if (enabled != null) {
                enabled.setAttributeNS(ANDROID, "android:value", "false")
            }
            val updateUrl = metadata.firstOrNull { it.getAttributeNS(ANDROID, "name") == "expo.modules.updates.EXPO_UPDATE_URL" }
            if (updateUrl != null) {
                updateUrl.setAttributeNS(ANDROID, "android:value", "")
            }
        }
    }
}
