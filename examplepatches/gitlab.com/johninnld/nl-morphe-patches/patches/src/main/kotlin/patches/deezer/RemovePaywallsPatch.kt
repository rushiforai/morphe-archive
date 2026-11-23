package patches.deezer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

internal fun suppressNoFreemiumStartup2703(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    check(method.definingClass == "LlllllIlIIllIl;" && method.name == "llIIIIIIlIIIIll")
    method.addInstructions(
            0,
            """
                iget v0, p0, LlllllIlIIllIl;->IllIlIlIIlIllIll:I
                const/16 v1, 0x8
                if-ne v0, v1, :morphe_native_rule
                const/4 v0, 0x0
                return-object v0
                :morphe_native_rule
            """,
        )
}

/**
 * Subscription surfaces open from the premium tab, the artist paywall, trial
 * prompts and offer dialogs. The premium tab is consumed at navigation time:
 * finishing its activity would remove the current task and drop to the launcher.
 * Other paywall screens close after their normal super.onCreate.
 */
@Suppress("unused")
val deezerRemovePaywalls = bytecodePatch(
    name = "Remove subscription paywalls",
    description = "Stops the startup plans page from blocking the app by treating the account as not " +
        "waiting for payment and skipping the no-freemium startup redirect, stops the Premium tab and " +
        "the startup Premium surface from blocking the app, redirecting the startup Premium activity to " +
        "Home, and closes the artist paywall, trial-start and offer-dialog activities after their normal " +
        "lifecycle starts. Account, sign-in and catalogue services are unchanged.",
    default = true,
) {
    compatibleWith(deezer)
    dependsOn(deezerBase, deezerKeepSessionOnColdStart)

    execute {
        // Startup block page: every non-dialog activity re-runs the startup
        // NavigationPolicy from onResume. Its no-freemium rule reads
        // NoFreemiumData.mNoFreemiumStatus (1 = WAITING_FOR_PAYMENT from the auth
        // response, cached in preferences) and returns the NoFreemiumRedirection or
        // GoToPayment deeplink, which reopens the plans page over whatever screen is
        // showing. Report the account as not waiting for payment (status 3, the
        // normal signed-in value) and make the rule ignore a stale cached status 1.
        exact("Lcore/auth/module/UserAuthParsedResult;", "isWaitingforPayment", "Z")
            .method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")

        // R8 merged this rule with consent/logout rules in 27. Only variant 8
        // is the no-freemium redirect; all other variants must retain their code.
        suppressNoFreemiumStartup2703(exact("LlllllIlIIllIl;", "llIIIIIIlIIIIll", "LIlllllIIllIllII;",
            "Landroid/content/Context;", "LIllllllIllIllIII;").method)

        // Menu id 5 is the Premium tab. Consume it before NavigationUI builds the
        // PremiumTabActivity intent; finishing that activity instead removes the
        // whole task and exposes the launcher.
        exact(
            "Lcom/deezer/ui/tabbar/NavigationTabBarFragment;",
            "IIIlIlIlIIlllll",
            "Z",
            "Landroid/view/MenuItem;",
        ).method.addInstructions(
            0,
            """
                invoke-interface/range {p1 .. p1}, Landroid/view/MenuItem;->getItemId()I
                move-result v0
                const/4 v1, 0x5
                if-ne v0, v1, :morphe_not_premium
                const/4 v0, 0x1
                return v0
                :morphe_not_premium
            """,
        )

        // Remove the Premium item (menu id 5) from the built bottom navigation menu, so
        // the tab is absent rather than only ignored when it is clicked.
        val tabMenu = exact(
            "Lcom/deezer/ui/tabbar/NavigationTabBarFragment;",
            "IIIIllllIIIIIllI",
            "V",
            "Landroid/view/Menu;",
            "LIIIIlIIIlIlIIIIl;",
            "Z",
        ).method
        val tabMenuImpl = tabMenu.implementation ?: error("Tab menu builder has no code")
        val tabReturn = tabMenuImpl.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        check(tabReturn >= 0) { "Deezer tab menu builder changed" }
        tabMenu.addInstructions(
            tabReturn,
            """
                const/4 v0, 0x5
                invoke-interface {p1, v0}, Landroid/view/Menu;->removeItem(I)V
            """,
        )

        // Post-login "paywall pressure" opens a WebView dialog for premiumtab.
        // Block that starter before it creates the dialog.
        exact(
            "Lcom/deezer/android/ui/activity/WebViewDialogActivity;",
            "IlllIlllllIIllll",
            "V",
            "Landroid/content/Context;",
            "Ljava/lang/String;",
            "LlIlllllllllIllI;",
        ).method.addInstructions(
            0,
            """
                const-string v0, "premiumtab"
                invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v0
                if-eqz v0, :morphe_not_premium_web
                return-void
                :morphe_not_premium_web
            """,
        )

        // Some callers start the dialog directly. Close a premiumtab payload after
        // the normal activity super call, over the still-running Home task.
        exact(
            "Lcom/deezer/android/ui/activity/WebViewDialogActivity;",
            "onCreate",
            "V",
            "Landroid/os/Bundle;",
        ).method.addInstructions(
            0,
            """
                invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;
                move-result-object v0
                const-string v1, "url"
                invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v0
                if-eqz v0, :morphe_web_continue
                const-string v1, "premiumtab"
                invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
                move-result v0
                if-eqz v0, :morphe_web_continue
                invoke-super/range {p0 .. p1}, LIIlIIIlIIlIIlIII;->onCreate(Landroid/os/Bundle;)V
                invoke-virtual/range {p0 .. p0}, Lcom/deezer/android/ui/activity/WebViewDialogActivity;->finish()V
                return-void
                :morphe_web_continue
            """,
        )

        // NativePremiumActivity can be the restored task root at startup. Finishing it
        // would empty the task and expose the launcher; start the normal Home surface
        // instead, then finish the subscription activity.
        redirectAfterSuperOnCreate(
            "Lcom/deezer/ui/premium/NativePremiumActivity;",
            "Lcom/deezer/ui/dynamicpage/DynamicPageRootActivity;",
        )

        listOf(
            "Lcom/deezer/feature/artist/ArtistPaywallActivity;",
            "Lcom/deezer/feature/trialstart/TrialStartActivity;",
            "Lcom/deezer/ui/premium/NativePremiumTabActivity;",
            "Lcom/deezer/android/ui/activity/UserOffersDialogActivity;",
        ).forEach { closeAfterSuperOnCreate(it) }
    }
}
