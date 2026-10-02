package io.github.bakwudo.uyu.extension.settings;

import android.app.Fragment;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Handler;
import android.os.Looper;
import android.preference.Preference;
import android.widget.Toast;

import java.util.List;

import io.github.bakwudo.uyu.extension.Utils;
import io.github.bakwudo.uyu.extension.danmaku.DanmakuFonts;

/**
 * The danmaku font: a system font, or a TTF / OTF file the user imports with the file picker.
 */
@SuppressWarnings("deprecation")
public final class FontPreference extends Preference {
    /** Request code for the file picker, passed back to {@link #onActivityResult}. */
    public static final int REQUEST_IMPORT_FONT = 0x7579;

    private final Fragment fragment;
    private final StringSetting setting;

    public FontPreference(Context context, Fragment fragment, StringSetting setting) {
        super(context);
        this.fragment = fragment;
        this.setting = setting;
        setKey(setting.key);
        setPersistent(true);
        setDefaultValue(setting.defaultValue);
    }

    @Override
    protected void onSetInitialValue(boolean restorePersistedValue, Object defaultValue) {
        setSummary(DanmakuFonts.label(setting.get()));
    }

    @Override
    protected void onClick() {
        Context context = getContext();
        List<DanmakuFonts.Choice> choices = DanmakuFonts.choices(context);
        String current = setting.get();

        CharSequence[] labels = new CharSequence[choices.size() + 1];
        int checked = -1;
        for (int i = 0; i < choices.size(); i++) {
            labels[i] = choices.get(i).label;
            if (choices.get(i).value.equals(current)) checked = i;
        }
        labels[choices.size()] = "Import a font file (TTF / OTF)…";

        SettingsUi.dialog(context)
                .setTitle(getTitle())
                .setSingleChoiceItems(labels, checked, (dialog, which) -> {
                    dialog.dismiss();
                    if (which < choices.size()) {
                        setValue(choices.get(which).value);
                    } else {
                        pickFontFile();
                    }
                })
                .setNegativeButton(android.R.string.cancel, null)
                .show();
    }

    private void pickFontFile() {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT)
                .addCategory(Intent.CATEGORY_OPENABLE)
                // Font files often have no font MIME type, so any file can be picked and is
                // checked after it is copied.
                .setType("*/*");
        try {
            fragment.startActivityForResult(intent, REQUEST_IMPORT_FONT);
        } catch (Exception ex) {
            Utils.logError("Failed to open the file picker", ex);
            Toast.makeText(getContext(), "No file picker available", Toast.LENGTH_SHORT).show();
        }
    }

    /**
     * Called by the settings screen with the result of the file picker.
     */
    public void onActivityResult(int resultCode, Intent data) {
        Uri uri = data == null ? null : data.getData();
        if (resultCode != android.app.Activity.RESULT_OK || uri == null) return;

        Context context = getContext().getApplicationContext();
        new Thread(() -> {
            String value = null;
            try {
                value = DanmakuFonts.importFont(context, uri);
            } catch (Exception ex) {
                Utils.logError("Failed to import font " + uri, ex);
            }
            String imported = value;
            new Handler(Looper.getMainLooper()).post(() -> {
                if (imported == null) {
                    Toast.makeText(context, "Not a font file Android can use", Toast.LENGTH_SHORT).show();
                } else if (fragment.isAdded()) {
                    setValue(imported);
                } else {
                    setting.save(imported);
                }
            });
        }, "uyu-font-import").start();
    }

    private void setValue(String value) {
        if (!callChangeListener(value)) return;
        persistString(value);
        setSummary(DanmakuFonts.label(value));
    }
}
