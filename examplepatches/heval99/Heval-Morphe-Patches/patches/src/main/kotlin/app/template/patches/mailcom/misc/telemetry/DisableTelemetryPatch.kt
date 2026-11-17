package app.template.patches.mailcom.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.mailcom.shared.forceGettersFalse
import app.template.patches.shared.Constants.COMPATIBILITY_MAILCOM
import app.template.patches.shared.addInstructionsChecked
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private const val PATCH = "Disable telemetry"

// The TrackingPermissions fields forced off: Brain and Trop (the app's own tracking pixels; Brain
// also gates mail-body link-click tracking, the link still opens) and Reach (INFOnline audience
// measurement). Toast (ToastDisplayingEndpoint, a debug display of events) and the advertisement
// flag are left as consent set them.
internal val DENIED_TRACKERS = listOf("isBrainTrackingAllowed", "isReachTrackingAllowed", "isTropTrackingAllowed")

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = PATCH,
    description = "Disables the app's usage tracking (Tracking2, Brain), INFOnline audience " +
        "measurement, app monitoring and Sentry crash reporting. Push notifications keep working.",
) {
    compatibleWith(COMPATIBILITY_MAILCOM)

    execute {
        // 1. Tracking2: EventCollector drops every event when the remote switch is off.
        Tracking2ConfigToStringFingerprint.classDef.forceGettersFalse(PATCH, listOf("isTracking2Enabled"))

        // 2. TrackingPermissions(ZZZZZ): the Brain, Reach and Trop arguments are set to false at
        // entry, whatever consent and remote config decided. The constructor is the only way in
        // (copy() calls it too). Each parameter register is read from the iput-boolean that
        // stores it, so a reordered constructor still forces the right flags.
        val permissions = TrackingPermissionsToStringFingerprint.classDef
        val constructor = permissions.methods.singleOrNull { method ->
            method.name == "<init>" && method.implementation != null &&
                method.parameterTypes.map(CharSequence::toString) == List(5) { "Z" }
        } ?: throw PatchException("$PATCH: ${permissions.type} has no single <init>(ZZZZZ)V")
        val implementation = constructor.implementation!!
        val p0 = implementation.registerCount - (constructor.parameterTypes.size + 1)
        val forced = DENIED_TRACKERS.joinToString("\n") { field ->
            val stores = implementation.instructions.filter { insn ->
                insn.opcode == Opcode.IPUT_BOOLEAN &&
                    ((insn as ReferenceInstruction).reference as FieldReference)
                        .let { it.definingClass == permissions.type && it.name == field }
            }
            val register = (stores.singleOrNull() as? TwoRegisterInstruction)?.registerA
                ?: throw PatchException("$PATCH: expected one iput-boolean of $field, found ${stores.size}")
            // p1..p5 are the five booleans; p0 is `this`.
            val parameter = register - p0
            if (parameter !in 1..5) {
                throw PatchException("$PATCH: $field is stored from v$register, not a parameter (p0 = v$p0)")
            }
            // const/4 takes a 4-bit register (rule 11); const/16 takes eight bits.
            "${if (register < 16) "const/4" else "const/16"} p$parameter, 0x0"
        }
        constructor.addInstructionsChecked(0, forced)

        // 3. App monitoring stays off.
        AppMonConfigToStringFingerprint.classDef.forceGettersFalse(PATCH, listOf("isAppMonEnabled"))

        // 4. Sentry is never started (auto-init is already off in the manifest). Reports and
        // breadcrumbs then go to Sentry's no-op hub.
        SentryStartFingerprint.method.returnEarly()
    }
}
