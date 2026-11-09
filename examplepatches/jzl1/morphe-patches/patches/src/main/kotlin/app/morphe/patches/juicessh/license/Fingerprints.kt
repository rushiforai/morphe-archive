package lab.juicessh.patches.license

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * `com.sonelli.oi0.d(Object)Z` — the single client-side Pro entitlement predicate.
 *
 * Every Pro gate in JuiceSSH 3.2.2 funnels through this method:
 * it checks `User.H()` (the RSA-signed account record) and then looks for a
 * `com.sonelli.juicessh.propack` purchase with state 0.
 */
internal object ProEntitlementFingerprint : Fingerprint(
    definingClass = "Lcom/sonelli/oi0;",
    name = "d",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Ljava/lang/Object;"),
)

/**
 * `com.sonelli.juicessh.models.User.H()Z` — verifies the server-issued RSA
 * signature over the account and purchase rows. Forcing it true also makes
 * locally cached users usable after the server signature becomes stale.
 */
internal object UserSignatureFingerprint : Fingerprint(
    definingClass = "Lcom/sonelli/juicessh/models/User;",
    name = "H",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Z",
)

/**
 * `com.sonelli.pi0.j(Context, pi0.p)` — the account loader.
 *
 * On a clean install JuiceSSH creates a local account literally named
 * "New User" and this method reports an error to the callback, so no `User`
 * object ever reaches the Pro gates. The patch replaces that error branch
 * with a callback carrying a fresh `User` instance, which lets the patched
 * entitlement predicate unlock Pro without a Google sign-in.
 */
internal object NewUserAuthFingerprint : Fingerprint(
    definingClass = "Lcom/sonelli/pi0;",
    name = "j",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Lcom/sonelli/pi0\$p;"),
    strings = listOf("New User"),
)