/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import org.junit.After;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.RuntimeEnvironment;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class GreetingStickersTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.HIDE_GREETING_STICKERS);
        Settings.HIDE_GREETING_STICKERS.resetToDefault();
        HookStatus.clear();
    }

    @Test public void offByDefaultLeavesTheStickerFrameShowing() {
        assertFalse(Settings.HIDE_GREETING_STICKERS.get());
        Greeting greeting = new Greeting();
        greeting.measure(false);
        assertEquals(View.VISIBLE, greeting.stickers.getVisibility());
    }

    @Test public void onHidesOnlyThePlainGreetingStickerAndKeepsItsText() {
        Settings.HIDE_GREETING_STICKERS.save(true);
        Greeting greeting = new Greeting();
        greeting.measure(false);
        assertEquals(View.GONE, greeting.stickers.getVisibility());
        assertEquals(View.VISIBLE, greeting.title.getVisibility());
        assertEquals(View.VISIBLE, greeting.description.getVisibility());
        assertTrue(String.join("\n", HookStatus.report()).contains("greeting sticker hidden 1"));
    }

    @Test public void businessIntroductionsAndPreviewsKeepTheirSticker() {
        Settings.HIDE_GREETING_STICKERS.save(true);
        Greeting greeting = new Greeting();
        greeting.measure(true);
        assertEquals(View.VISIBLE, greeting.stickers.getVisibility());
    }

    @Test public void switchingOffOrPausingShowsTheStickerAgainOnTheNextMeasure() {
        Settings.HIDE_GREETING_STICKERS.save(true);
        Greeting greeting = new Greeting();
        greeting.measure(false);
        assertEquals(View.GONE, greeting.stickers.getVisibility());
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            greeting.measure(false);
            assertEquals(View.VISIBLE, greeting.stickers.getVisibility());
            assertTrue(Settings.HIDE_GREETING_STICKERS.savedValue());
            PauseForTests.resume();
            greeting.measure(false);
            assertEquals(View.GONE, greeting.stickers.getVisibility());
        }
        Settings.HIDE_GREETING_STICKERS.save(false);
        greeting.measure(false);
        assertEquals(View.VISIBLE, greeting.stickers.getVisibility());
        Settings.HIDE_GREETING_STICKERS.save(true);
        SettingsContextRule.withoutContext(() -> {
            greeting.measure(false);
            assertEquals(View.VISIBLE, greeting.stickers.getVisibility());
        });
    }

    @Test public void unreadableSwitchShowsTheStickerAndReportsIt() {
        Settings.HIDE_GREETING_STICKERS.save(true);
        Greeting greeting = new Greeting();
        greeting.measure(false);
        SettingReadsForTests.breakReads(Settings.HIDE_GREETING_STICKERS);
        greeting.measure(false);
        assertEquals(View.VISIBLE, greeting.stickers.getVisibility());
        assertFalse(HookStatus.missing(FamilyNames.HIDE_GREETING_STICKERS).isEmpty());
    }

    @Test public void aMissingFrameIsLeftAlone() {
        Settings.HIDE_GREETING_STICKERS.save(true);
        GreetingStickers.measure(null, false);
        assertFalse(String.join("\n", HookStatus.report()).contains("greeting sticker hidden"));
    }

    /** Telegram's greeting: a title, a description and a sticker frame in a vertical LinearLayout. */
    private static final class Greeting {
        final LinearLayout root = new LinearLayout(RuntimeEnvironment.getApplication());
        final TextView title = new TextView(RuntimeEnvironment.getApplication());
        final TextView description = new TextView(RuntimeEnvironment.getApplication());
        final FrameLayout stickers = new FrameLayout(RuntimeEnvironment.getApplication());

        Greeting() {
            root.setOrientation(LinearLayout.VERTICAL);
            root.addView(title);
            root.addView(description);
            stickers.addView(new ImageView(RuntimeEnvironment.getApplication()));
            root.addView(stickers);
        }

        void measure(boolean introduction) {
            GreetingStickers.measure(stickers, introduction);
            root.measure(View.MeasureSpec.makeMeasureSpec(1080, View.MeasureSpec.AT_MOST),
                    View.MeasureSpec.makeMeasureSpec(1920, View.MeasureSpec.AT_MOST));
        }
    }
}
