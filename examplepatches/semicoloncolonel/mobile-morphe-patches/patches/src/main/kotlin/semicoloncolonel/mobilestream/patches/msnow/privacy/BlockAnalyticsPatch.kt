package semicoloncolonel.mobilestream.patches.msnow.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import semicoloncolonel.mobilestream.patches.msnow.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.privacy.analyticsKillSwitchesPatch
import semicoloncolonel.mobilestream.patches.shared.privacy.blockTrackers

// ─────────────────────────────────────────────────────────────────────────────
// Block analytics & tracking (OPT-IN, default OFF).
//
// MS NOW 14.6.0 ships Adobe, Nielsen, comScore, Kochava, Amplitude, Parse.ly,
// Iterate surveys and Firebase Analytics. The app already has its own remote-
// config switches (is_<sdk>_sdk_disabled) that skip starting each tracking SDK;
// this forces them on so the app never initializes Adobe, Nielsen, comScore,
// Amplitude or Parse.ly in the first place. (Blocking Adobe's config host mid-
// startup instead could trip the app's "Can't load configuration" dialog.)
// Kochava never starts, and the shared URLConnection layer and host blocklist
// cover Firebase and the rest. Google Cast and Amplitude's experiment flags are
// left alone, so features and feature flags still work.
//
// There is no Skip ads patch: the paid membership is sold as ad-free.
//
// Not touched: sign-in, TV-provider sign-in, the membership, push, comments,
// audio, OneTrust notices, playback or DRM.
// ─────────────────────────────────────────────────────────────────────────────

internal object KochavaStartFingerprint : Fingerprint(
    definingClass = "Lcom/kochava/measurement/base/Measurement;",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    returnType = "V",
    strings = listOf("Host called API: Start With App GUID "),
)

// The app's Firebase Remote Config boolean reader. It is found by the two
// config-value regex Patterns it uses (oe3.e / oe3.f) and its (String)Z shape.
internal object RemoteConfigBooleanFingerprint : Fingerprint(
    accessFlags = listOf(com.android.tools.smali.dexlib2.AccessFlags.PUBLIC, com.android.tools.smali.dexlib2.AccessFlags.FINAL),
    parameters = listOf("Ljava/lang/String;"),
    returnType = "Z",
    custom = { method, _ ->
        val patterns = method.implementation?.instructions
            ?.filterIsInstance<com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction>()
            ?.mapNotNull { (it.reference as? com.android.tools.smali.dexlib2.iface.reference.FieldReference) }
            ?.count { it.type == "Ljava/util/regex/Pattern;" } ?: 0
        patterns >= 2
    },
)

@Suppress("unused")
val blockAnalyticsPatch = bytecodePatch(
    name = "Block analytics & tracking",
    description = "Stops analytics and tracking in the MS NOW app: Adobe, Kochava, Nielsen, " +
        "comScore, Amplitude, Parse.ly, Iterate and Firebase. Blocking happens on the device, " +
        "inside the app. Sign-in and playback are left alone. Opt-in / experimental; " +
        "test on-device.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(analyticsKillSwitchesPatch)

    extendWith("extensions/extension.mpe")

    execute {
        KochavaStartFingerprint.methodOrNull?.addInstructions(0, "return-void")

        // Report every "is_<sdk>_sdk_disabled" flag as true, except Google Cast
        // (a feature) and Amplitude's experiment flags (feature flags). The
        // app then skips starting those tracking SDKs.
        RemoteConfigBooleanFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    const-string v0, "_sdk_disabled"
                    invoke-virtual {p1, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :msp_orig
                    const-string v0, "is_google_cast_sdk_disabled"
                    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v0
                    if-nez v0, :msp_orig
                    const-string v0, "is_amplitude_experiment_sdk_disabled"
                    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v0
                    if-nez v0, :msp_orig
                    const/4 v0, 0x1
                    return v0
                """,
                ExternalLabel("msp_orig", getInstruction(0)),
            )
        }

        blockTrackers()
    }
}
