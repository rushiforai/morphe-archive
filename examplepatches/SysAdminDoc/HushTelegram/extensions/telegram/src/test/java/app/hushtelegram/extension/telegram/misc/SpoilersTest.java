/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.text.SpannableString;
import android.text.Spanned;
import android.widget.EditText;
import android.widget.TextView;
import app.hushtelegram.extension.shared.SettingsContextRule;
import app.hushtelegram.extension.shared.diagnostics.HookStatus;
import app.hushtelegram.extension.shared.settings.HushTelegramPause;
import app.hushtelegram.extension.shared.settings.PauseForTests;
import app.hushtelegram.extension.shared.settings.SettingReadsForTests;
import app.hushtelegram.extension.telegram.settings.FamilyNames;
import app.hushtelegram.extension.telegram.settings.Settings;
import java.util.function.Predicate;
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
public class SpoilersTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    /** Stands in for Telegram's spoiler style span. */
    private static final class Spoiler {}
    private static final Predicate<Object> SPOILER = span -> span instanceof Spoiler;
    private static final Object MESSAGE = new Object();

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.REVEAL_SPOILERS);
        Settings.REVEAL_SPOILERS.resetToDefault();
        HookStatus.clear();
    }

    /** [text] with a spoiler over each of [covered]. */
    private static Spanned text(String text, String... covered) {
        SpannableString spanned = new SpannableString(text);
        for (String part : covered) {
            int start = text.indexOf(part);
            spanned.setSpan(new Spoiler(), start, start + part.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        }
        return spanned;
    }

    @Test public void offByDefaultKeepsEveryCover() {
        assertFalse(Settings.REVEAL_SPOILERS.get());
        assertFalse(Spoilers.skipText(null, text("the ending is sad", "sad"), SPOILER));
        assertTrue(Spoilers.covered(true, MESSAGE, message -> false));
        assertFalse(Spoilers.covered(false, MESSAGE, message -> true));
    }

    @Test public void onLeavesSpoilerTextUncovered() {
        Settings.REVEAL_SPOILERS.save(true);
        assertTrue(Spoilers.skipText(null, text("the ending is sad", "sad"), SPOILER));
        assertTrue(Spoilers.skipText(new TextView(RuntimeEnvironment.getApplication()), text("two spoilers in one line", "two", "line"), SPOILER));
        assertTrue(String.join("\n", HookStatus.report()).contains("spoiler text shown 2"));
        // Text without spoilers goes on to Telegram, which has nothing to cover.
        assertFalse(Spoilers.skipText(null, text("nothing hidden"), SPOILER));
    }

    @Test public void aSpoilerShapedLikeALoginCodeKeepsEveryCoverInTheText() {
        Settings.REVEAL_SPOILERS.save(true);
        assertFalse(Spoilers.skipText(null, text("Login code: 52814. Do not give this code to anyone", "52814"), SPOILER));
        assertFalse(Spoilers.skipText(null, text("code 123-456 and a secret", "secret", "123-456"), SPOILER));
        assertTrue(Spoilers.skipText(null, text("pin 1234", "1234"), SPOILER));
        assertTrue(Spoilers.skipText(null, text("call 123456789", "123456789"), SPOILER));
    }

    @Test public void textBeingTypedKeepsItsCover() {
        Settings.REVEAL_SPOILERS.save(true);
        assertFalse(Spoilers.skipText(new EditText(RuntimeEnvironment.getApplication()), text("the ending is sad", "sad"), SPOILER));
    }

    @Test public void onUncoversMediaOnlyTheSenderCovered() {
        Settings.REVEAL_SPOILERS.save(true);
        assertFalse(Spoilers.covered(true, MESSAGE, message -> false));
        assertTrue(String.join("\n", HookStatus.report()).contains("spoiler media shown 1"));
        // View-once and sensitive media keep the blur.
        assertTrue(Spoilers.covered(true, MESSAGE, message -> message == MESSAGE));
        // Uncovered media stays uncovered without asking.
        assertFalse(Spoilers.covered(false, MESSAGE, message -> { throw new AssertionError("not asked"); }));
    }

    @Test public void unpatchedStubsFindNothingToUncover() {
        Settings.REVEAL_SPOILERS.save(true);
        assertFalse(Spoilers.skipTextCovers(null, text("the ending is sad", "sad")));
        assertFalse(Spoilers.mediaCovered(MESSAGE));
    }

    @Test public void pausingOrAnEarlyStartKeepsEveryCover() {
        Settings.REVEAL_SPOILERS.save(true);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertFalse(reason.name(), Spoilers.skipText(null, text("the ending is sad", "sad"), SPOILER));
            assertTrue(reason.name(), Spoilers.covered(true, MESSAGE, message -> false));
            assertTrue(Settings.REVEAL_SPOILERS.savedValue());
            PauseForTests.resume();
            assertTrue(reason.name(), Spoilers.skipText(null, text("the ending is sad", "sad"), SPOILER));
            assertFalse(reason.name(), Spoilers.covered(true, MESSAGE, message -> false));
        }
        SettingsContextRule.withoutContext(() -> {
            assertFalse(Spoilers.skipText(null, text("the ending is sad", "sad"), SPOILER));
            assertTrue(Spoilers.covered(true, MESSAGE, message -> false));
        });
    }

    @Test public void aFailureKeepsTheCoverAndReportsIt() {
        Settings.REVEAL_SPOILERS.save(true);
        assertFalse(Spoilers.skipText(null, text("the ending is sad", "sad"), span -> { throw new IllegalStateException("span gone"); }));
        assertTrue(Spoilers.covered(true, MESSAGE, message -> { throw new IllegalStateException("message gone"); }));
        assertFalse(HookStatus.missing(FamilyNames.REVEAL_SPOILERS).isEmpty());

        HookStatus.clear();
        SettingReadsForTests.breakReads(Settings.REVEAL_SPOILERS);
        assertFalse(Spoilers.skipText(null, text("the ending is sad", "sad"), SPOILER));
        assertTrue(Spoilers.covered(true, MESSAGE, message -> false));
        assertFalse(HookStatus.missing(FamilyNames.REVEAL_SPOILERS).isEmpty());
    }
}
