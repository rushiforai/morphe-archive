/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-25.
 */
package app.morphe.extension.youtube.settings;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.content.ContextWrapper;
import android.content.pm.PackageInfo;
import android.content.res.Resources;
import android.view.View;
import android.widget.ImageView;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.patches.player.PlayerPatch;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 28,
        instrumentedPackages = "app.morphe.extension.youtube.settings.LegacySettingsPlayerBindingsTest")
public class LegacySettingsPlayerBindingsTest {
    @Test
    @SuppressWarnings("deprecation")
    public void restoredSettingsKeepsTheHiddenFullscreenButtonAvailableToThePlayer() {
        var app = RuntimeEnvironment.getApplication();
        var info = new PackageInfo();
        info.packageName = app.getPackageName();
        info.applicationInfo = app.getApplicationInfo();
        info.versionName = "21.45.90";
        Shadows.shadowOf(app.getPackageManager()).installPackage(info);

        // BaseActivityHook only looks up these IDs during class initialization.
        var resources = app.getResources();
        var indexedResources = new Resources(resources.getAssets(), resources.getDisplayMetrics(),
                resources.getConfiguration()) {
            @Override
            public int getIdentifier(String name, String type, String pkg) {
                if ("id".equals(type)) {
                    if ("revanced_settings_fragments".equals(name)) return 0x7f010001;
                    if ("revanced_toolbar_parent".equals(name)) return 0x7f010002;
                }
                if ("layout".equals(type) && "revanced_settings_with_toolbar".equals(name)) return 0x7f020001;

                return super.getIdentifier(name, type, pkg);
            }
        };
        Utils.setContext(new ContextWrapper(app) {
            @Override
            public Resources getResources() {
                return indexedResources;
            }
        });

        Settings.RESTORE_OLD_SETTINGS_MENUS.save(true);
        Settings.HIDE_PLAYER_FULLSCREEN_BUTTON.save(true);
        ImageView fullscreen = new ImageView(app);

        // A null result tells the injected call site to skip the native overlay binding.
        assertSame(fullscreen, PlayerPatch.hideFullscreenButton(fullscreen));
        assertEquals(View.VISIBLE, fullscreen.getVisibility());
        assertTrue(fullscreen.getY() < 0);
    }
}
