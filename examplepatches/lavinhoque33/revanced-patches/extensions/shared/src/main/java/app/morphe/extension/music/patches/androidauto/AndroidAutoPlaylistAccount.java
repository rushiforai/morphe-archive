/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-13.
 */
package app.morphe.extension.music.patches.androidauto;

import android.content.SharedPreferences;

import java.util.Map;

/** Captures the native selected-identity store, not identities merely constructed during account enumeration. */
public final class AndroidAutoPlaylistAccount {
    private static SharedPreferences preferences;
    private static final SharedPreferences.OnSharedPreferenceChangeListener listener = (prefs, key) -> refresh();

    private AndroidAutoPlaylistAccount() {}

    /** Installed only by the 9.15+ Android Auto patch; native preferences also work at cold offline startup. */
    public static synchronized void capture(SharedPreferences selectedPreferences) {
        if (preferences != selectedPreferences) {
            if (preferences != null) preferences.unregisterOnSharedPreferenceChangeListener(listener);
            preferences = selectedPreferences;
            preferences.registerOnSharedPreferenceChangeListener(listener);
        }
        refresh();
    }

    static synchronized void refresh() {
        Map<String, ?> selected = preferences == null ? Map.of() : preferences.getAll();
        AndroidAutoPlaylistFolder.selectAccount(identity(selected));
    }

    static String identity(Map<String, ?> selected) {
        if (Boolean.TRUE.equals(selected.get("IS_INCOGNITO_SESSION_IDENTITY"))
                || Boolean.TRUE.equals(selected.get("user_signed_out"))) return "";

        Object sync = selected.get("datasync_id");
        Object user = selected.get("user_identity_id");
        if (!(sync instanceof String syncId) || syncId.isEmpty()
                || !(user instanceof String userId) || userId.isEmpty()) return "";

        return syncId + "\n" + userId;
    }
}
