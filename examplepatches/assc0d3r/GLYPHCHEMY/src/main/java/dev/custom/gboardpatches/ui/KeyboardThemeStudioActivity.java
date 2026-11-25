package dev.custom.gboardpatches.ui;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CompoundButton;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

/** Theme Builder: edits the keyboard colours, corner radius and key font applied by the runtime. */
public class KeyboardThemeStudioActivity extends Activity {

    private static final int REQUEST_FONT = 41;
    private static final int REQUEST_PACK = 42;
    private static final int REQUEST_THEMES = 43;
    private static final int REQUEST_TREE = 44;
    private static final int REQUEST_EXPORT = 45;
    /** Only themes written by this screen carry it, so imported scenes never sort as saved. */
    private static final String SAVED_MARKER = "\"studioSaved\": true";

    private SharedPreferences prefs;

    private Switch enabledSwitch;
    private EditText accentField;
    private EditText backgroundField;
    private EditText textField;
    private SeekBar radiusSlider;
    private TextView radiusLabel;
    private EditText boardField;
    private EditText modifierBgField;
    private EditText modifierTextField;
    private EditText enterBgField;
    private EditText enterTextField;
    private EditText pressedField;
    private EditText borderColorField;
    private EditText borderWidthField;
    private LinearLayout previewRow;
    private TextView fontLabel;
    private TextView packLabel;
    private TextView previewQ;
    private TextView previewW;
    private TextView previewE;

    private String fontPath;
    private Typeface previewTypeface;

    private LinearLayout themeContainer;
    /** Painted-face JSON of the loaded scene, applied together with the flat colours. */
    private String pendingKeySkin;
    /** Name of the theme currently loaded or last saved, used for export file names. */
    private String currentThemeName;
    /** Remembers that name across launches, so export is still named after the theme. */
    private static final String KEY_THEME_NAME = "theme_name";
    private final List<String> themeNames = new ArrayList<String>();
    private final List<File> themeFiles = new ArrayList<File>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        prefs = getSharedPreferences(KeyboardThemeRuntime.PREFS, MODE_PRIVATE);
        setContentView(buildScreen());
        loadValues();
        renderPreview();
    }

    private View buildScreen() {
        int padding = dp(20);

        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        root.setBackgroundColor(Color.parseColor("#121212"));
        root.setPadding(padding, padding, padding, padding);

        TextView title = new TextView(this);
        title.setText("Theme Builder");
        title.setTextColor(Color.WHITE);
        title.setTextSize(24f);
        root.addView(title);

        TextView subtitle = new TextView(this);
        subtitle.setText("Colours, radius and font apply to Gboard keys while the theme is enabled.");
        subtitle.setTextColor(Color.parseColor("#B0B0B0"));
        subtitle.setTextSize(14f);
        subtitle.setPadding(0, dp(4), 0, dp(16));
        root.addView(subtitle);

        enabledSwitch = new Switch(this);
        enabledSwitch.setText("Enable custom key theme");
        enabledSwitch.setTextColor(Color.WHITE);
        enabledSwitch.setOnCheckedChangeListener(new CompoundButton.OnCheckedChangeListener() {
            @Override
            public void onCheckedChanged(CompoundButton buttonView, boolean isChecked) {
                renderPreview();
            }
        });
        root.addView(enabledSwitch);

        accentField = addColorField(root, "Accent colour", "#4285F4");
        backgroundField = addColorField(root, "Key background", "#202124");
        textField = addColorField(root, "Key text", "#FFFFFF");

        radiusLabel = new TextView(this);
        radiusLabel.setTextColor(Color.WHITE);
        radiusLabel.setTextSize(14f);
        radiusLabel.setPadding(0, dp(12), 0, 0);
        root.addView(radiusLabel);

        radiusSlider = new SeekBar(this);
        radiusSlider.setMax(32);
        radiusSlider.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                renderPreview();
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        });
        root.addView(radiusSlider);

        TextView advancedLabel = new TextView(this);
        advancedLabel.setText("Advanced colours (blank = keep Gboard's)");
        advancedLabel.setTextColor(Color.parseColor("#B0B0B0"));
        advancedLabel.setTextSize(13f);
        advancedLabel.setPadding(0, dp(20), 0, 0);
        root.addView(advancedLabel);

        boardField = addOptionalColorField(root, "Board background", "#FF121212");
        modifierBgField = addOptionalColorField(root, "Modifier key background", "#FF2A2C2E");
        modifierTextField = addOptionalColorField(root, "Modifier key text", "#FFDDDDDD");
        enterBgField = addOptionalColorField(root, "Enter key background", "#FF178A8C");
        enterTextField = addOptionalColorField(root, "Enter key text", "#FFFFFFFF");
        pressedField = addOptionalColorField(root, "Pressed key background", "#FF3C4043");
        borderColorField = addOptionalColorField(root, "Border colour", "#FF178A8C");

        TextView borderCaption = new TextView(this);
        borderCaption.setText("Border width (dp, blank = 2)");
        borderCaption.setTextColor(Color.parseColor("#B0B0B0"));
        borderCaption.setTextSize(13f);
        borderCaption.setPadding(0, dp(12), 0, dp(2));
        root.addView(borderCaption);

        borderWidthField = new EditText(this);
        borderWidthField.setSingleLine(true);
        borderWidthField.setInputType(InputType.TYPE_CLASS_NUMBER);
        borderWidthField.setTextColor(Color.WHITE);
        borderWidthField.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                renderPreview();
            }

            @Override
            public void afterTextChanged(Editable s) {
            }
        });
        root.addView(borderWidthField);

        TextView fontCaption = new TextView(this);
        fontCaption.setText("Key font (.ttf / .otf)");
        fontCaption.setTextColor(Color.parseColor("#B0B0B0"));
        fontCaption.setTextSize(13f);
        fontCaption.setPadding(0, dp(16), 0, dp(2));
        root.addView(fontCaption);

        fontLabel = new TextView(this);
        fontLabel.setTextColor(Color.WHITE);
        fontLabel.setTextSize(14f);
        fontLabel.setPadding(0, 0, 0, dp(6));
        root.addView(fontLabel);

        LinearLayout fontActions = new LinearLayout(this);
        fontActions.setOrientation(LinearLayout.HORIZONTAL);

        Button pickFont = new Button(this);
        pickFont.setText("Pick font file");
        pickFont.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                pickFontFile();
            }
        });
        fontActions.addView(pickFont, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        Button clearFont = new Button(this);
        clearFont.setText("Gboard font");
        clearFont.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                fontPath = null;
                previewTypeface = null;
                updateFontLabel();
                renderPreview();
            }
        });
        fontActions.addView(clearFont, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        root.addView(fontActions);

        TextView packCaption = new TextView(this);
        packCaption.setText("Keyboard icon pack (.wmicons.zip)");
        packCaption.setTextColor(Color.parseColor("#B0B0B0"));
        packCaption.setTextSize(13f);
        packCaption.setPadding(0, dp(16), 0, dp(2));
        root.addView(packCaption);

        packLabel = new TextView(this);
        packLabel.setTextColor(Color.WHITE);
        packLabel.setTextSize(14f);
        packLabel.setPadding(0, 0, 0, dp(6));
        root.addView(packLabel);

        LinearLayout packActions = new LinearLayout(this);
        packActions.setOrientation(LinearLayout.HORIZONTAL);

        Button pickPack = new Button(this);
        pickPack.setText("Import pack");
        pickPack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                pickIconPack();
            }
        });
        packActions.addView(pickPack, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        Button clearPack = new Button(this);
        clearPack.setText("Remove pack");
        clearPack.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                clearIconPack();
            }
        });
        packActions.addView(clearPack, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        root.addView(packActions);

        TextView themeCaption = new TextView(this);
        themeCaption.setText("Imported themes (.wmtheme.json)");
        themeCaption.setTextColor(Color.parseColor("#B0B0B0"));
        themeCaption.setTextSize(13f);
        themeCaption.setPadding(0, dp(16), 0, dp(2));
        root.addView(themeCaption);

        Button importThemes = new Button(this);
        importThemes.setText("Import themes (zip or .json)");
        importThemes.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                pickThemeFiles();
            }
        });
        root.addView(importThemes);

        Button importFolder = new Button(this);
        importFolder.setText("Import themes folder");
        importFolder.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                pickThemeFolder();
            }
        });
        root.addView(importFolder);

        LinearLayout saveExport = new LinearLayout(this);
        saveExport.setOrientation(LinearLayout.HORIZONTAL);
        saveExport.setPadding(0, dp(6), 0, 0);

        Button saveTheme = new Button(this);
        saveTheme.setText("Save theme");
        saveTheme.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                promptForThemeName();
            }
        });
        saveExport.addView(saveTheme, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        Button exportTheme = new Button(this);
        exportTheme.setText("Export theme");
        exportTheme.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                exportTheme();
            }
        });
        saveExport.addView(exportTheme, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        root.addView(saveExport);

        // A plain container, not a ListView: a scrolling list nested in this ScrollView cannot be
        // dragged, which would hide every theme past the first few rows.
        themeContainer = new LinearLayout(this);
        themeContainer.setOrientation(LinearLayout.VERTICAL);
        LinearLayout.LayoutParams listParams = new LinearLayout.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        listParams.setMargins(0, dp(8), 0, 0);
        root.addView(themeContainer, listParams);

        TextView previewLabel = new TextView(this);
        previewLabel.setText("Preview");
        previewLabel.setTextColor(Color.parseColor("#B0B0B0"));
        previewLabel.setTextSize(14f);
        previewLabel.setPadding(0, dp(16), 0, dp(8));
        root.addView(previewLabel);

        previewRow = new LinearLayout(this);
        previewRow.setOrientation(LinearLayout.HORIZONTAL);
        previewRow.setPadding(dp(6), dp(6), dp(6), dp(6));
        previewQ = addPreviewKey(previewRow, "Q");
        previewW = addPreviewKey(previewRow, "W");
        previewE = addPreviewKey(previewRow, "E");
        root.addView(previewRow);

        LinearLayout actions = new LinearLayout(this);
        actions.setOrientation(LinearLayout.HORIZONTAL);
        actions.setPadding(0, dp(24), 0, 0);

        Button save = new Button(this);
        save.setText("Save & apply");
        save.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                saveValues();
            }
        });
        actions.addView(save, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));

        Button reset = new Button(this);
        reset.setText("Reset");
        reset.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                resetValues();
            }
        });
        actions.addView(reset, new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        root.addView(actions);

        ScrollView scroll = new ScrollView(this);
        scroll.addView(root);
        return scroll;
    }

    private EditText addColorField(LinearLayout parent, String label, String initial) {
        TextView caption = new TextView(this);
        caption.setText(label + " (#AARRGGBB)");
        caption.setTextColor(Color.parseColor("#B0B0B0"));
        caption.setTextSize(13f);
        caption.setPadding(0, dp(12), 0, dp(2));
        parent.addView(caption);

        EditText field = new EditText(this);
        field.setText(initial);
        field.setSingleLine(true);
        field.setInputType(InputType.TYPE_CLASS_TEXT | InputType.TYPE_TEXT_FLAG_NO_SUGGESTIONS);
        field.setTextColor(Color.WHITE);
        field.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence s, int start, int count, int after) {
            }

            @Override
            public void onTextChanged(CharSequence s, int start, int before, int count) {
                renderPreview();
            }

            @Override
            public void afterTextChanged(Editable s) {
            }
        });
        parent.addView(field);
        return field;
    }

    private TextView addPreviewKey(LinearLayout row, String label) {
        TextView key = new TextView(this);
        key.setText(label);
        key.setGravity(Gravity.CENTER);
        key.setTextSize(18f);
        LinearLayout.LayoutParams params =
            new LinearLayout.LayoutParams(0, dp(56), 1f);
        params.setMargins(dp(4), 0, dp(4), 0);
        row.addView(key, params);
        return key;
    }

    private void loadValues() {
        enabledSwitch.setChecked(prefs.getBoolean(KeyboardThemeRuntime.KEY_ENABLED, false));
        accentField.setText(toHex(prefs.getInt(
            KeyboardThemeRuntime.KEY_ACCENT, KeyboardThemeRuntime.DEFAULT_ACCENT)));
        backgroundField.setText(toHex(prefs.getInt(
            KeyboardThemeRuntime.KEY_KEY_BG, KeyboardThemeRuntime.DEFAULT_KEY_BG)));
        textField.setText(toHex(prefs.getInt(
            KeyboardThemeRuntime.KEY_KEY_TEXT, KeyboardThemeRuntime.DEFAULT_KEY_TEXT)));
        radiusSlider.setProgress(prefs.getInt(
            KeyboardThemeRuntime.KEY_RADIUS, KeyboardThemeRuntime.DEFAULT_RADIUS));
        boardField.setText(loadOptional(prefs, KeyboardThemeRuntime.KEY_BOARD_BG));
        modifierBgField.setText(loadOptional(prefs, KeyboardThemeRuntime.KEY_MOD_BG));
        modifierTextField.setText(loadOptional(prefs, KeyboardThemeRuntime.KEY_MOD_TEXT));
        enterBgField.setText(loadOptional(prefs, KeyboardThemeRuntime.KEY_ENTER_BG));
        enterTextField.setText(loadOptional(prefs, KeyboardThemeRuntime.KEY_ENTER_TEXT));
        pressedField.setText(loadOptional(prefs, KeyboardThemeRuntime.KEY_PRESSED_BG));
        borderColorField.setText(loadOptional(prefs, KeyboardThemeRuntime.KEY_BORDER_COLOR));
        borderWidthField.setText(prefs.contains(KeyboardThemeRuntime.KEY_BORDER_WIDTH)
            ? String.valueOf(prefs.getInt(KeyboardThemeRuntime.KEY_BORDER_WIDTH, 2)) : "");
        fontPath = prefs.getString(KeyboardThemeRuntime.KEY_FONT, null);
        pendingKeySkin = prefs.getString(KeyboardThemeRuntime.KEY_KEY_SKIN, null);
        currentThemeName = prefs.getString(KEY_THEME_NAME, null);
        previewTypeface = loadTypeface(fontPath);
        updateFontLabel();
        updatePackLabel();
        refreshThemeList();
    }

    private void saveValues() {
        Integer accent = parseColor(accentField);
        Integer background = parseColor(backgroundField);
        Integer text = parseColor(textField);
        if (accent == null || background == null || text == null) {
            Toast.makeText(this, "Use colours like #FF4285F4", Toast.LENGTH_SHORT).show();
            return;
        }
        SharedPreferences.Editor editor = prefs.edit()
            .putBoolean(KeyboardThemeRuntime.KEY_ENABLED, enabledSwitch.isChecked())
            .putInt(KeyboardThemeRuntime.KEY_ACCENT, accent)
            .putInt(KeyboardThemeRuntime.KEY_KEY_BG, background)
            .putInt(KeyboardThemeRuntime.KEY_KEY_TEXT, text)
            .putInt(KeyboardThemeRuntime.KEY_RADIUS, radiusSlider.getProgress());
        if (fontPath == null) {
            editor.remove(KeyboardThemeRuntime.KEY_FONT);
        } else {
            editor.putString(KeyboardThemeRuntime.KEY_FONT, fontPath);
        }
        putOptional(editor, KeyboardThemeRuntime.KEY_BOARD_BG, boardField);
        putOptional(editor, KeyboardThemeRuntime.KEY_MOD_BG, modifierBgField);
        putOptional(editor, KeyboardThemeRuntime.KEY_MOD_TEXT, modifierTextField);
        putOptional(editor, KeyboardThemeRuntime.KEY_ENTER_BG, enterBgField);
        putOptional(editor, KeyboardThemeRuntime.KEY_ENTER_TEXT, enterTextField);
        putOptional(editor, KeyboardThemeRuntime.KEY_PRESSED_BG, pressedField);
        putOptional(editor, KeyboardThemeRuntime.KEY_BORDER_COLOR, borderColorField);
        String widthValue = borderWidthField.getText().toString().trim();
        if (widthValue.length() == 0) {
            editor.remove(KeyboardThemeRuntime.KEY_BORDER_WIDTH);
        } else {
            try {
                editor.putInt(KeyboardThemeRuntime.KEY_BORDER_WIDTH,
                    Math.max(0, Integer.parseInt(widthValue)));
            } catch (NumberFormatException invalid) {
                editor.remove(KeyboardThemeRuntime.KEY_BORDER_WIDTH);
            }
        }
        if (pendingKeySkin == null) {
            editor.remove(KeyboardThemeRuntime.KEY_KEY_SKIN);
        } else {
            editor.putString(KeyboardThemeRuntime.KEY_KEY_SKIN, pendingKeySkin);
        }
        editor.apply();
        Toast.makeText(this, "Theme saved", Toast.LENGTH_SHORT).show();
        renderPreview();
        finish();
    }

    private void resetValues() {
        prefs.edit()
            .putBoolean(KeyboardThemeRuntime.KEY_ENABLED, false)
            .putInt(KeyboardThemeRuntime.KEY_ACCENT, KeyboardThemeRuntime.DEFAULT_ACCENT)
            .putInt(KeyboardThemeRuntime.KEY_KEY_BG, KeyboardThemeRuntime.DEFAULT_KEY_BG)
            .putInt(KeyboardThemeRuntime.KEY_KEY_TEXT, KeyboardThemeRuntime.DEFAULT_KEY_TEXT)
            .putInt(KeyboardThemeRuntime.KEY_RADIUS, KeyboardThemeRuntime.DEFAULT_RADIUS)
            .remove(KeyboardThemeRuntime.KEY_FONT)
            .remove(KeyboardThemeRuntime.KEY_BOARD_BG)
            .remove(KeyboardThemeRuntime.KEY_MOD_BG)
            .remove(KeyboardThemeRuntime.KEY_MOD_TEXT)
            .remove(KeyboardThemeRuntime.KEY_ENTER_BG)
            .remove(KeyboardThemeRuntime.KEY_ENTER_TEXT)
            .remove(KeyboardThemeRuntime.KEY_PRESSED_BG)
            .remove(KeyboardThemeRuntime.KEY_BORDER_COLOR)
            .remove(KeyboardThemeRuntime.KEY_BORDER_WIDTH)
            .remove(KeyboardThemeRuntime.KEY_KEY_SKIN)
            .apply();
        pendingKeySkin = null;
        fontPath = null;
        previewTypeface = null;
        loadValues();
        renderPreview();
    }

    private void renderPreview() {
        int accent = colorOrDefault(accentField, KeyboardThemeRuntime.DEFAULT_ACCENT);
        int background = colorOrDefault(backgroundField, KeyboardThemeRuntime.DEFAULT_KEY_BG);
        int text = colorOrDefault(textField, KeyboardThemeRuntime.DEFAULT_KEY_TEXT);
        int radius = radiusSlider == null ? KeyboardThemeRuntime.DEFAULT_RADIUS : radiusSlider.getProgress();

        boolean on = enabledSwitch != null && enabledSwitch.isChecked();
        int shownBackground = on ? background : Color.parseColor("#3C4043");
        int shownText = on ? text : Color.WHITE;

        if (radiusLabel != null) {
            radiusLabel.setText("Corner radius: " + radius + "dp");
        }
        Integer border = parseColor(borderColorField);
        int strokeColor = border != null ? border : accent;
        int strokeWidth = 2;
        String widthText = borderWidthField == null
            ? "" : borderWidthField.getText().toString().trim();
        if (widthText.length() > 0) {
            try {
                strokeWidth = Math.max(0, Integer.parseInt(widthText));
            } catch (NumberFormatException invalid) {
                strokeWidth = 2;
            }
        }
        Integer board = parseColor(boardField);
        if (previewRow != null) {
            previewRow.setBackgroundColor(on && board != null ? board : Color.TRANSPARENT);
        }

        styleKey(previewQ, shownBackground, shownText, strokeColor, strokeWidth, radius, on);
        styleKey(previewW, shownBackground, shownText, strokeColor, strokeWidth, radius, on);
        styleKey(previewE, shownBackground, shownText, strokeColor, strokeWidth, radius, on);
    }

    private void styleKey(TextView key, int background, int text, int accent, int strokeWidth,
                         int radius, boolean on) {
        if (key == null) {
            return;
        }
        GradientDrawable shape = new GradientDrawable();
        shape.setColor(background);
        shape.setCornerRadius(dp(radius));
        if (on && strokeWidth > 0) {
            shape.setStroke(dp(strokeWidth), accent);
        }
        key.setBackgroundDrawable(shape);
        key.setTextColor(text);
        key.setTypeface(previewTypeface);
    }

    private void pickFontFile() {
        Intent intent = new Intent("android.intent.action.OPEN_DOCUMENT");
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("*/*");
        intent.putExtra("android.intent.extra.MIME_TYPES", new String[] {
            "font/ttf", "font/otf", "application/x-font-ttf", "application/x-font-otf",
            "application/x-font", "application/octet-stream"
        });
        try {
            startActivityForResult(intent, REQUEST_FONT);
        } catch (Throwable missingPicker) {
            Toast.makeText(this, "No file picker available", Toast.LENGTH_SHORT).show();
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (resultCode != RESULT_OK || data == null) {
            return;
        }
        if (requestCode == REQUEST_PACK) {
            importIconPack(data.getData());
            return;
        }
        if (requestCode == REQUEST_THEMES) {
            importThemeUris(data);
            return;
        }
        if (requestCode == REQUEST_TREE) {
            importThemeTree(data.getData());
            return;
        }
        if (requestCode == REQUEST_EXPORT) {
            writeThemeTo(data.getData());
            return;
        }
        if (requestCode != REQUEST_FONT) {
            return;
        }
        Uri uri = data.getData();
        if (uri == null) {
            return;
        }
        String copied = copyFontIntoAppStorage(uri);
        if (copied == null) {
            Toast.makeText(this, "Could not read that font", Toast.LENGTH_SHORT).show();
            return;
        }
        Typeface loaded = loadTypeface(copied);
        if (loaded == null) {
            Toast.makeText(this, "That file is not a usable font", Toast.LENGTH_SHORT).show();
            new File(copied).delete();
            return;
        }
        fontPath = copied;
        previewTypeface = loaded;
        updateFontLabel();
        renderPreview();
        Toast.makeText(this, "Font selected - tap Save & apply", Toast.LENGTH_SHORT).show();
    }

    /** Copies the picked document into app storage so Gboard can read it after a reboot. */
    private String copyFontIntoAppStorage(Uri uri) {
        String name = "keyfont.ttf";
        try {
            String display = uri.getLastPathSegment();
            if (display != null && display.toLowerCase().endsWith(".otf")) {
                name = "keyfont.otf";
            }
        } catch (Throwable ignored) {
        }
        File target = new File(getFilesDir(), name);
        new File(getFilesDir(), name.endsWith(".otf") ? "keyfont.ttf" : "keyfont.otf").delete();
        try {
            InputStream input = getContentResolver().openInputStream(uri);
            if (input == null) {
                return null;
            }
            try {
                OutputStream output = new FileOutputStream(target);
                try {
                    byte[] buffer = new byte[8192];
                    int read;
                    while ((read = input.read(buffer)) != -1) {
                        output.write(buffer, 0, read);
                    }
                } finally {
                    output.close();
                }
            } finally {
                input.close();
            }
            return target.getAbsolutePath();
        } catch (Throwable failed) {
            return null;
        }
    }

    private File themeDirectory() {
        File dir = new File(getFilesDir(), "themes");
        if (!dir.isDirectory()) {
            dir.mkdirs();
        }
        return dir;
    }

    private void pickThemeFiles() {
        Intent intent = new Intent("android.intent.action.OPEN_DOCUMENT");
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("*/*");
        intent.putExtra("android.intent.extra.ALLOW_MULTIPLE", true);
        intent.putExtra("android.intent.extra.MIME_TYPES", new String[] {
            "application/zip", "application/json", "application/octet-stream", "text/plain"
        });
        try {
            startActivityForResult(intent, REQUEST_THEMES);
        } catch (Throwable missingPicker) {
            Toast.makeText(this, "No file picker available", Toast.LENGTH_SHORT).show();
        }
    }

    private EditText addOptionalColorField(LinearLayout parent, String label, String hint) {
        EditText field = addColorField(parent, label, "");
        field.setHint(hint);
        field.setHintTextColor(Color.parseColor("#666666"));
        return field;
    }

    private static void setOptional(EditText field, String json, String key) {
        long value = jsonLong(json, key, -1L);
        field.setText(value >= 0 ? toHex((int) value) : "");
    }

    private static String loadOptional(SharedPreferences prefs, String key) {
        return prefs.contains(key) ? toHex(prefs.getInt(key, 0)) : "";
    }

    private static void putOptional(SharedPreferences.Editor editor, String key, EditText field) {
        String value = field.getText().toString().trim();
        if (value.length() == 0) {
            editor.remove(key);
        } else {
            Integer parsed = parseColor(field);
            if (parsed == null) {
                editor.remove(key);
            } else {
                editor.putInt(key, parsed);
            }
        }
    }

    private void promptForThemeName() {
        final EditText input = new EditText(this);
        input.setSingleLine(true);
        input.setTextColor(Color.BLACK);   // the dialog surface is light, so keep the name readable
        input.setHintTextColor(Color.GRAY);
        input.setHint("Theme name");
        new AlertDialog.Builder(this)
            .setTitle("Save theme")
            .setMessage("Saved themes appear in the list and are never overwritten.")
            .setView(input)
            .setPositiveButton("Save", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    saveThemeAsPreset(input.getText() == null ? "" : input.getText().toString());
                }
            })
            .setNegativeButton("Cancel", null)
            .show();
    }

    private void saveThemeAsPreset(String requested) {
        String name = requested == null ? "" : requested.trim();
        if (name.length() == 0) {
            name = "My theme";
        }
        File target = uniqueThemeFile(name);
        if (!writeText(target, buildThemeJson(name))) {
            Toast.makeText(this, "Could not save the theme", Toast.LENGTH_SHORT).show();
            return;
        }
        currentThemeName = name;
        prefs.edit().putString(KEY_THEME_NAME, name).apply();
        refreshThemeList();
        String shown = target.getName();
        if (shown.endsWith(".json")) {
            shown = shown.substring(0, shown.length() - 5);
        }
        Toast.makeText(this, "Saved as " + shown, Toast.LENGTH_SHORT).show();
    }

    /** Never overwrites: an existing name gets a "(2)", "(3)"… suffix instead. */
    private File uniqueThemeFile(String name) {
        String base = sanitizeFileName(name);
        File file = new File(themeDirectory(), base + ".wmtheme.json");
        int index = 2;
        while (file.exists()) {
            file = new File(themeDirectory(), base + " (" + index + ").wmtheme.json");
            index++;
        }
        return file;
    }

    private static String sanitizeFileName(String name) {
        StringBuilder cleaned = new StringBuilder();
        for (int i = 0; i < name.length(); i++) {
            char c = name.charAt(i);
            if (Character.isLetterOrDigit(c) || c == ' ' || c == '-' || c == '_') {
                cleaned.append(c);
            }
        }
        String result = cleaned.toString().trim();
        return result.length() == 0 ? "theme" : result;
    }

    /** File name for the exported scene, taken from the theme itself. */
    private String exportFileName() {
        String name = currentThemeName;
        if (name == null || name.trim().length() == 0) {
            name = "My theme";
        }
        return sanitizeFileName(name) + ".wmtheme.json";
    }

    private void exportTheme() {
        Intent intent = new Intent("android.intent.action.CREATE_DOCUMENT");
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("application/json");
        intent.putExtra("android.intent.extra.TITLE", exportFileName());
        try {
            startActivityForResult(intent, REQUEST_EXPORT);
        } catch (Throwable missingPicker) {
            Toast.makeText(this, "No file saver available", Toast.LENGTH_SHORT).show();
        }
    }

    private void writeThemeTo(Uri uri) {
        if (uri == null) {
            return;
        }
        String name = displayName(uri, exportFileName());
        int dot = name.indexOf('.');
        if (dot > 0) {
            name = name.substring(0, dot);
        }
        if (currentThemeName != null && currentThemeName.trim().length() > 0) {
            name = currentThemeName.trim();
        }
        try {
            OutputStream output = getContentResolver().openOutputStream(uri);
            if (output == null) {
                throw new java.io.IOException("no stream");
            }
            try {
                output.write(buildThemeJson(name).getBytes("UTF-8"));
            } finally {
                output.close();
            }
            Toast.makeText(this, "Exported " + name, Toast.LENGTH_SHORT).show();
        } catch (Throwable failed) {
            Toast.makeText(this, "Export failed", Toast.LENGTH_SHORT).show();
        }
    }

    /** Serialises the fields exactly the way a .wmtheme.json scene does. */
    private String buildThemeJson(String name) {
        StringBuilder json = new StringBuilder();
        json.append("{\n");
        json.append("  \"id\": \"studio_")
            .append(sanitizeFileName(name).toLowerCase().replace(' ', '_')).append("\",\n");
        json.append("  \"name\": \"").append(name.replace("\\", "")).append("\",\n");
        json.append("  \"studioSaved\": true,\n");
        appendColor(json, "accent", parseColor(accentField));
        appendColor(json, "keyBackground", parseColor(backgroundField));
        appendColor(json, "keyText", parseColor(textField));
        appendColor(json, "boardBackground", parseColor(boardField));
        appendColor(json, "modifierKeyBackground", parseColor(modifierBgField));
        appendColor(json, "modifierKeyText", parseColor(modifierTextField));
        appendColor(json, "enterKeyBackground", parseColor(enterBgField));
        appendColor(json, "enterKeyText", parseColor(enterTextField));
        appendColor(json, "pressedKeyBackground", parseColor(pressedField));
        appendColor(json, "keyBorderColor", parseColor(borderColorField));
        json.append("  \"keyCornerRadiusDp\": ").append(radiusSlider.getProgress()).append(",\n");
        String width = borderWidthField.getText().toString().trim();
        int strokeWidth = 2;
        if (width.length() > 0) {
            try {
                strokeWidth = Math.max(0, Integer.parseInt(width));
            } catch (NumberFormatException invalid) {
                strokeWidth = 2;
            }
        }
        json.append("  \"keyBorderWidthDp\": ").append(strokeWidth);
        // The painted faces are the scene, so the saved/exported file carries them verbatim;
        // without this the theme reloads as flat colours only.
        if (pendingKeySkin != null && pendingKeySkin.trim().length() > 0) {
            json.append(",\n  \"keySkin\": ").append(pendingKeySkin.trim());
        }
        json.append("\n}\n");
        return json.toString();
    }

    private static void appendColor(StringBuilder json, String key, Integer value) {
        if (value == null) {
            return;
        }
        json.append("  \"").append(key).append("\": ")
            .append(value & 0xFFFFFFFFL).append(",\n");
    }

    private static boolean writeText(File file, String text) {
        try {
            OutputStream output = new FileOutputStream(file);
            try {
                output.write(text.getBytes("UTF-8"));
            } finally {
                output.close();
            }
            return true;
        } catch (Throwable failed) {
            return false;
        }
    }

    private void pickThemeFolder() {
        Intent intent = new Intent("android.intent.action.OPEN_DOCUMENT_TREE");
        try {
            startActivityForResult(intent, REQUEST_TREE);
        } catch (Throwable missingPicker) {
            Toast.makeText(this, "No folder picker available", Toast.LENGTH_SHORT).show();
        }
    }

    /**
     * Copies every *.wmtheme.json below a picked folder. DocumentsContract is reached
     * reflectively because the build's android.jar predates it.
     */
    private void importThemeTree(Uri treeUri) {
        if (treeUri == null) {
            return;
        }
        int imported = 0;
        try {
            Class<?> documents = Class.forName("android.provider.DocumentsContract");
            java.lang.reflect.Method treeDocId = documents.getMethod("getTreeDocumentId", Uri.class);
            String rootId = (String) treeDocId.invoke(null, treeUri);
            imported = importThemeTreeChildren(treeUri, rootId, documents, 0);
        } catch (Throwable failed) {
            Toast.makeText(this, "Could not read that folder", Toast.LENGTH_SHORT).show();
        }
        refreshThemeList();
        Toast.makeText(this, imported == 0
            ? "No .wmtheme.json files found in that folder"
            : "Imported " + imported + " themes", Toast.LENGTH_SHORT).show();
    }

    private int importThemeTreeChildren(Uri treeUri, String documentId, Class<?> documents, int depth) {
        int imported = 0;
        if (documentId == null || depth > 2) {
            return 0;
        }
        try {
            java.lang.reflect.Method buildChildren = documents.getMethod(
                "buildChildDocumentsUriUsingTree", Uri.class, String.class);
            java.lang.reflect.Method buildDocument = documents.getMethod(
                "buildDocumentUriUsingTree", Uri.class, String.class);
            Uri children = (Uri) buildChildren.invoke(null, treeUri, documentId);
            android.database.Cursor cursor = getContentResolver().query(children, new String[] {
                "document_id", "_display_name", "mime_type"
            }, null, null, null);
            if (cursor == null) {
                return 0;
            }
            try {
                while (cursor.moveToNext()) {
                    String childId = cursor.getString(0);
                    String name = cursor.getString(1);
                    String mime = cursor.getString(2);
                    if ("vnd.android.document/directory".equals(mime)) {
                        imported += importThemeTreeChildren(treeUri, childId, documents, depth + 1);
                        continue;
                    }
                    if (name == null || !name.toLowerCase().endsWith(".json")) {
                        continue;
                    }
                    Uri document = (Uri) buildDocument.invoke(null, treeUri, childId);
                    if (copyInto(document, new File(themeDirectory(), name))) {
                        imported++;
                    }
                }
            } finally {
                cursor.close();
            }
        } catch (Throwable failed) {
        }
        return imported;
    }

    private void importThemeUris(Intent data) {
        List<Uri> uris = new ArrayList<Uri>();
        try {
            if (data.getClipData() != null) {
                int count = data.getClipData().getItemCount();
                for (int i = 0; i < count; i++) {
                    uris.add(data.getClipData().getItemAt(i).getUri());
                }
            } else if (data.getData() != null) {
                uris.add(data.getData());
            }
        } catch (Throwable ignored) {
        }
        int imported = 0;
        for (int i = 0; i < uris.size(); i++) {
            Uri uri = uris.get(i);
            String name = displayName(uri, "theme.json").toLowerCase();
            if (name.endsWith(".zip") || name.endsWith(".rar")) {
                if (name.endsWith(".rar")) {
                    Toast.makeText(this, "RAR is not supported - extract it first", Toast.LENGTH_LONG).show();
                    continue;
                }
                imported += importThemeZip(uri);
            } else {
                File target = new File(themeDirectory(), displayName(uri, "theme.wmtheme.json"));
                if (copyInto(uri, target)) {
                    imported++;
                }
            }
        }
        refreshThemeList();
        Toast.makeText(this, imported == 0
            ? "No .wmtheme.json files imported"
            : "Imported " + imported + " themes", Toast.LENGTH_SHORT).show();
    }

    private int importThemeZip(Uri uri) {
        int imported = 0;
        try {
            InputStream input = getContentResolver().openInputStream(uri);
            if (input == null) {
                return 0;
            }
            ZipInputStream zip = new ZipInputStream(input);
            try {
                ZipEntry entry = zip.getNextEntry();
                while (entry != null) {
                    String name = entry.getName();
                    if (!entry.isDirectory()
                        && name.toLowerCase().endsWith(".json")
                        && name.toLowerCase().contains("wmtheme")) {
                        String base = name.substring(name.lastIndexOf('/') + 1);
                        File target = new File(themeDirectory(), base);
                        OutputStream output = new FileOutputStream(target);
                        try {
                            byte[] buffer = new byte[8192];
                            int read;
                            while ((read = zip.read(buffer)) != -1) {
                                output.write(buffer, 0, read);
                            }
                        } finally {
                            output.close();
                        }
                        imported++;
                    }
                    entry = zip.getNextEntry();
                }
            } finally {
                zip.close();
                input.close();
            }
        } catch (Throwable failed) {
        }
        return imported;
    }

    private void refreshThemeList() {
        if (themeContainer == null) {
            return;
        }
        themeNames.clear();
        themeFiles.clear();
        themeContainer.removeAllViews();
        File[] files = themeDirectory().listFiles();
        if (files != null) {
            List<File> sorted = new ArrayList<File>();
            for (int i = 0; i < files.length; i++) {
                if (files[i].isFile() && files[i].getName().endsWith(".json")) {
                    sorted.add(files[i]);
                }
            }
            Collections.sort(sorted, new java.util.Comparator<File>() {
                @Override
                public int compare(File left, File right) {
                    boolean leftMine = isSavedHere(left);
                    boolean rightMine = isSavedHere(right);
                    if (leftMine != rightMine) {
                        return leftMine ? -1 : 1;
                    }
                    return left.getName().compareToIgnoreCase(right.getName());
                }
            });
            for (int i = 0; i < sorted.size(); i++) {
                final File file = sorted.get(i);
                String name = readThemeName(file);
                String suffix = fileNameSuffix(name, file);
                if (suffix.length() > 0) {
                    name = name + " " + suffix;
                }
                themeFiles.add(file);
                themeNames.add(name);

                TextView row = new TextView(this);
                row.setText(name);
                row.setTextColor(Color.WHITE);
                row.setTextSize(15f);
                row.setPadding(dp(8), dp(12), dp(8), dp(12));
                row.setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View v) {
                        applyPreset(file);
                    }
                });
                row.setOnLongClickListener(new View.OnLongClickListener() {
                    @Override
                    public boolean onLongClick(View v) {
                        showThemeActions(file);
                        return true;
                    }
                });
                themeContainer.addView(row);
            }
        }
    }

    /** "(2)" for the second save of a name, so duplicates stay distinguishable in the list. */
    private static String fileNameSuffix(String displayName, File file) {
        String stripped = file.getName();
        if (stripped.endsWith(".wmtheme.json")) {
            stripped = stripped.substring(0, stripped.length() - ".wmtheme.json".length());
        } else if (stripped.endsWith(".json")) {
            stripped = stripped.substring(0, stripped.length() - 5);
        }
        String base = sanitizeFileName(displayName);
        if (!stripped.startsWith(base) || stripped.equals(base)) {
            return "";
        }
        return stripped.substring(base.length()).trim();
    }

    /** Themes saved from this screen carry a marker and are listed first. */
    private static boolean isSavedHere(File file) {
        try {
            return readText(file).contains(SAVED_MARKER);
        } catch (Throwable ignored) {
            return false;
        }
    }

    private String readThemeName(File file) {
        try {
            String name = jsonString(readText(file), "name");
            if (name != null && name.length() > 0) {
                return name;
            }
        } catch (Throwable ignored) {
        }
        String fileName = file.getName();
        return fileName.endsWith(".json") ? fileName.substring(0, fileName.length() - 5) : fileName;
    }

    /** Loads the flat colours and radius a .wmtheme.json scene defines into the editable fields. */
    private void applyPreset(File file) {
        try {
            String json = readText(file);
            long accent = jsonLong(json, "accent", -1L);
            long background = jsonLong(json, "keyBackground", -1L);
            long text = jsonLong(json, "keyText", -1L);
            long radius = jsonLong(json, "keyCornerRadiusDp", -1L);
            setOptional(boardField, json, "boardBackground");
            setOptional(modifierBgField, json, "modifierKeyBackground");
            setOptional(modifierTextField, json, "modifierKeyText");
            setOptional(enterBgField, json, "enterKeyBackground");
            setOptional(enterTextField, json, "enterKeyText");
            setOptional(pressedField, json, "pressedKeyBackground");
            setOptional(borderColorField, json, "keyBorderColor");
            pendingKeySkin = extractJsonObject(json, "keySkin");
            long strokeWidth = jsonLong(json, "keyBorderWidthDp", -1L);
            if (strokeWidth >= 0) {
                borderWidthField.setText(String.valueOf(strokeWidth));
            } else {
                borderWidthField.setText("");
            }
            if (accent >= 0) {
                accentField.setText(toHex((int) accent));
            }
            if (background >= 0) {
                backgroundField.setText(toHex((int) background));
            }
            if (text >= 0) {
                textField.setText(toHex((int) text));
            }
            if (radius >= 0) {
                radiusSlider.setProgress((int) Math.max(0L, Math.min(32L, radius)));
            }
            currentThemeName = readThemeName(file);
            prefs.edit().putString(KEY_THEME_NAME, readThemeName(file)).apply();
            renderPreview();
            Toast.makeText(this, "Loaded " + readThemeName(file) + " - tap Save & apply",
                Toast.LENGTH_SHORT).show();
        } catch (Throwable failed) {
            Toast.makeText(this, "Could not read that theme", Toast.LENGTH_SHORT).show();
        }
    }

    /** Long-press menu on a theme row: continue editing it, rename it, or delete it. */
    private void showThemeActions(final File file) {
        final String name = readThemeName(file);
        new AlertDialog.Builder(this)
            .setTitle(name)
            .setItems(new String[] {"Edit in builder", "Rename", "Delete"},
                new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        if (which == 0) {
                            applyPreset(file);
                        } else if (which == 1) {
                            promptRename(file, name);
                        } else {
                            confirmDelete(file, name);
                        }
                    }
                })
            .show();
    }

    private void promptRename(final File file, String current) {
        final EditText input = new EditText(this);
        input.setSingleLine(true);
        input.setTextColor(Color.BLACK);
        input.setHintTextColor(Color.GRAY);
        input.setText(current == null ? "" : current);
        new AlertDialog.Builder(this)
            .setTitle("Rename theme")
            .setView(input)
            .setPositiveButton("Rename", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    renameTheme(file, input.getText() == null ? "" : input.getText().toString());
                }
            })
            .setNegativeButton("Cancel", null)
            .show();
    }

    /** Renames the scene and its file; an existing name gets a suffix instead of being replaced. */
    private void renameTheme(File file, String requested) {
        String name = requested == null ? "" : requested.trim();
        if (name.length() == 0) {
            Toast.makeText(this, "Name cannot be empty", Toast.LENGTH_SHORT).show();
            return;
        }
        String oldName = readThemeName(file);
        String json = readText(file);
        String updated = replaceJsonString(json, "name", name);
        String newBase = sanitizeFileName(name);
        File target = newBase.equals(sanitizeFileName(oldName)) ? file : uniqueThemeFile(name);
        if (!writeText(target, updated)) {
            Toast.makeText(this, "Could not rename the theme", Toast.LENGTH_SHORT).show();
            return;
        }
        if (!target.equals(file)) {
            file.delete();
        }
        if (oldName.equals(currentThemeName)) {
            currentThemeName = name;
            prefs.edit().putString(KEY_THEME_NAME, name).apply();
        }
        refreshThemeList();
        Toast.makeText(this, "Renamed to " + readThemeName(target), Toast.LENGTH_SHORT).show();
    }

    private void confirmDelete(final File file, final String name) {
        new AlertDialog.Builder(this)
            .setTitle("Delete theme")
            .setMessage("\"" + name + "\" will be removed for good.")
            .setPositiveButton("Delete", new DialogInterface.OnClickListener() {
                @Override
                public void onClick(DialogInterface dialog, int which) {
                    if (file.delete()) {
                        if (name.equals(currentThemeName)) {
                            currentThemeName = null;
                            prefs.edit().remove(KEY_THEME_NAME).apply();
                        }
                        refreshThemeList();
                        Toast.makeText(KeyboardThemeStudioActivity.this,
                            "Deleted " + name, Toast.LENGTH_SHORT).show();
                    } else {
                        Toast.makeText(KeyboardThemeStudioActivity.this,
                            "Could not delete that theme", Toast.LENGTH_SHORT).show();
                    }
                }
            })
            .setNegativeButton("Cancel", null)
            .show();
    }

    /** Replaces the textual value of one top-level key, leaving nested data untouched. */
    static String replaceJsonString(String json, String key, String value) {
        int at = json.indexOf("\"" + key + "\"");
        if (at < 0) {
            return json;
        }
        int colon = json.indexOf(':', at);
        if (colon < 0) {
            return json;
        }
        int quote = json.indexOf("\"", colon + 1);
        if (quote < 0) {
            return json;
        }
        int end = quote + 1;
        boolean escaped = false;
        while (end < json.length()) {
            char c = json.charAt(end);
            if (escaped) {
                escaped = false;
            } else if (c == '\\') {
                escaped = true;
            } else if (c == '"') {
                break;
            }
            end++;
        }
        if (end >= json.length()) {
            return json;
        }
        String clean = value.replace("\\", "").replace("\"", "");
        return json.substring(0, quote + 1) + clean + json.substring(end);
    }

    /** Cuts a nested object value (here "keySkin") out of the scene, braces and strings intact. */
    static String extractJsonObject(String json, String key) {
        int at = json.indexOf("\"" + key + "\"");
        if (at < 0) {
            return null;
        }
        int open = json.indexOf('{', at);
        if (open < 0) {
            return null;
        }
        int depth = 0;
        boolean inString = false;
        boolean escaped = false;
        for (int i = open; i < json.length(); i++) {
            char c = json.charAt(i);
            if (inString) {
                if (escaped) {
                    escaped = false;
                } else if (c == '\\') {
                    escaped = true;
                } else if (c == '"') {
                    inString = false;
                }
                continue;
            }
            if (c == '"') {
                inString = true;
            } else if (c == '{') {
                depth++;
            } else if (c == '}') {
                depth--;
                if (depth == 0) {
                    return json.substring(open, i + 1);
                }
            }
        }
        return null;
    }

    /** Minimal JSON field readers: the build's android.jar predates org.json. */
    private static String jsonString(String json, String key) {
        try {
            int at = json.indexOf("\"" + key + "\"");
            if (at < 0) {
                return null;
            }
            int colon = json.indexOf(':', at);
            if (colon < 0) {
                return null;
            }
            int quote = json.indexOf('"', colon + 1);
            if (quote < 0) {
                return null;
            }
            int end = quote + 1;
            while (end < json.length()) {
                char c = json.charAt(end);
                if (c == 92) {
                    end += 2;
                    continue;
                }
                if (c == '"') {
                    break;
                }
                end++;
            }
            return json.substring(quote + 1, Math.min(end, json.length()));
        } catch (Throwable failed) {
            return null;
        }
    }

    private static long jsonLong(String json, String key, long fallback) {
        try {
            int at = json.indexOf("\"" + key + "\"");
            if (at < 0) {
                return fallback;
            }
            int colon = json.indexOf(':', at);
            if (colon < 0) {
                return fallback;
            }
            int index = colon + 1;
            while (index < json.length() && Character.isWhitespace(json.charAt(index))) {
                index++;
            }
            int start = index;
            if (index < json.length() && (json.charAt(index) == '-' || json.charAt(index) == '+')) {
                index++;
            }
            int digits = index;
            while (index < json.length() && Character.isDigit(json.charAt(index))) {
                index++;
            }
            if (index == digits) {
                return fallback;
            }
            return Long.parseLong(json.substring(start, index));
        } catch (Throwable failed) {
            return fallback;
        }
    }

    private static String readText(File file) {
        try {
            InputStream input = new java.io.FileInputStream(file);
            try {
                java.io.ByteArrayOutputStream out = new java.io.ByteArrayOutputStream();
                byte[] buffer = new byte[8192];
                int read;
                while ((read = input.read(buffer)) != -1) {
                    out.write(buffer, 0, read);
                }
                return out.toString("UTF-8");
            } finally {
                input.close();
            }
        } catch (Throwable failed) {
            return "";
        }
    }

    private void pickIconPack() {
        Intent intent = new Intent("android.intent.action.OPEN_DOCUMENT");
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("*/*");
        intent.putExtra("android.intent.extra.MIME_TYPES", new String[] {
            "application/zip", "application/x-zip-compressed", "application/octet-stream"
        });
        try {
            startActivityForResult(intent, REQUEST_PACK);
        } catch (Throwable missingPicker) {
            Toast.makeText(this, "No file picker available", Toast.LENGTH_SHORT).show();
        }
    }

    private void importIconPack(Uri uri) {
        if (uri == null) {
            return;
        }
        File directory = KeyboardIconPackRuntime.packDirectory(this);
        if (!directory.isDirectory() && !directory.mkdirs()) {
            Toast.makeText(this, "Cannot create pack folder", Toast.LENGTH_SHORT).show();
            return;
        }
        File target = KeyboardIconPackRuntime.activePackFile(this);
        if (!copyInto(uri, target)) {
            Toast.makeText(this, "Could not read that pack", Toast.LENGTH_SHORT).show();
            return;
        }
        String name = displayName(uri, "pack.wmicons.zip");
        writeActivePackName(name);
        KeyboardIconPackRuntime.reload();
        int icons = KeyboardIconPackRuntime.iconCount(this);
        if (icons == 0) {
            target.delete();
            new File(directory, KeyboardIconPackRuntime.ACTIVE_NAME_FILE).delete();
            KeyboardIconPackRuntime.reload();
            updatePackLabel();
            Toast.makeText(this, "No icons/*.png entries in that pack", Toast.LENGTH_LONG).show();
            return;
        }
        updatePackLabel();
        Toast.makeText(this, "Applied " + icons + " icons", Toast.LENGTH_SHORT).show();
    }

    private void clearIconPack() {
        KeyboardIconPackRuntime.activePackFile(this).delete();
        new File(KeyboardIconPackRuntime.packDirectory(this),
            KeyboardIconPackRuntime.ACTIVE_NAME_FILE).delete();
        KeyboardIconPackRuntime.reload();
        updatePackLabel();
        Toast.makeText(this, "Icon pack removed", Toast.LENGTH_SHORT).show();
    }

    private void writeActivePackName(String name) {
        try {
            OutputStream out = new FileOutputStream(new File(
                KeyboardIconPackRuntime.packDirectory(this),
                KeyboardIconPackRuntime.ACTIVE_NAME_FILE));
            try {
                out.write(name.getBytes("UTF-8"));
            } finally {
                out.close();
            }
        } catch (Throwable ignored) {
        }
    }

    private boolean copyInto(Uri uri, File target) {
        try {
            InputStream input = getContentResolver().openInputStream(uri);
            if (input == null) {
                return false;
            }
            try {
                OutputStream output = new FileOutputStream(target);
                try {
                    byte[] buffer = new byte[8192];
                    int read;
                    while ((read = input.read(buffer)) != -1) {
                        output.write(buffer, 0, read);
                    }
                } finally {
                    output.close();
                }
            } finally {
                input.close();
            }
            return true;
        } catch (Throwable failed) {
            return false;
        }
    }

    private static String displayName(Uri uri, String fallback) {
        try {
            String last = uri.getLastPathSegment();
            if (last != null && last.length() > 0) {
                int slash = last.lastIndexOf('/');
                return slash >= 0 ? last.substring(slash + 1) : last;
            }
        } catch (Throwable ignored) {
        }
        return fallback;
    }

    private void updatePackLabel() {
        if (packLabel == null) {
            return;
        }
        File active = KeyboardIconPackRuntime.activePackFile(this);
        if (!active.isFile()) {
            packLabel.setText("No icon pack imported");
            return;
        }
        KeyboardIconPackRuntime.reload();
        String name = KeyboardIconPackRuntime.activePackName(this);
        int icons = KeyboardIconPackRuntime.iconCount(this);
        packLabel.setText("Using " + name + " (" + icons + " icons)");
    }

    private void updateFontLabel() {
        if (fontLabel == null) {
            return;
        }
        if (fontPath == null) {
            fontLabel.setText("Using Gboard's font");
            return;
        }
        fontLabel.setText("Using " + new File(fontPath).getName());
    }

    private static Typeface loadTypeface(String path) {
        if (path == null || path.length() == 0) {
            return null;
        }
        try {
            File file = new File(path);
            if (!file.isFile()) {
                return null;
            }
            return Typeface.createFromFile(file);
        } catch (Throwable ignored) {
            return null;
        }
    }

    private int colorOrDefault(EditText field, int fallback) {
        Integer parsed = parseColor(field);
        return parsed == null ? fallback : parsed;
    }

    private static Integer parseColor(EditText field) {
        if (field == null) {
            return null;
        }
        String value = field.getText().toString().trim();
        if (!value.startsWith("#")) {
            return null;
        }
        try {
            long parsed = Long.parseLong(value.substring(1), 16);
            if (value.length() == 7) {
                return (int) (0xFF000000L | parsed);
            }
            if (value.length() == 9) {
                return (int) parsed;
            }
            return null;
        } catch (NumberFormatException invalid) {
            return null;
        }
    }

    private static String toHex(int color) {
        return String.format("#%08X", color);
    }

    private int dp(int value) {
        return Math.round(value * getResources().getDisplayMetrics().density);
    }
}
