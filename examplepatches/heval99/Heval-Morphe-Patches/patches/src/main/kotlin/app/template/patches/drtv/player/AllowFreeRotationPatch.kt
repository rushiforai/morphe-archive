package app.template.patches.drtv.player

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_DRTV
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** ActivityInfo.SCREEN_ORIENTATION_SENSOR_LANDSCAPE, what the player asks for. */
private const val SENSOR_LANDSCAPE = 6

/** ActivityInfo.SCREEN_ORIENTATION_FULL_SENSOR: any of the four orientations, by the sensor. */
private const val FULL_SENSOR = 10

/**
 * The video player is landscape only: the manifest declares sensorLandscape for PlayerActivity
 * and onResume requests it again on API 27 and later. The patch swaps the value onResume requests
 * for full sensor, which replaces the manifest value once the player is shown. PlayerActivity
 * already handles orientation changes itself (configChanges), so rotating does not restart
 * playback. The rest of the app keeps its own orientation.
 *
 * Android 8.0 and older are not affected, because the app makes no orientation request there and
 * the manifest stays in charge (a manifest change would need a resource patch).
 *
 * Verified 2026-10-29 against 4.39.0 (versionCode 439000): see COMPATIBILITY_DRTV.
 */
@Suppress("unused")
val allowFreeRotationPatch = bytecodePatch(
    name = "Allow free rotation",
    description = "Lets the video player turn to portrait as well as landscape.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_DRTV)

    execute {
        val method = PlayerActivityResumeFingerprint.method
        val insns = method.implementation?.instructions?.toList()
            ?: throw PatchException("${method.definingClass}->${method.name} has no implementation")

        val requests = insns.indices.filter { index ->
            val ref = (insns[index] as? ReferenceInstruction)?.reference as? MethodReference
            insns[index].opcode == Opcode.INVOKE_VIRTUAL && ref?.name == "setRequestedOrientation" &&
                ref.parameterTypes.map(CharSequence::toString) == listOf("I")
        }
        val request = requests.singleOrNull() ?: throw PatchException(
            "${method.definingClass}->${method.name}: expected one setRequestedOrientation call, found ${requests.size}",
        )
        val register = (insns[request] as FiveRegisterInstruction).registerD
        val load = insns.getOrNull(request - 1)
        if (load?.opcode != Opcode.CONST_4 || (load as OneRegisterInstruction).registerA != register ||
            (load as NarrowLiteralInstruction).narrowLiteral != SENSOR_LANDSCAPE
        ) {
            throw PatchException(
                "${method.definingClass}->${method.name}: expected const/4 v$register, $SENSOR_LANDSCAPE " +
                    "before setRequestedOrientation, got ${load?.opcode}",
            )
        }

        // 10 does not fit const/4 (-8..7), so the swap uses const/16.
        method.replaceInstruction(request - 1, "const/16 v$register, $FULL_SENSOR")
    }
}
