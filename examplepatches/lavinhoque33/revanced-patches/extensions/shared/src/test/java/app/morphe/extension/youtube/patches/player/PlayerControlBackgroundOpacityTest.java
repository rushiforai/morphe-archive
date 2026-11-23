/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-22.
 */

package app.morphe.extension.youtube.patches.player;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.PackageInfo;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.RippleDrawable;
import android.view.TouchDelegate;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.TextView;

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

import java.util.concurrent.atomic.AtomicInteger;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.patches.utils.PlayerControlsPatch;
import app.morphe.extension.youtube.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 34)
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class PlayerControlBackgroundOpacityTest {
    private static final int PLAY_PAUSE_REPLAY = 101;
    private static final int PREVIOUS = 102;
    private static final int NEXT = 103;
    private static final int REWIND = 104;
    private static final int TIMESTAMPS = 105;
    private static final int FULLSCREEN = 106;
    private static final int STOCK_ALPHA = 86;

    private ActivityController<Activity> activity;
    private Context context;
    private FrameLayout host;
    private FrameLayout group;

    @Before
    @SuppressWarnings("deprecation")
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
                return switch (name) {
                    case "player_control_play_pause_replay_button" -> PLAY_PAUSE_REPLAY;
                    case "player_control_previous_button" -> PREVIOUS;
                    case "player_control_next_button" -> NEXT;
                    case "timestamps_container" -> TIMESTAMPS;
                    default -> super.getIdentifier(name, type, pkg);
                };
            }
        };
        context = new ContextWrapper(app) {
            @Override
            public Resources getResources() {
                return indexed;
            }
        };
        Utils.setContext(context);

        Settings.HIDE_PLAYER_FULLSCREEN_BUTTON.resetToDefault();
        Settings.HIDE_PLAYER_CONTROL_BUTTONS_BACKGROUND.resetToDefault();
        Settings.PLAYER_TRANSPORT_BACKGROUND_OPACITY.resetToDefault();
        Settings.PLAYER_OTHER_OVERLAY_BACKGROUND_OPACITY.resetToDefault();

        activity = Robolectric.buildActivity(Activity.class).setup().visible();
        host = new FrameLayout(context);
        activity.get().setContentView(host);
        group = new FrameLayout(context);
        host.addView(group);
    }

    @After
    public void tearDown() {
        activity.close();
    }

    @Test
    public void defaultsLeaveNativeDrawablesAndTheirOriginalColorsUntouched() {
        ImageView play = addButton(group, PLAY_PAUSE_REPLAY);
        ImageView fullscreen = addButton(host, FULLSCREEN);
        View timestamp = addTimestamp(false);
        Drawable playBackground = play.getBackground();
        Drawable fullscreenBackground = fullscreen.getBackground();
        Drawable timestampBackground = timestamp.getBackground();

        PlayerPatch.styleControlButtonsBackground(group);
        assertSame(fullscreen, PlayerPatch.hideFullscreenButton(fullscreen));
        drawControls();

        assertSame(playBackground, play.getBackground());
        assertSame(fullscreenBackground, fullscreen.getBackground());
        assertSame(timestampBackground, timestamp.getBackground());
        assertRenderedAlpha(STOCK_ALPHA, play, fullscreen, timestamp);
    }

    @Test
    public void transparentTransportLeavesOtherControlsOpaqueAndPreservesInteraction() {
        Settings.PLAYER_TRANSPORT_BACKGROUND_OPACITY.save(0);
        Settings.PLAYER_OTHER_OVERLAY_BACKGROUND_OPACITY.save(100);
        ImageView play = addButton(group, PLAY_PAUSE_REPLAY);
        ImageView previous = addButton(group, PREVIOUS);
        ImageView next = addButton(group, NEXT);
        ImageView rewind = addButton(group, REWIND);
        ImageView fullscreen = addButton(host, FULLSCREEN);
        View timestamp = addTimestamp(true);

        Drawable icon = play.getDrawable();
        RippleDrawable ripple = (RippleDrawable) play.getBackground();
        var touchDelegate = new TouchDelegate(new Rect(0, 0, 48, 48), play);
        var clicks = new AtomicInteger();
        group.setTouchDelegate(touchDelegate);
        play.setOnClickListener(view -> clicks.incrementAndGet());
        play.setContentDescription("Replay");
        play.setImportantForAccessibility(View.IMPORTANT_FOR_ACCESSIBILITY_YES);

        PlayerPatch.styleControlButtonsBackground(group);
        assertSame(fullscreen, PlayerPatch.hideFullscreenButton(fullscreen));
        drawControls();

        assertRenderedAlpha(0, play, previous, next);
        assertRenderedAlpha(255, rewind, fullscreen, timestamp);
        assertSame(icon, play.getDrawable());
        assertSame(ripple, play.getBackground());
        var rippleMask = (GradientDrawable) ripple.findDrawableByLayerId(android.R.id.mask);
        assertEquals(Color.WHITE, rippleMask.getColor().getDefaultColor());
        assertSame(touchDelegate, group.getTouchDelegate());
        assertEquals(View.VISIBLE, play.getVisibility());
        assertEquals(1f, play.getAlpha(), 0f);
        assertEquals("Replay", play.getContentDescription());
        assertEquals(View.IMPORTANT_FOR_ACCESSIBILITY_YES, play.getImportantForAccessibility());
        assertTrue(play.performClick());
        assertEquals(1, clicks.get());
    }

    @Test
    public void opaqueTransportDoesNotBleedIntoLateTimestampOrReboundFullscreen() {
        Settings.PLAYER_TRANSPORT_BACKGROUND_OPACITY.save(100);
        Settings.PLAYER_OTHER_OVERLAY_BACKGROUND_OPACITY.save(0);
        ImageView play = addButton(group, PLAY_PAUSE_REPLAY);
        ImageView next = addButton(group, NEXT);
        ImageView custom = addButton(host, View.NO_ID);
        ImageView fullscreen = addButton(host, FULLSCREEN);
        fullscreen.setTranslationY(12);
        PlayerControlsPatch.setFullscreenCloseButton(fullscreen);
        PlayerPatch.styleControlButtonsBackground(group);
        PlayerPatch.styleOverlayButtonBackground(custom);
        drawControls();

        // The native bottom stub and fullscreen circle may be bound after the center buttons.
        View timestamp = addTimestamp(true);
        fullscreen.setBackground(new InsetDrawable(circle(STOCK_ALPHA), 1));
        drawControls();

        assertRenderedAlpha(255, play, next);
        assertRenderedAlpha(0, custom, fullscreen, timestamp);
        assertEquals(12f, fullscreen.getTranslationY(), 0f);
        assertEquals(View.VISIBLE, fullscreen.getVisibility());
    }

    @Test
    public void hideBackgroundsStillOverridesBothSlidersAndSurvivesFullscreenRebind() {
        Settings.PLAYER_TRANSPORT_BACKGROUND_OPACITY.save(100);
        Settings.PLAYER_OTHER_OVERLAY_BACKGROUND_OPACITY.save(100);
        Settings.HIDE_PLAYER_CONTROL_BUTTONS_BACKGROUND.save(true);
        ImageView play = addButton(group, PLAY_PAUSE_REPLAY);
        ImageView rewind = addButton(group, REWIND);
        ImageView fullscreen = addButton(host, FULLSCREEN);
        View timestamp = addTimestamp(false);

        PlayerPatch.styleControlButtonsBackground(group);
        assertSame(fullscreen, PlayerPatch.hideFullscreenButton(fullscreen));
        fullscreen.setBackground(circle(STOCK_ALPHA));
        drawControls();

        assertNull(play.getBackground());
        assertNull(rewind.getBackground());
        assertNull(fullscreen.getBackground());
        assertNull(timestamp.getBackground());
        assertFalse(Settings.PLAYER_TRANSPORT_BACKGROUND_OPACITY.isAvailable());
        assertFalse(Settings.PLAYER_OTHER_OVERLAY_BACKGROUND_OPACITY.isAvailable());
    }

    private ImageView addButton(FrameLayout parent, int id) {
        ImageView button = new ImageView(context);
        button.setId(id);
        button.setImageDrawable(new ColorDrawable(Color.WHITE));
        var mask = circle(255);
        mask.setColor(Color.WHITE);
        button.setBackground(new RippleDrawable(ColorStateList.valueOf(Color.WHITE), circle(STOCK_ALPHA), mask));
        parent.addView(button);
        return button;
    }

    private View addTimestamp(boolean nested) {
        var outer = new FrameLayout(context);
        outer.setId(TIMESTAMPS);
        host.addView(outer);

        FrameLayout pill = outer;
        if (nested) {
            pill = new FrameLayout(context);
            outer.addView(pill);
        }
        var text = new TextView(context);
        text.setText("1:23 / 4:56");
        pill.addView(text);
        pill.setBackground(circle(STOCK_ALPHA));
        return pill;
    }

    private static GradientDrawable circle(int alpha) {
        var background = new GradientDrawable();
        background.setShape(GradientDrawable.OVAL);
        background.setColor(Color.argb(alpha, 0, 0, 0));
        return background;
    }

    private void drawControls() {
        host.getViewTreeObserver().dispatchOnPreDraw();
    }

    private static void assertRenderedAlpha(int expected, View... views) {
        for (View view : views) {
            Drawable background = view.getBackground();
            Rect original = new Rect(background.getBounds());
            Bitmap bitmap = Bitmap.createBitmap(24, 24, Bitmap.Config.ARGB_8888);
            background.setBounds(0, 0, 24, 24);
            background.draw(new Canvas(bitmap));
            background.setBounds(original);
            assertEquals("Rendered alpha for view " + view.getId(), expected, Color.alpha(bitmap.getPixel(12, 12)));
        }
    }
}
