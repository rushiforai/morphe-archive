package app.saketh.patches.webnovel.popups

import app.morphe.patcher.patch.classDefBy
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.saketh.patches.webnovel.controls.patchControlsRuntime
import app.saketh.patches.webnovel.controls.registerFeature
import app.saketh.patches.webnovel.controls.whenEnabled
import app.saketh.patches.shared.Constants.COMPATIBILITY_WEBNOVEL

private const val NOTIFICATION_NAG_CLASS = "Lcom/qidian/QDReader/widget/notification/NotificationDialogUtil;"
private const val FEATURED_WORKS_CONFIG_CLASS = "Lcom/qidian/QDReader/components/entity/CustomPage;"

@Suppress("unused")
val hidePopupsPatch = patch(
    name = "Hide popups",
    description = "Hides promotional and nag popups: home campaign popups and floating banners, " +
        "the automatic check-in modal, notification permission nags, automatic rating prompts " +
        "and the popups shown when leaving the reader. Adds a separate switch for the full-screen " +
        "Featured Works page. Purchase and login dialogs are left as they are.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_WEBNOVEL)
    dependsOn(patchControlsRuntime)

    execute {
        registerFeature("hide_popups")
        HomeCampaignPopupFingerprint.method.whenEnabled("hidePopups", "return-void")

        HomeFloatingPromoFingerprint.method.whenEnabled("hidePopups", "return-void")

        // Use the existing no-campaign branch without changing reading-time or reward data.
        LibraryFloatingPromoFingerprint.method.whenEnabled("hidePopups", "const/4 p1, 0x0")

        // Server config gating the full-screen Featured Works page at launch and its shortcut above the tabs.
        registerFeature("hide_featured_works")
        mutableClassDefBy(FEATURED_WORKS_CONFIG_CLASS).methods.single {
            it.name == "canShow" && it.parameterTypes.isEmpty() && it.returnType == "Z"
        }.whenEnabled("hideFeaturedWorks", "const/4 v0, 0x0\nreturn v0")

        // The app's own "disabled" branch continues normal home screen startup.
        AutoCheckInModalFingerprint.method.whenEnabled("hidePopups", "const/4 v0, 0x0\nreturn v0")

        // Each no-argument method launches one nag (after commenting, after reading, on task screens).
        mutableClassDefBy(NOTIFICATION_NAG_CLASS).methods
            .filter { it.returnType == "V" && it.parameterTypes.isEmpty() && !it.name.startsWith("<") }
            .forEach { it.whenEnabled("hidePopups", "return-void") }

        // Leave the "profile" branch alone so the user can still rate the app on purpose.
        RatingPromptFingerprint.let {
            it.method.whenEnabled("hidePopups", "return-void", it.instructionMatches.last().index + 1)
        }

        // Call the exit callback the app uses when no popup is configured, which closes the reader.
        // p7 is the callback parameter: p1 context, p2-p3 long, p4 int, p5-p6 long, p7 callback.
        ReaderExitPopupFingerprint.method.apply {
            val callbackType = parameterTypes.last().toString()
            val closeReader = classDefBy(callbackType).methods.single {
                it.returnType == "V" && it.parameterTypes.isEmpty()
            }
            whenEnabled(
                "hidePopups",
                """
                    invoke-interface { p7 }, $callbackType->${closeReader.name}()V
                    return-void
                """,
            )
        }
    }
}
