package app.hushmessenger.extension;

import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.TextView;

/**
 * The words field under Hide messages with your words. Typing pauses for a moment before the words are saved, and
 * leaving the field or the page saves them at once, the way the home header's words do. One per settings page.
 */
final class HiddenWordsRow {
    /** Typing waits this long for a pause before the words are saved. */
    static final int SAVE_DELAY_MILLIS = 300;
    private final SettingsActivity page;
    private final android.os.Handler handler = new android.os.Handler(android.os.Looper.getMainLooper());
    private final Runnable save = this::saveWords;
    private EditText words;
    /** Whether the words were typed since the last save. A page left untouched never puts its old words back. */
    private boolean typed;

    HiddenWordsRow(SettingsActivity page) {
        this.page = page;
    }

    void addTo(LinearLayout content) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        words = ui.field(text.get("hidden_words_hint", HiddenWords.MAX_LENGTH), HiddenWords.MAX_LENGTH, true);
        words.setTag("hidden_words_text");
        // Leaving the page saves what was typed, so a page made again reads the words from there, never its own old copy.
        words.setSaveEnabled(false);
        words.setText(Settings.preferences.getString(HiddenWords.WORDS, ""));
        TextView label = ui.text(text.get("hidden_words_words"), 14, ui.text, true);
        label.setLabelFor(words.getId());
        ui.add(content, label, 12);
        ui.add(content, words, 8);
        words.addTextChangedListener(new android.text.TextWatcher() {
            @Override public void beforeTextChanged(CharSequence typing, int start, int count, int after) { }

            @Override public void onTextChanged(CharSequence typing, int start, int before, int count) { }

            @Override public void afterTextChanged(android.text.Editable edited) {
                typed = true;
                handler.removeCallbacks(save);
                handler.postDelayed(save, SAVE_DELAY_MILLIS);
            }
        });
        words.setOnFocusChangeListener((view, focused) -> { if (!focused) saveWords(); });
        ui.add(content, ui.text(text.get("hidden_words_help"), 13, ui.muted, false), 8);
    }

    /** Saves the words typed so far, if they changed. Leaving the field or the page saves them at once. */
    void saveWords() {
        handler.removeCallbacks(save);
        if (words == null || !typed) return;
        typed = false;
        String now = words.getText().toString();
        if (now.equals(Settings.preferences.getString(HiddenWords.WORDS, ""))) return;
        Settings.preferences.edit().putString(HiddenWords.WORDS, now).apply();
    }

    /** Shows the saved words again after something other than typing changed them, such as a Quick setup or its Undo. */
    void reload() {
        if (words != null) {
            String saved = Settings.preferences.getString(HiddenWords.WORDS, "");
            if (!saved.contentEquals(words.getText())) words.setText(saved);
            // Setting the field reads as typing, so drop the save that queued: the words came from the saved value.
            typed = false;
        }
        handler.removeCallbacks(save);
    }
}
