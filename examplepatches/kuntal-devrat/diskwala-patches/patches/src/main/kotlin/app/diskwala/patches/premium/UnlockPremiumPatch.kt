package app.diskwala.patches.premium

import app.diskwala.patches.shared.Constants.COMPATIBILITY_DISKWALA
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod

/**
 * Unlocks DiskWala's own premium/session state.
 *
 * DiskWala 26.9 is a native Compose app. The screens read SessionManager
 * (n5/d) flows and the z5/g theme wrapper. Forcing those flows to
 * logged-in + PREMIUM is enough to remove the premium gate and ad path; no
 * RevenueCat network call is needed.
 */
@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Forces DiskWala's native session state to logged-in + premium, unlocking the ads-free experience and premium UI. RevenueCat is also patched as a best-effort fallback.",
    default = true
) {
    compatibleWith(COMPATIBILITY_DISKWALA)

    execute {
        fun MutableMethod.insertBeforeLastInstruction(smali: String) {
            val count = implementation?.instructions?.count()
                ?: error("Method ${definingClass}->${name} has no implementation")
            check(count > 0) { "Method ${definingClass}->${name} has no instructions" }
            addInstructions(count - 1, smali)
        }

        // ---------------------------------------------------------------
        // 1. SessionManager initial flows
        // ---------------------------------------------------------------
        // q/r are the same MutableStateFlow instance (logged-in), s/t are the
        // same instance (premium enum). Initialise them to a stable premium
        // state so the very first composition is already unlocked.
        SessionManagerConstructorFingerprint.method.insertBeforeLastInstruction(
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                invoke-static {v0}, Lnb/p0;->a(Ljava/lang/Object;)Lnb/o0;
                move-result-object v0
                iput-object v0, v1, Ln5/d;->q:Lnb/o0;
                iput-object v0, v1, Ln5/d;->r:Lnb/o0;

                sget-object v0, Ln5/a;->c:Ln5/a;
                invoke-static {v0}, Lnb/p0;->a(Ljava/lang/Object;)Lnb/o0;
                move-result-object v0
                iput-object v0, v1, Ln5/d;->s:Lnb/o0;
                iput-object v0, v1, Ln5/d;->t:Lnb/o0;
            """
        )

        // ---------------------------------------------------------------
        // 2. SessionManager state setters
        // ---------------------------------------------------------------
        // b(false, ...) and j(false, ...) are "logged out / not premium"
        // transitions. Force the incoming boolean to true so the app cannot
        // downgrade itself after a failed/absent server response.
        SessionManagerSetLoggedInFingerprint.method.addInstructions(0, "const/4 p1, 0x1")
        SessionManagerSetLoggedInAltFingerprint.method.addInstructions(0, "const/4 p1, 0x1")

        // ---------------------------------------------------------------
        // 3. Compose theme wrapper
        // ---------------------------------------------------------------
        // static a(darkTheme, loggedIn, premium, ...) - force the two state
        // arguments regardless of what the collected flows currently hold.
        AppThemeStateFingerprint.method.addInstructions(
            0,
            """
                const/4 p1, 0x1
                sget-object p2, Ln5/a;->c:Ln5/a;
            """
        )

        // ---------------------------------------------------------------
        // 4. RevenueCat fallback (optional)
        // ---------------------------------------------------------------
        // In 26.9 EntitlementInfo.isActive is a field, not a method, so this
        // fingerprint is expected to miss. Keeping it costs nothing and helps
        // if a future build exposes the getter again.
        runCatching {
            EntitlementInfoIsActiveFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }

        runCatching {
            EntitlementInfosGetActiveFingerprint.method.addInstructions(
                0,
                """
                    iget-object v0, p0, Lcom/revenuecat/purchases/EntitlementInfos;->all:Ljava/util/Map;
                    return-object v0
                """
            )
        }
    }
}
