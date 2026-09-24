package app.journal.patches.substances

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.journal.patches.shared.Constants.COMPATIBILITY_JOURNAL
import java.io.File

// The app's substance database is a single bundled asset, loaded by its
// literal filename ("Substances.json") - not user-configurable, resource ID,
// or otherwise indirected. Swapping it is just a matter of overwriting that
// file in the decoded resource tree before it's repacked.
@Suppress("unused")
val customSubstancesPatch = resourcePatch(
    name = "Custom substances database",
    description = "Replaces the bundled Substances.json asset with your own file.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_JOURNAL)

    val substancesFile by stringOption(
        key = "substancesFile",
        default = "",
        title = "Substances JSON path",
        description = "Absolute path on your machine to the replacement Substances.json file.",
        required = true,
    ) {
        it != null && File(it).isFile
    }

    execute {
        val source = File(substancesFile!!)
        val target = get("assets/Substances.json", false)

        if (!target.exists()) {
            throw PatchException("Could not find assets/Substances.json in the decoded resources")
        }

        source.copyTo(target, overwrite = true)
    }
}
