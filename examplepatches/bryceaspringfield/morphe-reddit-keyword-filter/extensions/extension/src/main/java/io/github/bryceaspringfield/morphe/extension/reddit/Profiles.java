package io.github.bryceaspringfield.morphe.extension.reddit;

import static io.github.bryceaspringfield.morphe.extension.reddit.FilterSettings.*;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.widget.Toast;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileInputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Named copies of every setting (this bundle's and Morphe's own), switched by hand or by the Reddit account in use.
 * The settings in force always belong to the profile in use: switching first saves them into it.
 */
final class Profiles {
    static final String DEFAULT = "Default";
    private static final String FILE = "reddit_keyword_filter_profiles";
    /** Morphe's own settings file, recorded when its settings page opens. */
    private static final String MORPHE_FILE = "morphe_file";
    private static final String NAMES = "names";
    private static final String ACTIVE = "active";
    private static final String ASSIGNED = "assigned";
    private static final String DATA = "data_";
    /** Keys each profile leaves alone: debug logging, migration markers, and the flairs seen so far. */
    private static final Set<String> SHARED_KEYS = new HashSet<>(java.util.Arrays.asList(
            DEBUG, LEGACY_PLACES_VERSION, Scopes.SEEN_FLAIRS, RECENT_COMMUNITIES));
    private static final Pattern ACTIVE_ACCOUNT = Pattern.compile(
            "active_session_name.{0,12}?com\\.reddit\\.auth_active\\.([A-Za-z0-9_-]{3,24})", Pattern.DOTALL);
    private static final long ACCOUNT_CHECK_MS = 5_000;
    private static volatile long accountCheckedAt = -ACCOUNT_CHECK_MS;
    private static volatile String lastAccount;

    private Profiles() {
    }

    @SuppressLint("PrivateApi")
    private static Context app() {
        try {
            return (Context) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
        } catch (Exception ex) {
            return null;
        }
    }

    private static SharedPreferences store() {
        Context context = app();
        return context == null ? null : context.getSharedPreferences(FILE, Context.MODE_PRIVATE);
    }

    private static SharedPreferences morphe() {
        Context context = app();
        SharedPreferences store = store();
        String name = store == null ? null : store.getString(MORPHE_FILE, null);
        return context == null || name == null ? null : context.getSharedPreferences(name, Context.MODE_PRIVATE);
    }

    /** Records the file of Morphe's own settings, which each profile also keeps. */
    static void morpheFile(String name) {
        SharedPreferences store = store();
        if (store != null && name != null && !name.equals(store.getString(MORPHE_FILE, null))) {
            store.edit().putString(MORPHE_FILE, name).apply();
        }
    }

    static String active() {
        SharedPreferences store = store();
        String name = store == null ? null : store.getString(ACTIVE, null);
        return name == null ? DEFAULT : name;
    }

    static List<String> names() {
        List<String> names = new ArrayList<>();
        names.add(DEFAULT);
        SharedPreferences store = store();
        if (store == null) return names;
        try {
            JSONArray array = new JSONArray(store.getString(NAMES, "[]"));
            for (int i = 0; i < array.length(); i++) {
                String name = array.getString(i);
                if (!names.contains(name)) names.add(name);
            }
        } catch (Exception ex) {
            Log.e(TAG, "Could not read the profile names", ex);
        }
        return names;
    }

    private static void saveNames(SharedPreferences.Editor editor, List<String> names) {
        JSONArray array = new JSONArray();
        for (String name : names) if (!name.equals(DEFAULT)) array.put(name);
        editor.putString(NAMES, array.toString());
    }

    /** The profile assigned to each account, by lowercase account name. */
    static Map<String, String> assigned() {
        Map<String, String> map = new LinkedHashMap<>();
        SharedPreferences store = store();
        if (store == null) return map;
        try {
            JSONObject json = new JSONObject(store.getString(ASSIGNED, "{}"));
            for (Iterator<String> keys = json.keys(); keys.hasNext(); ) {
                String account = keys.next();
                map.put(account, json.getString(account));
            }
        } catch (Exception ex) {
            Log.e(TAG, "Could not read the profile accounts", ex);
        }
        return map;
    }

    static void assign(String account, String profile) {
        SharedPreferences store = store();
        if (store == null) return;
        Map<String, String> map = assigned();
        if (profile == null) map.remove(account.toLowerCase(Locale.ROOT));
        else map.put(account.toLowerCase(Locale.ROOT), profile);
        store.edit().putString(ASSIGNED, new JSONObject(map).toString()).commit();
        lastAccount = null;
    }

    // region Snapshots

    private static JSONObject snapshot(SharedPreferences preferences, boolean ours) throws Exception {
        JSONObject json = new JSONObject();
        if (preferences == null) return json;
        for (Map.Entry<String, ?> entry : preferences.getAll().entrySet()) {
            if (ours && SHARED_KEYS.contains(entry.getKey())) continue;
            Object value = entry.getValue();
            JSONObject typed = new JSONObject();
            if (value instanceof Boolean) typed.put("t", "b");
            else if (value instanceof Integer) typed.put("t", "i");
            else if (value instanceof Long) typed.put("t", "l");
            else if (value instanceof Float) typed.put("t", "f");
            else if (value instanceof Set) typed.put("t", "set");
            else typed.put("t", "s");
            typed.put("v", value instanceof Set ? new JSONArray((Set<?>) value) : value);
            json.put(entry.getKey(), typed);
        }
        return json;
    }

    private static void restore(SharedPreferences preferences, JSONObject json, boolean ours) throws Exception {
        if (preferences == null || json == null) return;
        SharedPreferences.Editor editor = preferences.edit();
        for (String key : preferences.getAll().keySet()) {
            if (!(ours && SHARED_KEYS.contains(key))) editor.remove(key);
        }
        for (Iterator<String> keys = json.keys(); keys.hasNext(); ) {
            String key = keys.next();
            JSONObject typed = json.getJSONObject(key);
            switch (typed.getString("t")) {
                case "b":
                    editor.putBoolean(key, typed.getBoolean("v"));
                    break;
                case "i":
                    editor.putInt(key, typed.getInt("v"));
                    break;
                case "l":
                    editor.putLong(key, typed.getLong("v"));
                    break;
                case "f":
                    editor.putFloat(key, (float) typed.getDouble("v"));
                    break;
                case "set": {
                    JSONArray array = typed.getJSONArray("v");
                    Set<String> set = new HashSet<>();
                    for (int i = 0; i < array.length(); i++) set.add(array.getString(i));
                    editor.putStringSet(key, set);
                    break;
                }
                default:
                    editor.putString(key, typed.getString("v"));
            }
        }
        editor.commit();
    }

    /** Saves the settings in force into the profile in use. */
    private static void saveActive() throws Exception {
        SharedPreferences store = store();
        if (store == null) return;
        JSONObject data = new JSONObject();
        data.put("ours", snapshot(preferences(), true));
        data.put("morphe", snapshot(morphe(), false));
        store.edit().putString(DATA + active(), data.toString()).commit();
    }

    // endregion

    /**
     * Makes a profile the one in use: saves the settings in force into the current profile, then loads the named
     * one. A profile never saved starts from the settings in force.
     *
     * @return Whether Morphe's own settings changed, which apply after Reddit restarts.
     */
    static synchronized boolean switchTo(String name) {
        try {
            if (name.equals(active())) return false;
            saveActive();
            SharedPreferences store = store();
            if (store == null) return false;
            String raw = store.getString(DATA + name, null);
            boolean morpheChanged = false;
            if (raw != null) {
                JSONObject data = new JSONObject(raw);
                JSONObject morpheData = data.optJSONObject("morphe");
                morpheChanged = morpheData != null && !morpheData.toString().equals(snapshot(morphe(), false).toString());
                restore(preferences(), data.optJSONObject("ours"), true);
                if (morpheChanged) restore(morphe(), morpheData, false);
            }
            store.edit().putString(ACTIVE, name).commit();
            HideKeywordContentPatch.settingsChanged();
            Log.i(TAG, "profile in use: " + name + (morpheChanged ? " (Morphe settings changed)" : ""));
            return morpheChanged;
        } catch (Exception ex) {
            Log.e(TAG, "Could not switch profiles", ex);
            return false;
        }
    }

    /** Adds a profile holding a copy of the settings in force, and makes it the one in use. */
    static synchronized boolean create(String name) {
        name = name.trim();
        if (name.isEmpty() || names().contains(name)) return false;
        try {
            saveActive();
            SharedPreferences store = store();
            if (store == null) return false;
            List<String> names = names();
            names.add(name);
            SharedPreferences.Editor editor = store.edit();
            saveNames(editor, names);
            editor.putString(ACTIVE, name).commit();
            saveActive();
            return true;
        } catch (Exception ex) {
            Log.e(TAG, "Could not add a profile", ex);
            return false;
        }
    }

    static synchronized boolean rename(String from, String to) {
        to = to.trim();
        if (from.equals(DEFAULT) || to.isEmpty() || names().contains(to)) return false;
        SharedPreferences store = store();
        if (store == null) return false;
        List<String> names = names();
        names.set(names.indexOf(from), to);
        SharedPreferences.Editor editor = store.edit();
        saveNames(editor, names);
        String data = store.getString(DATA + from, null);
        editor.remove(DATA + from);
        if (data != null) editor.putString(DATA + to, data);
        if (from.equals(active())) editor.putString(ACTIVE, to);
        Map<String, String> map = assigned();
        for (Map.Entry<String, String> entry : map.entrySet()) if (entry.getValue().equals(from)) entry.setValue(to);
        editor.putString(ASSIGNED, new JSONObject(map).toString());
        editor.commit();
        return true;
    }

    /** Deletes a profile other than Default and the one in use; its accounts go back to no profile. */
    static synchronized boolean delete(String name) {
        if (name.equals(DEFAULT) || name.equals(active())) return false;
        SharedPreferences store = store();
        if (store == null) return false;
        List<String> names = names();
        names.remove(name);
        SharedPreferences.Editor editor = store.edit();
        saveNames(editor, names);
        editor.remove(DATA + name);
        Map<String, String> map = assigned();
        map.values().removeAll(Collections.singleton(name));
        editor.putString(ASSIGNED, new JSONObject(map).toString());
        editor.commit();
        return true;
    }

    // region Accounts

    /** The account Reddit has signed in, read from its session store, or null when signed out. */
    static String currentAccount() {
        Context context = app();
        if (context == null) return null;
        File file = new File(context.getFilesDir(), "datastore/com.reddit.auth_active.preferences_pb");
        if (!file.isFile() || file.length() > 65536) return null;
        try (FileInputStream in = new FileInputStream(file)) {
            byte[] bytes = new byte[(int) file.length()];
            int read = 0;
            while (read < bytes.length) {
                int n = in.read(bytes, read, bytes.length - read);
                if (n < 0) break;
                read += n;
            }
            String text = new String(bytes, 0, read, StandardCharsets.ISO_8859_1);
            if (!text.contains("LOGGED_IN")) return null;
            Matcher m = ACTIVE_ACCOUNT.matcher(text);
            return m.find() ? m.group(1).toLowerCase(Locale.ROOT) : null;
        } catch (Exception ex) {
            return null;
        }
    }

    /**
     * Switches to the profile assigned to the account signed in, when that account changed since the last check.
     * Called as feeds load; checks at most every few seconds.
     */
    static void checkAccount() {
        long now = SystemClock.elapsedRealtime();
        if (now - accountCheckedAt < ACCOUNT_CHECK_MS) return;
        accountCheckedAt = now;
        try {
            String account = currentAccount();
            if (account == null || account.equals(lastAccount)) return;
            lastAccount = account;
            String profile = assigned().get(account);
            if (profile == null || profile.equals(active()) || !names().contains(profile)) return;
            boolean restart = switchTo(profile);
            Context context = app();
            if (context == null) return;
            String message = restart
                    ? Strings.f("Profile %s in use for u/%s; restart Reddit to apply its Morphe settings", profile, account)
                    : Strings.f("Profile %s in use for u/%s", profile, account);
            new Handler(Looper.getMainLooper()).post(() -> Toast.makeText(context, message, Toast.LENGTH_LONG).show());
        } catch (Exception ex) {
            Log.e(TAG, "Could not check the account's profile", ex);
        }
    }

    // endregion

}
