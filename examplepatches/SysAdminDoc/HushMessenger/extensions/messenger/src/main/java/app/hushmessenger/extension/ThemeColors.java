package app.hushmessenger.extension;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.SharedPreferences;
import android.os.Build;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

/**
 * The Appearance section's theme colors: the saved theme's name, and the buttons that paste one from the clipboard,
 * copy the one in use and go back to wallpaper colors. Shown only where Material You applied. One per settings page.
 */
final class ThemeColors {
    private final SettingsActivity page;
    /** The Material You theme line, and the button that drops a pasted theme (#115). */
    private TextView themeStatus;
    private Button themeClear;

    ThemeColors(SettingsActivity page) {
        this.page = page;
    }

    /** The status line, the three buttons and the file help, at the end of [appearance]. */
    void addTo(LinearLayout appearance) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        themeStatus = ui.text("", 13, ui.muted, false);
        themeStatus.setTag("theme_status");
        ui.add(appearance, themeStatus, 12);
        Button paste = ui.button(text.get("theme_paste"));
        paste.setTag("theme_paste");
        paste.setOnClickListener(view -> pasteTheme());
        ui.add(appearance, paste, 8);
        Button copy = ui.button(text.get("theme_copy"));
        copy.setTag("theme_copy");
        copy.setOnClickListener(view -> copyTheme());
        ui.add(appearance, copy, 8);
        themeClear = ui.button(text.get("theme_clear"));
        themeClear.setTag("theme_clear");
        themeClear.setOnClickListener(view -> clearTheme());
        ui.add(appearance, themeClear, 8);
        ui.add(appearance, ui.text(text.get("theme_file_help"), 13, ui.muted, false), 8);
        showTheme();
    }

    /** Names the saved theme, and shows Back to wallpaper colors only while there is one. */
    private void showTheme() {
        SettingsText text = page.text;
        ThemeFile theme = ThemeFile.saved();
        themeStatus.setText(theme == null ? text.get("theme_status_wallpaper")
            : theme.name.isEmpty() ? text.get("theme_status_unnamed") : text.get("theme_status_saved", theme.name));
        themeClear.setVisibility(theme == null ? View.GONE : View.VISIBLE);
    }

    /** Saves the copied theme. Its pure black choice, when it has one, sets that switch; it isn't kept with the colors. */
    private void pasteTheme() {
        SettingsText text = page.text;
        ThemeFile theme;
        try {
            ClipboardManager clipboard = page.getSystemService(ClipboardManager.class);
            ClipData clip = clipboard == null || !clipboard.hasPrimaryClip() ? null : clipboard.getPrimaryClip();
            CharSequence raw = clip == null || clip.getItemCount() == 0 ? null : clip.getItemAt(0).getText();
            if (raw == null || raw.toString().trim().isEmpty()) {
                page.feedback(text.get("theme_paste_empty"), Toast.LENGTH_LONG);
                return;
            }
            theme = ThemeFile.parse(raw.toString());
        } catch (RuntimeException error) {
            android.util.Log.w("HushMessenger", "Can't read that theme", error);
            page.feedback(text.get("theme_paste_invalid"), Toast.LENGTH_LONG);
            return;
        }
        SharedPreferences.Editor edit = Settings.preferences.edit().putString(ThemeFile.KEY, theme.withPureBlack(null).encode());
        if (theme.pureBlack != null) edit.putBoolean(MaterialYouTheme.BLACK_KEY, theme.pureBlack);
        edit.apply();
        page.refreshChoices();
        showTheme();
        page.feedback(text.get("theme_pasted"), Toast.LENGTH_SHORT);
    }

    /** Copies the saved theme, or the colors in use as one, with the pure black switch as it is now. */
    private void copyTheme() {
        SettingsText text = page.text;
        try {
            ThemeFile theme = ThemeFile.saved();
            if (theme == null) {
                TonePalette palette = MaterialYouTheme.palette();
                theme = new ThemeFile("", palette.tone(TonePalette.ACCENT, 40), palette.tone(TonePalette.NEUTRAL, 50), null);
            }
            String json = theme.withPureBlack(Settings.preferences.getBoolean(MaterialYouTheme.BLACK_KEY, false)).encode();
            ClipboardManager clipboard = page.getSystemService(ClipboardManager.class);
            if (clipboard == null) throw new IllegalStateException("Clipboard unavailable");
            clipboard.setPrimaryClip(ClipData.newPlainText(text.get("theme_copy"), json));
            if (Build.VERSION.SDK_INT < 33) page.feedback(text.get("theme_copied"), Toast.LENGTH_SHORT);
        } catch (RuntimeException error) {
            android.util.Log.e("HushMessenger", "Can't copy the theme", error);
            page.feedback(text.get("theme_copy_failed"), Toast.LENGTH_LONG);
        }
    }

    private void clearTheme() {
        Settings.preferences.edit().remove(ThemeFile.KEY).apply();
        showTheme();
        page.feedback(page.text.get("theme_cleared"), Toast.LENGTH_SHORT);
    }
}
