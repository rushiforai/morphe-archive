package app.polishapps.patches.orange.dashboard

import app.morphe.patcher.patch.bytecodePatch
import app.polishapps.patches.shared.Constants.COMPATIBILITY_MOJ_ORANGE

@Suppress("unused")
val hideStoriesPatch = bytecodePatch(
    name = "Hide stories",
    description = "Removes the Instagram-style stories row at the top of the home screen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_MOJ_ORANGE)

    dependsOn(dashboardItemsHookPatch)

    execute {
        setLayoutId("storiesLayout", "template_dashboard_stories_collection")
        setLayoutId("prepaidStoriesLayout", "template_prepaid_dashboard_stories_collection")
        setExtensionConstant("hideStories", 1)
    }
}
