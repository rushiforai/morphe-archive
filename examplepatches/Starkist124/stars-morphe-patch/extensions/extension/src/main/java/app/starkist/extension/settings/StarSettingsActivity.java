package app.starkist.extension.settings;

import android.app.ActionBar;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Typeface;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.provider.OpenableColumns;
import android.util.Log;
import android.util.TypedValue;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.LinearLayout;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.ScrollView;
import android.widget.SeekBar;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Locale;

import app.starkist.extension.settings.StarSettings.FontChoice;

/**
 * The Star settings screen. Built entirely in code, so it needs no resources
 * from the patched app. Declared in the app's manifest by the settings patch.
 */
@SuppressWarnings({"unused", "deprecation"})
public final class StarSettingsActivity extends Activity {

    private static final String TAG = "StarSettings";
    private static final int REQUEST_PICK_FONT = 1;
    private static final String PREVIEW_TEXT =
            "The quick brown fox jumps over the lazy dog. 0123456789";

    private TextView previewText;
    private TextView textSizeLabel;
    private RadioGroup fontGroup;
    private RadioButton customFontButton;
    /** True while [refresh] updates views, so listeners ignore those changes. */
    private boolean refreshing;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        setTheme(Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q
                ? android.R.style.Theme_DeviceDefault_DayNight
                : android.R.style.Theme_DeviceDefault);
        super.onCreate(savedInstanceState);
        setTitle(StarSettings.TITLE);

        ActionBar actionBar = getActionBar();
        if (actionBar != null) actionBar.setDisplayHomeAsUpEnabled(true);

        setContentView(buildContent());
        refresh();
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        if (item.getItemId() == android.R.id.home) {
            finish();
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    // region Layout

    private View buildContent() {
        LinearLayout root = new LinearLayout(this);
        root.setOrientation(LinearLayout.VERTICAL);
        int padding = dp(16);
        root.setPadding(padding, padding, padding, padding);

        root.addView(sectionHeader("Font and text size"));

        previewText = new TextView(this);
        previewText.setText(PREVIEW_TEXT);
        previewText.setPadding(0, dp(8), 0, dp(16));
        root.addView(previewText);

        // Text size.
        textSizeLabel = new TextView(this);
        textSizeLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        root.addView(textSizeLabel);

        SeekBar textSizeBar = new SeekBar(this);
        textSizeBar.setMax((StarSettings.TEXT_ZOOM_MAX - StarSettings.TEXT_ZOOM_MIN) / StarSettings.TEXT_ZOOM_STEP);
        textSizeBar.setProgress((StarSettings.getTextZoom(this) - StarSettings.TEXT_ZOOM_MIN) / StarSettings.TEXT_ZOOM_STEP);
        textSizeBar.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if (!fromUser) return;
                StarSettings.setTextZoom(StarSettingsActivity.this,
                        StarSettings.TEXT_ZOOM_MIN + progress * StarSettings.TEXT_ZOOM_STEP);
                refresh();
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
            }
        });
        textSizeBar.setPadding(dp(8), dp(12), dp(8), dp(24));
        root.addView(textSizeBar);

        // Font.
        TextView fontLabel = new TextView(this);
        fontLabel.setText("Font");
        fontLabel.setTextSize(TypedValue.COMPLEX_UNIT_SP, 16);
        root.addView(fontLabel);

        fontGroup = new RadioGroup(this);
        for (FontChoice choice : FontChoice.values()) {
            RadioButton button = new RadioButton(this);
            button.setId(View.generateViewId());
            button.setTag(choice);
            button.setText(choice.label);
            button.setPadding(dp(8), dp(10), 0, dp(10));
            if (choice == FontChoice.CUSTOM) customFontButton = button;
            fontGroup.addView(button);
        }
        fontGroup.setOnCheckedChangeListener((group, checkedId) -> {
            if (refreshing) return;
            RadioButton checked = group.findViewById(checkedId);
            if (checked == null) return;
            FontChoice choice = (FontChoice) checked.getTag();
            if (choice == FontChoice.CUSTOM && StarSettings.getCustomFontName(this) == null) {
                // No font file yet: ask for one first.
                pickFontFile();
                refresh();
                return;
            }
            StarSettings.setFont(this, choice);
            refresh();
        });
        root.addView(fontGroup);

        Button pickButton = new Button(this);
        pickButton.setText("Choose font file (.ttf / .otf)");
        pickButton.setOnClickListener(v -> pickFontFile());
        root.addView(pickButton);

        Button resetButton = new Button(this);
        resetButton.setText("Reset to app defaults");
        resetButton.setOnClickListener(v -> {
            StarSettings.resetAll(this);
            textSizeBar.setProgress((StarSettings.TEXT_ZOOM_DEFAULT - StarSettings.TEXT_ZOOM_MIN) / StarSettings.TEXT_ZOOM_STEP);
            refresh();
        });
        root.addView(resetButton);

        // Loaded fonts and text size stay in memory until the app restarts.
        Button restartButton = new Button(this);
        restartButton.setText("Restart app to apply");
        restartButton.setOnClickListener(v -> restartApp());
        root.addView(restartButton);

        TextView note = new TextView(this);
        note.setText("Changes apply to the whole app after it restarts. "
                + "100% is the app's normal text size.");
        note.setAlpha(0.7f);
        note.setPadding(0, dp(16), 0, 0);
        root.addView(note);

        ScrollView scrollView = new ScrollView(this);
        scrollView.addView(root);
        return scrollView;
    }

    private TextView sectionHeader(String text) {
        TextView header = new TextView(this);
        header.setText(text);
        header.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20);
        header.setTypeface(Typeface.DEFAULT_BOLD);
        header.setPadding(0, 0, 0, dp(8));
        return header;
    }

    /** Updates every view to match the stored settings. */
    private void refresh() {
        int zoom = StarSettings.getTextZoom(this);
        textSizeLabel.setText(String.format(Locale.US, "Text size: %d%%", zoom));

        FontChoice font = StarSettings.getFont(this);
        refreshing = true;
        for (int i = 0; i < fontGroup.getChildCount(); i++) {
            RadioButton button = (RadioButton) fontGroup.getChildAt(i);
            if (button.getTag() == font) fontGroup.check(button.getId());
        }
        refreshing = false;

        String customName = StarSettings.getCustomFontName(this);
        customFontButton.setText(customName == null
                ? FontChoice.CUSTOM.label + " (choose a file below)"
                : FontChoice.CUSTOM.label + ": " + customName);

        // The article body is 20px in the app's stylesheet.
        previewText.setTextSize(TypedValue.COMPLEX_UNIT_SP, 20f * zoom / 100f);
        previewText.setTypeface(previewTypeface(font));
    }

    private Typeface previewTypeface(FontChoice font) {
        try {
            switch (font) {
                case GRAPHIK:
                    return Typeface.createFromAsset(getAssets(), "Graphik-Regular.ttf");
                case SERIF:
                    return Typeface.SERIF;
                case SANS_SERIF:
                    return Typeface.SANS_SERIF;
                case MONOSPACE:
                    return Typeface.MONOSPACE;
                case CUSTOM:
                    return Typeface.createFromFile(StarSettings.getCustomFontFile(this));
                default:
                    return Typeface.createFromAsset(getAssets(), "TNYAdobeCaslonPro-Regular.otf");
            }
        } catch (Exception e) {
            Log.w(TAG, "Could not load preview font", e);
            return Typeface.DEFAULT;
        }
    }

    // endregion

    // region Font file picking

    private void pickFontFile() {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        // Font files are often reported with generic types, so accept anything
        // and check the file extension afterwards.
        intent.setType("*/*");
        try {
            startActivityForResult(intent, REQUEST_PICK_FONT);
        } catch (Exception e) {
            Log.e(TAG, "No file picker available", e);
            toast("No file picker available");
        }
    }

    @Override
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        if (requestCode != REQUEST_PICK_FONT || resultCode != RESULT_OK || data == null || data.getData() == null) {
            return;
        }

        Uri uri = data.getData();
        String name = displayName(uri);
        String lower = name.toLowerCase(Locale.ROOT);
        if (!lower.endsWith(".ttf") && !lower.endsWith(".otf")) {
            toast("Please choose a .ttf or .otf font file");
            return;
        }

        Context appContext = getApplicationContext();
        new Thread(() -> {
            boolean copied = copyToCustomFontFile(appContext, uri);
            runOnUiThread(() -> {
                if (!copied) {
                    toast("Could not read that font file");
                    return;
                }
                StarSettings.setCustomFontName(appContext, name);
                StarSettings.setFont(appContext, FontChoice.CUSTOM);
                toast("Font set to " + name);
                if (!isFinishing()) refresh();
            });
        }).start();
    }

    private String displayName(Uri uri) {
        try (Cursor cursor = getContentResolver().query(uri,
                new String[]{OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            if (cursor != null && cursor.moveToFirst()) {
                String name = cursor.getString(0);
                if (name != null) return name;
            }
        } catch (Exception e) {
            Log.w(TAG, "Could not read file name", e);
        }
        String last = uri.getLastPathSegment();
        return last != null ? last : "font";
    }

    private static boolean copyToCustomFontFile(Context context, Uri uri) {
        File target = StarSettings.getCustomFontFile(context);
        File temp = new File(target.getParentFile(), "custom_font.tmp");
        //noinspection ResultOfMethodCallIgnored
        target.getParentFile().mkdirs();

        try (InputStream in = context.getContentResolver().openInputStream(uri);
             OutputStream out = new FileOutputStream(temp)) {
            if (in == null) return false;
            byte[] buffer = new byte[64 * 1024];
            int read;
            while ((read = in.read(buffer)) != -1) {
                out.write(buffer, 0, read);
            }
        } catch (Exception e) {
            Log.e(TAG, "Could not copy font file", e);
            //noinspection ResultOfMethodCallIgnored
            temp.delete();
            return false;
        }

        //noinspection ResultOfMethodCallIgnored
        target.delete();
        return temp.renameTo(target);
    }

    // endregion

    /** Relaunches the app in a fresh process so every screen picks up the new settings. */
    private void restartApp() {
        Intent launch = getPackageManager().getLaunchIntentForPackage(getPackageName());
        if (launch == null || launch.getComponent() == null) {
            toast("Please close and reopen the app");
            return;
        }
        startActivity(Intent.makeRestartActivityTask(launch.getComponent()));
        Runtime.getRuntime().exit(0);
    }

    private int dp(int value) {
        return Math.round(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value,
                getResources().getDisplayMetrics()));
    }

    private void toast(String message) {
        Toast.makeText(this, message, Toast.LENGTH_SHORT).show();
    }
}
