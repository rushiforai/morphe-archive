package app.hushmessenger.extension;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
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
        "font_adjust_failed", "bubble_settings_missing", "export_failed", "exported", "choices_file_no_picker",
        "choices_file_saved", "choices_file_changed", "choices_file_timeout", "choices_file_timeout_read",
        "restore_failed", "quick_unchanged", "font_file_set", "font_file_set_off",
        "quick_missing", "local_search_open_failed", "call_recording_failed", "copied", "copy_failed", "message_log_set_aside_failed", "message_log_cleared",
        "message_log_clear_failed", "auto_reply_saved_none", "import_empty", "import_invalid", "import_no_choices",
        "import_auto_reply_off", "open_help", "no_browser", "page_blocked", "camera_missing", "camera_failed",
        "camera_permission", "gallery_missing", "gallery_failed", "restart_save_failed", "restart_unavailable",
        "text_style_read_only", "text_style_bold_none", "text_style_italic_none", "mark_read_done", "mark_read_nothing",
        "settings_open_failed", "settings_open_instead", "message_log_restored", "message_log_restore_failed",
        "import_same", "save_voice_menu_failed",
    };

    @Test public void everyToastFitsOnTwoLines() {
        SettingsText words = new SettingsText(Locale.US);
        List<String> cut = new ArrayList<>();
        for (String key : PLAIN) check(cut, key, words.get(key));
        check(cut, "quick_setups_hidden", words.get("quick_setups_hidden", words.format("quick_setups_home"), words.format("choices")));
        check(cut, "font_file_too_large", words.get("font_file_too_large", FontFile.MAX_MEGABYTES));
        check(cut, "auto_reply_saved", words.get("auto_reply_saved", 12));
        check(cut, "call_recording_saved", words.get("call_recording_saved", "Recordings/" + CallRecording.FOLDER));
        check(cut, "save_voice_menu_saved", words.get("save_voice_menu_saved", "Recordings/" + VoiceMessages.FOLDER));
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
        for (String[] control : SettingsActivity.CONTROLS) {
            check(cut, "choice_on " + control[0], words.get("choice_on", control[1]));
            check(cut, "choice_off " + control[0], words.get("choice_off", control[1]));
        }
        assertTrue("Cut after two lines:\n" + String.join("\n", cut), cut.isEmpty());
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

    private static void check(List<String> cut, String key, String message) {
        if (lines(message) > 2) cut.add(key + ": " + message);
    }

    /** Greedy word wrap, the way a toast's text breaks between words, and inside a word too long for a line. */
    static int lines(String message) {
        int count = 0, used = 0;
        for (String word : message.trim().split("\\s+")) {
            if (used > 0 && used + 1 + word.length() <= LINE) used += 1 + word.length();
            else {
                count += (word.length() - 1) / LINE + 1;
                used = (word.length() - 1) % LINE + 1;
            }
        }
        return count;
    }
}
