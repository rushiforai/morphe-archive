package com.anderson.applemusic.one.media;

import android.content.Context;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.util.Locale;

/**
 * Reads the Apple account the engine already has, inside the engine's own data directory.
 *
 * <p>The StoreApi persists its active account as Gson JSON in
 * {@code files/AccountTable.json} (name, Apple ID, storefront, DSID). The subscription
 * state lives in the settings DataStore
 * ({@code files/datastore/settings.preferences_pb}) under {@code subscription_status} /
 * {@code subscription_reason} / {@code subscription_free_trial}, which is what
 * {@code p201ja.a1.i()} reads for the whole engine. No engine class is loaded, so the
 * panel still works if the StoreApi API changes.
 */
public final class AccountSession {

    private static final String TAG = "AppleMusicOne";
    private static final String ACCOUNT_FILE = "AccountTable.json";
    private static final String SETTINGS_FILE = "files/datastore/settings.preferences_pb";

    public static final class Profile {
        public final boolean signedIn;
        public final String name;
        public final String email;
        public final String subscription;
        public final String initial;

        Profile(boolean signedIn, String name, String email, String subscription,
                String initial) {
            this.signedIn = signedIn;
            this.name = name;
            this.email = email;
            this.subscription = subscription;
            this.initial = initial;
        }
    }

    private AccountSession() {
    }

    public static Profile load(Context context) {
        JSONObject account = activeAccount(context);
        byte[] settings = settings(context);
        String status = settings != null ? CatalogSearch.prefValue(settings, "subscription_status") : null;
        String reason = settings != null ? CatalogSearch.prefValue(settings, "subscription_reason") : null;
        Boolean family = settings != null ? CatalogSearch.prefBoolean(settings, "subscription_is_family") : null;
        Boolean trial = settings != null ? CatalogSearch.prefBoolean(settings, "subscription_free_trial") : null;

        boolean signedIn = account != null;
        String first = account != null ? clean(account.optString("firstName")) : "";
        String last = account != null ? clean(account.optString("lastName")) : "";
        String email = account != null ? clean(account.optString("id")) : "";
        String name = (first + " " + last).trim();
        if (name.length() == 0) name = email;
        if (name.length() == 0) name = "Conta Apple";

        boolean isFamily = family != null && family.booleanValue();
        boolean isTrial = trial != null && trial.booleanValue();
        String subscription = subscriptionLabel(status, reason, isFamily, isTrial);
        Log.i(TAG, "account: signedIn=" + signedIn + " accountFile=" + (account != null)
                + " name=" + (name.length() > 0) + " email=" + (email.length() > 0)
                + " status=" + status + " reason=" + reason + " family=" + isFamily
                + " trial=" + isTrial + " subscription=" + subscription);
        return new Profile(signedIn, name, email, subscription, initial(name));
    }

    private static JSONObject activeAccount(Context context) {
        File file = new File(context.getFilesDir(), ACCOUNT_FILE);
        if (!file.isFile()) {
            Log.w(TAG, "account: " + ACCOUNT_FILE + " not found");
            return null;
        }
        try {
            JSONObject root = new JSONObject(text(file));
            JSONArray accounts = root.optJSONArray("accounts");
            if (accounts == null || accounts.length() == 0) return null;
            int index = root.isNull("activeAccount") ? -1 : root.optInt("activeAccount", -1);
            if (index >= 0 && index < accounts.length()) {
                JSONObject candidate = accounts.optJSONObject(index);
                if (candidate != null && candidate.optLong("dsid", 0L) != 0L) return candidate;
            }
            for (int i = 0; i < accounts.length(); i++) {
                JSONObject candidate = accounts.optJSONObject(i);
                if (candidate != null && candidate.optBoolean("active")) return candidate;
            }
            Log.i(TAG, "account: no active account in " + ACCOUNT_FILE);
        } catch (Throwable t) {
            Log.w(TAG, "account: cannot parse " + ACCOUNT_FILE + ": " + t);
        }
        return null;
    }

    private static byte[] settings(Context context) {
        try {
            return bytes(new File(context.getApplicationInfo().dataDir, SETTINGS_FILE));
        } catch (Throwable t) {
            Log.w(TAG, "account: cannot read the settings DataStore: " + t);
            return null;
        }
    }

    /**
     * {@code subscription_status} is the {@code MusicStatus} enum name the engine stores
     * ("ENABLED", "DISABLED", "UNLINKED", "GLIDE"); the reason refines the plan and the
     * booleans carry trial/family. Unknown values are shown as-is instead of guessed.
     */
    private static String subscriptionLabel(String status, String reason, boolean family,
                                            boolean trial) {
        if (status == null || status.length() == 0) return "Assinatura não informada";
        String value = status.toLowerCase(Locale.ROOT);
        if (value.equals("enabled")) {
            if (trial) return "Teste grátis";
            String plan = reason == null ? "" : reason.toLowerCase(Locale.ROOT);
            if (family || plan.contains("family") || plan.contains("member")) {
                return "Assinatura Família";
            }
            if (plan.contains("student")) return "Assinatura Universitária";
            if (plan.contains("carrier")) return "Assinatura pela operadora";
            return "Assinatura Individual";
        }
        if (value.equals("glide")) return "Assinatura em carência";
        if (value.equals("disabled") || value.equals("unlinked")) {
            return "Sem assinatura ativa";
        }
        return status;
    }

    private static String initial(String name) {
        if (name.length() == 0) return "?";
        for (int i = 0; i < name.length(); i++) {
            char c = name.charAt(i);
            if (Character.isLetterOrDigit(c)) {
                return String.valueOf(Character.toUpperCase(c));
            }
        }
        return "?";
    }

    private static String clean(String value) {
        return value == null ? "" : value.trim();
    }

    private static String text(File file) throws Exception {
        return new String(bytes(file), "UTF-8");
    }

    private static byte[] bytes(File file) throws Exception {
        FileInputStream input = new FileInputStream(file);
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            byte[] buffer = new byte[8192];
            int read;
            while ((read = input.read(buffer)) > 0) out.write(buffer, 0, read);
            return out.toByteArray();
        } finally {
            input.close();
        }
    }
}
