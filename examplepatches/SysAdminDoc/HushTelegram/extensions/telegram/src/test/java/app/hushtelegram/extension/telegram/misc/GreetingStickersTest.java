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

    /** A chat's listener, which it sets on the greeting for Telegram's sticker and a business introduction's alike. */
    private static final Object CHAT = new Object();

    @Test public void offByDefaultLeavesTheStickerFrameShowing() {
        assertFalse(Settings.HIDE_GREETING_STICKERS.get());
        Greeting greeting = new Greeting();
        greeting.measure(CHAT);
        assertEquals(View.VISIBLE, greeting.stickers.getVisibility());
    }

    @Test public void onHidesOnlyTheGreetingStickerAndKeepsItsText() {
        Settings.HIDE_GREETING_STICKERS.save(true);
        Greeting greeting = new Greeting();
        greeting.measure(CHAT);
        assertEquals(View.GONE, greeting.stickers.getVisibility());
        assertEquals(View.VISIBLE, greeting.title.getVisibility());
        assertEquals(View.VISIBLE, greeting.description.getVisibility());
        assertTrue(String.join("\n", HookStatus.report()).contains("greeting sticker hidden 1"));
    }

    @Test public void theIntroductionEditorsOwnPreviewKeepsItsSticker() {
        Settings.HIDE_GREETING_STICKERS.save(true);
        Greeting preview = new Greeting();
        preview.measure(null);
        assertEquals(View.VISIBLE, preview.stickers.getVisibility());
        assertFalse(String.join("\n", HookStatus.report()).contains("greeting sticker hidden"));
    }

    @Test public void switchingOffOrPausingShowsTheStickerAgainOnTheNextMeasure() {
        Settings.HIDE_GREETING_STICKERS.save(true);
        Greeting greeting = new Greeting();
        greeting.measure(CHAT);
        assertEquals(View.GONE, greeting.stickers.getVisibility());
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            greeting.measure(CHAT);
            assertEquals(View.VISIBLE, greeting.stickers.getVisibility());
            assertTrue(Settings.HIDE_GREETING_STICKERS.savedValue());
            PauseForTests.resume();
            greeting.measure(CHAT);
            assertEquals(View.GONE, greeting.stickers.getVisibility());
        }
        Settings.HIDE_GREETING_STICKERS.save(false);
        greeting.measure(CHAT);
        assertEquals(View.VISIBLE, greeting.stickers.getVisibility());
        Settings.HIDE_GREETING_STICKERS.save(true);
        SettingsContextRule.withoutContext(() -> {
            greeting.measure(CHAT);
            assertEquals(View.VISIBLE, greeting.stickers.getVisibility());
        });
    }

    @Test public void unreadableSwitchShowsTheStickerAndReportsIt() {
        Settings.HIDE_GREETING_STICKERS.save(true);
        Greeting greeting = new Greeting();
        greeting.measure(CHAT);
        SettingReadsForTests.breakReads(Settings.HIDE_GREETING_STICKERS);
        greeting.measure(CHAT);
        assertEquals(View.VISIBLE, greeting.stickers.getVisibility());
        assertFalse(HookStatus.missing(FamilyNames.HIDE_GREETING_STICKERS).isEmpty());
    }

    @Test public void aMissingFrameIsLeftAlone() {
        Settings.HIDE_GREETING_STICKERS.save(true);
        GreetingStickers.measure(null, CHAT);
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

        void measure(Object sends) {
            GreetingStickers.measure(stickers, sends);
            root.measure(View.MeasureSpec.makeMeasureSpec(1080, View.MeasureSpec.AT_MOST),
                    View.MeasureSpec.makeMeasureSpec(1920, View.MeasureSpec.AT_MOST));
        }
    }
}
