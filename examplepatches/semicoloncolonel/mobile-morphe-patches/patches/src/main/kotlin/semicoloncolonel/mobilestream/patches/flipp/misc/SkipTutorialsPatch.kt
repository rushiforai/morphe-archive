package semicoloncolonel.mobilestream.patches.flipp.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.flipp.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.prependGate
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// ─────────────────────────────────────────────────────────────────────────────
// Skip tutorials.
//
// Flipp 115.0.0 walks a new user through the app with a sheet after setup,
// spotlights on the search bar, the save button, and the Lists tab, and
// tutorials in flyers, coupons, and the shopping list. Each one is shown once
// and then recorded as shown in the app's preferences, which nearly all of
// them read through SharedPreferencesHelper.getBoolean. There the "shown"
// keys in ShoppingAdsFilter.isFlippTutorialKey read as true, so the app
// treats every tutorial as already seen.
//
// Two tutorials decide another way and are answered directly: the
// long-press-to-save tutorial reports that it was already shown, and the
// "browse other flyers" tutorial at the end of a flyer is never due.
//
// Not touched: the setup screens that ask for your location and stores.
// ─────────────────────────────────────────────────────────────────────────────

private const val ADS_FILTER = "Lsemicoloncolonel/mobilestream/extension/shared/misc/ShoppingAdsFilter;"
private const val TUTORIAL_RESULT = "Lcom/wishabi/flipp/app/TutorialManager\$Result;"

internal object PreferenceBooleanFingerprint : Fingerprint(
    definingClass = "Lcom/wishabi/flipp/util/SharedPreferencesHelper;",
    name = "getBoolean",
    parameters = listOf("Ljava/lang/String;", "Z"),
    returnType = "Z",
)

internal object LongPressTutorialFingerprint : Fingerprint(
    definingClass = "Lcom/wishabi/flipp/app/TutorialManager;",
    name = "showLongPressToClipTutorial",
    returnType = TUTORIAL_RESULT,
)

internal object CrossBrowseTutorialFingerprint : Fingerprint(
    definingClass = "Lcom/wishabi/flipp/storefront/domain/usecase/ShouldShowCrossBrowseTutorialUseCaseImpl;",
    name = "shouldShow",
    returnType = "Z",
)

@Suppress("unused")
val skipTutorialsPatch = bytecodePatch(
    name = "Skip tutorials",
    description = "Skips the spotlights and tutorials that walk a new user through the app.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        PreferenceBooleanFingerprint.method.prependGate(
            """
                invoke-static/range { p0 .. p0 }, $ADS_FILTER->isFlippTutorialKey(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :msp_orig
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )

        LongPressTutorialFingerprint.method.returnEarly(
            """
                sget-object v0, $TUTORIAL_RESULT->ALREADY_SHOWN:$TUTORIAL_RESULT
                return-object v0
            """.trimIndent(),
        )

        CrossBrowseTutorialFingerprint.method.returnEarly(
            """
                const/4 v0, 0x0
                return v0
            """.trimIndent(),
        )
    }
}
