package app.ahmedyarub.extension.x;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.accounts.AuthenticatorDescription;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Environment;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.Iterator;

import app.morphe.extension.shared.Logger;

/**
 * Keeps a copy of the signed-in accounts outside the app, so a reinstall (which a patched app
 * replacing the Play one needs) does not sign them out. X keeps each account in the system
 * account manager: its user data and its two OAuth tokens. The copy is a file in Download,
 * which the app can read back after a reinstall only with "All files access".
 */
@SuppressWarnings("unused")
public final class TokenBackup {
    private static final String[] USER_DATA = {
            "account_user_id",
            "com.twitter.android.username",
            "com.twitter.android.name",
            "com.x.android.lite.version",
            "kdt",
            "com.x.android.lite.account.settings",
    };
    private static final String[] AUTH_TOKENS = {
            "com.twitter.android.oauth.token",
            "com.twitter.android.oauth.token.secret",
    };
    private static final String CURRENT_USER = "current_user_id";

    private TokenBackup() {
    }

    /** Injection point: the start of the application's onCreate, before it loads its accounts. */
    public static void onAppCreate(Context context) {
        try {
            AccountManager manager = AccountManager.get(context);
            String type = accountType(context, manager);
            if (type == null) return;
            File file = backupFile(context);
            if (manager.getAccountsByType(type).length == 0) {
                // Restored only on the first start after an install. Signed out after having
                // been signed in, the backup goes, so a sign-out stays one across a reinstall
                // too; a restore that did not take keeps it.
                if (firstStart(context)) {
                    // A restored session is a signed-in one, should it be signed out in this run.
                    if (file.isFile() && restore(context, manager, type, file)) state(context).edit().putBoolean("signedIn", true).apply();
                } else if (state(context).getBoolean("signedIn", false) && file.isFile() && !file.delete()) {
                    Logger.printInfo(() -> "TokenBackup could not delete " + file);
                }
                return;
            }
            firstStart(context);
            state(context).edit().putBoolean("signedIn", true).apply();
            new Thread(() -> backUp(context, manager, type, file), "morphe-token-backup").start();
        } catch (Throwable ex) {
            Logger.printException(() -> "TokenBackup failed", ex);
        }
    }

    private static String accountType(Context context, AccountManager manager) {
        for (AuthenticatorDescription description : manager.getAuthenticatorTypes()) {
            if (context.getPackageName().equals(description.packageName)) return description.type;
        }
        return null;
    }

    static File backupFile(Context context) {
        File directory = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOWNLOADS), "morphe-tokens");
        return new File(directory, context.getPackageName() + ".json");
    }

    private static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(context.getPackageName() + "_preferences", Context.MODE_PRIVATE);
    }

    private static void backUp(Context context, AccountManager manager, String type, File file) {
        try {
            JSONArray accounts = new JSONArray();
            for (Account account : manager.getAccountsByType(type)) {
                JSONObject userData = new JSONObject();
                for (String key : USER_DATA) {
                    String value = manager.getUserData(account, key);
                    if (value != null) userData.put(key, value);
                }
                JSONObject tokens = new JSONObject();
                for (String key : AUTH_TOKENS) {
                    String value = manager.peekAuthToken(account, key);
                    if (value != null) tokens.put(key, value);
                }
                accounts.put(new JSONObject().put("name", account.name).put("userData", userData).put("tokens", tokens));
            }
            JSONObject backup = new JSONObject()
                    .put("type", type)
                    .put(CURRENT_USER, preferences(context).getLong(CURRENT_USER, -1))
                    .put("accounts", accounts);

            File directory = file.getParentFile();
            if (directory != null && !directory.isDirectory() && !directory.mkdirs()) {
                Logger.printInfo(() -> "TokenBackup cannot write " + directory + "; grant All files access");
                return;
            }
            try (FileOutputStream out = new FileOutputStream(file)) {
                out.write(backup.toString().getBytes(StandardCharsets.UTF_8));
            }
        } catch (Throwable ex) {
            Logger.printException(() -> "TokenBackup could not back up the accounts", ex);
        }
    }

    private static boolean restore(Context context, AccountManager manager, String type, File file) {
        try {
            JSONObject backup = new JSONObject(new String(Files.readAllBytes(file.toPath()), StandardCharsets.UTF_8));
            if (!type.equals(backup.optString("type"))) return false;
            JSONArray accounts = backup.getJSONArray("accounts");
            for (int i = 0; i < accounts.length(); i++) {
                JSONObject saved = accounts.getJSONObject(i);
                Account account = new Account(saved.getString("name"), type);
                Bundle userData = new Bundle();
                JSONObject data = saved.getJSONObject("userData");
                for (Iterator<String> keys = data.keys(); keys.hasNext(); ) {
                    String key = keys.next();
                    userData.putString(key, data.getString(key));
                }
                if (!manager.addAccountExplicitly(account, null, userData)) continue;
                JSONObject tokens = saved.getJSONObject("tokens");
                for (Iterator<String> keys = tokens.keys(); keys.hasNext(); ) {
                    String key = keys.next();
                    manager.setAuthToken(account, key, tokens.getString(key));
                }
            }
            long current = backup.optLong(CURRENT_USER, -1);
            if (current != -1) preferences(context).edit().putLong(CURRENT_USER, current).commit();
            Logger.printInfo(() -> "TokenBackup restored " + accounts.length() + " accounts");
            return manager.getAccountsByType(type).length > 0;
        } catch (Throwable ex) {
            Logger.printException(() -> "TokenBackup could not restore the accounts", ex);
            return false;
        }
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
