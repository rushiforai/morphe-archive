package semicoloncolonel.mobilestream.patches.yahoonews.misc

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.rawResourcePatch
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle
import semicoloncolonel.mobilestream.patches.shared.misc.disableExpoUpdatesPatch
import semicoloncolonel.mobilestream.patches.yahoonews.shared.Constants
import semicoloncolonel.mobilestream.patches.yahoonews.shared.videoOptOutPatch

// ─────────────────────────────────────────────────────────────────────────────
// Yahoo News 100.1.1 — Customize bottom bar.
//
// AndroidTabs lists the bottom tabs with Expo Router's Tabs.Screen. A tab is
// shown with the options {title: <label>} and hidden with {href: null}, which
// is how Yahoo hides the tabs that are switched off. Each option hides one tab
// the same way (HermesBundle.hideTab). Home stays, so the bar always has a tab
// to open on.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val customizeBottomBarPatch = rawResourcePatch(
    name = "Customize bottom bar",
    description = "Hides the bottom tabs you choose in the options. Home always stays.",
    default = false,
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(disableExpoUpdatesPatch, videoOptOutPatch)

    val tabs = listOf(
        Triple("top-stories", "hideTrending", "Hide Trending"),
        Triple("games", "hideGames", "Hide Games"),
        Triple("notifications", "hideNotifications", "Hide Notifications"),
        Triple("search-tab", "hideSearch", "Hide Search"),
    ).map { (tab, key, title) ->
        tab to booleanOption(
            key = key,
            default = false,
            title = title,
            description = "Removes this tab from the bottom bar.",
        )
    }

    execute {
        val chosen = tabs.filter { (_, option) -> option.value == true }.map { it.first }
        if (chosen.isEmpty()) return@execute
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        chosen.forEach { bundle.hideTab("AndroidTabs", it) }
        file.writeBytes(bundle.toByteArray())
    }
}
