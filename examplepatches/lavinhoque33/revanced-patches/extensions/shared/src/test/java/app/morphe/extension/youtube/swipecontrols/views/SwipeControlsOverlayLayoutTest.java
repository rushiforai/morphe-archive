/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-24.
 */
package app.morphe.extension.youtube.swipecontrols.views;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;

import android.content.Context;
import android.content.ContextWrapper;
import android.content.pm.PackageInfo;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.view.View;
import android.widget.TextView;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.Shadows;
import org.robolectric.annotation.Config;
import org.robolectric.annotation.GraphicsMode;
import org.robolectric.util.ReflectionHelpers;

import java.text.NumberFormat;
import java.util.Locale;

import app.morphe.extension.shared.utils.Utils;
import app.morphe.extension.youtube.settings.Settings;
import app.morphe.extension.youtube.shared.VideoInformation;
import app.morphe.extension.youtube.swipecontrols.SwipeControlsConfigurationProvider.SwipeOverlayStyle;
import app.morphe.extension.youtube.videoplayer.PlayerIcons;

@RunWith(RobolectricTestRunner.class)
@Config(manifest = Config.NONE, sdk = 34, qualifiers = "mdpi")
@GraphicsMode(GraphicsMode.Mode.NATIVE)
public class SwipeControlsOverlayLayoutTest {
    private static final Locale ARABIC = Locale.forLanguageTag("ar-EG");
    private static final String AUTO_BRIGHTNESS = "السطوع التلقائي";
    private static final int TRACK_PROGRESS = 0xFF11B8A0;
    private static final int BOOST_PROGRESS = 0xBFFF7043;
    private static final int ICON_ID = 0x7f080010;
    private static final int AUTO_TEXT_ID = 0x7f130010;

    private Context context;
    private final Rect lastDrawnIconBounds = new Rect();
    private String lastIconName;

    @Before
    public void setUp() {
        RuntimeEnvironment.setFontScale(1.7f);
        Context application = RuntimeEnvironment.getApplication();
        PackageInfo appInfo = new PackageInfo();
        appInfo.packageName = application.getPackageName();
        appInfo.applicationInfo = application.getApplicationInfo();
        appInfo.versionName = "21.45.90";
        Shadows.shadowOf(application.getPackageManager()).installPackage(appInfo);

        Configuration configuration = new Configuration(application.getResources().getConfiguration());
        configuration.setLocale(ARABIC);
        Context localized = application.createConfigurationContext(configuration);
        Resources base = localized.getResources();
        Resources resources = new Resources(base.getAssets(), base.getDisplayMetrics(), base.getConfiguration()) {
            @Override
            public int getIdentifier(String name, String type, String packageName) {
                if ("drawable".equals(type) && name.startsWith("revanced_ic_sc_")) {
                    lastIconName = name;
                    return ICON_ID;
                }
                if ("revanced_swipe_lowest_value_enable_auto_brightness_overlay_text".equals(name)) {
                    return AUTO_TEXT_ID;
                }
                return super.getIdentifier(name, type, packageName);
            }

            @Override
            public String getString(int id) throws NotFoundException {
                return id == AUTO_TEXT_ID ? AUTO_BRIGHTNESS : super.getString(id);
            }

            @Override
            public Drawable getDrawable(int id, Theme theme) throws NotFoundException {
                if (id != ICON_ID) return super.getDrawable(id, theme);

                // Model the shipped duotone vectors: an opaque white glyph over a translucent white path.
                LayerDrawable icon = new LayerDrawable(new Drawable[]{
                        new ColorDrawable(0x66FFFFFF), new ColorDrawable(Color.WHITE)
                }) {
                    @Override
                    public void draw(Canvas canvas) {
                        lastDrawnIconBounds.set(getBounds());
                        super.draw(canvas);
                    }
                };
                icon.setLayerInset(1, 4, 4, 4, 4);
                return icon;
            }
        };
        context = new ContextWrapper(localized) {
            @Override
            public Resources getResources() {
                return resources;
            }
        };
        Utils.setContext(context);
        Settings.PLAYER_ICON_STYLE.save(PlayerIcons.Style.PHOSPHOR_DUOTONE);
        Settings.SWIPE_OVERLAY_TEXT_SIZE.save(30);
        Settings.SWIPE_OVERLAY_BACKGROUND_COLOR.save("#FFFFFF");
        Settings.SWIPE_OVERLAY_OPACITY.save(100);
        Settings.SWIPE_OVERLAY_BRIGHTNESS_COLOR.save("#11B8A0");
        Settings.SWIPE_OVERLAY_VOLUME_COLOR.save("#11B8A0");
        Settings.SWIPE_LOWEST_VALUE_ENABLE_AUTO_BRIGHTNESS.save(true);
    }

    @After
    public void resetPreferences() {
        Settings.PLAYER_ICON_STYLE.resetToDefault();
        Settings.SWIPE_OVERLAY_STYLE.resetToDefault();
        Settings.SWIPE_OVERLAY_TEXT_SIZE.resetToDefault();
        Settings.SWIPE_OVERLAY_BACKGROUND_COLOR.resetToDefault();
        Settings.SWIPE_OVERLAY_FOREGROUND_COLOR.resetToDefault();
        Settings.SWIPE_OVERLAY_OPACITY.resetToDefault();
        Settings.SWIPE_OVERLAY_BRIGHTNESS_COLOR.resetToDefault();
        Settings.SWIPE_OVERLAY_VOLUME_COLOR.resetToDefault();
        Settings.SWIPE_LOWEST_VALUE_ENABLE_AUTO_BRIGHTNESS.resetToDefault();
        Settings.VOLUME_BOOST.resetToDefault();
    }

    @Test
    public void changingBrightnessKeepsBoundsInEveryStyleAndPlayerSize() {
        Settings.SWIPE_OVERLAY_FOREGROUND_COLOR.save("#000000");
        for (SwipeOverlayStyle style : SwipeOverlayStyle.values()) {
            if (style == SwipeOverlayStyle.FOLLOW_DEFAULT) continue;

            Settings.SWIPE_OVERLAY_STYLE.save(style);
            SwipeControlsOverlayLayout overlay = new SwipeControlsOverlayLayout(context);
            for (int[] playerSize : new int[][]{{360, 204}, {840, 360}}) {
                Rect overlayBounds = null;
                Rect iconBounds = null;
                for (int brightness : new int[]{0, 9, 10, 99, 100}) {
                    overlay.onBrightnessChanged(brightness);
                    View feedback = position(overlay, playerSize[0], playerSize[1]);
                    Bitmap rendered = render(feedback);
                    if (style != SwipeOverlayStyle.CIRCULAR_MINIMAL) {
                        boolean stacked = style.isCircular() || style.isVertical();
                        int textStartX = stacked ? 0 : rendered.getWidth() / 2;
                        int textStartY = stacked ? rendered.getHeight() / 2 : 0;
                        assertTrue(style + " did not paint a label at " + brightness, hasDarkPixel(
                                rendered, textStartX, textStartY));
                    }
                    rendered.recycle();
                    Rect bounds = new Rect(feedback.getLeft(), feedback.getTop(),
                            feedback.getRight(), feedback.getBottom());
                    assertTrue(style.name(), bounds.width() > 0 && bounds.height() > 0);
                    if (overlayBounds == null) {
                        overlayBounds = bounds;
                        iconBounds = new Rect(lastDrawnIconBounds);
                        assertFalse(iconBounds.isEmpty());
                    } else {
                        assertEquals(style.name(), overlayBounds, bounds);
                        assertEquals(style.name(), iconBounds, lastDrawnIconBounds);
                    }
                }
            }
        }
    }

    @Test
    public void foregroundTintChangesTextAndIconWithoutFlatteningDuotoneOrRecoloringProgress() {
        Settings.SWIPE_OVERLAY_FOREGROUND_COLOR.resetToDefault();
        Settings.SWIPE_OVERLAY_STYLE.save(SwipeOverlayStyle.HORIZONTAL_CENTER);
        SwipeControlsOverlayLayout defaults = new SwipeControlsOverlayLayout(context);
        defaults.onBrightnessChanged(50);
        Bitmap original = render(position(defaults, 840, 360));
        Rect originalIcon = new Rect(lastDrawnIconBounds);
        assertEquals(Color.WHITE, original.getPixel(originalIcon.centerX(), originalIcon.centerY()));

        Settings.SWIPE_OVERLAY_FOREGROUND_COLOR.save("#000000");
        SwipeControlsOverlayLayout customized = new SwipeControlsOverlayLayout(context);
        customized.onBrightnessChanged(50);
        Bitmap changed = render(position(customized, 840, 360));
        Rect glyph = new Rect(lastDrawnIconBounds);
        assertTrue(lastIconName.endsWith("_phosphor_duotone"));
        assertEquals(originalIcon, glyph);
        assertEquals(Color.BLACK, changed.getPixel(glyph.centerX(), glyph.centerY()));
        int shade = Color.red(changed.getPixel(glyph.left + 1, glyph.top + 1));
        assertTrue("Translucent path should stay visibly lighter than the opaque glyph", shade > 100 && shade < 200);

        int textStart = changed.getWidth() * 3 / 4;
        assertFalse(hasDarkPixel(original, textStart, 0));
        assertTrue(hasDarkPixel(changed, textStart, 0));
        assertEquals(colorBounds(original, TRACK_PROGRESS), colorBounds(changed, TRACK_PROGRESS));
        assertFalse(colorBounds(changed, TRACK_PROGRESS).isEmpty());
    }

    @Test
    public void horizontalTrackAndLabelSlotDoNotMoveAcrossMuteFullAndBoostedVolume() {
        Settings.VOLUME_BOOST.save(true);
        Settings.SWIPE_OVERLAY_FOREGROUND_COLOR.save("#242424");
        Settings.SWIPE_OVERLAY_STYLE.save(SwipeOverlayStyle.HORIZONTAL_CENTER);
        SwipeControlsOverlayLayout overlay = new SwipeControlsOverlayLayout(context);

        overlay.onVolumeChanged(0, 100, 0);
        View feedback = position(overlay, 360, 204);
        Bitmap muted = render(feedback);
        int sampleX = lastDrawnIconBounds.right + 20;
        int centerY = muted.getHeight() / 2;
        int trackPixel = muted.getPixel(sampleX, centerY);
        assertTrue(Color.red(trackPixel) > 205 && Color.red(trackPixel) < 245);
        Rect track = colorBounds(muted, trackPixel);
        assertTrue(lastIconName.contains("volume_mute"));

        overlay.onVolumeChanged(100, 100, 0);
        Bitmap full = render(position(overlay, 360, 204));
        assertEquals(track, colorBounds(full, TRACK_PROGRESS));
        assertEquals(muted.getWidth(), full.getWidth());

        overlay.onVolumeChanged(100, 100, 4);
        Bitmap boosted = render(position(overlay, 360, 204));
        int boostedPixel = boosted.getPixel(sampleX, centerY);
        assertEquals(track, colorBounds(boosted, boostedPixel));
        assertEquals(muted.getWidth(), boosted.getWidth());
        assertTrue(Color.red(boostedPixel) > Color.green(boostedPixel));
        int alpha = Color.alpha(BOOST_PROGRESS);
        int red = (Color.red(BOOST_PROGRESS) * alpha + Color.red(trackPixel) * (255 - alpha) + 127) / 255;
        assertEquals(red, Color.red(boostedPixel), 1);

        Settings.SWIPE_OVERLAY_STYLE.save(SwipeOverlayStyle.LEGACY);
        SwipeControlsOverlayLayout legacy = new SwipeControlsOverlayLayout(context);
        legacy.onVolumeChanged(100, 100, 4);
        TextView label = (TextView) position(legacy, 360, 204);
        assertEquals(NumberFormat.getPercentInstance(ARABIC).format(2), label.getText().toString());
    }

    @Test
    public void crossingAnHourDoesNotResizeTheSeekOverlay() {
        long duration = 7_400_000;
        long previousLength = ReflectionHelpers.getStaticField(VideoInformation.class, "videoLength");
        long previousTime = ReflectionHelpers.getStaticField(VideoInformation.class, "videoTime");
        try {
            ReflectionHelpers.setStaticField(VideoInformation.class, "videoLength", duration);
            ReflectionHelpers.setStaticField(VideoInformation.class, "videoTime", 3_599_000L);
            for (SwipeOverlayStyle style : new SwipeOverlayStyle[]{
                    SwipeOverlayStyle.CIRCULAR, SwipeOverlayStyle.HORIZONTAL_CENTER, SwipeOverlayStyle.LEGACY
            }) {
                Settings.SWIPE_OVERLAY_STYLE.save(style);
                SwipeControlsOverlayLayout overlay = new SwipeControlsOverlayLayout(context);
                overlay.onSeekChanged(0);
                View feedback = position(overlay, 360, 204);
                int shortWidth = feedback.getWidth();
                int shortHeight = feedback.getHeight();

                overlay.onSeekChanged(2_000);
                feedback = position(overlay, 360, 204);
                assertEquals(style.name(), shortWidth, feedback.getWidth());
                assertEquals(style.name(), shortHeight, feedback.getHeight());
            }
        } finally {
            ReflectionHelpers.setStaticField(VideoInformation.class, "videoLength", previousLength);
            ReflectionHelpers.setStaticField(VideoInformation.class, "videoTime", previousTime);
        }
    }

    private static View position(SwipeControlsOverlayLayout overlay, int width, int height) {
        overlay.measure(View.MeasureSpec.makeMeasureSpec(width, View.MeasureSpec.EXACTLY),
                View.MeasureSpec.makeMeasureSpec(height, View.MeasureSpec.EXACTLY));
        overlay.layout(0, 0, width, height);
        View feedback = overlay.getChildAt(0);
        assertEquals(View.VISIBLE, feedback.getVisibility());
        return feedback;
    }

    private static Bitmap render(View view) {
        Bitmap bitmap = Bitmap.createBitmap(view.getWidth(), view.getHeight(), Bitmap.Config.ARGB_8888);
        view.draw(new Canvas(bitmap));
        return bitmap;
    }

    private static boolean hasDarkPixel(Bitmap bitmap, int startX, int startY) {
        for (int y = startY; y < bitmap.getHeight(); y++) {
            for (int x = startX; x < bitmap.getWidth(); x++) {
                int pixel = bitmap.getPixel(x, y);
                if (Color.alpha(pixel) == 255 && Color.red(pixel) < 100 && Color.green(pixel) < 100) return true;
            }
        }
        return false;
    }

    private static Rect colorBounds(Bitmap bitmap, int color) {
        Rect bounds = new Rect();
        for (int y = 0; y < bitmap.getHeight(); y++) {
            for (int x = 0; x < bitmap.getWidth(); x++) {
                if (bitmap.getPixel(x, y) == color) bounds.union(x, y, x + 1, y + 1);
            }
        }
        return bounds;
    }
}
