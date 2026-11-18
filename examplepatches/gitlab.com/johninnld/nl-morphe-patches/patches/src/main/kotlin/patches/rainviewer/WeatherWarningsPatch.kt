package patches.rainviewer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hideWeatherWarnings = bytecodePatch(
    name = "Hide weather warnings overlay",
    description = "Removes the Weather Warnings map-layer control and stops its overlay downloads. Keeps weather warnings delivered as part of ordinary forecasts.",
    default = true,
) {
    compatibleWith(rainviewer)
    dependsOn(originalInput, startupCompatibility)
    execute {
        exact("Lpd3;", "e", "Ljd3;", "Lcom/lucky_apps/common/data/radarsmap/entity/MapLayer;").apply {
            check(implementation!!.registerCount >= 8) { "Unexpected overlay model registers" }
            addInstructions(0, """
                new-instance v0, Ljd3;
                const/4 v1, 0x0
                const/4 v2, 0x0
                const/4 v3, 0x0
                new-instance v4, Ln55;
                invoke-direct {v4, v1}, Ln55;-><init>(Z)V
                const/4 v5, 0x0
                invoke-direct/range {v0 .. v5}, Ljd3;-><init>(ZZZLq55;Ljava/lang/Integer;)V
                return-object v0
            """.trimIndent())
        }
        // This is the map-overlay dispatch condition. Force it off even when an
        // older build persisted overlay_alerts_enabled=true. Forecast alerts use
        // independent forecast/notification paths and remain unchanged.
        exact("Ldb;", "c", "Z").addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
