package app.ahmedyarub.extension.instagram;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Environment;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import app.morphe.extension.shared.Logger;

/**
 * Keeps a copy of the signed-in session outside the app, so a reinstall (which a patched app
 * replacing the Play one needs) does not sign it out. Instagram keeps the signed-in user in its
 * default preferences and each user's authorization header in an encrypted store whose key the
 * reinstall loses, so the header is copied out decrypted, through the store, and written back
 * through the new store. The copy is a file in Download, which the app can read back after a
 * reinstall only with "All files access".
 */
@SuppressWarnings("unused")
public final class TokenBackup {
    private static final String AUTH_STORE = "AuthHeaderPrefs";
    private static final String CURRENT_USER = "current";

    /** The auth store's method returning its editor. Rewritten by the patch. */
    private static String editorMethod() {
        return "editorMethod";
    }

    /** The editor's putString. Rewritten by the patch. */
    private static String putStringMethod() {
        return "putStringMethod";
    }

    private static final ThreadLocal<String> opening = new ThreadLocal<>();
    private static volatile Object authStore;
    private static volatile JSONObject pendingAuth;
    private static volatile Runnable backup;
    /** Set while restored authorization headers are waiting for their store. */
    private static volatile Context appContext;

    private TokenBackup() {
    }

    static File backupFile(Context context) {
        File directory = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS), "morphe-tokens");
        return new File(directory, context.getPackageName() + ".json");
    }

    private static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(context.getPackageName() + "_preferences", Context.MODE_PRIVATE);
    }

    /** Injection point: the start of the application's onCreate, before the session is loaded. */
    public static void onAppCreate(Context context) {
        try {
            SharedPreferences preferences = preferences(context);
            File file = backupFile(context);
            if (!preferences.contains(CURRENT_USER)) {
                // Restored only on the first start after an install. Signed out after having
                // been signed in, the backup goes, so a sign-out stays one across a reinstall
                // too; a restore that did not take keeps it.
                if (firstStart(context)) {
                    // Signed in once its authorization headers are back (see onStoreOpened), so
                    // the context is there before restore hands the headers over.
                    if (file.isFile()) {
                        appContext = context.getApplicationContext();
                        if (!restore(preferences, file)) appContext = null;
                    }
                } else if (state(context).getBoolean("signedIn", false) && file.isFile() && !file.delete()) {
                    Logger.printInfo(() -> "TokenBackup could not delete " + file);
                }
                return;
            }
            firstStart(context);
            state(context).edit().putBoolean("signedIn", true).apply();
            // Backed up once the app opens its authorization store, whenever that is.
            backup = () -> backUp(preferences, file);
            if (authStore != null) startBackup();
        } catch (Throwable ex) {
            Logger.printException(() -> "TokenBackup failed", ex);
        }
    }

    /** Injection point: a preferences store is about to be opened under this name. */
    public static void onStoreOpening(String name) {
        opening.set(name);
    }

    /** Injection point: the store just opened under the name given to onStoreOpening. */
    public static void onStoreOpened(Object store) {
        String name = opening.get();
        opening.remove();
        if (!AUTH_STORE.equals(name) || store == null) return;
        authStore = store;
        startBackup();
        JSONObject pending = pendingAuth;
        if (pending == null) return;
        pendingAuth = null;
        try {
            Object editor = store.getClass().getMethod(editorMethod()).invoke(store);
            Method putString = editor.getClass().getMethod(putStringMethod(), String.class, String.class);
            for (Iterator<String> keys = pending.keys(); keys.hasNext(); ) {
                String key = keys.next();
                putString.invoke(editor, key, pending.getString(key));
            }
            editor.getClass().getMethod("commit").invoke(editor);
            // A session whose headers are back is a signed-in one, should it be signed out in
            // this run; one whose headers never apply keeps its backup.
            Context context = appContext;
            if (context != null) state(context).edit().putBoolean("signedIn", true).apply();
            Logger.printInfo(() -> "TokenBackup restored " + pending.length() + " authorization headers");
        } catch (Throwable ex) {
            Logger.printException(() -> "TokenBackup could not restore the authorization headers", ex);
        }
    }

    /** Runs the backup the app start asked for, once, off the thread that opened the store. */
    private static synchronized void startBackup() {
        Runnable task = backup;
        if (task == null) return;
        backup = null;
        new Thread(task, "morphe-token-backup").start();
    }

    private static void backUp(SharedPreferences preferences, File file) {
        try {
            Object store = authStore;
            if (store == null) return;
            JSONObject auth = new JSONObject();
            for (Map.Entry<?, ?> entry : ((Map<?, ?>) store.getClass().getMethod("getAll").invoke(store)).entrySet()) {
                if (entry.getValue() instanceof String) auth.put(String.valueOf(entry.getKey()), entry.getValue());
            }
            if (auth.length() == 0) return;

            JSONObject backup = new JSONObject()
                    .put("preferences", encode(preferences.getAll()))
                    .put("auth", auth);
            File directory = file.getParentFile();
            if (directory != null && !directory.isDirectory() && !directory.mkdirs()) {
                Logger.printInfo(() -> "TokenBackup cannot write " + directory + "; grant All files access");
                return;
            }
            try (FileOutputStream out = new FileOutputStream(file)) {
                out.write(backup.toString().getBytes(StandardCharsets.UTF_8));
            }
        } catch (Throwable ex) {
            Logger.printException(() -> "TokenBackup could not back up the session", ex);
        }
    }

    private static boolean restore(SharedPreferences preferences, File file) {
        try {
            JSONObject backup = new JSONObject(new String(Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8));
            SharedPreferences.Editor editor = preferences.edit();
            JSONObject saved = backup.getJSONObject("preferences");
            for (Iterator<String> keys = saved.keys(); keys.hasNext(); ) {
                String key = keys.next();
                JSONObject value = saved.getJSONObject(key);
                switch (value.getString("t")) {
                    case "s" -> editor.putString(key, value.getString("v"));
                    case "b" -> editor.putBoolean(key, value.getBoolean("v"));
                    case "i" -> editor.putInt(key, value.getInt("v"));
                    case "l" -> editor.putLong(key, value.getLong("v"));
                    case "f" -> editor.putFloat(key, (float) value.getDouble("v"));
                    case "ss" -> {
                        JSONArray items = value.getJSONArray("v");
                        Set<String> set = new HashSet<>();
                        for (int i = 0; i < items.length(); i++) set.add(items.getString(i));
                        editor.putStringSet(key, set);
                    }
                    default -> {
                    }
                }
            }
            editor.commit();
            pendingAuth = backup.getJSONObject("auth");
            Logger.printInfo(() -> "TokenBackup restored the signed-in session's preferences");
            return true;
        } catch (Throwable ex) {
            Logger.printException(() -> "TokenBackup could not restore the session", ex);
            return false;
        }
    }

    private static JSONObject encode(Map<String, ?> values) throws Exception {
        JSONObject encoded = new JSONObject();
        for (Map.Entry<String, ?> entry : values.entrySet()) {
            Object value = entry.getValue();
            JSONObject typed = new JSONObject();
            if (value instanceof String) typed.put("t", "s").put("v", value);
            else if (value instanceof Boolean) typed.put("t", "b").put("v", value);
            else if (value instanceof Integer) typed.put("t", "i").put("v", value);
            else if (value instanceof Long) typed.put("t", "l").put("v", value);
            else if (value instanceof Float) typed.put("t", "f").put("v", (double) (Float) value);
            else if (value instanceof Set) typed.put("t", "ss").put("v", new JSONArray((Set<?>) value));
            else continue;
            encoded.put(entry.getKey(), typed);
        }
        return encoded;
    }

    /** True the first time this install calls it. */
    private static SharedPreferences state(Context context) {
        return context.getSharedPreferences("morphe_token_backup", Context.MODE_PRIVATE);
    }

    private static boolean firstStart(Context context) {
        SharedPreferences state = state(context);
        if (state.getBoolean("started", false)) return false;
        state.edit().putBoolean("started", true).commit();
        return true;
    }
}
