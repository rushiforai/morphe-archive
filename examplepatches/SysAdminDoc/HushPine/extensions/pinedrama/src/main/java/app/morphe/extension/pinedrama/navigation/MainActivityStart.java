/*
 * Copyright 2026 HushPine contributors
 * https://github.com/SysAdminDoc/HushPine
 */
package app.morphe.extension.pinedrama.navigation;

import android.app.Activity;
import android.content.Context;

import app.morphe.extension.pinedrama.settings.SettingsReturn;

/**
 * What every bundle does on each start, from the patched {@code MainActivity.onCreate}, right after
 * the extension's context and before the host's own onCreate. Nothing here may touch the window,
 * which would build the decor before the host asks for its window features.
 */
public final class MainActivityStart {
    private MainActivityStart() {
    }

    public static void install(Context context) {
        if (!(context instanceof Activity)) return;
        // A link opened in another app's task is moved to PineDrama's own (#227). Always on, so it
        // has no patch or setting of its own.
        LinkTaskGuard.onMainActivityCreate((Activity) context);
        // A restart pressed in the settings lands back on its page. This posts the opening and
        // touches no window itself.
        SettingsReturn.onMainActivityCreated();
    }
}
