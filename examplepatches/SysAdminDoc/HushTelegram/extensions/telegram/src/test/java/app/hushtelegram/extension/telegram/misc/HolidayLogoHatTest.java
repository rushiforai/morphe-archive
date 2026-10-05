/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertSame;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PixelFormat;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.text.SpannableStringBuilder;
import android.text.Spanned;
import android.text.style.ImageSpan;

import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.telegram.settings.Settings;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class HolidayLogoHatTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void setUp() { Settings.HOLIDAY_LOOK.save(true); }
    @After public void tearDown() {
        PauseForTests.resume();
        Settings.HOLIDAY_LOOK.resetToDefault();
    }

    @Test public void registeredBottomAlignedLogoUsesItsOwnBoundsAtBothTextSizesAndThemeColors() throws Exception {
        for (int textHeight : new int[] {32, 64}) {
            for (int color : new int[] {0xffeeeeee, 0xff222222}) {
                RecordingDrawable logo = new RecordingDrawable(28, 24);
                logo.setBounds(3, 4, 31, 28);
                logo.setColorFilter(color, android.graphics.PorterDuff.Mode.MULTIPLY);
                ColorFilter originalFilter = logo.filter;
                Rect originalBounds = new Rect(logo.getBounds());
                for (String appName : new String[] {"Telegram", "An app name with a very different width"}) {
                    SpannableStringBuilder title = title(appName, logo, true);
                    RecordingDrawable hat = new RecordingDrawable(20, 14);
                    hat.setColorFilter(0xff112233, android.graphics.PorterDuff.Mode.SRC_IN);
                    ColorFilter originalHatFilter = hat.filter;
                    draw(title, hat, 100, 20, textHeight, 6, -2, 3, 127);
                    assertEquals(new Rect(110, 20 + textHeight - 28 + 4 - 2 + 3 - 14,
                            130, 20 + textHeight - 28 + 4 - 2 + 3), hat.getBounds());
                    assertEquals(127, hat.alpha);
                    assertEquals(1, hat.draws);
                    assertSame("Hat follows the logo color in either theme", originalFilter, hat.drawnFilter);
                    assertSame("Shared seasonal drawable keeps its original filter", originalHatFilter, hat.filter);
                    assertEquals(originalBounds, logo.getBounds());
                    assertSame(originalFilter, logo.filter);
                    assertEquals(0, logo.draws);
                    assertTrue(title.getSpans(0, title.length(), ImageSpan.class).length == 1);
                }
            }
        }
    }

    @Test public void onlyTheRegisteredWholeTitleSpanCanDraw() throws Exception {
        RecordingDrawable logo = new RecordingDrawable(28, 24);
        logo.setBounds(0, 2, 28, 26);
        assertFalse(eligible("Telegram"));
        assertFalse(eligible(title("Telegram", logo, false)));
        SpannableStringBuilder valid = title("Telegram", logo, true);
        assertTrue(eligible(valid));
        // A copied title keeps the same owned ImageSpan, as the title view may copy spans.
        assertTrue(eligible(new SpannableStringBuilder(valid)));
        valid.append(" other text");
        assertFalse(eligible(valid));
        valid = title("Telegram", logo, true);
        valid.setSpan(new ImageSpan(logo), 0, valid.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        assertFalse(eligible(valid));
        ImageSpan baseline = new ImageSpan(logo, ImageSpan.ALIGN_BASELINE);
        register(baseline);
        valid = new SpannableStringBuilder("Telegram");
        valid.setSpan(baseline, 0, valid.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        assertFalse(eligible(valid));
    }

    @Test public void offEveryPauseReasonAndUnavailableSettingsLeaveTheStockHatUntouched() throws Exception {
        RecordingDrawable logo = new RecordingDrawable(28, 24);
        logo.setBounds(0, 2, 28, 26);
        SpannableStringBuilder title = title("Telegram", logo, true);
        Settings.HOLIDAY_LOOK.save(false);
        assertNoDraw(title);
        Settings.HOLIDAY_LOOK.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertNoDraw(title);
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> {
            try { assertNoDraw(title); } catch (Exception error) { throw new AssertionError(error); }
        });
    }

    @Test public void emptyLogoBoundsAndMissingHatFailOpen() throws Exception {
        RecordingDrawable logo = new RecordingDrawable(28, 24);
        SpannableStringBuilder title = title("Telegram", logo, true);
        assertNoDraw(title);
        logo.setBounds(0, 2, 28, 26);
        draw(title, null, 100, 20, 32, 6, -2, 3, 255);
    }

    private static void assertNoDraw(CharSequence title) throws Exception {
        RecordingDrawable hat = new RecordingDrawable(20, 14);
        hat.setBounds(1, 2, 3, 4);
        draw(title, hat, 100, 20, 32, 6, -2, 3, 200);
        assertEquals(0, hat.draws);
        assertEquals(new Rect(1, 2, 3, 4), hat.getBounds());
        assertEquals(255, hat.alpha);
    }

    private static SpannableStringBuilder title(String text, Drawable logo, boolean owned) throws Exception {
        ImageSpan span = new ImageSpan(logo);
        if (owned) register(span);
        SpannableStringBuilder title = new SpannableStringBuilder(text);
        title.setSpan(span, 0, title.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        return title;
    }

    private static void register(ImageSpan span) throws Exception {
        HolidayLook.registerLogoSpan(span);
    }

    private static boolean eligible(CharSequence title) throws Exception {
        return HolidayLook.isLogoTitle(title);
    }

    private static void draw(CharSequence title, Drawable hat, int x, int y, int height,
                             int dx, int dy, int scaleY, int alpha) throws Exception {
        HolidayLook.drawLogoHatAt(new Canvas(), title, hat, x, y, height, dx, dy, scaleY, alpha);
    }

    private static final class RecordingDrawable extends Drawable {
        final int width;
        final int height;
        int draws;
        int alpha = 255;
        ColorFilter filter;
        ColorFilter drawnFilter;
        RecordingDrawable(int width, int height) { this.width = width; this.height = height; }
        @Override public int getIntrinsicWidth() { return width; }
        @Override public int getIntrinsicHeight() { return height; }
        @Override public void draw(Canvas canvas) { draws++; drawnFilter = filter; }
        @Override public void setAlpha(int value) { alpha = value; }
        @Override public void setColorFilter(ColorFilter value) { filter = value; }
        @Override public ColorFilter getColorFilter() { return filter; }
        @Override public int getOpacity() { return PixelFormat.TRANSLUCENT; }
    }
}
