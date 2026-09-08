/**
 * Copyright 2026 Psylos
 * Private SoundCloud patch.
 */
package psylos.morphe.extension.soundcloud;

import android.view.View;

@SuppressWarnings("unused")
public final class CastIconHook {
    private CastIconHook() {
    }

    public static void applyCastButtonVisibility(View view) {
        if (view != null && SoundCloudPrivateSettings.HIDE_TOP_CAST.get().booleanValue()) {
            view.setVisibility(View.GONE);
        }
    }

    public static boolean shouldShowCast() {
        return !SoundCloudPrivateSettings.HIDE_TOP_CAST.get().booleanValue();
    }
}
