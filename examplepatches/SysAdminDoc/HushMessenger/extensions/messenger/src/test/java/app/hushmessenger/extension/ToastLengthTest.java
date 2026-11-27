package app.hushmessenger.extension;

import android.icu.lang.UCharacter;
import android.icu.lang.UProperty;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.TreeSet;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;
import static org.junit.Assert.*;

/** Android 12 and later cut a text toast after its second line, so every toast the extension shows has to fit in two. */
@RunWith(RobolectricTestRunner.class)
@Config(sdk = 36)
public class ToastLengthTest {
    /** About 30 characters fit on a toast line on a Galaxy S22 at the default text size; 28 leaves room for bigger text. */
    private static final int LINE = 28;

    /** Every toast that shows one whole string with nothing filled in. */
    private static final String[] PLAIN = {
        "safe_mode_save_failed", "safe_mode_cleared", "changes_paused", "changes_resumed",
        "font_file_no_picker", "font_file_picker_failed", "font_file_busy", "font_file_finishing", "font_file_unreadable",
        "font_file_not_font", "font_file_wont_load", "font_file_not_saved", "font_file_stopped", "font_file_timeout",
        "font_adjust_failed", "bubble_settings_missing", "export_failed", "choices_file_save_failed", "exported", "choices_file_no_picker",
        "choices_file_saved", "choices_file_changed", "choices_file_timeout", "choices_file_timeout_read",
        "restore_failed", "quick_unchanged", "font_file_set", "font_file_set_off",
        "quick_missing", "local_search_open_failed", "call_recording_failed", "copied", "copy_failed", "message_log_set_aside_failed", "message_log_cleared",
        "message_log_clear_failed", "auto_reply_saved_none", "import_empty", "import_invalid", "import_no_choices",
        "import_too_large", "import_zip_too_large", "export_too_large",
        "import_auto_reply_off", "open_help", "no_browser", "page_blocked", "camera_missing", "camera_failed",
        "camera_permission", "gallery_missing", "gallery_failed", "instant_gallery_shutter", "restart_save_failed", "restart_unavailable",
        "text_style_read_only", "text_style_bold_none", "text_style_italic_none", "mark_read_done", "mark_read_nothing",
        "settings_open_failed", "settings_open_instead", "message_log_restored", "message_log_restore_failed",
        "import_same", "save_voice_menu_failed", "home_header_saved", "home_header_removed", "home_header_remove_failed",
        "home_header_not_picture", "home_header_unreadable", "home_header_not_saved", "home_header_busy", "home_header_timeout",
        "home_header_font_saved", "home_header_font_removed", "home_header_font_remove_failed",
        "special_contacts_tracked", "special_contacts_untracked", "special_contacts_full", "special_contacts_failed", "special_contacts_cleared",
        "chat_preview_taps_gone", StrangerSend.HELD, RemoveContact.DONE, RemoveContact.FAILED,
        "invisible_buttons_invisible", "invisible_buttons_visible", "invisible_buttons_pick_now", "invisible_buttons_pick_none",
        "theme_accent_saved", "theme_accent_saved_on", "theme_pasted", "theme_pasted_on",
        "own_chat_sounds_saved", "own_chat_sounds_removed", "own_chat_sounds_remove_failed", "own_chat_sounds_not_sound",
        "own_chat_sounds_unreadable", "own_chat_sounds_not_saved", "own_chat_sounds_busy", "own_chat_sounds_timeout",
    };

    @Test public void everyToastFitsOnTwoLinesInEveryLanguage() {
        List<String> cut = new ArrayList<>();
        List<String> tags = new ArrayList<>(new TreeSet<>(SettingsTranslations.LOCALES.keySet()));
        tags.add(0, "en-US");
        for (String tag : tags) {
            List<String> here = new ArrayList<>();
            toasts(new SettingsText(Locale.forLanguageTag(tag)), here);
            for (String line : here) cut.add(tag + " " + line);
        }
        assertTrue("Cut after two lines:\n" + String.join("\n", cut), cut.isEmpty());
    }

    private static void toasts(SettingsText words, List<String> cut) {
        for (String key : PLAIN) check(cut, key, words.get(key));
        check(cut, "quick_setups_hidden", words.get("quick_setups_hidden", words.format("quick_setups_home"), words.format("choices")));
        check(cut, "font_file_too_large", words.get("font_file_too_large", FontFile.MAX_MEGABYTES));
        check(cut, "home_header_too_large", words.get("home_header_too_large", HomeHeaderPicture.MAX_MEGABYTES));
        check(cut, "own_chat_sounds_too_large", words.get("own_chat_sounds_too_large", OwnChatSounds.MAX_MEGABYTES));
        check(cut, "auto_reply_saved", words.get("auto_reply_saved", 12));
        check(cut, "call_recording_saved", words.get("call_recording_saved", "Recordings/" + CallRecording.FOLDER));
        check(cut, "save_voice_menu_saved", words.get("save_voice_menu_saved", "Recordings/" + VoiceMessages.FOLDER));
        check(cut, "call_captions_picked", words.get("call_captions_picked", CallCaptions.name("zh-TW")));
        check(cut, "call_captions_picked untranslated", words.get("call_captions_picked", words.get("call_captions_untranslated_choice")));
        check(cut, "call_captions_downloading_now", words.get("call_captions_downloading_now", CallCaptions.name("zh-TW")));
        check(cut, "invisible_buttons_level", words.get("invisible_buttons_level", words.percent(75)));
        // A restored or lifted pause adds its own sentence to the restore toast.
        for (String paused : new String[] {" " + words.get("changes_paused") + ".", " " + words.get("changes_resumed") + "."}) {
            for (int count : new int[] {1, 12}) check(cut, "imported", words.count("imported", count) + paused);
            check(cut, "imported_partial", words.get("imported_partial", 57, 58) + paused);
            check(cut, "import_none_changed", words.get("import_none_changed") + paused);
        }
        // The choices only match a backup that left the pause as it was, so a match never says the pause lifted.
        check(cut, "import_same", words.get("import_same") + " " + words.get("changes_paused") + ".");
        for (int count : new int[] {1, 12}) {
            check(cut, "quick_changed", words.count("quick_changed", count));
            check(cut, "quick_undone", words.count("quick_undone", count));
        }
        for (String mode : new String[] {"stock", "chat_heads", "native"})
            check(cut, "bubble_changed " + mode, words.get("bubble_changed", words.base("bubble_" + mode)));
        for (String style : TonePalette.STYLES)
            check(cut, "material_you_style_changed " + style, words.get("material_you_style_changed", words.get("material_you_style_" + style)));
        for (String level : SeeThroughTabBar.LEVELS)
            check(cut, "see_through_tab_bar_picked " + level, words.get("see_through_tab_bar_picked", words.get(SeeThroughTabBar.KEY + "_" + level)));
        for (String level : StoryRowSize.LEVELS)
            check(cut, "story_row_size_picked " + level, words.get("story_row_size_picked", words.percent(Integer.parseInt(level))));
        for (String size : TabIcons.SIZES)
            check(cut, "tab_icons_size_picked " + size, words.get("tab_icons_size_picked", words.percent(Integer.parseInt(size))));
        // A switch's toast names it the way its row does, so a translated row puts its translated name in the toast.
        for (String[] control : SettingsActivity.CONTROLS) {
            check(cut, "choice_on " + control[0], words.get("choice_on", words.control(control, 1)));
            check(cut, "choice_off " + control[0], words.get("choice_off", words.control(control, 1)));
        }
        // The App tab's own switches toast the same way.
        for (String key : new String[] {SettingsActivity.IN_RECENTS}) {
            check(cut, "choice_on " + key, words.get("choice_on", words.get(key)));
            check(cut, "choice_off " + key, words.get("choice_off", words.get(key)));
        }
    }

    @Test public void theWrapCutsTheToastThePhoneCut() {
        assertEquals(1, lines("Changes paused"));
        assertEquals(2, lines("Hidden. Tap Quick setups section under Your choices."));
        // The S22 showed this one as "Quick setups hidden. Tap Quick / setups section under Your choic...".
        assertEquals(4, lines("Quick setups hidden. Tap Quick setups section under Your choices to show it again."));
        // A word longer than a line breaks inside itself, like a picked font's file name.
        assertEquals(3, lines("Restart Messenger to use NotoSansJP-VariableFont_wght.ttf."));
        assertEquals(2, lines("NotoSansJP-VariableFont_wght.ttf"));
    }

    @Test public void theWrapBreaksThaiAndChineseBetweenLetters() {
        String han = new String(Character.toChars(0x4E00));
        // Chinese puts no spaces between words and each letter takes two places, so 14 fill a line and the 15th starts the next.
        assertEquals(1, lines(repeat(han, 14)));
        assertEquals(2, lines(repeat(han, 15)));
        assertEquals(3, lines(repeat(han, 29)));
        // Thai has no spaces either, and its vowel and tone marks sit on a letter without taking a place of their own.
        String thai = new String(new int[] {0x0E17, 0x0E35, 0x0E48}, 0, 3);
        assertEquals(1, lines(repeat(thai, 28)));
        assertEquals(2, lines(repeat(thai, 29)));
        // A run of them carries on from a Latin word on the same line, and a fullwidth colon is as wide as a letter.
        assertEquals(1, lines("Android " + repeat(han, 10)));
        assertEquals(2, lines("Android " + repeat(han, 11)));
        String colon = new String(Character.toChars(0xFF1A));
        assertEquals(2, lines(repeat(han, 12) + colon + colon + han));
        assertEquals(1, lines(repeat(han, 12) + colon + han));
    }

    private static String repeat(String text, int times) {
        StringBuilder out = new StringBuilder();
        for (int i = 0; i < times; i++) out.append(text);
        return out.toString();
    }

    private static void check(List<String> cut, String key, String message) {
        if (lines(message) > 2) cut.add(key + ": " + message);
    }

    /**
     * Greedy word wrap, the way a toast's text breaks between words, and inside a word too long for a line. Thai and
     * Chinese write words with no space between them, so a run of either breaks between any two letters.
     */
    static int lines(String message) {
        int count = 0, used = 0;
        for (String word : message.trim().split("\\s+")) {
            if (breaksAnywhere(word)) {
                used = used > 0 && used + 1 + width(word.codePointAt(0)) <= LINE ? used + 1 : LINE;
                for (int i = 0; i < word.length(); i += Character.charCount(word.codePointAt(i))) {
                    int w = width(word.codePointAt(i));
                    if (used + w > LINE) {
                        count++;
                        used = 0;
                    }
                    used += w;
                }
                continue;
            }
            int w = width(word);
            if (used > 0 && used + 1 + w <= LINE) used += 1 + w;
            else {
                count += (w - 1) / LINE + 1;
                used = (w - 1) % LINE + 1;
            }
        }
        return count;
    }

    private static boolean breaksAnywhere(String word) {
        for (int i = 0; i < word.length(); i += Character.charCount(word.codePointAt(i))) {
            int c = word.codePointAt(i);
            if (Character.UnicodeScript.of(c) == Character.UnicodeScript.THAI || width(c) == 2) return true;
        }
        return false;
    }

    private static int width(String word) {
        int total = 0;
        for (int i = 0; i < word.length(); i += Character.charCount(word.codePointAt(i))) total += width(word.codePointAt(i));
        return total;
    }

    /** Places a letter takes on a line: none for a mark that sits on the letter before it, two for a wide East Asian one. */
    private static int width(int c) {
        int type = Character.getType(c);
        if (type == Character.NON_SPACING_MARK || type == Character.ENCLOSING_MARK || type == Character.FORMAT) return 0;
        int east = UCharacter.getIntPropertyValue(c, UProperty.EAST_ASIAN_WIDTH);
        return east == UCharacter.EastAsianWidth.WIDE || east == UCharacter.EastAsianWidth.FULLWIDTH ? 2 : 1;
    }
}
