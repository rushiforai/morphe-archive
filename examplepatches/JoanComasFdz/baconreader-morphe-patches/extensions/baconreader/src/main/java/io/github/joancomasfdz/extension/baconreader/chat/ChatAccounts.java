// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.extension.baconreader.chat;

import android.content.Context;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.util.Base64;
import android.util.Log;
import android.webkit.CookieManager;
import android.webkit.WebSettings;
import android.webkit.WebStorage;

import androidx.annotation.Nullable;

import com.onelouder.baconreader.data.SessionManager;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicBoolean;

/**
 * Keeps a chat login for each BaconReader account. The chat's web view has one set of reddit.com cookies, the
 * website's login: when another account shows, the cookies of the last one are put aside and those of the new one,
 * if it logged in to the chat before, are put back.
 * <p>
 * A new login in the chat belongs to the account shown when it happens. A login the chat had before it knew its
 * account is asked for its user name once.
 */
final class ChatAccounts {
    private static final String TAG = "ChatAccounts";

    private static final String SITE = "https://www.reddit.com";
    private static final String ME = "https://www.reddit.com/api/me.json";
    private static final String SESSION_COOKIE = "reddit_session";

    private static final String PREFERENCES = "baconreader_patches";
    private static final String KEY_ACCOUNT = "reddit_chat.login_account";
    private static final String KEY_SESSION = "reddit_chat.login_session";
    private static final String KEY_SAVED = "reddit_chat.login_cookies.";

    // Reddit renews its cookies while the chat is used.
    private static final long RESTORED_MAX_AGE = 180L * 24 * 60 * 60;
    private static final int TIMEOUT_MS = 15_000;
    private static final long MIN_IDENTIFY_INTERVAL_MS = 60_000L;

    private static final Handler main = new Handler(Looper.getMainLooper());
    private static final AtomicBoolean identifying = new AtomicBoolean(false);
    private static volatile long lastIdentify;

    private ChatAccounts() {
    }

    /**
     * On the main thread: when the account shown isn't the one the chat is logged in with, swaps their logins and
     * runs onSwapped.
     */
    static void follow(Context context, Runnable onSwapped) {
        SharedPreferences preferences = preferences(context);
        String account = current();
        String cookies = cookies();
        String session = cookies == null ? null : sessionOf(cookies);
        String owner = preferences.getString(KEY_ACCOUNT, null);
        if (session != null) {
            String hash = hash(session);
            if (owner == null) {
                identify(context, cookies, hash, onSwapped);
                return;
            }
            if (!hash.equals(preferences.getString(KEY_SESSION, null))) {
                preferences.edit().putString(KEY_ACCOUNT, account).putString(KEY_SESSION, hash).apply();
                return;
            }
        } else if (owner == null) {
            preferences.edit().putString(KEY_ACCOUNT, account).remove(KEY_SESSION).apply();
            return;
        }
        if (owner.equalsIgnoreCase(account)) return;

        String saved = preferences.getString(savedKey(account), null);
        SharedPreferences.Editor editor = preferences.edit();
        if (session != null) editor.putString(savedKey(owner), cookies);
        else editor.remove(savedKey(owner));
        String savedSession = saved == null ? null : sessionOf(saved);
        editor.remove(savedKey(account))
                .putString(KEY_ACCOUNT, account)
                .putString(KEY_SESSION, savedSession == null ? null : hash(savedSession))
                .apply();
        CookieManager manager = CookieManager.getInstance();
        if (cookies != null) clear(manager, cookies);
        if (saved != null) restore(manager, saved);
        manager.flush();
        // The chat's own data, such as its Matrix session, belongs to the last login too.
        WebStorage.getInstance().deleteOrigin(SITE);
        Log.i(TAG, "Chat login switched to the account shown");
        onSwapped.run();
    }

    /** The BaconReader account shown, or "" while none is logged in. */
    private static String current() {
        String name = SessionManager.getUsername();
        return name == null ? "" : name;
    }

    /**
     * Asks Reddit, in the background, whose login the chat has, then follows the account shown with it. Until it
     * answers, nothing is swapped; a failure asks again on the next call, at most once a minute.
     */
    private static void identify(Context context, String cookies, String hash, Runnable onSwapped) {
        long now = System.currentTimeMillis();
        if (now - lastIdentify < MIN_IDENTIFY_INTERVAL_MS) return;
        if (!identifying.compareAndSet(false, true)) return;
        lastIdentify = now;
        String userAgent;
        try {
            userAgent = WebSettings.getDefaultUserAgent(context);
        } catch (Exception exception) {
            userAgent = null;
        }
        final String agent = userAgent;
        new Thread(() -> {
            try {
                String name = userName(cookies, agent);
                if (name == null) return;
                String account = null;
                List<String> names = SessionManager.getNames();
                if (names != null) {
                    for (String known : new ArrayList<>(names)) {
                        if (known != null && known.equalsIgnoreCase(name)) {
                            account = known;
                            break;
                        }
                    }
                }
                final String owner = account != null ? account : current();
                main.post(() -> {
                    SharedPreferences preferences = preferences(context);
                    if (preferences.getString(KEY_ACCOUNT, null) != null) return;
                    preferences.edit().putString(KEY_ACCOUNT, owner).putString(KEY_SESSION, hash).apply();
                    follow(context, onSwapped);
                });
            } catch (Exception exception) {
                Log.i(TAG, "Could not tell whose login the chat has", exception);
            } finally {
                identifying.set(false);
            }
        }, "RedditChatAccount").start();
    }

    /** The user name of the website's login, or null when Reddit doesn't tell it. */
    @Nullable
    private static String userName(String cookies, @Nullable String userAgent) throws Exception {
        HttpURLConnection connection = (HttpURLConnection) new URL(ME).openConnection();
        try {
            connection.setConnectTimeout(TIMEOUT_MS);
            connection.setReadTimeout(TIMEOUT_MS);
            connection.setUseCaches(false);
            connection.setRequestProperty("Cookie", cookies);
            if (userAgent != null) connection.setRequestProperty("User-Agent", userAgent);
            connection.setRequestProperty("Accept", "application/json");
            int code = connection.getResponseCode();
            if (code != HttpURLConnection.HTTP_OK) {
                Log.i(TAG, "Reddit answered HTTP " + code + " for the chat's user");
                return null;
            }
            StringBuilder body = new StringBuilder();
            try (BufferedReader reader = new BufferedReader(
                    new InputStreamReader(connection.getInputStream(), StandardCharsets.UTF_8))) {
                char[] buffer = new char[4096];
                int read;
                while ((read = reader.read(buffer)) != -1) body.append(buffer, 0, read);
            }
            JSONObject data = new JSONObject(body.toString()).optJSONObject("data");
            if (data == null) return null;
            String name = data.optString("name");
            return name.isEmpty() ? null : name;
        } finally {
            connection.disconnect();
        }
    }

    @Nullable
    private static String cookies() {
        try {
            String cookies = CookieManager.getInstance().getCookie(SITE);
            return cookies == null || cookies.trim().isEmpty() ? null : cookies;
        } catch (Exception exception) {
            // Such as while Android updates the WebView.
            Log.i(TAG, "Could not read the chat's cookies", exception);
            return null;
        }
    }

    private static List<String> pairs(String cookies) {
        List<String> pairs = new ArrayList<>();
        for (String pair : cookies.split(";")) {
            String trimmed = pair.trim();
            if (trimmed.contains("=")) pairs.add(trimmed);
        }
        return pairs;
    }

    @Nullable
    private static String sessionOf(String cookies) {
        for (String pair : pairs(cookies)) {
            if (pair.startsWith(SESSION_COOKIE + "=")) {
                String value = pair.substring(pair.indexOf('=') + 1);
                return value.isEmpty() ? null : value;
            }
        }
        return null;
    }

    /** Expires the cookies, set on reddit.com or only on www.reddit.com. */
    private static void clear(CookieManager manager, String cookies) {
        for (String pair : pairs(cookies)) {
            String name = pair.substring(0, pair.indexOf('='));
            manager.setCookie(SITE, name + "=; Max-Age=0; Path=/");
            manager.setCookie(SITE, name + "=; Max-Age=0; Domain=.reddit.com; Path=/");
        }
    }

    /**
     * Puts the cookies back on reddit.com. Android doesn't tell their own attributes, so they're secure, and the
     * login cookie is also hidden from the page's scripts, as Reddit sets it.
     */
    private static void restore(CookieManager manager, String cookies) {
        for (String pair : pairs(cookies)) {
            String httpOnly = pair.startsWith(SESSION_COOKIE + "=") ? "; HttpOnly" : "";
            manager.setCookie(SITE,
                    pair + "; Domain=.reddit.com; Path=/; Secure; Max-Age=" + RESTORED_MAX_AGE + httpOnly);
        }
    }

    private static String savedKey(String account) {
        return KEY_SAVED + account.toLowerCase(Locale.ROOT);
    }

    private static String hash(String value) {
        try {
            return Base64.encodeToString(MessageDigest.getInstance("SHA-256")
                    .digest(value.getBytes(StandardCharsets.UTF_8)), Base64.NO_WRAP);
        } catch (Exception exception) {
            throw new IllegalStateException(exception);
        }
    }

    private static SharedPreferences preferences(Context context) {
        return context.getSharedPreferences(PREFERENCES, Context.MODE_PRIVATE);
    }
}
