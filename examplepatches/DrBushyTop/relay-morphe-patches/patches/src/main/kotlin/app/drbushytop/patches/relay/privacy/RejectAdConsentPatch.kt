package app.drbushytop.patches.relay.privacy

import app.drbushytop.patches.relay.Relay
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

private const val CONSENT_MANAGER_CLASS = "Lreddit/news/ads/consent/GoogleConsentManager;"
private const val LISTENER_CLASS = "Lreddit/news/ads/consent/GoogleConsentManager\$onConsentUpdatedListener;"
private const val REJECT_AD_CONSENT_CLASS = "Lapp/drbushytop/extension/relay/RejectAdConsent;"

/**
 * `GoogleConsentManager#o(listener, boolean)`: Relay asks for consent before loading ads. Once
 * Google's consent check is done it goes on to `n` (the form), or straight to the listener when
 * the check failed or no form is available.
 */
internal object RequestConsentFingerprint : Fingerprint(
    definingClass = CONSENT_MANAGER_CLASS,
    returnType = "V",
    parameters = listOf(LISTENER_CLASS, "Z"),
)

/**
 * `GoogleConsentManager#n(boolean)`: loads Google's consent form, shows it when Google says
 * consent is needed (or when asked to from Relay's About screen), then tells Relay's listener to
 * go on with the answer the form stored.
 */
internal object LoadConsentFormFingerprint : Fingerprint(
    definingClass = CONSENT_MANAGER_CLASS,
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(
        methodCall(definingClass = "Lcom/google/android/ump/UserMessagingPlatform;"),
    ),
)

/**
 * `GoogleConsentManager#g()`: whether consent was obtained (status OBTAINED, 3). If it was,
 * Relay skips the form step and hands the stored answer to each ad network.
 */
internal object ConsentObtainedFingerprint : Fingerprint(
    definingClass = CONSENT_MANAGER_CLASS,
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        methodCall(definingClass = "Lcom/google/android/ump/ConsentInformation;", returnType = "I"),
        literal(3),
    ),
)

@Suppress("unused")
val rejectAdConsentPatch = bytecodePatch(
    name = "Reject ad consent",
    description = "Answers Relay's ad consent request (Google's cookie and personal data form) with " +
        "\"reject all\" without showing it: no purposes, no vendors, no legitimate interest. An " +
        "answer given before is replaced.",
    default = true,
) {
    compatibleWith(*Relay.compatibility)
    extendWith(Relay.EXTENSION)

    execute {
        val fields = LoadConsentFormFingerprint.classDef.fields
        val activity = fields.firstOrNull { it.type == "Landroid/app/Activity;" }
            ?: throw PatchException("GoogleConsentManager has no Activity field")

        // Every path to the ads, including a failed consent check, starts with the rejection.
        // v0 is a local that the method only writes before reading.
        RequestConsentFingerprint.method.addInstructions(
            0,
            """
                iget-object v0, p0, $CONSENT_MANAGER_CLASS->${activity.name}:Landroid/app/Activity;
                invoke-static { v0 }, $REJECT_AD_CONSENT_CLASS->rejectAll(Landroid/content/Context;)V
            """,
        )

        LoadConsentFormFingerprint.method.apply {
            val listener = fields.firstOrNull { it.type == LISTENER_CLASS }
                ?: throw PatchException("GoogleConsentManager has no listener field")
            if (implementation!!.registerCount - parameters.size - 1 < 2) {
                throw PatchException("GoogleConsentManager#n has too few registers")
            }
            // Store "reject all" again (Google's consent check has run by now and may have
            // changed what was stored), then go on as when the form is closed.
            addInstructions(
                0,
                """
                    iget-object v0, p0, $CONSENT_MANAGER_CLASS->${activity.name}:Landroid/app/Activity;
                    invoke-static { v0 }, $REJECT_AD_CONSENT_CLASS->rejectAll(Landroid/content/Context;)V
                    iget-object v0, p0, $CONSENT_MANAGER_CLASS->${listener.name}:$LISTENER_CLASS
                    if-eqz v0, :done
                    const/4 v1, 0x0
                    iput-object v1, p0, $CONSENT_MANAGER_CLASS->${listener.name}:$LISTENER_CLASS
                    invoke-interface { v0 }, $LISTENER_CLASS->a()V
                    :done
                    return-void
                """,
            )
        }

        // "Obtained" now means this run's rejection is stored: an answer given before goes
        // through the form step too and is replaced, and the rejection then reaches each network.
        ConsentObtainedFingerprint.method.addInstructions(
            0,
            """
                invoke-static { }, $REJECT_AD_CONSENT_CLASS->answered()Z
                move-result v0
                return v0
            """,
        )
    }
}
