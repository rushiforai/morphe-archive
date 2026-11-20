package dev.novaoffline.patches.nova.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.novaoffline.patches.nova.shared.Constants.NOVA_LAUNCHER
import dev.novaoffline.patches.util.returnFalseObject
import dev.novaoffline.patches.util.returnNull
import dev.novaoffline.patches.util.returnVoid

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Stops Nova's telemetry and ad-mediation network calls at the source: " +
        "Amplitude (incl. Session Replay), the Novalytics raw-data upload, the ad-mediation " +
        "config fetch, and the runtime re-enable of Firebase Analytics/Crashlytics (which " +
        "would otherwise go through Google Play Services). Works with or without the " +
        "Internet-removal patch; together they are defence in depth.",
    default = true,
) {
    compatibleWith(NOVA_LAUNCHER)

    execute {
        // Amplitude init: return before monitor-enter, so nothing is initialised.
        AmplitudeInitFingerprint.method.returnVoid()

        // Novalytics raw-data upload: report failure so local files are discarded.
        RawDataUploadFingerprint.method.returnFalseObject()

        // Ad-mediation config fetch: report failure so no mapping is loaded.
        MediationConfigFingerprint.method.returnNull()

        // Firebase consent gate: overwrite the consent_sdk/f0.n() result with false.
        val method = FirebaseConsentFingerprint.method
        val insns = method.implementation?.instructions?.toList()
            ?: throw PatchException("Nova Launcher: FirebaseConsentFingerprint has no implementation")
        val consentCallIndex = insns.indexOfFirst { insn ->
            (insn as? ReferenceInstruction)?.reference.let { ref ->
                ref is MethodReference &&
                    ref.definingClass == "Lcom/google/android/gms/internal/consent_sdk/f0;" &&
                    ref.name == "n"
            }
        }
        if (consentCallIndex < 0) {
            throw PatchException("Nova Launcher: consent check f0.n() not found in NovaApplication")
        }
        // The MOVE_RESULT right after the consent call holds the boolean we overwrite.
        val moveIndex = (consentCallIndex + 1 until insns.size).firstOrNull { i ->
            insns[i].opcode == Opcode.MOVE_RESULT
        } ?: throw PatchException("Nova Launcher: no MOVE_RESULT after consent check")
        val reg = method.getInstruction<OneRegisterInstruction>(moveIndex).registerA
        method.addInstructions(moveIndex + 1, "const/4 v$reg, 0x0")
    }
}
