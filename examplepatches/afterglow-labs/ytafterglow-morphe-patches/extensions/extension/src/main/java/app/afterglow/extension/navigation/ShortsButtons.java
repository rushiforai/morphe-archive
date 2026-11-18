package app.afterglow.extension.navigation;

import android.view.View;
import app.afterglow.extension.litho.ShortsHeaderPolicy;
import app.afterglow.extension.playback.PlayerOverlay;

/** Native Shorts controls are identified by their renderer icon, never a translated label. */
public final class ShortsButtons {
    private ShortsButtons() {}

    public static void header(View view, Enum<?> icon) {
        if (icon == null) return;
        String key = ShortsHeaderPolicy.nativeKey(icon.name());
        if (key != null) PlayerOverlay.bind(view, key, "shorts-layout");
    }

    public static void lens(View view) {
        PlayerOverlay.bind(view, "hideShortsLens", "shorts-layout");
    }
}
