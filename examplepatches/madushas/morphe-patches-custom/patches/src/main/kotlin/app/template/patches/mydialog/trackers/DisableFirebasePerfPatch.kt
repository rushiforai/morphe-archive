package app.template.patches.mydialog.trackers

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.mydialog.FirebasePerfInstrument
import app.template.patches.mydialog.VerifyInstallerId
import app.template.patches.shared.Constants.MYDIALOG_COMPATIBILITY
import app.template.patches.shared.clearBody
import app.template.patches.shared.ensureRegisters

/**
 * Firebase Performance Monitoring wraps every network call in
 * `FirebasePerfUrlConnection.instrument(...)` (tracing + telemetry). Replacing it
 * with an identity function keeps the returned connection intact — every caller
 * behaves exactly as before — while perf tracing never engages.
 *
 * The same patch also fixes `NativeUtilsModule.verifyInstallerId(Promise)`:
 * it resolves whether the app was installed from Play, and patched installs are
 * sideloaded (installer = null → `false`), which JS may treat as tampering.
 * It now always resolves `true`.
 */
@Suppress("unused")
val myDialogDisableFirebasePerfPatch = bytecodePatch(
    name = "Disable Firebase Performance + installer check",
    description = "Makes Firebase Performance's connection wrapper a pass-through " +
        "(no perf telemetry) and reports installs as Play-installed regardless " +
        "of the actual installer.",
    default = true,
) {
    compatibleWith(MYDIALOG_COMPATIBILITY)

    execute {
        // instrument(URLConnection) -> the same connection, untraced.
        // (Static method: its single parameter is p0.)
        val instrument = FirebasePerfInstrument.method
        instrument.ensureRegisters(1)
        instrument.clearBody()
        instrument.addInstructions(
            0,
            """
            return-object p0
            """.trimIndent(),
        )

        // verifyInstallerId(Promise) -> resolve(true).
        val verify = VerifyInstallerId.method
        verify.ensureRegisters(2)
        verify.clearBody()
        verify.addInstructions(
            0,
            """
            const/4 v0, 0x1
            invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
            move-result-object v0
            invoke-virtual {p1, v0}, Lcom/facebook/react/bridge/Promise;->resolve(Ljava/lang/Object;)V
            return-void
            """.trimIndent(),
        )
    }
}
