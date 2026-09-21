/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/tiktok/interaction/speed/Fingerprints.kt
 */
package app.morphe.patches.tiktok.interaction.speed

import app.morphe.patcher.Fingerprint
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal object PlaybackSpeedSelectionBoundaryFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "F",
        "Lcom/ss/android/ugc/aweme/feed/model/Aweme;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
    strings = listOf(
        "swipe_up_lock_persist",
        "click_share_button",
        "long_press",
    ),
)

internal fun Method.playerManagerSpeedBoundary(): MethodReference? {
    val candidates = implementation?.instructions?.mapNotNull { instruction ->
        if (instruction.opcode != Opcode.INVOKE_INTERFACE) return@mapNotNull null
        instruction.getReference<MethodReference>()?.takeIf { reference ->
            reference.parameterTypes == listOf("F") && reference.returnType == "V"
        }
    }?.distinctBy(MethodReference::toString).orEmpty()
    return candidates.singleOrNull()
}

internal object PlayerControllerSetSpeedFingerprint : Fingerprint(
    definingClass = "/feed/controller/PlayerController;",
    returnType = "V",
    parameters = listOf("F"),
    strings = listOf("speed_begin", "begin_speed"),
    custom = { method, _ -> method.playerManagerSpeedBoundary() != null },
)

internal object PlaybackSpeedMenuFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/ss/android/ugc/aweme/share/base/model/BaseSharePackage;"),
    strings = listOf("is_highlight_fast_speed"),
)

internal object LongPressSpeedUpEnableFingerprint : Fingerprint(
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("long_press_speed_up_enable"),
)

internal object LongPressSpeedUpLockFingerprint : Fingerprint(
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = emptyList(),
    strings = listOf("long_press_speed_up_lock"),
)
