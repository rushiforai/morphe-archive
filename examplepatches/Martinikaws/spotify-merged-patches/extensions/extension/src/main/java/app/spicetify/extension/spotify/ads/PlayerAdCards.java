package app.spicetify.extension.spotify.ads;

import app.spicetify.extension.spotify.settings.PatchSettings;

public final class PlayerAdCards {
    private PlayerAdCards() {}

    public static boolean showImageBrandAd(boolean present) {
        return present && !PatchSettings.hidePlayerAdCardsEnabled();
    }

    public static boolean showEmbeddedAd() {
        return !PatchSettings.hidePlayerAdCardsEnabled();
    }
}
