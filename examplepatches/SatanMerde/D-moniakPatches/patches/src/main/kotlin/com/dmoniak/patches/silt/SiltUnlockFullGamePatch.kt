package com.dmoniak.patches.silt

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.instructionsOrNull
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.dmoniak.patches.shared.BillingHookHelper.executeGooglePlayBillingBypass
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_SILT
import com.dmoniak.patches.shared.replaceMethod
import java.io.File
import java.util.Base64
import java.util.zip.GZIPInputStream
import java.io.ByteArrayInputStream
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.logging.Logger

private const val PAIRIP_PREFIX = "Lcom/pairip/"
private const val APPLICATION_CLASS = "Lcom/pairip/application/Application;"
private const val STARTUP_LAUNCHER_CLASS = "Lcom/pairip/StartupLauncher;"
private const val VMRUNNER_CLASS = "Lcom/pairip/VMRunner;"
private const val RESTORE_STRING_METHOD = "restoreString"
private val STRING_SOURCE_CLASSES = setOf(APPLICATION_CLASS, STARTUP_LAUNCHER_CLASS)
private val WRAPPER_NAME_REGEX = Regex("""\$\d+$""")

private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_SUPER, Opcode.INVOKE_SUPER_RANGE,
    Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE,
    Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE,
    Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE,
)
private val MOVE_RESULT_OPCODES = setOf(
    Opcode.MOVE_RESULT, Opcode.MOVE_RESULT_WIDE, Opcode.MOVE_RESULT_OBJECT,
)
private val RETURN_OPCODES = setOf(
    Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT, Opcode.RETURN_VOID,
)

private fun String.toSmaliLiteral(): String = buildString {
    for (c in this@toSmaliLiteral) when (c) {
        '\\' -> append("\\\\")
        34.toChar() -> append("\\\"")
        '\n' -> append("\\n")
        '\r' -> append("\\r")
        '\t' -> append("\\t")
        else -> append(c)
    }
}

private fun minimalReturnFor(returnType: String): String = when (returnType) {
    "V" -> "return-void"
    "Z", "B", "C", "S", "I", "F" -> "const/4 v0, 0x0\nreturn v0"
    "J", "D" -> "const-wide/16 v0, 0x0\nreturn-wide v0"
    else -> "const/4 v0, 0x0\nreturn-object v0"
}



private fun realOpcodeFor(stubInvoke: Opcode, callSiteRange: Boolean): Opcode? {
    val (base, range) = when (stubInvoke) {
        Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE -> Opcode.INVOKE_VIRTUAL to Opcode.INVOKE_VIRTUAL_RANGE
        Opcode.INVOKE_SUPER, Opcode.INVOKE_SUPER_RANGE -> Opcode.INVOKE_SUPER to Opcode.INVOKE_SUPER_RANGE
        Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE -> Opcode.INVOKE_DIRECT to Opcode.INVOKE_DIRECT_RANGE
        Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE -> Opcode.INVOKE_STATIC to Opcode.INVOKE_STATIC_RANGE
        Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE -> Opcode.INVOKE_INTERFACE to Opcode.INVOKE_INTERFACE_RANGE
        else -> return null
    }
    return if (callSiteRange) range else base
}

private class ParsedWrapper(val realOpcode: Opcode, val realTarget: MethodReference)

private fun BytecodePatchContext.parseWrapper(ref: MethodReference): ParsedWrapper? {
    val classDef = classDefByOrNull(ref.definingClass) ?: return null
    val method = classDef.methods.firstOrNull { m ->
        m.name == ref.name &&
            m.returnType == ref.returnType &&
            m.parameterTypes.map { it.toString() } == ref.parameterTypes.map { it.toString() }
    } ?: return null
    if (!AccessFlags.STATIC.isSet(method.accessFlags)) return null
    val insns = method.implementation?.instructions?.toList() ?: return null
    val invokes = insns.filter { it.opcode in INVOKE_OPCODES }
    if (invokes.size != 1) return null
    val realInvoke = invokes[0]
    if (!insns.all { it === realInvoke || it.opcode in MOVE_RESULT_OPCODES || it.opcode in RETURN_OPCODES }) return null
    val realTarget = (realInvoke as? ReferenceInstruction)?.reference as? MethodReference ?: return null
    return ParsedWrapper(realInvoke.opcode, realTarget)
}

private fun buildInlined(callSite: Instruction, parsed: ParsedWrapper): BuilderInstruction? {
    val newOpcode = realOpcodeFor(parsed.realOpcode, callSite.opcode == Opcode.INVOKE_STATIC_RANGE) ?: return null
    return when (callSite) {
        is BuilderInstruction35c -> BuilderInstruction35c(
            newOpcode,
            callSite.registerCount,
            callSite.registerC,
            callSite.registerD,
            callSite.registerE,
            callSite.registerF,
            callSite.registerG,
            parsed.realTarget,
        )
        is BuilderInstruction3rc -> BuilderInstruction3rc(
            newOpcode,
            callSite.startRegister,
            callSite.registerCount,
            parsed.realTarget,
        )
        else -> null
    }
}

val siltUnlockFullGameBytecodePatch = bytecodePatch(
    name = "Unlock Full Game Bytecode - Silt",
    description = "Bytecode de-obfuscation and unlock engine for Silt",
) {
    compatibleWith(COMPATIBILITY_SILT)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSiltUnlockFullGameBytecodeLogic(logger)
    }
}

@Suppress("unused")
val siltUnlockFullGamePatch = rawResourcePatch(
    name = "Unlock Full Game - Silt",
    description = "Unlocks the full game, all oceanic abyss chapters, and in-app purchase verification in Silt (v1.0.10). Automatically neutralizes PairIP native DRM in Google Play installations.",
) {
    compatibleWith(COMPATIBILITY_SILT)
    dependsOn(siltUnlockFullGameBytecodePatch)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeSiltNativeDrmNeutralization(logger)
    }
}

fun BytecodePatchContext.executeSiltUnlockFullGameBytecodeLogic(logger: Logger) {
    logger.info("Executing Unlock Full Game bytecode patch for Silt (com.snapbreak.silt)...")
    var hookedPoints = 0

    // 1. Google Play Billing Client SDK bypass
    hookedPoints += executeGooglePlayBillingBypass(logger, "Silt")

    // 2. PairIP Bytecode String De-obfuscation
    val stringMap = HashMap<String, String>(SILT_PAIRIP_STRINGS)
    val placeholderClasses = HashSet<String>()
    for (fieldRef in SILT_PAIRIP_STRINGS.keys) {
        val clazz = fieldRef.substringBefore(";->") + ";"
        placeholderClasses += clazz
    }

    classDefForEach { classDef ->
        if (classDef.type !in STRING_SOURCE_CLASSES) return@classDefForEach
        classDef.methods.forEach methods@{ method ->
            if (classDef.type == STARTUP_LAUNCHER_CLASS && method.name != RESTORE_STRING_METHOD) return@methods
            val insns = method.instructionsOrNull?.toList() ?: return@methods
            insns.forEachIndexed { i, insn ->
                if (insn.opcode == Opcode.SPUT_OBJECT) {
                    val ref = (insn as ReferenceInstruction).reference
                    if (ref is FieldReference) placeholderClasses += ref.definingClass
                }
                if (insn.opcode == Opcode.CONST_STRING && i + 1 < insns.size) {
                    val next = insns[i + 1]
                    if (next.opcode == Opcode.SPUT_OBJECT) {
                        val value = ((insn as ReferenceInstruction).reference as StringReference).string
                        val fieldRef = (next as ReferenceInstruction).reference.toString()
                        stringMap[fieldRef] = value
                    }
                }
            }
        }
        placeholderClasses += classDef.type
    }

    logger.info("[Silt PairIP] Loaded ${stringMap.size} obfuscated strings across ${placeholderClasses.size} placeholder classes")

    // Inlining obfuscated strings into call sites
    if (stringMap.isNotEmpty()) {
        var restoredStrings = 0
        classDefForEach { classDef ->
            if (classDef.type.startsWith(PAIRIP_PREFIX)) return@classDefForEach
            if (classDef.type in placeholderClasses) return@classDefForEach
            classDef.methods.forEach methods@{ method ->
                val insns = method.instructionsOrNull?.toList() ?: return@methods
                val edits = ArrayList<Triple<Int, Int, String>>()
                insns.forEachIndexed { index, insn ->
                    if (insn.opcode != Opcode.SGET_OBJECT) return@forEachIndexed
                    val fieldRef = (insn as ReferenceInstruction).reference.toString()
                    val value = stringMap[fieldRef] ?: return@forEachIndexed
                    val reg = (insn as OneRegisterInstruction).registerA
                    val prev = if (index > 0) insns[index - 1] else null
                    val prevIsDummy = prev != null &&
                        (prev.opcode == Opcode.CONST_4 || prev.opcode == Opcode.CONST_16) &&
                        (prev as? OneRegisterInstruction)?.registerA == reg
                    if (prevIsDummy) {
                        edits += Triple(index - 1, index, "const-string v$reg, \"${value.toSmaliLiteral()}\"")
                    } else {
                        edits += Triple(-1, index, "const-string v$reg, \"${value.toSmaliLiteral()}\"")
                    }
                }
                if (edits.isEmpty()) return@methods
                val mutableClass = mutableClassDefByOrNull(classDef.type) ?: return@methods
                val mutableMethod = mutableClass.methods.firstOrNull { m ->
                    m.name == method.name &&
                        m.returnType == method.returnType &&
                        m.parameterTypes.map { it.toString() } == method.parameterTypes.map { it.toString() }
                } ?: return@methods
                edits.sortedByDescending { it.second }.forEach { (constIndex, sgetIndex, smali) ->
                    mutableMethod.replaceInstruction(sgetIndex, smali)
                    if (constIndex >= 0) {
                        mutableMethod.removeInstruction(constIndex)
                    }
                    restoredStrings++
                }
            }
        }
        logger.info("[Silt PairIP] Inlined $restoredStrings string references into bytecode call sites")
        hookedPoints += restoredStrings
    }

    // 3. Inlining Call Wrappers in UnityPlayerActivity and host classes
    var inlinedWrappers = 0
    val stubsToDelete = ArrayList<Pair<String, MethodReference>>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(PAIRIP_PREFIX)) return@classDefForEach
        classDef.methods.forEach methods@{ method ->
            val insns = method.instructionsOrNull?.toList() ?: return@methods
            val replacements = ArrayList<Pair<Int, BuilderInstruction>>()
            insns.forEachIndexed { index, insn ->
                if (insn.opcode != Opcode.INVOKE_STATIC && insn.opcode != Opcode.INVOKE_STATIC_RANGE) return@forEachIndexed
                val targetRef = (insn as? ReferenceInstruction)?.reference as? MethodReference ?: return@forEachIndexed
                if (!WRAPPER_NAME_REGEX.containsMatchIn(targetRef.name)) return@forEachIndexed
                val parsed = parseWrapper(targetRef) ?: return@forEachIndexed
                val inlined = buildInlined(insn, parsed) ?: return@forEachIndexed
                replacements += index to inlined
                stubsToDelete += targetRef.definingClass to targetRef
            }
            if (replacements.isEmpty()) return@methods
            val mutableClass = mutableClassDefByOrNull(classDef.type) ?: return@methods
            val mutableMethod = mutableClass.methods.firstOrNull { m ->
                m.name == method.name &&
                    m.returnType == method.returnType &&
                    m.parameterTypes.map { it.toString() } == method.parameterTypes.map { it.toString() }
            } ?: return@methods
            replacements.forEach { (index, newInsn) ->
                mutableMethod.replaceInstruction(index, newInsn)
                inlinedWrappers++
            }
        }
    }
    logger.info("[Silt PairIP] Inlined $inlinedWrappers call wrapper stubs (retaining stubs for compatibility)")
    hookedPoints += inlinedWrappers

    // 4. Wipe methods invoking VMRunner and remove PairIP calls
    classDefForEach { classDef ->
        if (classDef.type.startsWith(PAIRIP_PREFIX)) return@classDefForEach
        val vmTargets = classDef.methods.filter { method ->
            method.instructionsOrNull?.any { insn ->
                insn.opcode == Opcode.INVOKE_STATIC &&
                    (insn as? ReferenceInstruction)?.reference?.toString()?.contains(VMRUNNER_CLASS) == true
            } == true
        }
        if (vmTargets.isEmpty()) return@classDefForEach
        val mutableClass = mutableClassDefByOrNull(classDef.type) ?: return@classDefForEach
        vmTargets.forEach { method ->
            val mutableMethod = mutableClass.methods.firstOrNull { m ->
                m.name == method.name &&
                    m.returnType == method.returnType &&
                    m.parameterTypes.map { it.toString() } == method.parameterTypes.map { it.toString() }
            } ?: return@forEach
            val count = mutableMethod.instructions.size
            mutableMethod.removeInstructions(0, count)
            mutableMethod.addInstructions(0, minimalReturnFor(method.returnType))
            hookedPoints++
        }
    }

    // 5. Neutralize PairIP DRM verification classes as safe stubs
    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()

        // Handle PairIP Application specifically: initialize base Android context cleanly and do nothing else
        if (type == APPLICATION_CLASS) {
            for (method in classDef.methods.toList()) {
                if (method.name == "<clinit>") {
                    try {
                        val smali = buildString {
                            SILT_PAIRIP_STRINGS.forEach { (fieldRef, value) ->
                                appendLine("const-string v0, \"${value.toSmaliLiteral()}\"")
                                appendLine("sput-object v0, $fieldRef")
                            }
                            appendLine("return-void")
                        }
                        replaceMethod(method = method, registerCount = 2, smaliCode = smali)
                        hookedPoints += SILT_PAIRIP_STRINGS.size
                        logger.info("[Silt PairIP] Populated ${SILT_PAIRIP_STRINGS.size} obfuscated static strings in Application.<clinit>")
                    } catch (e: Exception) {
                        logger.warning("[Silt PairIP] Failed to populate Application.<clinit>: ${e.message}")
                    }
                } else if (method.name == "attachBaseContext") {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 2,
                            smaliCode = """
                            invoke-super {p0, p1}, Landroid/app/Application;->attachBaseContext(Landroid/content/Context;)V
                            return-void
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[Silt PairIP] Neutralized Application.attachBaseContext to pure invoke-super")
                    } catch (_: Exception) {}
                }
            }
            return@classDefForEach
        }

        // Handle CoreComponentFactory.<clinit> so it doesn't invoke StartupLauncher
        if (type == "Landroidx/core/app/CoreComponentFactory;") {
            for (method in classDef.methods.toList()) {
                if (method.name == "<clinit>" && method.implementation != null) {
                    try {
                        replaceMethod(method = method, registerCount = 1, smaliCode = "return-void")
                        hookedPoints++
                        logger.info("[Silt PairIP] Neutralized CoreComponentFactory.<clinit>")
                    } catch (_: Exception) {}
                }
            }
            return@classDefForEach
        }

        if (tl.contains("pairip")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val mName = method.name
                if (mName == "<init>") continue
                val mn = mName.lowercase()
                val retType = method.returnType

                if (mName == "<clinit>") {
                    try {
                        replaceMethod(method = method, registerCount = 1, smaliCode = "return-void")
                        hookedPoints++
                    } catch (_: Exception) {}
                    continue
                }

                if (tl.contains("signaturecheck") && (mn.contains("verify") || mn.contains("check"))) {
                    try {
                        if (retType == "V") {
                            replaceMethod(method = method, registerCount = 3, smaliCode = "return-void")
                        } else if (retType == "Z") {
                            replaceMethod(method = method, registerCount = 3, smaliCode = "const/4 v0, 0x1\nreturn v0")
                        }
                        hookedPoints++
                    } catch (_: Exception) {}
                    continue
                }

                if ((tl.contains("licensecontentprovider") || tl.contains("initcontextprovider")) && mn == "oncreate") {
                    try {
                        replaceMethod(method = method, registerCount = 3, smaliCode = "const/4 v0, 0x1\nreturn v0")
                        hookedPoints++
                    } catch (_: Exception) {}
                    continue
                }

                if (tl.contains("licenseclient")) {
                    try {
                        if (mn == "performlocalinstallercheck") {
                            replaceMethod(method = method, registerCount = 3, smaliCode = "const/4 v0, 0x1\nreturn v0")
                            hookedPoints++
                        } else if (retType == "V") {
                            replaceMethod(method = method, registerCount = 3, smaliCode = "return-void")
                            hookedPoints++
                        } else if (retType == "Z") {
                            replaceMethod(method = method, registerCount = 3, smaliCode = "const/4 v0, 0x1\nreturn v0")
                            hookedPoints++
                        } else {
                            replaceMethod(method = method, registerCount = 3, smaliCode = minimalReturnFor(retType))
                            hookedPoints++
                        }
                    } catch (_: Exception) {}
                    continue
                }

                if (tl.contains("licenseactivity")) {
                    if (mn == "oncreate" && method.parameterTypes.size == 1) {
                        try {
                            replaceMethod(
                                method = method,
                                registerCount = 2,
                                smaliCode = """
                                invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V
                                invoke-virtual {p0}, Landroid/app/Activity;->finish()V
                                return-void
                                """.trimIndent(),
                            )
                            hookedPoints++
                        } catch (_: Exception) {}
                        continue
                    }
                    if (retType == "V") {
                        try {
                            replaceMethod(method = method, registerCount = 3, smaliCode = "return-void")
                            hookedPoints++
                        } catch (_: Exception) {}
                        continue
                    }
                }

                if (tl.contains("vmrunner")) {
                    try {
                        replaceMethod(method = method, registerCount = 3, smaliCode = minimalReturnFor(retType))
                        hookedPoints++
                    } catch (_: Exception) {}
                    continue
                }

                if (tl.contains("startuplauncher")) {
                    try {
                        replaceMethod(method = method, registerCount = 3, smaliCode = minimalReturnFor(retType))
                        hookedPoints++
                    } catch (_: Exception) {}
                    continue
                }

                // Generic neutralization for any other PairIP method
                try {
                    replaceMethod(method = method, registerCount = 3, smaliCode = minimalReturnFor(retType))
                    hookedPoints++
                } catch (_: Exception) {}
            }
        }
    }

    // Neutralize BroadcastReceivers hijacked by PairIP
    val pairipReceivers = setOf(
        "Landroidx/core/content/pm/ShortcutManagerCompat\$1;",
        "Lcom/android/billingclient/api/zzr;",
        "Lcom/google/android/datatransport/runtime/scheduling/jobscheduling/AlarmManagerSchedulerBroadcastReceiver;",
        "Lcom/google/android/gms/common/api/internal/zabx;",
        "Lcom/google/android/play/core/assetpacks/internal/m;",
        "Lcom/unity3d/player/HFPStatus\$1;",
        "Lorg/fmod/FMOD\$PluginBroadcastReceiver;",
    )
    classDefForEach { classDef ->
        if (classDef.type in pairipReceivers) {
            for (method in classDef.methods.toList()) {
                if (method.name == "onReceive" && method.implementation != null) {
                    try {
                        replaceMethod(method = method, registerCount = 3, smaliCode = "return-void")
                        hookedPoints++
                    } catch (_: Exception) {}
                }
            }
        }
    }

    // 6. Neutralize UnityPlayer.preloadJavaPlugins and GetGlViewContentDescription
    classDefForEach { classDef ->
        if (classDef.type == "Lcom/unity3d/player/UnityPlayer;") {
            for (method in classDef.methods.toList()) {
                if (method.name == "preloadJavaPlugins") {
                    try {
                        replaceMethod(method = method, registerCount = 1, smaliCode = "return-void")
                        hookedPoints++
                    } catch (_: Exception) {}
                }
                if (method.name == "GetGlViewContentDescription") {
                    try {
                        replaceMethod(method = method, registerCount = 2, smaliCode = "const-string v0, \"GameView\"\nreturn-object v0")
                        hookedPoints++
                    } catch (_: Exception) {}
                }
            }
        }
    }

    // 6b. Restore clean Unity lifecycle methods in UnityPlayerActivity to bypass PairIP reflection hijacking
    classDefForEach { classDef ->
        if (classDef.type == "Lcom/unity3d/player/UnityPlayerActivity;") {
            for (method in classDef.methods.toList()) {
                val mName = method.name
                val pCount = method.parameterTypes.size
                if (mName == "onCreate" && pCount == 1) {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 6,
                            smaliCode = """
                            const/4 v0, 0x1
                            invoke-virtual {p0, v0}, Lcom/unity3d/player/UnityPlayerActivity;->requestWindowFeature(I)Z
                            invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V
                            invoke-virtual {p0}, Lcom/unity3d/player/UnityPlayerActivity;->getIntent()Landroid/content/Intent;
                            move-result-object v0
                            const-string v1, "unity"
                            invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
                            move-result-object v1
                            invoke-virtual {p0, v1}, Lcom/unity3d/player/UnityPlayerActivity;->updateUnityCommandLineArguments(Ljava/lang/String;)Ljava/lang/String;
                            move-result-object v1
                            const-string v2, "unity"
                            invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
                            new-instance v0, Lcom/unity3d/player/UnityPlayer;
                            invoke-direct {v0, p0, p0}, Lcom/unity3d/player/UnityPlayer;-><init>(Landroid/content/Context;Lcom/unity3d/player/IUnityPlayerLifecycleEvents;)V
                            iput-object v0, p0, Lcom/unity3d/player/UnityPlayerActivity;->mUnityPlayer:Lcom/unity3d/player/UnityPlayer;
                            iget-object v0, p0, Lcom/unity3d/player/UnityPlayerActivity;->mUnityPlayer:Lcom/unity3d/player/UnityPlayer;
                            invoke-virtual {p0, v0}, Lcom/unity3d/player/UnityPlayerActivity;->setContentView(Landroid/view/View;)V
                            iget-object v0, p0, Lcom/unity3d/player/UnityPlayerActivity;->mUnityPlayer:Lcom/unity3d/player/UnityPlayer;
                            invoke-virtual {v0}, Lcom/unity3d/player/UnityPlayer;->requestFocus()Z
                            return-void
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[Silt Unity] Restored clean UnityPlayerActivity.onCreate lifecycle")
                    } catch (_: Exception) {}
                } else if (mName == "onDestroy" && pCount == 0) {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 3,
                            smaliCode = """
                            iget-object v0, p0, Lcom/unity3d/player/UnityPlayerActivity;->mUnityPlayer:Lcom/unity3d/player/UnityPlayer;
                            if-eqz v0, :cond_destroy
                            invoke-virtual {v0}, Lcom/unity3d/player/UnityPlayer;->destroy()V
                            :cond_destroy
                            invoke-super {p0}, Landroid/app/Activity;->onDestroy()V
                            return-void
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[Silt Unity] Restored clean UnityPlayerActivity.onDestroy lifecycle")
                    } catch (_: Exception) {}
                } else if (mName == "onPause" && pCount == 0) {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 3,
                            smaliCode = """
                            invoke-super {p0}, Landroid/app/Activity;->onPause()V
                            iget-object v0, p0, Lcom/unity3d/player/UnityPlayerActivity;->mUnityPlayer:Lcom/unity3d/player/UnityPlayer;
                            if-eqz v0, :cond_pause
                            invoke-virtual {v0}, Lcom/unity3d/player/UnityPlayer;->onPause()V
                            :cond_pause
                            return-void
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[Silt Unity] Restored clean UnityPlayerActivity.onPause lifecycle")
                    } catch (_: Exception) {}
                } else if (mName == "onResume" && pCount == 0) {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 3,
                            smaliCode = """
                            invoke-super {p0}, Landroid/app/Activity;->onResume()V
                            iget-object v0, p0, Lcom/unity3d/player/UnityPlayerActivity;->mUnityPlayer:Lcom/unity3d/player/UnityPlayer;
                            if-eqz v0, :cond_resume
                            invoke-virtual {v0}, Lcom/unity3d/player/UnityPlayer;->onResume()V
                            :cond_resume
                            return-void
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[Silt Unity] Restored clean UnityPlayerActivity.onResume lifecycle")
                    } catch (_: Exception) {}
                } else if (mName == "onStart" && pCount == 0) {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 3,
                            smaliCode = """
                            invoke-super {p0}, Landroid/app/Activity;->onStart()V
                            iget-object v0, p0, Lcom/unity3d/player/UnityPlayerActivity;->mUnityPlayer:Lcom/unity3d/player/UnityPlayer;
                            if-eqz v0, :cond_start
                            invoke-virtual {v0}, Lcom/unity3d/player/UnityPlayer;->onStart()V
                            :cond_start
                            return-void
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[Silt Unity] Restored clean UnityPlayerActivity.onStart lifecycle")
                    } catch (_: Exception) {}
                } else if (mName == "onStop" && pCount == 0) {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 3,
                            smaliCode = """
                            invoke-super {p0}, Landroid/app/Activity;->onStop()V
                            iget-object v0, p0, Lcom/unity3d/player/UnityPlayerActivity;->mUnityPlayer:Lcom/unity3d/player/UnityPlayer;
                            if-eqz v0, :cond_stop
                            invoke-virtual {v0}, Lcom/unity3d/player/UnityPlayer;->onStop()V
                            :cond_stop
                            return-void
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[Silt Unity] Restored clean UnityPlayerActivity.onStop lifecycle")
                    } catch (_: Exception) {}
                } else if (mName == "onWindowFocusChanged" && pCount == 1) {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 3,
                            smaliCode = """
                            invoke-super {p0, p1}, Landroid/app/Activity;->onWindowFocusChanged(Z)V
                            iget-object v0, p0, Lcom/unity3d/player/UnityPlayerActivity;->mUnityPlayer:Lcom/unity3d/player/UnityPlayer;
                            if-eqz v0, :cond_focus
                            invoke-virtual {v0, p1}, Lcom/unity3d/player/UnityPlayer;->windowFocusChanged(Z)V
                            :cond_focus
                            return-void
                            """.trimIndent(),
                        )
                        hookedPoints++
                    } catch (_: Exception) {}
                }
            }
        }
    }

    // 6c. Neutralize remaining PairIP reflection hijacking targets
    classDefForEach { classDef ->
        if (classDef.type == "Lcom/google/android/gms/games/internal/v2/appshortcuts/PlayGamesAppShortcutsActivity;") {
            for (method in classDef.methods.toList()) {
                if (method.name == "onCreate") {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 2,
                            smaliCode = """
                            invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V
                            invoke-virtual {p0}, Landroid/app/Activity;->finish()V
                            return-void
                            """.trimIndent(),
                        )
                        hookedPoints++
                    } catch (_: Exception) {}
                }
            }
        } else if (classDef.type == "Lcom/google/android/gms/nearby/exposurenotification/WakeUpService;") {
            for (method in classDef.methods.toList()) {
                if (method.name == "onBind") {
                    try {
                        replaceMethod(method = method, registerCount = 3, smaliCode = "const/4 v0, 0x0\nreturn-object v0")
                        hookedPoints++
                    } catch (_: Exception) {}
                }
            }
        } else if (classDef.type == "Lcom/google/android/play/core/assetpacks/AssetPackExtractionService;") {
            for (method in classDef.methods.toList()) {
                if (method.name == "onCreate") {
                    try {
                        replaceMethod(method = method, registerCount = 1, smaliCode = "return-void")
                        hookedPoints++
                    } catch (_: Exception) {}
                } else if (method.name == "onBind") {
                    try {
                        replaceMethod(method = method, registerCount = 3, smaliCode = "const/4 v0, 0x0\nreturn-object v0")
                        hookedPoints++
                    } catch (_: Exception) {}
                }
            }
        }
    }

    // 7. Play Integrity API dialog bypass
    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("play/core/integrity") || tl.contains("play/integrity") || tl.contains("integritydialog")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                if (method.name.lowercase().contains("showdialog")) {
                    try {
                        if (method.returnType == "Lcom/google/android/gms/tasks/Task;") {
                            replaceMethod(
                                method = method,
                                registerCount = 4,
                                smaliCode = """
                                const/4 v0, 0x0
                                invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                                move-result-object v0
                                invoke-static {v0}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;
                                move-result-object v0
                                return-object v0
                                """.trimIndent(),
                            )
                            hookedPoints++
                        } else if (method.returnType == "V") {
                            replaceMethod(method = method, registerCount = 3, smaliCode = "return-void")
                            hookedPoints++
                        }
                    } catch (_: Exception) {}
                }
            }
        }
    }

    // Play Games v2 App Shortcuts background thread crash fix
    classDefForEach { classDef ->
        if (classDef.type.contains("games/internal/v2/appshortcuts")) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                if (method.name in listOf("run", "zza", "zzb") && method.returnType == "V") {
                    try {
                        replaceMethod(method = method, registerCount = 1, smaliCode = "return-void")
                        hookedPoints++
                    } catch (_: Exception) {}
                }
            }
        }
    }

    // Google Play Services & AndroidX Preconditions and ConnectionResult crash immunizations
    classDefForEach { classDef ->
        val type = classDef.type
        if (type == "Lcom/google/android/gms/common/internal/Preconditions;" || type == "Landroidx/core/util/Preconditions;") {
            for (method in classDef.methods.toList()) {
                val mName = method.name
                if (mName == "checkNotNull" && method.returnType == "Ljava/lang/Object;") {
                    try {
                        replaceMethod(method = method, registerCount = maxOf(2, method.parameterTypes.size), smaliCode = "return-object p0")
                        hookedPoints++
                    } catch (_: Exception) {}
                } else if (mName == "checkNotEmpty" && method.returnType == "Ljava/lang/String;") {
                    try {
                        replaceMethod(method = method, registerCount = maxOf(2, method.parameterTypes.size), smaliCode = "return-object p0")
                        hookedPoints++
                    } catch (_: Exception) {}
                }
            }
        } else if (type == "Lcom/google/android/gms/common/ConnectionResult;") {
            for (method in classDef.methods.toList()) {
                if (method.name == "toString" && method.parameterTypes.isEmpty()) {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 2,
                            smaliCode = """
                            const-string v0, "ConnectionResult{SUCCESS}"
                            return-object v0
                            """.trimIndent(),
                        )
                        hookedPoints++
                    } catch (_: Exception) {}
                }
            }
        }
    }

    // 8. Game Unlock & Play Pass checks
    classDefForEach { classDef ->
        val tl = classDef.type.lowercase()
        if (tl.contains("androidx") || tl.contains("android/support") || tl.contains("com/google")) return@classDefForEach

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            if (!isStatic && (
                mName == "isfullgameunlocked" ||
                mName == "isgameunlocked" ||
                mName == "haspurchasedfullgame" ||
                mName == "isfullgamepurchased" ||
                mName == "isfullversion" ||
                mName == "canaccessfullgame" ||
                mName == "isunlocked" ||
                mName == "hasfullaccess" ||
                mName == "isplaypasssubscribed" ||
                mName == "hasplaypass" ||
                mName == "isgoogleplaypass" ||
                mName == "isplaypass"
            ) && retType == "Z" && pTypes.isEmpty()) {
                try {
                    replaceMethod(method = method, registerCount = 3, smaliCode = "const/4 v0, 0x1\nreturn v0")
                    hookedPoints++
                    logger.info("[Silt Unlock] Unlocked full game check in: ${classDef.type}->${method.name}")
                } catch (_: Exception) {}
            }

            if (!isStatic && (
                mName == "istrial" ||
                mName == "isdemo" ||
                mName == "isfreeversion" ||
                mName == "islimitedversion" ||
                mName == "requiretrial"
            ) && retType == "Z" && pTypes.isEmpty()) {
                try {
                    replaceMethod(method = method, registerCount = 3, smaliCode = "const/4 v0, 0x0\nreturn v0")
                    hookedPoints++
                    logger.info("[Silt Unlock] Suppressed trial/demo flag in: ${classDef.type}->${method.name}")
                } catch (_: Exception) {}
            }

            if (!isStatic && (
                mName == "ischapterunlocked" ||
                mName == "islevelunlocked" ||
                mName == "canplaychapter"
            ) && retType == "Z" && pTypes.size <= 1) {
                try {
                    replaceMethod(method = method, registerCount = 4, smaliCode = "const/4 v0, 0x1\nreturn v0")
                    hookedPoints++
                    logger.info("[Silt Unlock] Unlocked chapter check in: ${classDef.type}->${method.name}")
                } catch (_: Exception) {}
            }
        }
    }

    // 8b. Google Play Asset Delivery (PAD) bypass and local asset pack resolver
    classDefForEach { classDef ->
        val type = classDef.type
        if (type == "Lcom/unity3d/player/PlayAssetDeliveryUnityWrapper;" || type == "Lcom/unity3d/player/m;") {
            for (method in classDef.methods.toList()) {
                val mName = method.name
                val pCount = method.parameterTypes.size
                val retType = method.returnType

                if (mName == "playCoreApiMissing" && retType == "Z") {
                    try {
                        replaceMethod(method = method, registerCount = 2, smaliCode = "const/4 v0, 0x0\nreturn v0")
                        hookedPoints++
                        logger.info("[Silt PAD] Neutralized playCoreApiMissing -> false")
                    } catch (_: Exception) {}
                } else if ((mName == "getAssetPackPath" || mName == "a") && retType == "Ljava/lang/String;" && pCount == 1 && method.parameterTypes[0] == "Ljava/lang/String;") {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 14,
                            smaliCode = """
                            if-eqz p1, :cond_empty
                            invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;
                            move-result-object v0
                            if-eqz v0, :cond_empty

                            invoke-virtual {v0}, Landroid/app/Application;->getFilesDir()Ljava/io/File;
                            move-result-object v1
                            if-eqz v1, :cond_empty

                            new-instance v2, Ljava/io/File;
                            const-string v5, "UnityDataAssetPack"
                            invoke-direct {v2, v1, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

                            new-instance v3, Ljava/io/File;
                            const-string v5, "assets/bin/Data"
                            invoke-direct {v3, v2, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

                            new-instance v4, Ljava/io/File;
                            const-string v5, "datapack.unity3d"
                            invoke-direct {v4, v3, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

                            invoke-virtual {v4}, Ljava/io/File;->exists()Z
                            move-result v5
                            if-eqz v5, :cond_find_apk

                            invoke-virtual {v4}, Ljava/io/File;->length()J
                            move-result-wide v5
                            const-wide/32 v7, 0x23c34600
                            cmp-long v5, v5, v7
                            if-lez v5, :cond_find_apk

                            invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
                            move-result-object v0
                            return-object v0

                            :cond_find_apk
                            :try_start
                            invoke-virtual {v0}, Landroid/app/Application;->getPackageResourcePath()Ljava/lang/String;
                            move-result-object v5

                            invoke-virtual {v0}, Landroid/app/Application;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;
                            move-result-object v6
                            if-eqz v6, :cond_create_dirs
                            iget-object v6, v6, Landroid/content/pm/ApplicationInfo;->splitSourceDirs:[Ljava/lang/String;
                            if-eqz v6, :cond_create_dirs
                            array-length v7, v6
                            const/4 v8, 0x0

                            :loop_splits
                            if-ge v8, v7, :cond_create_dirs
                            aget-object v9, v6, v8
                            if-eqz v9, :cond_next_split
                            const-string v10, "UnityData"
                            invoke-virtual {v9, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                            move-result v10
                            if-eqz v10, :cond_found_split
                            :cond_next_split
                            add-int/lit8 v8, v8, 0x1
                            goto :loop_splits

                            :cond_found_split
                            move-object v5, v9

                            :cond_create_dirs
                            if-eqz v5, :cond_prepare_dest
                            goto :cond_return_pack

                            :cond_prepare_dest
                            invoke-virtual {v3}, Ljava/io/File;->mkdirs()Z

                            new-instance v6, Ljava/io/File;
                            const-string v7, "datapack.unity3d.tmp"
                            invoke-direct {v6, v3, v7}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V
                            invoke-virtual {v6}, Ljava/io/File;->exists()Z
                            move-result v7
                            if-eqz v7, :cond_delete_tmp
                            goto :cond_open_zip

                            :cond_delete_tmp
                            invoke-virtual {v6}, Ljava/io/File;->delete()Z

                            :cond_open_zip
                            new-instance v7, Ljava/util/zip/ZipFile;
                            invoke-direct {v7, v5}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V

                            const-string v8, "assets/bin/Data/datapack.unity3d"
                            invoke-virtual {v7, v8}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;
                            move-result-object v8
                            if-eqz v8, :cond_close_zip
                            invoke-virtual {v7, v8}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;
                            move-result-object v8

                            new-instance v9, Ljava/io/FileOutputStream;
                            invoke-direct {v9, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

                            const/high16 v10, 0x40000
                            new-array v10, v10, [B

                            :loop_copy
                            invoke-virtual {v8, v10}, Ljava/io/InputStream;->read([B)I
                            move-result v11
                            if-lez v11, :cond_done_copy
                            const/4 v12, 0x0
                            invoke-virtual {v9, v10, v12, v11}, Ljava/io/OutputStream;->write([BII)V
                            goto :loop_copy

                            :cond_done_copy
                            invoke-virtual {v9}, Ljava/io/OutputStream;->flush()V
                            invoke-virtual {v9}, Ljava/io/OutputStream;->close()V
                            invoke-virtual {v8}, Ljava/io/InputStream;->close()V
                            invoke-virtual {v7}, Ljava/util/zip/ZipFile;->close()V

                            invoke-virtual {v6, v4}, Ljava/io/File;->renameTo(Ljava/io/File;)Z
                            goto :cond_return_pack

                            :cond_close_zip
                            invoke-virtual {v7}, Ljava/util/zip/ZipFile;->close()V
                            :try_end
                            .catch Ljava/lang/Throwable; {:try_start .. :try_end} :cond_return_pack

                            :cond_return_pack
                            invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
                            move-result-object v0
                            return-object v0

                            :cond_empty
                            const-string v0, ""
                            return-object v0
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[Silt PAD] Hooked ${classDef.type}->$mName (asset pack path resolver)")
                    } catch (_: Exception) {}
                } else if ((mName == "getAssetPackStates" || mName == "a") && pCount == 2 && method.parameterTypes[0] == "[Ljava/lang/String;" && method.parameterTypes[1] == "Lcom/unity3d/player/IAssetPackManagerStatusQueryCallback;") {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 8,
                            smaliCode = """
                            if-nez p2, :cond_cb
                            return-void
                            :cond_cb
                            if-nez p1, :cond_has_names
                            const/4 v0, 0x0
                            new-array p1, v0, [Ljava/lang/String;
                            :cond_has_names
                            array-length v0, p1
                            new-array v4, v0, [I
                            new-array v5, v0, [I
                            const/4 v1, 0x0
                            :loop_status
                            if-ge v1, v0, :cond_invoke
                            const/4 v2, 0x4
                            aput v2, v4, v1
                            const/4 v2, 0x0
                            aput v2, v5, v1
                            add-int/lit8 v1, v1, 0x1
                            goto :loop_status
                            :cond_invoke
                            const-wide/16 v1, 0x0
                            move-object v0, p2
                            move-object v3, p1
                            invoke-interface/range {v0 .. v5}, Lcom/unity3d/player/IAssetPackManagerStatusQueryCallback;->onStatusResult(J[Ljava/lang/String;[I[I)V
                            return-void
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[Silt PAD] Hooked ${classDef.type}->$mName (query callback -> COMPLETED)")
                    } catch (_: Exception) {}
                } else if (mName == "getAssetPackState" && pCount == 2 && method.parameterTypes[0] == "Ljava/lang/String;" && method.parameterTypes[1] == "Lcom/unity3d/player/IAssetPackManagerStatusQueryCallback;") {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 8,
                            smaliCode = """
                            if-nez p2, :cond_cb
                            return-void
                            :cond_cb
                            const/4 v0, 0x1
                            new-array v3, v0, [Ljava/lang/String;
                            const/4 v1, 0x0
                            aput-object p1, v3, v1
                            new-array v4, v0, [I
                            const/4 v2, 0x4
                            aput v2, v4, v1
                            new-array v5, v0, [I
                            aput v1, v5, v1
                            const-wide/16 v1, 0x0
                            move-object v0, p2
                            invoke-interface/range {v0 .. v5}, Lcom/unity3d/player/IAssetPackManagerStatusQueryCallback;->onStatusResult(J[Ljava/lang/String;[I[I)V
                            return-void
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[Silt PAD] Hooked ${classDef.type}->$mName (single query callback -> COMPLETED)")
                    } catch (_: Exception) {}
                } else if ((mName == "downloadAssetPacks" || mName == "a") && pCount == 2 && method.parameterTypes[0] == "[Ljava/lang/String;" && method.parameterTypes[1] == "Lcom/unity3d/player/IAssetPackManagerDownloadStatusCallback;") {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 12,
                            smaliCode = """
                            if-nez p2, :cond_cb
                            return-void
                            :cond_cb
                            if-nez p1, :cond_has_names
                            return-void
                            :cond_has_names
                            array-length v0, p1
                            const/4 v1, 0x0
                            :loop_dl
                            if-ge v1, v0, :cond_done
                            aget-object v3, p1, v1
                            const/4 v4, 0x4
                            const-wide/16 v5, 0x64
                            const-wide/16 v7, 0x64
                            const/4 v9, 0x0
                            const/4 v10, 0x0
                            move-object v2, p2
                            invoke-interface/range {v2 .. v10}, Lcom/unity3d/player/IAssetPackManagerDownloadStatusCallback;->onStatusUpdate(Ljava/lang/String;IJJII)V
                            add-int/lit8 v1, v1, 0x1
                            goto :loop_dl
                            :cond_done
                            return-void
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[Silt PAD] Hooked ${classDef.type}->$mName (download callback -> COMPLETED)")
                    } catch (_: Exception) {}
                } else if (mName == "downloadAssetPack" && pCount == 2 && method.parameterTypes[0] == "Ljava/lang/String;" && method.parameterTypes[1] == "Lcom/unity3d/player/IAssetPackManagerDownloadStatusCallback;") {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 10,
                            smaliCode = """
                            if-nez p2, :cond_cb
                            return-void
                            :cond_cb
                            const/4 v2, 0x4
                            const-wide/16 v3, 0x64
                            const-wide/16 v5, 0x64
                            const/4 v7, 0x0
                            const/4 v8, 0x0
                            move-object v0, p2
                            move-object v1, p1
                            invoke-interface/range {v0 .. v8}, Lcom/unity3d/player/IAssetPackManagerDownloadStatusCallback;->onStatusUpdate(Ljava/lang/String;IJJII)V
                            return-void
                            """.trimIndent(),
                        )
                        hookedPoints++
                        logger.info("[Silt PAD] Hooked ${classDef.type}->$mName (single download callback -> COMPLETED)")
                    } catch (_: Exception) {}
                } else if (mName.startsWith("cancelAssetPack") || mName == "removeAssetPack" || (classDef.type == "Lcom/unity3d/player/m;" && (mName == "b" || (mName == "a" && pCount == 1 && method.parameterTypes[0] == "[Ljava/lang/String;")))) {
                    try {
                        replaceMethod(method = method, registerCount = 2, smaliCode = "return-void")
                        hookedPoints++
                    } catch (_: Exception) {}
                } else if (mName == "registerDownloadStatusListener" || (classDef.type == "Lcom/unity3d/player/m;" && mName == "a" && pCount == 1 && method.parameterTypes[0] == "Lcom/unity3d/player/IAssetPackManagerDownloadStatusCallback;")) {
                    try {
                        replaceMethod(method = method, registerCount = 2, smaliCode = "const/4 v0, 0x0\nreturn-object v0")
                        hookedPoints++
                    } catch (_: Exception) {}
                } else if (mName == "unregisterDownloadStatusListener" || (classDef.type == "Lcom/unity3d/player/m;" && mName == "a" && pCount == 1 && method.parameterTypes[0] == "Ljava/lang/Object;")) {
                    try {
                        replaceMethod(method = method, registerCount = 2, smaliCode = "return-void")
                        hookedPoints++
                    } catch (_: Exception) {}
                } else if (mName == "requestToUseMobileData" || (classDef.type == "Lcom/unity3d/player/m;" && mName == "a" && pCount == 2 && method.parameterTypes[0] == "Landroid/app/Activity;" && method.parameterTypes[1] == "Lcom/unity3d/player/IAssetPackManagerMobileDataConfirmationCallback;")) {
                    try {
                        replaceMethod(
                            method = method,
                            registerCount = 4,
                            smaliCode = """
                            if-nez p2, :cond_cb
                            return-void
                            :cond_cb
                            const/4 v0, 0x1
                            invoke-interface {p2, v0}, Lcom/unity3d/player/IAssetPackManagerMobileDataConfirmationCallback;->onMobileDataConfirmationResult(Z)V
                            return-void
                            """.trimIndent(),
                        )
                        hookedPoints++
                    } catch (_: Exception) {}
                }
            }
        }
    }

    // 9. Retain all PairIP classes as safe, neutralized stubs in DEX to prevent ClassNotFoundException / NoClassDefFoundError
    logger.info("[Silt PairIP] Retained all PairIP classes as safe neutralized stubs (preserving AndroidManifest components and AndroidX callers)")
    logger.info("[Silt Bytecode] Total bytecode hooks applied: $hookedPoints")
}

fun ResourcePatchContext.executeSiltNativeDrmNeutralization(logger: Logger) {
    logger.info("[Silt Native DRM] Inspecting APK entries for native PairIP binary encryption...")

    val libEntries = listApkEntries("lib/")

    // 1. Restore official clean DRM-free libil2cpp.so (eliminates encrypted metadata & methodSpecs crash at 0xc351bc)
    val il2cppEntries = libEntries.filter { it.endsWith("libil2cpp.so") }
    for (entry in il2cppEntries) {
        try {
            if (entry.contains("arm64")) {
                val soFile = get(entry, true)
                val bytes = soFile.readBytes()
                if (bytes.size == SiltNativeDiffs.PLAY_IL2CPP_ARM64_SIZE) {
                    val cleanBytes = SiltNativeDiffs.applyDiffPatch(bytes, SiltNativeDiffs.getIl2CppArm64DiffBytes())
                    soFile.writeBytes(cleanBytes)
                    logger.info("[Silt Native DRM] Successfully restored official DRM-free libil2cpp.so in $entry (${cleanBytes.size} bytes)")
                } else if (bytes.size == SiltNativeDiffs.CLEAN_IL2CPP_ARM64_SIZE) {
                    logger.info("[Silt Native DRM] $entry is already clean official binary (${bytes.size} bytes)")
                }
            }
        } catch (e: Exception) {
            logger.warning("[Silt Native DRM] Failed to restore $entry: ${e.message}")
        }
    }

    // 2. Restore official clean DRM-free libunity.so (eliminates MurmurHash SIGILL at 0xc43a74 and PairIP DT_NEEDED)
    val unityEntries = libEntries.filter { it.endsWith("libunity.so") }
    for (entry in unityEntries) {
        try {
            if (entry.contains("arm64")) {
                val soFile = get(entry, true)
                var bytes = soFile.readBytes()
                var modified = false
                if (bytes.size == SiltNativeDiffs.PLAY_UNITY_ARM64_SIZE) {
                    bytes = SiltNativeDiffs.applyDiffPatch(bytes, SiltNativeDiffs.getUnityArm64DiffBytes())
                    modified = true
                    logger.info("[Silt Native DRM] Successfully restored official DRM-free libunity.so in $entry (${bytes.size} bytes)")
                } else if (bytes.size == SiltNativeDiffs.CLEAN_UNITY_ARM64_SIZE) {
                    logger.info("[Silt Native DRM] $entry is already clean official binary (${bytes.size} bytes)")
                }

                if (bytes.size == SiltNativeDiffs.CLEAN_UNITY_ARM64_SIZE) {
                    if (patchUnityArm64PadFreeze(bytes, logger)) {
                        modified = true
                    }
                }

                if (modified) {
                    soFile.writeBytes(bytes)
                }
            }
        } catch (e: Exception) {
            logger.warning("[Silt Native DRM] Failed to restore $entry: ${e.message}")
        }
    }

    // 3. Neutralize libmain.so RTLD_LAZY -> RTLD_NOW (fixes Android 16 / Xiaomi HyperOS lazy binding crash at 0x14f3b0)
    val libMainEntries = libEntries.filter { it.endsWith("libmain.so") }
    for (entry in libMainEntries) {
        try {
            val soFile = get(entry, true)
            val bytes = soFile.readBytes()
            val modified = patchLibMainRtldNow(bytes, logger, entry)
            if (modified) {
                soFile.writeBytes(bytes)
                logger.info("[Silt Native DRM] Successfully patched RTLD_NOW in $entry")
            }
        } catch (e: Exception) {
            logger.warning("[Silt Native DRM] Failed to patch $entry: ${e.message}")
        }
    }

    // 4. Neutralize libfmod.so DT_NEEDED on libpairipcore.so
    val fmodEntries = libEntries.filter { it.endsWith("libfmod.so") }
    for (entry in fmodEntries) {
        try {
            val soFile = get(entry, true)
            val bytes = soFile.readBytes()
            val targetBytes = "libpairipcore.so".toByteArray(Charsets.ISO_8859_1)
            val replacementBytes = "libc++_shared.so".toByteArray(Charsets.ISO_8859_1)
            var modified = false
            for (i in 0 until bytes.size - targetBytes.size) {
                var match = true
                for (j in targetBytes.indices) {
                    if (bytes[i + j] != targetBytes[j]) {
                        match = false
                        break
                    }
                }
                if (match) {
                    for (j in replacementBytes.indices) {
                        bytes[i + j] = replacementBytes[j]
                    }
                    modified = true
                    break
                }
            }
            if (modified) {
                soFile.writeBytes(bytes)
                logger.info("[Silt Native DRM] Replaced DT_NEEDED libpairipcore.so with libc++_shared.so in $entry")
            }
        } catch (e: Exception) {
            logger.warning("[Silt Native DRM] Failed to sanitize DT_NEEDED in $entry: ${e.message}")
        }
    }

    // 5. Retain libpairipcore.so as safe stub (do not delete, so any remaining dynamic references resolve)
    val pairipCoreEntries = libEntries.filter { it.endsWith("libpairipcore.so") }
    if (pairipCoreEntries.isEmpty()) {
        logger.info("[Silt Native DRM] No libpairipcore.so found in APK (base APK only or clean build). Bytecode patch active.")
    } else {
        val arm64Fix = getPairipArm64FixBytes()
        for (entry in pairipCoreEntries) {
            try {
                val soFile = get(entry, true)
                if (entry.contains("arm64")) {
                    soFile.writeBytes(arm64Fix)
                    logger.info("[Silt Native DRM] Replaced arm64 $entry with custom dynamic GOT resolver (${arm64Fix.size} bytes)")
                } else {
                    val bytes = soFile.readBytes()
                    val modified = stubPairipCoreElf(bytes, logger, entry)
                    if (modified) {
                        soFile.writeBytes(bytes)
                        logger.info("[Silt Native DRM] Successfully neutralized native anti-tamper in $entry")
                    }
                }
            } catch (e: Exception) {
                logger.warning("[Silt Native DRM] Failed to patch $entry: ${e.message}")
            }
        }
    }

    // Delete stamp-cert-sha256 if present to avoid Play signature checks
    val stampEntries = listApkEntries("stamp-cert-sha256")
    for (stamp in stampEntries) {
        try {
            delete(stamp)
            logger.info("[Silt Native DRM] Removed signature stamp: $stamp")
        } catch (_: Exception) {}
    }
}

/**
 * Dynamically parses ELF32 / ELF64 shared libraries and neutralizes:
 * - ExecuteProgram (instant return 0)
 * - JNI_OnLoad (instant return JNI_VERSION_1_6 = 0x10006)
 * - JNI_OnUnload (instant return)
 * - DT_INIT_ARRAY function pointers (instant return)
 */
private fun stubPairipCoreElf(data: ByteArray, logger: Logger, entryName: String): Boolean {
    if (data.size < 52 || data[0] != 0x7f.toByte() || data[1] != 'E'.code.toByte() || data[2] != 'L'.code.toByte() || data[3] != 'F'.code.toByte()) {
        return false
    }
    val eiClass = data[4].toInt() // 1 = 32-bit, 2 = 64-bit
    val buf = ByteBuffer.wrap(data).order(ByteOrder.LITTLE_ENDIAN)

    if (eiClass == 1) { // ELF32 (armeabi-v7a / x86)
        val phOff = buf.getInt(0x1c)
        val phNum = buf.getShort(0x2c).toInt()
        val phList = ArrayList<IntArray>() // [p_type, p_offset, p_vaddr, p_filesz]
        for (i in 0 until phNum) {
            val base = phOff + i * 32
            val pType = buf.getInt(base)
            val pOff = buf.getInt(base + 4)
            val pVaddr = buf.getInt(base + 8)
            val pFilesz = buf.getInt(base + 16)
            phList.add(intArrayOf(pType, pOff, pVaddr, pFilesz))
        }

        fun va2off(va: Int): Int {
            for (p in phList) {
                if (p[0] == 1 && va >= p[2] && va < p[2] + p[3]) { // PT_LOAD
                    return p[1] + (va - p[2])
                }
            }
            return -1
        }

        val dynPh = phList.firstOrNull { it[0] == 2 } ?: return false // PT_DYNAMIC
        val dynOff = dynPh[1]
        val dynSz = dynPh[3]

        var symtabVa = 0
        var strtabVa = 0
        var strtabSz = 0
        var initArrayVa = 0
        var initArraySz = 0

        var dOff = 0
        while (dOff < dynSz) {
            val tag = buf.getInt(dynOff + dOff)
            val dVal = buf.getInt(dynOff + dOff + 4)
            if (tag == 0) break
            when (tag) {
                6 -> symtabVa = dVal // DT_SYMTAB
                5 -> strtabVa = dVal // DT_STRTAB
                10 -> strtabSz = dVal // DT_STRSZ
                0x19 -> initArrayVa = dVal // DT_INIT_ARRAY
                0x1b -> initArraySz = dVal // DT_INIT_ARRAYSZ
            }
            dOff += 8
        }

        val symtabOff = va2off(symtabVa)
        val strtabOff = va2off(strtabVa)
        if (symtabOff < 0 || strtabOff < 0) return false

        var idx = 0
        while (symtabOff + idx * 16 + 16 <= data.size && idx < 3000) {
            val base = symtabOff + idx * 16
            val stName = buf.getInt(base)
            val stValue = buf.getInt(base + 4)
            if (stName in 0 until strtabSz && strtabOff + stName < data.size) {
                var end = strtabOff + stName
                while (end < data.size && data[end] != 0.toByte()) end++
                val sName = String(data, strtabOff + stName, end - (strtabOff + stName), Charsets.UTF_8)
                val targetOff = va2off(stValue)

                if (targetOff in 0 until data.size) {
                    if (sName == "ExecuteProgram" && targetOff + 8 <= data.size) {
                        // ARM32: mov r0, #0; bx lr (00 00 a0 e3 1e ff 2f e1)
                        val armMov0BxLr = byteArrayOf(0x00, 0x00, 0xa0.toByte(), 0xe3.toByte(), 0x1e, 0xff.toByte(), 0x2f, 0xe1.toByte())
                        System.arraycopy(armMov0BxLr, 0, data, targetOff, armMov0BxLr.size)
                        logger.info("  [ARM32] Neutralized ExecuteProgram at offset 0x${targetOff.toString(16)}")
                    } else if (sName == "JNI_OnLoad" && targetOff + 12 <= data.size) {
                        // ARM32: movw r0, #6; movt r0, #1; bx lr
                        val armJniOnLoad = byteArrayOf(0x06, 0x00, 0x00, 0xe3.toByte(), 0x01, 0x00, 0x40, 0xe3.toByte(), 0x1e, 0xff.toByte(), 0x2f, 0xe1.toByte())
                        System.arraycopy(armJniOnLoad, 0, data, targetOff, armJniOnLoad.size)
                        logger.info("  [ARM32] Neutralized JNI_OnLoad at offset 0x${targetOff.toString(16)}")
                    } else if (sName == "JNI_OnUnload" && targetOff + 4 <= data.size) {
                        // ARM32: bx lr
                        val armBxLr = byteArrayOf(0x1e, 0xff.toByte(), 0x2f, 0xe1.toByte())
                        System.arraycopy(armBxLr, 0, data, targetOff, armBxLr.size)
                        logger.info("  [ARM32] Neutralized JNI_OnUnload at offset 0x${targetOff.toString(16)}")
                    }
                }
            }
            idx++
        }

        if (initArrayVa != 0 && initArraySz > 0) {
            val initArrayOff = va2off(initArrayVa)
            if (initArrayOff in 0 until data.size) {
                val count = (initArraySz / 4).coerceAtMost((data.size - initArrayOff) / 4)
                for (i in 0 until count * 4) {
                    data[initArrayOff + i] = 0
                }
                logger.info("  [ARM32] Zeroed .init_array ($count entries) at offset 0x${initArrayOff.toString(16)}")
            }
        }
        return true
    } else if (eiClass == 2) { // ELF64 (arm64-v8a / x86_64)
        val phOff = buf.getLong(0x20).toInt()
        val phNum = buf.getShort(0x38).toInt()
        val phList = ArrayList<LongArray>() // [p_type, p_offset, p_vaddr, p_filesz]
        for (i in 0 until phNum) {
            val base = phOff + i * 56
            val pType = buf.getInt(base).toLong()
            val pOff = buf.getLong(base + 8)
            val pVaddr = buf.getLong(base + 16)
            val pFilesz = buf.getLong(base + 32)
            phList.add(longArrayOf(pType, pOff, pVaddr, pFilesz))
        }

        fun va2off64(va: Long): Int {
            for (p in phList) {
                if (p[0] == 1L && va >= p[2] && va < p[2] + p[3]) {
                    return (p[1] + (va - p[2])).toInt()
                }
            }
            return -1
        }

        val dynPh = phList.firstOrNull { it[0] == 2L } ?: return false
        val dynOff = dynPh[1].toInt()
        val dynSz = dynPh[3].toInt()

        var symtabVa = 0L
        var strtabVa = 0L
        var strtabSz = 0L
        var initArrayVa = 0L
        var initArraySz = 0L

        var dOff = 0
        while (dOff < dynSz) {
            val tag = buf.getLong(dynOff + dOff)
            val dVal = buf.getLong(dynOff + dOff + 8)
            if (tag == 0L) break
            when (tag) {
                6L -> symtabVa = dVal
                5L -> strtabVa = dVal
                10L -> strtabSz = dVal
                0x19L -> initArrayVa = dVal
                0x1bL -> initArraySz = dVal
            }
            dOff += 16
        }

        val symtabOff = va2off64(symtabVa)
        val strtabOff = va2off64(strtabVa)
        if (symtabOff < 0 || strtabOff < 0) return false

        var idx = 0
        while (symtabOff + idx * 24 + 24 <= data.size && idx < 3000) {
            val base = symtabOff + idx * 24
            val stName = buf.getInt(base)
            val stValue = buf.getLong(base + 8)
            if (stName in 0 until strtabSz && strtabOff + stName < data.size) {
                var end = strtabOff + stName
                while (end < data.size && data[end] != 0.toByte()) end++
                val sName = String(data, strtabOff + stName, end - (strtabOff + stName), Charsets.UTF_8)
                val targetOff = va2off64(stValue)

                if (targetOff in 0 until data.size) {
                    if (sName == "ExecuteProgram" && targetOff + 8 <= data.size) {
                        // ARM64: mov x0, #0; ret (00 00 80 d2 c0 03 5f d6)
                        val arm64Mov0Ret = byteArrayOf(0x00, 0x00, 0x80.toByte(), 0xd2.toByte(), 0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte())
                        System.arraycopy(arm64Mov0Ret, 0, data, targetOff, arm64Mov0Ret.size)
                        logger.info("  [ARM64] Neutralized ExecuteProgram at offset 0x${targetOff.toString(16)}")
                    } else if (sName == "JNI_OnLoad" && targetOff + 12 <= data.size) {
                        // ARM64: mov x0, #6; movk x0, #1, lsl 16; ret
                        val arm64JniOnLoad = byteArrayOf(0xc0.toByte(), 0x00, 0x80.toByte(), 0xd2.toByte(), 0x20, 0x00, 0xa0.toByte(), 0xf2.toByte(), 0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte())
                        System.arraycopy(arm64JniOnLoad, 0, data, targetOff, arm64JniOnLoad.size)
                        logger.info("  [ARM64] Neutralized JNI_OnLoad at offset 0x${targetOff.toString(16)}")
                    } else if (sName == "JNI_OnUnload" && targetOff + 4 <= data.size) {
                        // ARM64: ret
                        val arm64Ret = byteArrayOf(0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte())
                        System.arraycopy(arm64Ret, 0, data, targetOff, arm64Ret.size)
                        logger.info("  [ARM64] Neutralized JNI_OnUnload at offset 0x${targetOff.toString(16)}")
                    }
                }
            }
            idx++
        }

        if (initArrayVa != 0L && initArraySz > 0L) {
            val initArrayOff = va2off64(initArrayVa)
            if (initArrayOff in 0 until data.size) {
                val count = (initArraySz / 8).toInt().coerceAtMost((data.size - initArrayOff) / 8)
                for (i in 0 until count * 8) {
                    data[initArrayOff + i] = 0
                }
                logger.info("  [ARM64] Zeroed .init_array ($count entries) at offset 0x${initArrayOff.toString(16)}")
            }
        }
        return true
    }
    return false
}

private fun patchUnityArm64PadFreeze(bytes: ByteArray, logger: Logger): Boolean {
    var patched = false
    // 1. Bypass AreCoreAssetPacksReady at 0x22f480 -> mov w0, #1; ret
    val expected1 = byteArrayOf(0xfe.toByte(), 0x0f, 0x1f.toByte(), 0xf8.toByte(), 0xbf.toByte(), 0x8d.toByte(), 0x0f, 0x94.toByte())
    if (bytes.size > 0x22f488 && bytes.copyOfRange(0x22f480, 0x22f488).contentEquals(expected1)) {
        val patch1 = byteArrayOf(0x20, 0x00, 0x80.toByte(), 0x52, 0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte())
        System.arraycopy(patch1, 0, bytes, 0x22f480, patch1.size)
        patched = true
        logger.info("[Silt Native DRM] Patched AreCoreAssetPacksReady at 0x22f480 -> true")
    }

    // 2. Bypass IsAssetPackReady at 0x612a1c -> mov w0, #1; ret
    val expected2 = byteArrayOf(0xf4.toByte(), 0x0f, 0x1e, 0xf8.toByte(), 0xf3.toByte(), 0x7b, 0x01, 0xa9.toByte())
    if (bytes.size > 0x612a24 && bytes.copyOfRange(0x612a1c, 0x612a24).contentEquals(expected2)) {
        val patch2 = byteArrayOf(0x20, 0x00, 0x80.toByte(), 0x52, 0xc0.toByte(), 0x03, 0x5f, 0xd6.toByte())
        System.arraycopy(patch2, 0, bytes, 0x612a1c, patch2.size)
        patched = true
        logger.info("[Silt Native DRM] Patched IsAssetPackReady at 0x612a1c -> true")
    }

    // 3. Bypass S_IFDIR directory check in 0x61604c -> nop
    val expected3 = byteArrayOf(0xa1.toByte(), 0x03, 0x00, 0x54)
    if (bytes.size > 0x616050 && bytes.copyOfRange(0x61604c, 0x616050).contentEquals(expected3)) {
        val nop = byteArrayOf(0x1f, 0x20, 0x03, 0xd5.toByte())
        System.arraycopy(nop, 0, bytes, 0x61604c, nop.size)
        patched = true
        logger.info("[Silt Native DRM] Patched S_IFDIR check at 0x61604c -> nop")
    }

    // 4. Bypass assets/bin/Data check in 0x616058 -> nop
    val expected4 = byteArrayOf(0xa0.toByte(), 0x03, 0x00, 0x36)
    if (bytes.size > 0x61605c && bytes.copyOfRange(0x616058, 0x61605c).contentEquals(expected4)) {
        val nop = byteArrayOf(0x1f, 0x20, 0x03, 0xd5.toByte())
        System.arraycopy(nop, 0, bytes, 0x616058, nop.size)
        patched = true
        logger.info("[Silt Native DRM] Patched assets/bin/Data check at 0x616058 -> nop")
    }

    // 5. Bypass "UnityDataAssetPack" string check in MountDataArchive at 0x5fe0e0 -> nop
    val expected5 = byteArrayOf(0x20, 0x07, 0x00, 0x54)
    if (bytes.size > 0x5fe0e4 && bytes.copyOfRange(0x5fe0e0, 0x5fe0e4).contentEquals(expected5)) {
        val nop = byteArrayOf(0x1f, 0x20, 0x03, 0xd5.toByte())
        System.arraycopy(nop, 0, bytes, 0x5fe0e0, nop.size)
        patched = true
        logger.info("[Silt Native DRM] Patched MountDataArchive string check at 0x5fe0e0 -> nop")
    }
    return patched
}

private fun patchLibMainRtldNow(data: ByteArray, logger: Logger, entryName: String): Boolean {
    if (data.size < 52 || data[0] != 0x7f.toByte() || data[1] != 'E'.code.toByte() || data[2] != 'L'.code.toByte() || data[3] != 'F'.code.toByte()) {
        return false
    }
    val eiClass = data[4].toInt() // 1 = 32-bit, 2 = 64-bit
    var modified = false

    if (eiClass == 1) { // ARM32 (Thumb: movs r1, #1 -> movs r1, #2)
        for (i in 0 until data.size - 6) {
            if (data[i] == 0x01.toByte() && data[i + 1] == 0x21.toByte()) {
                val b3 = data[i + 3].toInt() and 0xff
                if ((b3 and 0xd0) == 0xd0 || (b3 and 0xf0) == 0xe0) {
                    data[i] = 0x02.toByte()
                    modified = true
                }
            }
        }
    } else if (eiClass == 2) { // ARM64 (mov w1, #1 -> mov w1, #2: 21 00 80 52 -> 41 00 80 52)
        for (i in 0 until data.size - 16) {
            if (data[i] == 0x21.toByte() && data[i + 1] == 0x00.toByte() && data[i + 2] == 0x80.toByte() && data[i + 3] == 0x52.toByte()) {
                var hasBl = false
                for (step in listOf(4, 8, 12)) {
                    val insnB3 = data[i + step + 3].toInt() and 0xff
                    if ((insnB3 and 0xfc) == 0x94) {
                        hasBl = true
                        break
                    }
                }
                if (hasBl) {
                    data[i] = 0x41.toByte()
                    modified = true
                }
            }
        }
    }
    return modified
}

private fun getPairipArm64FixBytes(): ByteArray {
    val gzBytes = Base64.getDecoder().decode(PAIRIP_ARM64_FIX_GZIP_BASE64)
    return GZIPInputStream(ByteArrayInputStream(gzBytes)).readBytes()
}

private const val PAIRIP_ARM64_FIX_GZIP_BASE64 = "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"
