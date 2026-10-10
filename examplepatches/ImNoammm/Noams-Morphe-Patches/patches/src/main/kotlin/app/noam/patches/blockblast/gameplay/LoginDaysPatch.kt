package app.noam.patches.blockblast.gameplay

import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.rawResourcePatch
import app.noam.patches.blockblast.mod.Mod
import app.noam.patches.blockblast.mod.modLoaderPatch
import app.noam.patches.blockblast.shared.Constants.COMPATIBILITY_BLOCK_BLAST

@Suppress("unused")
val loginDaysPatch = rawResourcePatch(
    name = "Login days",
    description = "The score multiplier uses a fixed number of login days instead of counting the days you open the game.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_BLOCK_BLAST)
    dependsOn(modLoaderPatch)

    val days by intOption(
        key = "days",
        default = 1,
        values = mapOf("1 day (a new install)" to 1, "7 days" to 7, "30 days" to 30, "100 days" to 100),
        title = "Login days",
        description = "Clears score 1 + log10(days) + 1/(1 + days mod 10) times the base (1 day: x1.5, 10 days: x3).",
        validator = { it == null || it >= 1 },
    )

    execute { Mod.enable("loginDays", mapOf("days" to (days ?: 1))) }
}
