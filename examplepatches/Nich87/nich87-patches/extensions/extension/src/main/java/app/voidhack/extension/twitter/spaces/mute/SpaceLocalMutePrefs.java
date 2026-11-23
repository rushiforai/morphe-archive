package app.voidhack.extension.twitter.spaces.mute;

import android.content.Context;
import android.content.SharedPreferences;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Persistent preferences for listener-side per-user local muting in Spaces.
 */
final class SpaceLocalMutePrefs {
    private static final String PREFS_NAME = "voidhack_space_local_mute_prefs";
    private static final String KEY_MUTED_USERS = "local_muted_users_json";
    private static final String KEY_STRICT_OVERLAP_MUTE = "local_mute_strict_overlap";
    private static final int MAX_MUTED_USERS = 100;

    private SpaceLocalMutePrefs() {}

    private static SharedPreferences prefs(Context ctx) {
        return ctx.getApplicationContext().getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE);
    }

    static boolean isStrictOverlapMute(Context ctx) {
        return ctx != null && prefs(ctx).getBoolean(KEY_STRICT_OVERLAP_MUTE, false);
    }

    static void setStrictOverlapMute(Context ctx, boolean strict) {
        if (ctx != null) prefs(ctx).edit().putBoolean(KEY_STRICT_OVERLAP_MUTE, strict).apply();
    }

    static List<SpaceLocalMuteLogic.MutedUser> getMutedUsers(Context ctx) {
        List<SpaceLocalMuteLogic.MutedUser> out = new ArrayList<>();
        if (ctx == null) return out;
        try {
            String raw = prefs(ctx).getString(KEY_MUTED_USERS, "[]");
            JSONArray arr = new JSONArray(raw);
            for (int i = 0; i < arr.length(); i++) {
                JSONObject o = arr.optJSONObject(i);
                if (o == null) continue;
                SpaceLocalMuteLogic.MutedUser u = new SpaceLocalMuteLogic.MutedUser(
                        o.optString("twitterUserId", ""),
                        o.optString("periscopeUserId", ""),
                        o.optString("username", ""),
                        o.optString("displayName", ""),
                        o.optLong("mutedAtMs", 0L));
                if (!u.primaryKey.isEmpty()) {
                    out.add(u);
                }
            }
        } catch (Throwable ignored) {}
        return out;
    }

    static void saveMutedUsers(Context ctx, List<SpaceLocalMuteLogic.MutedUser> users) {
        if (ctx == null) return;
        try {
            JSONArray arr = new JSONArray();
            if (users != null) {
                int limit = Math.min(users.size(), MAX_MUTED_USERS);
                for (int i = 0; i < limit; i++) {
                    SpaceLocalMuteLogic.MutedUser u = users.get(i);
                    if (u == null || u.primaryKey.isEmpty()) continue;
                    JSONObject o = new JSONObject();
                    o.put("twitterUserId", u.twitterUserId);
                    o.put("periscopeUserId", u.periscopeUserId);
                    o.put("username", u.username);
                    o.put("displayName", u.displayName);
                    o.put("mutedAtMs", u.mutedAtMs);
                    arr.put(o);
                }
            }
            prefs(ctx).edit().putString(KEY_MUTED_USERS, arr.toString()).apply();
        } catch (Throwable ignored) {}
    }
}
