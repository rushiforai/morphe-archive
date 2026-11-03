package app.template.patches.drtv.misc.telemetry

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_DRTV
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * DRTV sends its usage analytics through Segment, audience measurement through Nielsen, playback
 * quality reports through NPAW (Youbora), and crash and performance data through Firebase.
 * Firebase Analytics is already deactivated in the app's manifest.
 *
 * Continue watching (ResumePointService) and the player's local debug overlay
 * (PlayerStatisticsManager) are not touched.
 *
 * Verified 2026-10-29 against 4.39.0 (versionCode 439000): see COMPATIBILITY_DRTV.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics, tracking and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_DRTV)

    execute {
        // 1. Crashlytics: automatic data collection reads as off, so no crash report is sent.
        CrashlyticsDataCollectionFingerprint.method.returnEarly(false)

        // 2. Firebase Performance: monitoring reads as off, so no trace or metric is collected.
        PerformanceMonitoringEnabledFingerprint.method.returnEarly(false)

        // 3. Segment: the client is never built. The provider's analytics field stays null and
        // every reader (event tracking, identify/reset, the Cast and search anonymous id) skips it.
        SegmentInitializeFingerprint.method.returnEarly()

        // 4. Nielsen: no NielsenUtil is created, so no VOD tracker is added and live tracking
        // never starts.
        NielsenInitFingerprint.method.returnEarly()

        // 5. NPAW: the feature flag reads as off, so the player adapter is never built ...
        NpawFeatureFlagFingerprint.method.returnEarly(false)

        // ... and the plugin the player module still creates starts with analytics disabled:
        // setEnabled(true) becomes setEnabled(false). The method still returns the plugin.
        val npaw = NpawInitializeFingerprint.method
        val insns = npaw.implementation?.instructions?.toList()
            ?: throw PatchException("${npaw.definingClass}->${npaw.name} has no implementation")
        val setEnabled = insns.indexOfFirst { instruction ->
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            instruction.opcode == Opcode.INVOKE_VIRTUAL && ref?.definingClass == NPAW_ANALYTICS_OPTIONS &&
                ref.name == "setEnabled" && ref.parameterTypes.map(CharSequence::toString) == listOf("Z")
        }
        if (setEnabled <= 0) {
            throw PatchException("${npaw.definingClass}->${npaw.name} does not call AnalyticsOptions.setEnabled(Z)")
        }
        val argRegister = (insns[setEnabled] as FiveRegisterInstruction).registerD
        val load = insns[setEnabled - 1]
        if (load.opcode != Opcode.CONST_4 || (load as OneRegisterInstruction).registerA != argRegister ||
            (load as NarrowLiteralInstruction).narrowLiteral != 1
        ) {
            throw PatchException(
                "${npaw.definingClass}->${npaw.name}: expected const/4 v$argRegister, 0x1 before setEnabled, got ${load.opcode}",
            )
        }
        npaw.replaceInstruction(setEnabled - 1, "const/4 v$argRegister, 0x0")
    }
}
