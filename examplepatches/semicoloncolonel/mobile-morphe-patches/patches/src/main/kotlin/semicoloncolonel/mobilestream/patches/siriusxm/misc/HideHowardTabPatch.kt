package semicoloncolonel.mobilestream.patches.siriusxm.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import semicoloncolonel.mobilestream.patches.siriusxm.shared.Constants

// SiriusXM 2610.4.0. The tabs at the top of Discover (For You, Music, Talk &
// Podcasts, Sports, Howard) are the "categories" in the app's bundled config,
// assets/sxmp-configs/content.json. Each has a titleKey, and Howard's is
// "nav_howard", which opens Howard Stern's page. The phone uses
// config.categories, and the overrides hold the same list for Android TV.
// The patch removes the Howard entry from each list. SiriusXM's server
// config (checked on 2026-11-08) does not send its own list of tabs.

private const val CONTENT_CONFIG = "assets/sxmp-configs/content.json"

// One category object, with its fields in any order.
private const val HOWARD = """\{[^{}]*"titleKey"\s*:\s*"nav_howard"[^{}]*\}"""

@Suppress("unused")
val hideHowardTabPatch = resourcePatch(
    name = "Hide Howard tab",
    description = "Removes the Howard tab from the top of Discover.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        val file = get(CONTENT_CONFIG)
        if (!file.exists()) throw PatchException("SiriusXM: $CONTENT_CONFIG not found")
        val text = file.readText()
        if (!Regex(HOWARD).containsMatchIn(text)) {
            throw PatchException("SiriusXM: the Howard tab was not found in $CONTENT_CONFIG")
        }
        file.writeText(
            text
                // After another category: drop it with the comma before it.
                .replace(Regex(""",\s*$HOWARD"""), "")
                // First in its list: drop it with the comma after it.
                .replace(Regex("""$HOWARD\s*,?"""), ""),
        )
    }
}
