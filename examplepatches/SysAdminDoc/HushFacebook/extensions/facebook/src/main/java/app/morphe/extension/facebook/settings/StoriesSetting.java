/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.extension.facebook.settings;

import android.content.SharedPreferences;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.Utils;
import app.morphe.extension.shared.settings.BooleanSetting;
import app.morphe.extension.shared.settings.Setting;

/** The two Stories choices, including a value-preserving upgrade from the old combined choice. */
final class StoriesSetting extends BooleanSetting {
    static final String LEGACY_KEY = "hushfacebook_hide_stories_tray";
    static final String TOP_KEY = "hushfacebook_hide_top_stories_tray";
    static final String BETWEEN_KEY = "hushfacebook_hide_stories_between_posts";

    StoriesSetting(String key) {
        super(key, true, false);
    }

    /** Run before the independent settings load. A failed write keeps the old choice readable. */
    static void migrate() {
        try {
            finishMigration();
        } catch (RuntimeException failure) {
            Logger.printException(() -> "Could not migrate the Stories settings", failure);
        }
    }

    /** An import must finish a previously failed migration before default keys can be removed. */
    static void finishMigration() {
        synchronized (Setting.class) {
            SharedPreferences store = preferences.preferences;
            if (!store.contains(LEGACY_KEY) || !Utils.isMainProcess()) return;
            commit(store, null, null);
        }
    }

    @Override
    protected void load() {
        if (preferences.preferences.contains(key)) {
            super.load();
        } else {
            Object legacy = preferences.preferences.getAll().get(LEGACY_KEY);
            value = legacy instanceof Boolean ? (Boolean) legacy : defaultValue;
        }
    }

    @Override
    public void saveToPreferences() {
        persist(value);
    }

    @Override
    protected void removeFromPreferences() {
        persist(defaultValue);
    }

    /** A later save also retires a legacy key left by a failed startup commit, in the same write. */
    private void persist(Boolean next) {
        synchronized (Setting.class) {
            if (!Utils.isMainProcess()) {
                throw new IllegalStateException("Stories settings are writable only from the main process");
            }
            commit(preferences.preferences, key, next);
        }
    }

    private static void commit(SharedPreferences store, String changedKey, Boolean next) {
        SharedPreferences.Editor editor = store.edit();
        if (store.contains(LEGACY_KEY)) {
            Object legacy = store.getAll().get(LEGACY_KEY);
            boolean previous = legacy instanceof Boolean ? (Boolean) legacy : true;
            if (!store.contains(TOP_KEY)) editor.putBoolean(TOP_KEY, previous);
            if (!store.contains(BETWEEN_KEY)) editor.putBoolean(BETWEEN_KEY, previous);
            // Its removal is the migration marker. Default-valued later choices remove their own
            // keys, and must never be reseeded from the old choice on the next start.
            editor.remove(LEGACY_KEY);
        }
        if (changedKey != null) {
            if (Boolean.TRUE.equals(next)) editor.remove(changedKey);
            else editor.putBoolean(changedKey, false);
        }
        if (!editor.commit()) throw new IllegalStateException("Could not save the Stories settings");
    }
}
