package app.fluffy.patches.mdproxy.unlock

import app.fluffy.patches.mdproxy.CountdownFormatterFingerprint
import app.fluffy.patches.mdproxy.TimeLeftGetterFingerprint
import app.fluffy.patches.shared.Constants.COMPATIBILITY_MDPROXY
import app.fluffy.patches.waypoint.clearBody
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlimitedTimePatch = bytecodePatch(
    name = "Unlimited Time",
    description = "The session clock always reports 100 years, so sessions never expire. " +
        "The countdown display shows the infinity sign.",
) {
    compatibleWith(COMPATIBILITY_MDPROXY)

    execute {
        TimeLeftGetterFingerprint.method.apply {
            clearBody()
            addInstructions(0, "const-wide v0, 0x2dec1f42c00L\nreturn-wide v0")
        }

        CountdownFormatterFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const-wide v0, 0x16f60fa1600L
                    cmp-long v0, p0, v0
                    if-ltz v0, :cond_morphe_inf
                    const-string v0, "∞"
                    return-object v0
                    :cond_morphe_inf
                """.trimIndent(),
            )
        }

        println("MD Proxy: TimeLeft forced to 100 years, countdown shows ∞")
    }
}
