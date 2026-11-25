/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.hushtelegram.extension.telegram.misc;

import static org.junit.Assert.*;

import android.text.SpannableStringBuilder;
import android.text.Spanned;

import java.util.ArrayList;
import java.util.List;

import app.hushtelegram.extension.shared.L10nTablesForTests;
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
import org.robolectric.annotation.Config;

/**
 * The text beside the chat list's title, and the person's own text in its place. Pause is covered
 * here for the emoji rather than in PausedHooksTest, which turns every switch on and off: this is
 * text, and its paused answer is empty text.
 */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 30)
public class TitleEmojiTest {
    @Rule public final SettingsContextRule settingsContext = new SettingsContextRule();

    private static final String TREE = text(0x1F384);
    private static final String SPACE = text(0xa0);

    @Before public void reset() { restore(); }
    @After public void restore() {
        PauseForTests.resume();
        SettingReadsForTests.mend(Settings.TITLE_EMOJI);
        SettingReadsForTests.mend(Settings.CHAT_LIST_TITLE);
        SettingReadsForTests.mend(Settings.CHAT_LIST_TITLE_TEXT);
        Settings.TITLE_EMOJI.resetToDefault();
        Settings.HOLIDAY_LOOK.resetToDefault();
        Settings.CHAT_LIST_TITLE.resetToDefault();
        Settings.CHAT_LIST_TITLE_TEXT.resetToDefault();
        HookStatus.clear();
    }

    private static final String MINE = "Mine";

    private static String text(int... codePoints) { return new String(codePoints, 0, codePoints.length); }
    private static String report() { return String.join("\n", HookStatus.report()); }

    /** The chat list's title as Telegram builds it, with a stand-in for the logo's span. */
    private static SpannableStringBuilder title(Object logo) {
        SpannableStringBuilder title = new SpannableStringBuilder("Telegram");
        title.setSpan(logo, 0, title.length(), Spanned.SPAN_EXCLUSIVE_EXCLUSIVE);
        return title;
    }

    private static void assertUntouched(String why) {
        SpannableStringBuilder title = title(new Object());
        TitleEmoji.decorate(title);
        assertEquals(why, "Telegram", title.toString());
        assertEquals(why, 0, title.getSpans(0, title.length(), TitleEmoji.Suffix.class).length);
    }

    @Test public void emptyByDefaultTheTitleIsTelegramsOwn() {
        assertEquals("", Settings.TITLE_EMOJI.get());
        assertUntouched("default");
        SpannableStringBuilder title = title(new Object());
        assertEquals(title.length(), TitleEmoji.titleEnd(title));
        assertTrue(report().contains(FamilyNames.HOLIDAY_LOOK));
        assertFalse(report().contains("title emoji shown"));
    }

    @Test public void theSavedTextFollowsTheTitleAndTheLogoKeepsTheAppName() {
        Settings.TITLE_EMOJI.save(TREE);
        Object logo = new Object();
        SpannableStringBuilder title = title(logo);
        TitleEmoji.decorate(title);
        // A space that doesn't break keeps the text on the logo's line.
        assertEquals("Telegram" + SPACE + TREE, title.toString());
        assertEquals(0, title.getSpanStart(logo));
        assertEquals(8, title.getSpanEnd(logo));
        assertEquals(8, TitleEmoji.titleEnd(title));
        // The title view may copy the text with its spans, and the end still reads the same.
        assertEquals(8, TitleEmoji.titleEnd(new SpannableStringBuilder(title)));
        assertTrue(report().contains("title emoji shown"));
        // Text after the emoji that this class didn't add isn't Telegram's title any more.
        title.append("!");
        assertEquals(title.length(), TitleEmoji.titleEnd(title));
        TitleEmoji.decorate(null);
    }

    @Test public void theEmojiWorksWithTheHolidaySwitchOnOrOff() {
        Settings.TITLE_EMOJI.save(TREE);
        for (boolean holiday : new boolean[]{false, true}) {
            Settings.HOLIDAY_LOOK.save(holiday);
            SpannableStringBuilder title = title(new Object());
            TitleEmoji.decorate(title);
            assertEquals("holiday " + holiday, "Telegram" + SPACE + TREE, title.toString());
        }
        Settings.TITLE_EMOJI.save("");
        assertUntouched("holiday on, no emoji");
    }

    @Test public void pausingAnEarlyStartOrAnUnreadableSettingLeavesTheTitleAlone() {
        Settings.TITLE_EMOJI.save(TREE);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertUntouched(reason.name());
            // What the person saved is kept for after the pause.
            assertEquals(TREE, Settings.TITLE_EMOJI.savedValue());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertUntouched("before the settings are ready"));
        SettingReadsForTests.breakReads(Settings.TITLE_EMOJI);
        assertUntouched("unreadable");
        SettingReadsForTests.mend(Settings.TITLE_EMOJI);
        SpannableStringBuilder title = title(new Object());
        TitleEmoji.decorate(title);
        assertEquals("Telegram" + SPACE + TREE, title.toString());
    }

    @Test public void cleaningKeepsJoinedEmojiAndDropsWhatWouldBreakTheTitle() {
        assertEquals("", TitleEmoji.clean(null));
        assertEquals("", TitleEmoji.clean(" \n\t" + SPACE));
        assertEquals("a b", TitleEmoji.clean("  a \n\t b  "));
        // A right-to-left mark or override would turn the title around, and a control draws as a box.
        assertEquals("ab", TitleEmoji.clean("a" + text(0x202e) + "b" + text(0x200f, 0x7, 0x2066)));
        // Joined emoji keep their joiners, and a heart keeps the selector that makes it colored.
        String family = text(0x1F468, 0x200D, 0x1F469, 0x200D, 0x1F467);
        String heart = text(0x2764, 0xFE0F);
        assertEquals(family, TitleEmoji.clean(family));
        assertEquals(heart + " " + TREE, TitleEmoji.clean(" " + heart + "\n" + TREE + " "));
    }

    @Test public void onlyCleanShortTextCanBeSavedOrShown() {
        assertTrue("empty shows nothing", TitleEmoji.allowed(""));
        assertTrue(TitleEmoji.allowed(TREE));
        assertFalse(TitleEmoji.allowed(null));
        assertFalse("not cleaned", TitleEmoji.allowed(" " + TREE));
        assertFalse("not cleaned", TitleEmoji.allowed("a\nb"));
        StringBuilder longest = new StringBuilder();
        for (int i = 0; i < TitleEmoji.MAX_CODE_POINTS; i++) longest.append(TREE);
        // Counted in code points: sixteen trees are thirty-two chars.
        assertTrue(TitleEmoji.allowed(longest.toString()));
        assertFalse(TitleEmoji.allowed(longest + TREE));
        // A stored value the editor wouldn't take, say from an older build, shows nothing rather than part of it.
        Settings.TITLE_EMOJI.save(longest + TREE);
        assertUntouched("too long");
        // One that only needs cleaning shows cleaned.
        Settings.TITLE_EMOJI.save("  " + TREE + text(0x200f) + " ");
        SpannableStringBuilder title = title(new Object());
        TitleEmoji.decorate(title);
        assertEquals("Telegram" + SPACE + TREE, title.toString());
    }

    @Test public void theOwnTitleTakesTheLogosPlaceAndKeepsTheTitleViewsLook() {
        assertFalse("off by default", Settings.CHAT_LIST_TITLE.get());
        assertEquals("", Settings.CHAT_LIST_TITLE_TEXT.get());
        Settings.CHAT_LIST_TITLE_TEXT.save(MINE);
        assertUntouched("the switch is off");
        Settings.CHAT_LIST_TITLE.save(true);

        Object logo = new Object();
        SpannableStringBuilder title = title(logo);
        TitleEmoji.decorate(title);
        assertEquals(MINE, title.toString());
        // The logo goes with the name it covered, so the title view draws plain text in its own bold face and color.
        assertEquals(-1, title.getSpanStart(logo));
        assertEquals(0, title.getSpans(0, title.length(), Object.class).length);
        assertEquals(MINE.length(), TitleEmoji.titleEnd(title));
        assertTrue(report().contains("chat list title shown"));
        // The report counts it but never carries what the person typed.
        assertFalse(report().contains(MINE));

        // The emoji still goes after it.
        Settings.TITLE_EMOJI.save(TREE);
        SpannableStringBuilder both = title(new Object());
        TitleEmoji.decorate(both);
        assertEquals(MINE + SPACE + TREE, both.toString());
        assertEquals(MINE.length(), TitleEmoji.titleEnd(both));
    }

    @Test public void nothingSavedPausedEarlyOrUnreadableKeepsTelegramsTitle() {
        Settings.CHAT_LIST_TITLE.save(true);
        assertUntouched("nothing saved");
        Settings.CHAT_LIST_TITLE_TEXT.save(MINE);
        for (HushTelegramPause.Reason reason : HushTelegramPause.Reason.values()) {
            if (reason == HushTelegramPause.Reason.NONE) continue;
            PauseForTests.pause(reason);
            assertUntouched(reason.name());
            assertEquals(MINE, Settings.CHAT_LIST_TITLE_TEXT.savedValue());
            PauseForTests.resume();
        }
        SettingsContextRule.withoutContext(() -> assertUntouched("before the settings are ready"));
        SettingReadsForTests.breakReads(Settings.CHAT_LIST_TITLE_TEXT);
        assertUntouched("unreadable text");
        SettingReadsForTests.mend(Settings.CHAT_LIST_TITLE_TEXT);
        SettingReadsForTests.breakReads(Settings.CHAT_LIST_TITLE);
        assertUntouched("unreadable switch");
        SettingReadsForTests.mend(Settings.CHAT_LIST_TITLE);
        SpannableStringBuilder title = title(new Object());
        TitleEmoji.decorate(title);
        assertEquals(MINE, title.toString());
    }

    @Test public void onlyCleanShortTitlesCanBeSavedOrShown() {
        Settings.CHAT_LIST_TITLE.save(true);
        assertTrue("empty keeps Telegram's name", TitleEmoji.titleAllowed(""));
        assertFalse(TitleEmoji.titleAllowed(null));
        assertFalse("not cleaned", TitleEmoji.titleAllowed(" " + MINE));
        StringBuilder longest = new StringBuilder();
        for (int i = 0; i < TitleEmoji.MAX_TITLE_CODE_POINTS; i++) longest.append(i % 2 == 0 ? "a" : TREE);
        assertTrue(TitleEmoji.titleAllowed(longest.toString()));
        assertFalse(TitleEmoji.titleAllowed(longest + "a"));
        // Longer than the emoji may be: the title is a name, not a couple of emoji.
        assertTrue(TitleEmoji.MAX_TITLE_CODE_POINTS > TitleEmoji.MAX_CODE_POINTS);
        // A stored value the editor wouldn't take shows Telegram's title rather than part of it.
        Settings.CHAT_LIST_TITLE_TEXT.save(longest + "a");
        assertUntouched("too long");
        // One that only needs cleaning shows cleaned.
        Settings.CHAT_LIST_TITLE_TEXT.save("  My" + text(0x202e) + "\n chats ");
        SpannableStringBuilder title = title(new Object());
        TitleEmoji.decorate(title);
        assertEquals("My chats", title.toString());
    }

    @Test public void theTitleEditorsToastsFitTwoLinesInEveryLanguage() {
        for (String toast : new String[]{"That's too long. Try a shorter name.", "Couldn't save the title. Try again in a moment."}) {
            assertFitsATwoLineToast("en", toast);
            for (String language : new String[]{"bg", "de", "es", "in", "it", "pt-rbr", "tr"}) {
                String row = L10nTablesForTests.of(language).get(toast);
                assertNotNull(language + ": " + toast, row);
                assertFitsATwoLineToast(language, row);
            }
        }
    }

    /** A toast line holds about 34 characters on a small phone; 28 leaves room for wider letters. */
    private static void assertFitsATwoLineToast(String language, String text) {
        List<String> lines = new ArrayList<>();
        StringBuilder line = new StringBuilder();
        for (String word : text.split(" ")) {
            if (line.length() > 0 && line.length() + 1 + word.length() > 28) {
                lines.add(line.toString());
                line.setLength(0);
            }
            if (line.length() > 0) line.append(' ');
            line.append(word);
        }
        if (line.length() > 0) lines.add(line.toString());
        assertTrue(language + ": " + text, lines.size() <= 2);
        for (String each : lines) assertTrue(language + ": " + each, each.length() <= 28);
    }
}
