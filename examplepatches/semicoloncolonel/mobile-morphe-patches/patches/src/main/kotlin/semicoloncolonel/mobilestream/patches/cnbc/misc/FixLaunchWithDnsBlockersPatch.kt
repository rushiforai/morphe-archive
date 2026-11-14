package semicoloncolonel.mobilestream.patches.cnbc.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.cnbc.shared.Constants

// CNBC 8.8.2. The splash screen waits for OneTrust, the app's privacy
// consent service, to start. When OneTrust cannot reach its servers, for
// example when a DNS blocker blocks mobile-data.onetrust.io, it reports
// false, and the splash screen only acts on true, so the app never opens.
// A false answer now takes the app's own path for a start without the
// consent banner: it checks the subscription and opens the app.

internal object SplashOneTrustReadyFingerprint : Fingerprint(
    definingClass = "Lcom/cnbc/client/activities/SplashActivity;",
    name = "lambda\$onCreate\$0",
    returnType = "V",
    parameters = listOf("Ljava/lang/Boolean;"),
)

@Suppress("unused")
val fixLaunchWithDnsBlockersPatch = bytecodePatch(
    name = "Fix launch with DNS blockers",
    description = "Opens the app when a DNS blocker stops OneTrust, the app's privacy consent service. " +
        "Without it, the app stays on its splash screen.",
) {
    category("Setup")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        SplashOneTrustReadyFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-virtual { p1 }, Ljava/lang/Boolean;->booleanValue()Z
                    move-result p1
                    if-nez p1, :ready
                    invoke-direct { p0 }, Lcom/cnbc/client/activities/SplashActivity;->checkSubscription()V
                    return-void
                    :ready
                    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                """,
            )
        }
    }
}
