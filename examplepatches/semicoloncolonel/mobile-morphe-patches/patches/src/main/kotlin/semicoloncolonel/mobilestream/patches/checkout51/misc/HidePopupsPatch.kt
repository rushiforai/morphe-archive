package semicoloncolonel.mobilestream.patches.checkout51.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import semicoloncolonel.mobilestream.patches.checkout51.shared.Constants
import semicoloncolonel.mobilestream.patches.checkout51.shared.GetListItemsFromOfferModelsFingerprint
import semicoloncolonel.mobilestream.patches.checkout51.shared.SHOPPING_ADS_FILTER
import semicoloncolonel.mobilestream.patches.checkout51.shared.fixStuckDialogPatch

// ─────────────────────────────────────────────────────────────────────────────
// Hide pop-ups.
//
// Checkout 51 9.22.10, in its own unobfuscated code unless noted:
//
//   Sign-up sheet      SignUpPromptController.showIfPossible opens "Want to
//                      see more offers?" 30 seconds into a guest's first
//                      session. It now returns at once.
//   Review card        a "rate the app" card in the offer list, sent as an
//                      offer model labeled "_app_review_prompt_", is dropped.
//   Home dialogs       HomeDialogManager shows at most one of four dialogs a
//                      session. Three are marketing and now never qualify:
//                      the welcome walkthrough after sign-up
//                      (HomeWelcomeDialogUnit), the push notification primer
//                      (HomePlmDialogUnit), and the Instant Offers promotion
//                      (HomeInstantOfferDialogUnit). The country picker
//                      (HomeCountryDialogUnit) still shows, because it sets
//                      which offers you get.
//   Push banner        the "turn on notifications" global banner
//                      (PushGlobalBannerUnit). The offline banner still shows.
//   Braze messages     Braze's default in-app message listener now discards
//                      every marketing message instead of showing it.
//   Location notice    once location has been declined, PermissionChecker
//                      shows "Checkout 51 collects precise location data..."
//                      before asking again, and a second notice after it is
//                      declined for good. For location only, both now act as
//                      if Cancel was tapped: the Gas map shows its no-location
//                      screen. The camera notice for receipt scanning stays.
// ─────────────────────────────────────────────────────────────────────────────

internal object ShowSignUpPromptFingerprint : Fingerprint(
    definingClass = "Lcom/c51/feature/offers/offerList/SignUpPromptController;",
    name = "showIfPossible",
    returnType = "V",
)

private const val DIALOGS = "Lcom/c51/feature/offers/offerList/dialogs/"

internal object WelcomeDialogShouldShowFingerprint : Fingerprint(
    definingClass = "${DIALOGS}HomeWelcomeDialogUnit;",
    name = "shouldShow",
    returnType = "Z",
)

internal object PushPrimerShouldShowFingerprint : Fingerprint(
    definingClass = "${DIALOGS}HomePlmDialogUnit;",
    name = "shouldShow",
    returnType = "Z",
)

internal object InstantOfferDialogShouldShowFingerprint : Fingerprint(
    definingClass = "${DIALOGS}HomeInstantOfferDialogUnit;",
    name = "shouldShow",
    returnType = "Z",
)

internal object PushBannerReadyFingerprint : Fingerprint(
    definingClass = "Lcom/c51/feature/global/banner/pushNotification/PushGlobalBannerUnit;",
    name = "isReadyToShow",
    returnType = "Z",
)

private const val PERMISSION_CHECKER = "Lcom/c51/core/custom/permissions/PermissionChecker;"
private const val C51_PERMISSION = "Lcom/c51/core/custom/permissions/PermissionChecker\$C51Permission;"

internal object RequestPermissionFingerprint : Fingerprint(
    definingClass = PERMISSION_CHECKER,
    name = "requestPermission",
    parameters = listOf("Lcom/c51/core/activity/BaseActivity;", "Landroidx/lifecycle/c0;"),
    returnType = "V",
)

internal object ShowNeverAskAgainInquiryDialogFingerprint : Fingerprint(
    definingClass = PERMISSION_CHECKER,
    name = "showNeverAskAgainInquiryDialog",
    parameters = listOf("Landroid/app/Activity;"),
    returnType = "V",
)

private const val IN_APP_OPERATION = "Lcom/braze/ui/inappmessage/InAppMessageOperation;"

internal object BrazeBeforeInAppMessageDisplayedFingerprint : Fingerprint(
    definingClass = "Lcom/braze/ui/inappmessage/listeners/DefaultInAppMessageManagerListener;",
    name = "beforeInAppMessageDisplayed",
    returnType = IN_APP_OPERATION,
)

@Suppress("unused")
val hidePopupsPatch = bytecodePatch(
    name = "Hide pop-ups",
    description = "Removes the sign-up sheet, the welcome walkthrough, the notification and Instant Offers " +
        "prompts, the location notice, marketing messages, and the card that asks you to rate the app.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(fixStuckDialogPatch)

    extendWith("extensions/extension.mpe")

    execute {
        ShowSignUpPromptFingerprint.method.addInstructions(0, "return-void")

        WelcomeDialogShouldShowFingerprint.method.returnEarly(false)
        PushPrimerShouldShowFingerprint.method.returnEarly(false)
        InstantOfferDialogShouldShowFingerprint.method.returnEarly(false)
        PushBannerReadyFingerprint.method.returnEarly(false)

        BrazeBeforeInAppMessageDisplayedFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, $IN_APP_OPERATION->DISCARD:$IN_APP_OPERATION
                return-object v0
            """,
        )

        // requestPermission(BaseActivity p1, LifecycleOwner p2): for location,
        // when the notice would show (not granted, notice required, and the
        // system says to explain), report a denial as the Cancel button does.
        RequestPermissionFingerprint.method.addInstructionsWithLabels(
            0,
            """
                iget-object v0, p0, $PERMISSION_CHECKER->c51Permission:$C51_PERMISSION
                sget-object v1, $C51_PERMISSION->LOCATION:$C51_PERMISSION
                if-ne v0, v1, :show
                iget-boolean v1, p0, $PERMISSION_CHECKER->requiresInquiry:Z
                if-eqz v1, :show
                invoke-static {p1, v0}, $PERMISSION_CHECKER->hasPermission(Landroid/content/Context;$C51_PERMISSION)Ljava/lang/Boolean;
                move-result-object v1
                invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z
                move-result v1
                if-nez v1, :show
                invoke-direct {p0, p1, v0}, $PERMISSION_CHECKER->shouldShowPermissionRationale(Landroid/app/Activity;$C51_PERMISSION)Ljava/lang/Boolean;
                move-result-object v1
                invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z
                move-result v1
                if-eqz v1, :show
                const/4 v0, 0x0
                const/4 v1, 0x0
                invoke-direct {p0, v0, v1}, $PERMISSION_CHECKER->lambda${'$'}requestPermission${'$'}1(Landroid/content/DialogInterface;I)V
                return-void
                :show
                nop
            """,
        )

        // The notice after a permanent denial: for location, the OK button's
        // action runs without the dialog.
        ShowNeverAskAgainInquiryDialogFingerprint.method.addInstructionsWithLabels(
            0,
            """
                iget-object v0, p0, $PERMISSION_CHECKER->c51Permission:$C51_PERMISSION
                sget-object v1, $C51_PERMISSION->LOCATION:$C51_PERMISSION
                if-ne v0, v1, :show
                const/4 v0, 0x0
                const/4 v1, 0x0
                invoke-direct {p0, v0, v1}, $PERMISSION_CHECKER->lambda${'$'}showNeverAskAgainInquiryDialog${'$'}3(Landroid/content/DialogInterface;I)V
                return-void
                :show
                nop
            """,
        )

        GetListItemsFromOfferModelsFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x2
                invoke-static {p1, v0}, $SHOPPING_ADS_FILTER->checkout51Offers(Ljava/util/List;I)Ljava/util/List;
                move-result-object p1
            """,
        )
    }
}
