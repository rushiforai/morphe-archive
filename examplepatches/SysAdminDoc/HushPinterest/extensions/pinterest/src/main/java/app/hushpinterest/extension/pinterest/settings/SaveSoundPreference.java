/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.hushpinterest.extension.pinterest.settings;

import android.app.Activity;
import android.app.AlertDialog;
import android.content.ActivityNotFoundException;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.preference.Preference;
import android.provider.OpenableColumns;
import android.view.View;
import android.widget.Button;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import app.hushpinterest.extension.pinterest.ui.SaveSound;
import app.hushpinterest.extension.shared.L10n;
import app.hushpinterest.extension.shared.Logger;
import app.hushpinterest.extension.shared.Utils;
import app.hushpinterest.extension.shared.settings.Setting;

/**
 * Pick a save sound (#41): opens Android's file picker for a sound, and Custom save sound plays it
 * when a pin is saved. Once one is picked, a tap offers another sound or Pinterest's own again.
 *
 * <p>The picker answers through the page's onActivityResult, like Pick a download folder. The
 * picker hands over a lasting grant to read the file, which is kept so the sound still plays after
 * Pinterest restarts, and given back when the file is replaced or forgotten.
 */
@SuppressWarnings("deprecation") // Framework preferences are what the shared settings page builds on.
public final class SaveSoundPreference extends Preference {
    static final int PICK = 7315;

    /** The rows on the page right now, so a picked sound shows at once. */
    private static final List<WeakReference<SaveSoundPreference>> ROWS = new CopyOnWriteArrayList<>();

    @Nullable private static SharedPreferences observedStore;
    private static final SharedPreferences.OnSharedPreferenceChangeListener LISTENER = (store, key) -> {
        if (key == null || key.equals(SaveSound.PICKED.key) || key.equals(SaveSound.NAME.key)
                || key.equals(Settings.CUSTOM_SAVE_SOUND.key)) {
            Utils.runOnMainThread(SaveSoundPreference::refreshRows);
        }
    };

    private final HushPinterestPreferenceFragment page;

    SaveSoundPreference(HushPinterestPreferenceFragment page, Context context) {
        super(HushPinterestPreferenceFragment.themed(context));
        this.page = page;
        setKey("action_save_sound");
        setPersistent(false);
        setTitle(L10n.t(context, "Pick a save sound"));
        setOnPreferenceClickListener(preference -> {
            tapped();
            return true;
        });
        ROWS.add(new WeakReference<>(this));
        observe();
    }

    @Override public CharSequence getSummary() {
        return summary();
    }

    @Override protected void onBindView(View view) {
        super.onBindView(view);
        HushPinterestPreferenceFragment.showAllText(view);
        ScreenColors.row(view, this);
        view.setAccessibilityDelegate(new HushPinterestPreferenceFragment.RowSemantics(this, Button.class));
    }

    /** What the row says: no sound yet, the sound in use, or a sound waiting for its switch. */
    static String summary() {
        if (SaveSound.picked() == null) {
            return L10n.t("Pick a sound file for Custom save sound to play when you save a pin.");
        }
        String name = SaveSound.name();
        if (!Settings.CUSTOM_SAVE_SOUND.savedValue()) {
            return name == null ? L10n.t("A sound is picked, but Custom save sound is off, so Pinterest's sound plays.")
                    : L10n.f("%s is picked, but Custom save sound is off, so Pinterest's sound plays.", name);
        }
        return name == null ? L10n.t("Saving a pin plays the sound you picked. Tap to pick another sound or use Pinterest's again.")
                : L10n.f("Saving a pin plays %s. Tap to pick another sound or use Pinterest's again.", name);
    }

    private void tapped() {
        if (SaveSound.picked() == null) {
            pick(page);
            return;
        }
        try {
            AlertDialog dialog = new AlertDialog.Builder(HushPinterestPreferenceFragment.themed(getContext()))
                    .setTitle(getTitle())
                    .setAdapter(new ChoiceCards(ScreenColors.DEFAULT,
                            new CharSequence[]{L10n.t("Pick another sound"), L10n.t("Use Pinterest's sound again")},
                            new CharSequence[]{"", ""}, new boolean[]{true, false}), (shown, which) -> {
                        if (which == 0) pick(page);
                        else forget(appContext(page));
                    })
                    .setNegativeButton(L10n.t("Cancel"), null)
                    .create();
            dialog.create();
            dialog.getListView().setDivider(null);
            dialog.getListView().setSelector(new ColorDrawable(Color.TRANSPARENT));
            ScreenColors.dialog(dialog);
            dialog.show();
        } catch (RuntimeException failure) {
            Logger.printInfo(() -> "Could not show the sound choices: " + failure.getClass().getSimpleName());
            pick(page);
        }
    }

    /** Opens Android's file picker for a sound file. */
    static void pick(HushPinterestPreferenceFragment page) {
        Intent intent = new Intent(Intent.ACTION_OPEN_DOCUMENT);
        intent.addCategory(Intent.CATEGORY_OPENABLE);
        intent.setType("audio/*");
        intent.addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION | Intent.FLAG_GRANT_PERSISTABLE_URI_PERMISSION);
        try {
            page.startActivityForResult(intent, PICK);
        } catch (ActivityNotFoundException missing) {
            Logger.printInfo(() -> "No file picker");
            Utils.showToastLong(L10n.t("This phone has no file picker, so a file can't be chosen."));
        } catch (RuntimeException error) {
            Logger.printInfo(() -> "Could not open the file picker: " + error.getClass().getSimpleName());
            Utils.showToastLong(L10n.t("Couldn't open the file picker. Try again."));
        }
    }

    /**
     * The file picker's answer, from the page's onActivityResult.
     *
     * @return whether the request was this row's.
     */
    static boolean onResult(HushPinterestPreferenceFragment page, int request, int result, @Nullable Intent data) {
        if (request != PICK) return false;
        Uri sound = result == Activity.RESULT_OK && data != null ? data.getData() : null;
        if (sound == null) return true; // Cancelled: nothing changes.
        Context context = appContext(page);
        ContentResolver resolver = context.getContentResolver();
        try {
            resolver.takePersistableUriPermission(sound, Intent.FLAG_GRANT_READ_URI_PERMISSION);
        } catch (RuntimeException refused) {
            // The app holding the file gives no lasting grant, so the sound would stop with the next restart.
            Logger.printInfo(() -> "No lasting grant for the picked sound: " + refused.getClass().getSimpleName());
            Utils.showToastLong(L10n.t("That app can't share the sound. Pick one saved on the phone."));
            return true;
        }
        Uri before = SaveSound.picked();
        if (before != null && !before.equals(sound)) giveBack(resolver, before);
        String name = displayName(resolver, sound);
        SaveSound.NAME.save(name == null ? "" : name);
        SaveSound.PICKED.save(sound.toString());
        // The sound just picked is the one people expect to hear, so its switch comes on with it.
        if (!Settings.CUSTOM_SAVE_SOUND.savedValue()) {
            Settings.CUSTOM_SAVE_SOUND.save(true);
            page.refreshSwitches();
        }
        refreshRows();
        Utils.showToastLong(name == null ? L10n.t("Saving a pin will play the sound you picked.")
                : L10n.f("Saving a pin will play %s.", name));
        return true;
    }

    private static void forget(Context context) {
        Uri before = SaveSound.picked();
        if (before != null) giveBack(context.getContentResolver(), before);
        SaveSound.PICKED.save("");
        SaveSound.NAME.save("");
        refreshRows();
        Utils.showToastLong(L10n.t("Saving a pin will play Pinterest's sound again."));
    }

    /** Hands back the lasting grant for a sound that's no longer used, so it doesn't pile up. */
    private static void giveBack(ContentResolver resolver, Uri sound) {
        try {
            resolver.releasePersistableUriPermission(sound, Intent.FLAG_GRANT_READ_URI_PERMISSION);
        } catch (RuntimeException gone) {
            Logger.printInfo(() -> "Old sound grant already gone: " + gone.getClass().getSimpleName());
        }
    }

    /** The name the picker showed for the file, or null when its app doesn't say. */
    @Nullable
    static String displayName(ContentResolver resolver, Uri sound) {
        try (Cursor cursor = resolver.query(sound, new String[]{OpenableColumns.DISPLAY_NAME}, null, null, null)) {
            if (cursor != null && cursor.moveToFirst()) {
                int column = cursor.getColumnIndex(OpenableColumns.DISPLAY_NAME);
                String name = column < 0 ? null : cursor.getString(column);
                if (name != null && !name.trim().isEmpty()) return name.trim();
            }
        } catch (RuntimeException failure) {
            Logger.printInfo(() -> "Could not read the sound's name: " + failure.getClass().getSimpleName());
        }
        return null;
    }

    private static Context appContext(HushPinterestPreferenceFragment page) {
        Activity activity = page.getActivity();
        return activity != null ? activity.getApplicationContext() : Utils.getContext();
    }

    private static void refreshRows() {
        for (WeakReference<SaveSoundPreference> reference : ROWS) {
            SaveSoundPreference row = reference.get();
            if (row == null) ROWS.remove(reference);
            else row.notifyChanged();
        }
    }

    private static void observe() {
        SharedPreferences current = Setting.preferences.preferences;
        if (observedStore == current) return;
        if (observedStore != null) observedStore.unregisterOnSharedPreferenceChangeListener(LISTENER);
        observedStore = current;
        current.registerOnSharedPreferenceChangeListener(LISTENER);
    }
}
