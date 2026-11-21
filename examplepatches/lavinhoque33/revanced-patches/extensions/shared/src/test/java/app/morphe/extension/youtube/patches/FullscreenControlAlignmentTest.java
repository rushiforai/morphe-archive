/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-20.
 */
package app.morphe.extension.youtube.patches;

import static org.junit.Assert.assertEquals;

import android.app.Activity;
import android.content.ContextWrapper;
import android.content.pm.PackageInfo;
import android.content.res.Resources;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.Robolectric;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.android.controller.ActivityController;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.patches.utils.PlayerControlsPatch;
import app.morphe.extension.youtube.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 34)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class FullscreenControlAlignmentTest {
    private static final int ROW_ID = android.R.id.list;
    private ActivityController<Activity> activity;
    private FrameLayout controls;
    private ImageView fullscreen;
    private int rowIdLookups;

    @SuppressWarnings("deprecation")
    @Before
    public void setUp() {
        var app = RuntimeEnvironment.getApplication();
        var info = new PackageInfo();
        info.packageName = app.getPackageName();
        info.applicationInfo = app.getApplicationInfo();
        info.versionName = "21.45.90";
        Shadows.shadowOf(app.getPackageManager()).installPackage(info);
        var resources = app.getResources();
        var indexed = new Resources(resources.getAssets(), resources.getDisplayMetrics(),
                resources.getConfiguration()) {
            @Override
            public int getIdentifier(String name, String type, String pkg) {
                if ("id".equals(type) && "revanced_overlay_buttons_scroll_view".equals(name)) {
                    rowIdLookups++;
                    return ROW_ID;
                }
                return super.getIdentifier(name, type, pkg);
            }
        };
        var context = new ContextWrapper(app) {
            @Override
            public Resources getResources() {
                return indexed;
            }
        };
        Utils.setContext(context);
        Settings.HIDE_PLAYER_FULLSCREEN_BUTTON.save(false);
        activity = Robolectric.buildActivity(Activity.class).setup().visible();
        controls = new FrameLayout(context);
        activity.get().setContentView(controls);
        controls.layout(0, 0, 400, 80);
        fullscreen = new ImageView(context);
        controls.addView(fullscreen);
        fullscreen.layout(330, 0, 390, 60);
        fullscreen.setPadding(0, 16, 0, 4);
    }

    @After
    public void tearDown() {
        activity.close();
    }

    private FrameLayout addRow(String style, int buttonWidth) {
        var row = new FrameLayout(controls.getContext());
        row.setId(ROW_ID);
        row.setTag(style);
        var strip = new FrameLayout(controls.getContext());
        var button = new View(controls.getContext());
        strip.addView(button);
        row.addView(strip);
        controls.addView(row);
        row.layout(110, 12, 310, 56);
        strip.layout(0, 0, 200, 44);
        button.layout(0, 0, buttonWidth, 44);
        return row;
    }

    private void drawControls() {
        controls.getViewTreeObserver().dispatchOnGlobalLayout();
        controls.getViewTreeObserver().dispatchOnPreDraw();
    }

    @Test
    public void nativeButtonAndReinflatedOverlayStayAligned() {
        var modern = addRow("morphe_modern_overlay", 44);
        PlayerControlsPatch.setFullscreenCloseButton(fullscreen);
        drawControls();
        assertEquals(6f, modern.getTranslationY(), 0f);
        assertEquals(28f, modern.getTranslationX(), 0f);

        int beforeRedraws = rowIdLookups;
        for (int i = 0; i < 30; i++) {
            controls.getViewTreeObserver().dispatchOnPreDraw();
        }
        assertEquals("Steady video redraws must not resolve the same row ID again", beforeRedraws, rowIdLookups);

        // Same parent and resource ID, but YouTube replaced the row with a different layout.
        controls.removeView(modern);
        var legacy = addRow("morphe_legacy_overlay", 32);
        drawControls();
        assertEquals(34f, legacy.getTranslationX(), 0f);
        assertEquals(-2f, fullscreen.getTranslationY(), 0f);

        fullscreen.layout(310, 0, 370, 60);
        drawControls();
        assertEquals(14f, legacy.getTranslationX(), 0f);
    }

    @Test
    public void hidingFullscreenReclaimsItsSlotAtTheRightPadding() {
        Settings.HIDE_PLAYER_FULLSCREEN_BUTTON.save(true);
        controls.setPadding(0, 0, 12, 0);
        var row = addRow("morphe_modern_overlay", 44);
        PlayerControlsPatch.setFullscreenCloseButton(fullscreen);

        drawControls();

        assertEquals(388f, row.getRight() + row.getTranslationX(), 0f);
    }
}
