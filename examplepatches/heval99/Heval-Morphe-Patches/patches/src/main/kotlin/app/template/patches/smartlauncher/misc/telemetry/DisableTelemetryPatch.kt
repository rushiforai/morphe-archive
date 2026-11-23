package app.template.patches.smartlauncher.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_SMARTLAUNCHER
import app.template.patches.smartlauncher.misc.signature.spoofSignaturePatch
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Smart Launcher reports through Firebase Analytics and Crashlytics. The analytics switch is
 * pinned off, logEvent returns at once and the Crashlytics collection setter always stores
 * false. Remote config (which the app needs) is left alone.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_SMARTLAUNCHER)

    // The app exits at start when its signature is not the original one.
    dependsOn(spoofSignaturePatch)

    execute {
        // 1. The app's analytics switch hands its boolean to Firebase through Boolean.valueOf and
        //    returns the same register. Load false into that register right before the call, so
        //    Firebase gets false at start and on every preference change, and the app's own flag
        //    follows.
        val switch = AnalyticsSwitchFingerprint.method
        val valueOf = switch.implementation!!.instructions.single {
            it.opcode == Opcode.INVOKE_STATIC &&
                ((it as ReferenceInstruction).reference as MethodReference).let { ref ->
                    ref.definingClass == "Ljava/lang/Boolean;" && ref.name == "valueOf"
                }
        }
        val valueOfIndex = switch.implementation!!.instructions.indexOf(valueOf)
        val flag = (valueOf as FiveRegisterInstruction).registerC
        switch.addInstructionsChecked(valueOfIndex, "const/16 v$flag, 0x0")

        // 2. FirebaseAnalytics.logEvent (the renamed (String, Bundle) void). The connector's own
        //    logEvent is not touched.
        FirebaseAnalyticsLogEventFingerprint.method.also {
            if (it.implementation == null) throw PatchException("Disable telemetry: logEvent has no body")
        }.returnEarly()

        // 3. Crashlytics' collection setter always stores false: its boolean parameter (p1) is
        //    overwritten at entry. const/16 takes an 8-bit register, so a high p-register is safe.
        CrashlyticsCollectionSetterFingerprint.method.addInstructionsChecked(0, "const/16 p1, 0x0")
    }
}
