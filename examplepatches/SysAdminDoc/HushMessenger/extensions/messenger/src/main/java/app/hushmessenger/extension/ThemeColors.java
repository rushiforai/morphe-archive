package app.hushmessenger.extension;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.SharedPreferences;
import android.content.res.ColorStateList;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.InsetDrawable;
import android.graphics.drawable.RippleDrawable;
import android.os.Build;
import android.view.View;
import android.widget.Button;
import android.widget.HorizontalScrollView;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;

/**
 * The Appearance section's theme colors: the saved theme's name, accent colors one tap away, the palette styles, and
 * the buttons that paste a theme from the clipboard, copy the one in use, save it to a file or open one, and go back to
 * wallpaper colors. Shown only where Material You applied. One per settings page.
 */
final class ThemeColors {
    /** The accents a tap saves (#132), each with its name for screen readers. Messenger's own blue first. */
    static final int[] ACCENTS = {ThemeFile.MESSENGER_BLUE, 0xFF7B61FF, 0xFFE1306C, 0xFFE53935, 0xFFF57C00, 0xFF2E7D32, 0xFF00897B};
    static final String[] ACCENT_NAMES = {"blue", "purple", "pink", "red", "orange", "green", "teal"};
    /** The space around each dot that still takes its tap, so a swatch is a 48 dp target. */
    static final int DOT_INSET = 6;

    private final SettingsActivity page;
    /** The Material You theme line, and the button that drops a pasted theme (#115). */
    private TextView themeStatus;
    private Button themeClear;
    private final View[] swatches = new View[ACCENTS.length];
    private HorizontalScrollView accents;
    /** The palette style choices (#155), one per TonePalette.STYLES, or null until addTo. */
    private RadioButton[] styles;
    /** The color code fields (#211), or null until addTo. */
    private android.widget.EditText accentCode, neutralCode;
    /** Saving the theme to a file and opening one (#115). */
    private final ThemeDocument document;

    ThemeColors(SettingsActivity page) {
        this.page = page;
        document = new ThemeDocument(page, this::useTheme);
    }

    void documentResult(int request, int result, android.content.Intent data) {
        document.result(request, result, data);
    }

    void destroy() {
        document.destroy();
    }

    /** The status line, the accent swatches, the three buttons and the file help, at the end of [appearance]. */
    void addTo(LinearLayout appearance) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        themeStatus = ui.text("", 13, ui.muted, false);
        themeStatus.setTag("theme_status");
        ui.add(appearance, themeStatus, 12);
        ui.add(appearance, ui.text(text.get("theme_accents"), 14, ui.text, true), 12);
        LinearLayout row = ui.row();
        for (int i = 0; i < ACCENTS.length; i++) {
            int color = ACCENTS[i];
            View swatch = new View(page);
            swatch.setTag(String.format("theme_accent_%06X", color & 0xFFFFFF));
            swatch.setContentDescription(text.get("theme_accent_" + ACCENT_NAMES[i]));
            swatch.setOnClickListener(view -> pickAccent(color));
            // A 48 dp target around the 36 dp dot. The targets sit side by side, so the dots are 12 dp apart and none takes another's tap.
            row.addView(swatch, new LinearLayout.LayoutParams(ui.dp(36 + 2 * DOT_INSET), ui.dp(36 + 2 * DOT_INSET)));
            swatches[i] = swatch;
        }
        accents = new HorizontalScrollView(page);
        accents.setHorizontalScrollBarEnabled(false);
        accents.addView(row);
        ui.add(appearance, accents, 2);
        ((LinearLayout.LayoutParams) accents.getLayoutParams()).setMarginStart(-ui.dp(DOT_INSET));
        addCodes(appearance);
        ui.add(appearance, ui.text(text.get(MaterialYouTheme.STYLE_KEY), 14, ui.text, true), 12);
        ui.add(appearance, ui.text(text.get("material_you_style_help"), 13, ui.muted, false), 4);
        RadioGroup group = new RadioGroup(page);
        group.setOrientation(LinearLayout.VERTICAL);
        styles = new RadioButton[TonePalette.STYLES.length];
        for (int i = 0; i < styles.length; i++) {
            String style = TonePalette.STYLES[i];
            RadioButton choice = page.radio("material_you_style_" + style, text.get("material_you_style_" + style));
            choice.setOnClickListener(view -> pickStyle(style));
            group.addView(choice, new RadioGroup.LayoutParams(-1, -2));
            styles[i] = choice;
        }
        ui.add(appearance, group, 4);
        showStyle();
        Button paste = ui.button(text.get("theme_paste"));
        paste.setTag("theme_paste");
        paste.setOnClickListener(view -> pasteTheme());
        ui.add(appearance, paste, 2);
        Button copy = ui.button(text.get("theme_copy"));
        copy.setTag("theme_copy");
        copy.setOnClickListener(view -> copyTheme());
        ui.add(appearance, copy, 8);
        Button saveFile = ui.button(text.get("theme_file_save"));
        saveFile.setTag("theme_file_save");
        saveFile.setOnClickListener(view -> document.save(themeInUse()));
        ui.add(appearance, saveFile, 8);
        Button openFile = ui.button(text.get("theme_file_open"));
        openFile.setTag("theme_file_open");
        openFile.setOnClickListener(view -> document.open());
        ui.add(appearance, openFile, 8);
        themeClear = ui.button(text.get("theme_clear"));
        themeClear.setTag("theme_clear");
        themeClear.setOnClickListener(view -> clearTheme());
        ui.add(appearance, themeClear, 8);
        ui.add(appearance, ui.text(text.get("theme_file_help"), 13, ui.muted, false), 8);
        showTheme();
    }

    /** Two fields for color codes (#211), the accent and the background, and the button that saves them as the theme. */
    private void addCodes(LinearLayout appearance) {
        SettingsUi ui = page.ui;
        SettingsText text = page.text;
        ui.add(appearance, ui.text(text.get("theme_codes"), 14, ui.text, true), 12);
        LinearLayout fields = ui.row();
        accentCode = codeField(fields, "theme_code_accent", ThemeFile.hex(0xFFE1306C), 0);
        neutralCode = codeField(fields, "theme_code_neutral", ThemeFile.hex(0xFF1A1418), 12);
        ui.add(appearance, fields, 4);
        Button use = ui.button(text.get("theme_codes_use"));
        use.setTag("theme_codes_use");
        use.setOnClickListener(view -> useCodes());
        ui.add(appearance, use, 8);
        ui.add(appearance, ui.text(text.get("theme_codes_help"), 13, ui.muted, false), 8);
        fillCodes();
    }

    /** One labeled code field, half the row wide. */
    private android.widget.EditText codeField(LinearLayout fields, String id, String hint, int gap) {
        SettingsUi ui = page.ui;
        LinearLayout column = ui.column();
        android.widget.EditText field = ui.field(hint, 7, true);
        field.setTag(id);
        // The saved theme fills it whenever the page is drawn, so the page's own saved copy never stands in for it.
        field.setSaveEnabled(false);
        field.setInputType(android.text.InputType.TYPE_CLASS_TEXT | android.text.InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS
            | android.text.InputType.TYPE_TEXT_FLAG_CAP_CHARACTERS);
        field.setTextDirection(View.TEXT_DIRECTION_LTR);
        TextView label = ui.text(page.text.get(id), 13, ui.muted, false);
        label.setLabelFor(field.getId());
        column.addView(label);
        ui.add(column, field, 4);
        LinearLayout.LayoutParams half = new LinearLayout.LayoutParams(0, -2, 1);
        half.setMarginStart(ui.dp(gap));
        fields.addView(column, half);
        return field;
    }

    /** The saved theme's colors as codes, or empty fields for wallpaper colors. */
    private void fillCodes() {
        if (accentCode == null) return;
        ThemeFile theme = ThemeFile.saved();
        accentCode.setText(theme == null || theme.accent == null ? "" : ThemeFile.hex(theme.accent));
        neutralCode.setText(theme == null || theme.neutral == null ? "" : ThemeFile.hex(theme.neutral));
    }

    /** Saves the typed codes as the theme. An empty field leaves that color to Messenger; a wrong one saves nothing. */
    void useCodes() {
        SettingsText text = page.text;
        Integer accent, neutral;
        try {
            accent = ThemeFile.code(accentCode.getText().toString());
            neutral = ThemeFile.code(neutralCode.getText().toString());
        } catch (IllegalArgumentException wrong) {
            page.feedback(text.get("theme_codes_invalid"), Toast.LENGTH_LONG);
            return;
        }
        if (accent == null && neutral == null) {
            page.feedback(text.get("theme_codes_empty"), Toast.LENGTH_LONG);
            return;
        }
        Runnable undo = keep();
        Settings.preferences.edit().putString(ThemeFile.KEY, new ThemeFile("", accent, neutral, null).encode()).apply();
        page.refreshChoices();
        showTheme();
        page.feedback(text.get("theme_pasted"), Toast.LENGTH_SHORT);
        page.offerUndo(text.format("theme_change"), undo);
    }

    /** Names the saved theme, rings its accent, and shows Back to wallpaper colors only while there is one. */
    private void showTheme() {
        SettingsText text = page.text;
        SettingsUi ui = page.ui;
        ThemeFile theme = ThemeFile.saved();
        // The line above the swatches changes length with the theme, so they hold their place rather than slide under the finger.
        page.keepInPlace(accents);
        themeStatus.setText(theme == null ? text.get("theme_status_wallpaper")
            : theme.name.isEmpty() ? text.get("theme_status_unnamed") : text.get("theme_status_saved", theme.name));
        themeClear.setVisibility(theme == null ? View.GONE : View.VISIBLE);
        fillCodes();
        for (int i = 0; i < ACCENTS.length; i++) {
            boolean picked = theme != null && theme.accent != null && theme.accent == ACCENTS[i];
            GradientDrawable dot = ui.shape(ACCENTS[i], 0, 10);
            dot.setStroke(ui.dp(picked ? 3 : 1), picked ? ui.text : ui.line);
            // The press shows on the dot itself, the way the buttons under it show theirs.
            swatches[i].setBackground(new InsetDrawable(new RippleDrawable(ColorStateList.valueOf(ui.ripple), dot, null), ui.dp(DOT_INSET)));
            swatches[i].setSelected(picked);
        }
    }

    /** Checks the style in use. One this version doesn't know is used as Default, so Default shows. */
    void showStyle() {
        if (styles == null) return;
        int chosen = java.util.Arrays.asList(TonePalette.STYLES).indexOf(MaterialYouTheme.style());
        for (int i = 0; i < styles.length; i++) styles[i].setChecked(i == Math.max(0, chosen));
    }

    /** Saves the style. Default is no saved style, so a later version's default reaches it. */
    private void pickStyle(String style) {
        if (style.equals(MaterialYouTheme.style())) return;
        SharedPreferences.Editor edit = Settings.preferences.edit();
        if (TonePalette.STYLES[0].equals(style)) edit.remove(MaterialYouTheme.STYLE_KEY);
        else edit.putString(MaterialYouTheme.STYLE_KEY, style);
        edit.apply();
        showStyle();
        page.feedback(page.text.get("material_you_style_changed", page.text.get("material_you_style_" + style)), Toast.LENGTH_SHORT);
    }

    /**
     * Saves the accent as the theme, keeping a saved theme's neutral, so Material You takes it in dark and light mode.
     * The pasted theme's name goes, since its colors no longer match it.
     */
    private void pickAccent(int color) {
        Runnable undo = keep();
        ThemeFile old = ThemeFile.saved();
        ThemeFile theme = new ThemeFile("", color, old == null ? null : old.neutral, null);
        Settings.preferences.edit().putString(ThemeFile.KEY, theme.encode()).apply();
        page.refreshChoices();
        showTheme();
        page.feedback(page.text.get("theme_accent_saved"), Toast.LENGTH_SHORT);
        page.offerUndo(page.text.format("theme_change"), undo);
    }

    /**
     * Undo for the theme as it is now, taken before a tap replaces or drops it. A pasted theme's name and its pure black
     * choice can't be typed back in, so both come back with it.
     */
    private Runnable keep() {
        SharedPreferences prefs = Settings.preferences;
        String before = prefs.getString(ThemeFile.KEY, null);
        Boolean black = prefs.contains(MaterialYouTheme.BLACK_KEY) ? prefs.getBoolean(MaterialYouTheme.BLACK_KEY, false) : null;
        return () -> {
            SharedPreferences.Editor edit = Settings.preferences.edit();
            if (before == null) edit.remove(ThemeFile.KEY);
            else edit.putString(ThemeFile.KEY, before);
            if (black == null) edit.remove(MaterialYouTheme.BLACK_KEY);
            else edit.putBoolean(MaterialYouTheme.BLACK_KEY, black);
            edit.apply();
            page.refreshChoices();
            showTheme();
        };
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
        useTheme(theme);
    }

    /** Saves [theme] with Undo, from the clipboard or a file. */
    private void useTheme(ThemeFile theme) {
        SettingsText text = page.text;
        Runnable undo = keep();
        SharedPreferences.Editor edit = Settings.preferences.edit().putString(ThemeFile.KEY, theme.withPureBlack(null).encode());
        if (theme.pureBlack != null) edit.putBoolean(MaterialYouTheme.BLACK_KEY, theme.pureBlack);
        edit.apply();
        page.refreshChoices();
        showTheme();
        page.feedback(text.get("theme_pasted"), Toast.LENGTH_SHORT);
        page.offerUndo(text.format("theme_change"), undo);
    }

    /** The saved theme, or the colors in use as one, with the pure black switch as it is now. */
    private static ThemeFile themeInUse() {
        ThemeFile theme = ThemeFile.saved();
        if (theme == null) {
            TonePalette palette = MaterialYouTheme.palette();
            theme = new ThemeFile("", palette.tone(TonePalette.ACCENT, 40), palette.tone(TonePalette.NEUTRAL, 50), null);
        }
        return theme.withPureBlack(Settings.preferences.getBoolean(MaterialYouTheme.BLACK_KEY, false));
    }

    /** Copies the theme in use. */
    private void copyTheme() {
        SettingsText text = page.text;
        try {
            String json = themeInUse().encode();
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
        Runnable undo = keep();
        Settings.preferences.edit().remove(ThemeFile.KEY).apply();
        showTheme();
        page.feedback(page.text.get("theme_cleared"), Toast.LENGTH_SHORT);
        page.offerUndo(page.text.format("theme_change"), undo);
    }
}
