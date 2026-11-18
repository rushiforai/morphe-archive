package app.morphe.extension.music.patches.ads;

import android.view.View;

import app.morphe.extension.music.settings.Settings;

@SuppressWarnings("unused")
public class MusicAdsPatch {
    private static final boolean HIDE_MUSIC_ADS = Settings.HIDE_MUSIC_ADS.get();
    private static final boolean HIDE_GET_PREMIUM_LABEL = Settings.HIDE_GET_PREMIUM_LABEL.get();

    public static boolean hideMusicAds() {
        return HIDE_MUSIC_ADS;
    }

    public static boolean hideMusicAds(boolean original) {
        return !HIDE_MUSIC_ADS && original;
    }

    public static int getPremiumLabelVisibility(View panel, int originalVisibility) {
        return HIDE_GET_PREMIUM_LABEL ? View.GONE : originalVisibility;
    }
}
