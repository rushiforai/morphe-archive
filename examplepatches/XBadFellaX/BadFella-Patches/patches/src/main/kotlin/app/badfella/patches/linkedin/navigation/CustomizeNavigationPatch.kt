package app.badfella.patches.linkedin.navigation

import app.badfella.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.badfella.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.badfella.patches.linkedin.shared.markIncluded
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/NavigationBar;"

/** HomeNavTabsManager.getHomeNavTabs(): the tabs of the bottom bar. */
private object CustomizeHomeNavTabsFingerprint : Fingerprint(
    definingClass = "Lcom/linkedin/android/home/HomeNavTabsManager;",
    name = "getHomeNavTabs",
    returnType = "Ljava/util/List;",
    parameters = emptyList(),
)

/**
 * Picks the bottom bar tabs to hide while patching, for users who set the selection in Morphe Manager instead of
 * inside LinkedIn. The mask is stored once, before the bar builds its tabs, and the same runtime filter also
 * applies the in-app toggles of the Navigation bar patch, so either mechanism works and both can be combined.
 */
@Suppress("unused")
val customizeNavigationBarPatch = bytecodePatch(
    name = "Customize navigation bar",
    description = "Takes the bottom navigation buttons you pick off the bar, such as My Network, Post, " +
        "Notifications, Jobs, Video or News. Each page still opens from the Menu and from links. " +
        "Restart LinkedIn after changing the selection.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Navigation")
    dependsOn(navigationHooksPatch)

    val hideMyNetwork = booleanOption(
        "hide_my_network", false,
        title = "Hide My Network",
        description = "Removes the My Network button from the bottom navigation bar.",
    )
    val hidePost = booleanOption(
        "hide_post", false,
        title = "Hide Post",
        description = "Removes the center Post button from the bottom navigation bar.",
    )
    val hideNotifications = booleanOption(
        "hide_notifications", false,
        title = "Hide Notifications",
        description = "Removes the Notifications button from the bottom navigation bar.",
    )
    val hideJobs = booleanOption(
        "hide_jobs", false,
        title = "Hide Jobs",
        description = "Removes the Jobs button from the bottom navigation bar.",
    )
    val hideVideo = booleanOption(
        "hide_video", false,
        title = "Hide Video",
        description = "Removes the Video button from the bottom navigation bar.",
    )
    val hideNews = booleanOption(
        "hide_news", false,
        title = "Hide News",
        description = "Removes the News button from the bottom navigation bar.",
    )

    execute {
        markIncluded("isCustomizeNavigationIncluded")

        var mask = 0
        if (hideMyNetwork.value == true) mask = mask or 1
        if (hidePost.value == true) mask = mask or 2
        if (hideNotifications.value == true) mask = mask or 4
        if (hideJobs.value == true) mask = mask or 8
        if (hideVideo.value == true) mask = mask or 16
        if (hideNews.value == true) mask = mask or 32
        if (mask == 0) return@execute

        val method = CustomizeHomeNavTabsFingerprint.method
        val implementation = method.implementation
            ?: throw PatchException("getHomeNavTabs has no body; this build needs review")
        // The method is an instance method, so p0 is its only parameter word and every v register is free at entry.
        val parameterWords = 1
        if (implementation.registerCount - parameterWords < 1) {
            throw PatchException("getHomeNavTabs has no free local for the tab mask; this build needs review")
        }
        method.addInstructions(
            0,
            """
                const/16 v0, 0x${mask.toString(16)}
                invoke-static { v0 }, $EXTENSION_CLASS->setPresetMask(I)V
            """
        )
    }
}
