package app.noam.extension.chesscom.premium;

import app.noam.extension.chesscom.Features;

/** The account's premium tier, as the app's own session check sees it. */
public final class PremiumUnlock {
    private PremiumUnlock() {}

    public static boolean enabled() {
        return Features.premiumUnlockPatched() && Features.isEnabled(Features.PREMIUM_UNLOCK);
    }
}
