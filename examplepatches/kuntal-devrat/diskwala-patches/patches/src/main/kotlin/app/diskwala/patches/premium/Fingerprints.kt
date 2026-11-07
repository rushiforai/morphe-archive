package app.diskwala.patches.premium

import app.morphe.patcher.Fingerprint

/**
 * Premium/session fingerprints for DiskWala 26.9.
 *
 * The app's own SessionManager (n5/d) is the source of truth for the UI and
 * the Compose root, so that is patched directly. RevenueCat is only kept as a
 * best-effort fallback in case a screen reads entitlements directly.
 */

internal object SessionManagerConstructorFingerprint : Fingerprint(
    definingClass = "Ln5/d;",
    name = "<init>",
    returnType = "V",
    parameters = listOf(
        "Lq5/e;",
        "Ln5/G;",
        "Lo5/e;",
        "Lm5/b;",
        "Lm5/h;"
    )
)

// b(Z, Long) and j(Z, Long) are the two logged-in/premium state setters.
internal object SessionManagerSetLoggedInFingerprint : Fingerprint(
    definingClass = "Ln5/d;",
    name = "b",
    returnType = "V",
    parameters = listOf("Z", "Ljava/lang/Long;")
)

internal object SessionManagerSetLoggedInAltFingerprint : Fingerprint(
    definingClass = "Ln5/d;",
    name = "j",
    returnType = "V",
    parameters = listOf("Z", "Ljava/lang/Long;")
)

// Compose theme/root wrapper receives (darkTheme, loggedIn, premium, ...).
internal object AppThemeStateFingerprint : Fingerprint(
    definingClass = "Lz5/g;",
    name = "a",
    returnType = "V",
    parameters = listOf(
        "Z",
        "Z",
        "Ln5/a;",
        "Ljava/lang/Long;",
        "Lj5/h;",
        "Lj0/c;",
        "Lb0/j;",
        "I"
    )
)

// Best-effort RevenueCat fallback.
internal object EntitlementInfoIsActiveFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfo;",
    name = "isActive",
    returnType = "Z",
    parameters = emptyList()
)

internal object EntitlementInfosGetActiveFingerprint : Fingerprint(
    definingClass = "Lcom/revenuecat/purchases/EntitlementInfos;",
    name = "getActive",
    returnType = "Ljava/util/Map;",
    parameters = emptyList()
)
