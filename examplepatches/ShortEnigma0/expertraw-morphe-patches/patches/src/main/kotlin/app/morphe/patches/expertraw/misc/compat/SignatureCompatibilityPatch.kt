/*
 * Expert RAW patches for Morphe.
 * Licensed under the GNU General Public License version 3 (GPLv3), with the Additional
 * Terms under Section 7 described in the LICENSE file of this repository.
 */

package app.morphe.patches.expertraw.misc.compat

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.util.returnEarly
import app.morphe.patches.expertraw.misc.extension.sharedExtensionPatch
import app.morphe.patches.expertraw.shared.Constants.APP
import app.morphe.patches.expertraw.shared.Constants.COMPATIBILITY_EXPERT_RAW
import app.morphe.patches.expertraw.shared.Constants.EXTENSION
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val SAFE_CR = "$EXTENSION/SafeCR;"
private const val SAFE_SYS = "$EXTENSION/SafeSys;"
private const val BYPASS = "$EXTENSION/PpBypass;"
private const val CR = "Landroid/content/ContentResolver;"

/**
 * Original call ("Lowner;->name(params)ret") -> static replacement. For instance methods the
 * replacement takes the receiver as its first parameter.
 */
private val CALL_REWRITES: Map<String, String> = buildMap {
    fun instance(owner: String, nameAndSig: String, target: String) {
        val name = nameAndSig.substringBefore('(')
        val params = nameAndSig.substringAfter('(').substringBefore(')')
        val ret = nameAndSig.substringAfter(')')
        put("$owner->$nameAndSig", "$target->$name($owner$params)$ret")
    }
    fun static(owner: String, nameAndSig: String, target: String) {
        put("$owner->$nameAndSig", "$target->${nameAndSig}")
    }

    // ContentResolver: Samsung secmedia / GPPM / Gallery providers deny a re-signed app.
    listOf(
        "applyBatch(Ljava/lang/String;Ljava/util/ArrayList;)[Landroid/content/ContentProviderResult;",
        "call(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;",
        "delete(Landroid/net/Uri;Landroid/os/Bundle;)I",
        "delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I",
        "insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;",
        "query(Landroid/net/Uri;[Ljava/lang/String;Landroid/os/Bundle;Landroid/os/CancellationSignal;)Landroid/database/Cursor;",
        "query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;",
        "registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V",
        "update(Landroid/net/Uri;Landroid/content/ContentValues;Landroid/os/Bundle;)I",
        "update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I",
    ).forEach { instance(CR, it, SAFE_CR) }

    // Framework calls guarded by signature permissions.
    val wm = "Lcom/samsung/android/view/SemWindowManager;"
    instance(wm, "registerSystemKeyEvent(ILandroid/content/ComponentName;I)V", SAFE_SYS)
    instance(wm, "unregisterSystemKeyEvent(ILandroid/content/ComponentName;)V", SAFE_SYS)
    instance(wm, "setForcedDefaultDisplayDevice(I)V", SAFE_SYS)
    instance("Lcom/samsung/android/hardware/display/SemMdnieManager;", "setContentMode(I)Z", SAFE_SYS)
    static("Lcom/samsung/android/tsp/SemTspStateManager;", "setDeadZone(Landroid/view/View;Landroid/os/Bundle;)V", SAFE_SYS)
    val dvfs = "Lcom/samsung/android/os/SemDvfsManager;"
    instance(dvfs, "acquire()V", SAFE_SYS)
    instance(dvfs, "acquire(I)V", SAFE_SYS)
    instance(dvfs, "setHint(I)V", SAFE_SYS)
    instance(dvfs, "release()V", SAFE_SYS)
    static("Landroid/provider/Settings\$System;", "putInt($CR" + "Ljava/lang/String;I)Z", SAFE_SYS)
    instance("Landroid/os/PowerManager;", "semSetAutoBrightnessLimit(FF)V", SAFE_SYS)
    instance("Landroid/os/PowerManager;", "semGoToSleep(J)V", SAFE_SYS)
    instance("Landroid/media/AudioManager;", "setParameters(Ljava/lang/String;)V", SAFE_SYS)
    instance("Lcom/samsung/android/camera/mic/SemMultiMicManager;", "setMode(I)Z", SAFE_SYS)
    instance("Landroid/hardware/display/DisplayManager;", "semGetWifiDisplayStatus()Landroid/hardware/display/SemWifiDisplayStatus;", SAFE_SYS)
    instance("Landroid/app/ActivityManager;", "getRunningTasks(I)Ljava/util/List;", SAFE_SYS)
    instance("Landroid/telephony/TelephonyManager;", "registerTelephonyCallback(Ljava/util/concurrent/Executor;Landroid/telephony/TelephonyCallback;)V", SAFE_SYS)
    // Voice control needs privileged audio capture; its async AudioRecord failure crashes the app.
    instance("Lcom/samsung/android/speech/SemSpeechRecognizer;", "startRecognition(I)V", SAFE_SYS)
    // getCameraCutoutSetting needs MANAGE_ACTIVITY_TASKS -> PpBypass.safeCutout.
    put(
        "Landroid/app/SemActivityTaskManager;->getCameraCutoutSetting(ILjava/lang/String;)I",
        "$BYPASS->safeCutout(Landroid/app/SemActivityTaskManager;ILjava/lang/String;)I"
    )
    // Current user needs INTERACT_ACROSS_USERS; the camera only ever runs as its own user.
    put("Landroid/app/ActivityManager;->semGetCurrentUser()I", "Landroid/os/UserHandle;->semGetMyUserId()I")
    // App permission gate checks Environment.isExternalStorageManager() -> return true so GalaxyRaw reaches onResume.
    static("Landroid/os/Environment;", "isExternalStorageManager()Z", SAFE_SYS)
}

private const val DATA_SEC_ROOT = "/data/user/0/com.samsung.android.app.galaxyraw/files/sec"

private object GppmProviderIsDisabledFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("ENABLE_GPPM")
)

private fun Instruction.methodKey(): String? {
    if (this !is ReferenceInstruction) return null
    val ref = reference as? MethodReference ?: return null
    return "${ref.definingClass}->${ref.name}(${ref.parameterTypes.joinToString("")})${ref.returnType}"
}

private fun Instruction.registerList(): Pair<String, Boolean> = when (this) {
    is RegisterRangeInstruction ->
        if (registerCount == 0) "{}" to false
        else "{v$startRegister .. v${startRegister + registerCount - 1}}" to true
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG)
        .take(registerCount).joinToString(prefix = "{", postfix = "}") { "v$it" } to false
    else -> throw IllegalStateException("not an invoke: $opcode")
}

@Suppress("unused")
val signatureCompatibilityPatch = patch(
    name = "Samsung signature compatibility",
    description = "Lets a re-signed Expert RAW run on a stock Galaxy: calls that need Samsung's " +
        "platform signature are made safe, private storage under /data/sec is moved to app storage " +
        "and Samsung's private media provider is emulated with MediaStore. " +
        "Voice shutter and volume-key shutter stop working.",
) {
    compatibleWith(COMPATIBILITY_EXPERT_RAW)

    dependsOn(sharedExtensionPatch)

    execute {
        // region Route privileged calls in app code through the extension wrappers.

        val sites = mutableMapOf<String, MutableList<Pair<String, Int>>>() // class -> (method id, index)
        classDefForEach { classDef ->
            if (!classDef.type.startsWith("$APP/")) return@classDefForEach
            classDef.methods.forEach { method ->
                method.implementation?.instructions?.forEachIndexed { index, insn ->
                    if (insn.methodKey() in CALL_REWRITES) {
                        sites.getOrPut(classDef.type) { mutableListOf() }
                            .add("${method.name}${method.parameterTypes}${method.returnType}" to index)
                    }
                }
            }
        }
        var rewired = 0
        sites.forEach { (type, list) ->
            val mutableClass = mutableClassDefBy(type)
            list.groupBy({ it.first }, { it.second }).forEach { (methodId, indices) ->
                val method = mutableClass.methods.first {
                    "${it.name}${it.parameterTypes}${it.returnType}" == methodId
                }
                indices.forEach { index ->
                    val insn = method.implementation!!.instructions[index]
                    val target = CALL_REWRITES.getValue(insn.methodKey()!!)
                    val (regs, range) = insn.registerList()
                    method.replaceInstruction(index, "invoke-static${if (range) "/range" else ""} $regs, $target")
                    rewired++
                }
            }
        }
        if (rewired < 50) throw IllegalStateException("Only $rewired call sites rewired; unsupported app version?")

        // endregion

        // region MANAGE_EXTERNAL_STORAGE can only be granted through appops to a re-signed app:
        // drop it from the startup permission gate (still granted with `appops set ... allow`).

        replaceStrings("$APP/util/PermissionUtils;") { s ->
            if (s == "android.permission.MANAGE_EXTERNAL_STORAGE") "android.permission.CAMERA" else null
        }

        // endregion

        // region /data/sec is SELinux-restricted to Samsung-signed apps: use app-private storage.

        listOf(
            "$APP/core2/util/FileUtils;",
            "$APP/util/Util;",
            "$APP/util/StorageUtils;",
            "$APP/core2/processor/util/PLog;",
        ).forEach { type ->
            replaceStrings(type) { s ->
                when (s) {
                    "/data/sec" -> DATA_SEC_ROOT
                    "/data/sec/camera/galaxyraw" -> "$DATA_SEC_ROOT/camera/galaxyraw"
                    "/data/sec/log" -> "$DATA_SEC_ROOT/log"
                    else -> null
                }
            }
        }
        // This one checks whether a path *starts with* /data/sec (substring(0, 9)).
        replaceStrings("$APP/core2/processor/PostProcessDBHelper;") { s ->
            if (s == "/data/sec") "/data/use" else null
        }

        // endregion

        // GPPM (Samsung's global post-processing manager) is unreachable: report it disabled
        // so the app schedules processing itself.
        GppmProviderIsDisabledFingerprint.method.returnEarly(true)
    }
}

/** Replace string constants in every method of [type]; [map] returns the new value or null to keep. */
private fun replaceStrings(type: String, map: (String) -> String?) {
    val mutableClass = mutableClassDefBy(type)
    var count = 0
    mutableClass.methods.forEach { method ->
        val insns = method.implementation?.instructions ?: return@forEach
        insns.forEachIndexed { index, insn ->
            if (insn.opcode != Opcode.CONST_STRING && insn.opcode != Opcode.CONST_STRING_JUMBO) return@forEachIndexed
            val value = ((insn as ReferenceInstruction).reference as StringReference).string
            val replacement = map(value) ?: return@forEachIndexed
            val register = (insn as OneRegisterInstruction).registerA
            method.replaceInstruction(index, "const-string/jumbo v$register, \"$replacement\"")
            count++
        }
    }
    if (count == 0) throw IllegalStateException("No string constants replaced in $type")
}
