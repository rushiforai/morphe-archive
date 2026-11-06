package app.morphe.extension.youtube.bilibilidanmaku;

import android.content.Context;
import android.content.SharedPreferences;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProperties;
import android.util.Base64;

import org.json.JSONObject;

import java.nio.charset.StandardCharsets;
import java.security.KeyStore;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;

/**
 * Stores the user's own Bilibili web login, encrypted with a non-exportable Android Keystore key.
 *
 * <p>QR logins keep the cookies needed for Bilibili's official web cookie rotation plus the
 * refresh token, so the session can renew itself. Versions 2.0.x stored only a pasted SESSDATA
 * value; that format is still read (it cannot be renewed) until the user logs in again.</p>
 */
final class BilibiliDanmakuSession {
    private static final String STORE = "morphe_bilibili_danmaku_private";
    private static final String ALIAS = "morphe_bilibili_danmaku_session_v1";
    private static final String VALUE = "session";
    private static final String CHECKED_AT = "checked_at";
    private static final String EXPIRED = "expired";
    /** Cookies that the web login hands out and that the refresh flow needs. */
    private static final String[] KEPT = {"SESSDATA", "bili_jct", "DedeUserID", "DedeUserID__ckMd5", "sid"};
    static final String METHOD_QR = "qr";
    static final String METHOD_LEGACY = "legacy";

    private static Context context;
    private static State cache;
    private static boolean cacheLoaded;

    /** Decrypted login state. Instances are immutable snapshots. */
    static final class State {
        final Map<String, String> cookies;
        final String refreshToken;
        final String method;
        final String name;
        final String face;
        final int level;
        final long savedAt;

        State(Map<String, String> cookies, String refreshToken, String method,
              String name, String face, int level, long savedAt) {
            this.cookies = Collections.unmodifiableMap(new LinkedHashMap<>(cookies));
            this.refreshToken = refreshToken == null ? "" : refreshToken;
            this.method = method == null ? METHOD_LEGACY : method;
            this.name = name == null ? "" : name;
            this.face = face == null ? "" : face;
            this.level = level;
            this.savedAt = savedAt;
        }

        String cookie(String name) {
            String value = cookies.get(name);
            return value == null ? "" : value;
        }

        boolean canRenew() {
            return !refreshToken.isEmpty() && !cookie("bili_jct").isEmpty() && !cookie("SESSDATA").isEmpty();
        }

        State withProfile(String newName, String newFace, int newLevel) {
            return new State(cookies, refreshToken, method, newName, newFace, newLevel, savedAt);
        }

        JSONObject toJson() throws Exception {
            JSONObject root = new JSONObject();
            JSONObject jar = new JSONObject();
            for (Map.Entry<String, String> entry : cookies.entrySet()) jar.put(entry.getKey(), entry.getValue());
            root.put("v", 2);
            root.put("cookies", jar);
            root.put("refresh_token", refreshToken);
            root.put("method", method);
            root.put("name", name);
            root.put("face", face);
            root.put("level", level);
            root.put("saved_at", savedAt);
            return root;
        }

        static State fromJson(String text) throws Exception {
            JSONObject root = new JSONObject(text);
            Map<String, String> cookies = new LinkedHashMap<>();
            JSONObject jar = root.optJSONObject("cookies");
            if (jar != null) {
                Iterator<String> keys = jar.keys();
                while (keys.hasNext()) {
                    String key = keys.next();
                    cookies.put(key, jar.optString(key, ""));
                }
            }
            return new State(cookies, root.optString("refresh_token", ""), root.optString("method", METHOD_LEGACY),
                    root.optString("name", ""), root.optString("face", ""), root.optInt("level", -1),
                    root.optLong("saved_at", 0));
        }
    }

    private BilibiliDanmakuSession() {}

    static synchronized void initialize(Context ctx) {
        context = ctx.getApplicationContext();
    }

    static synchronized boolean hasSession() {
        State state = state();
        return state != null && !state.cookie("SESSDATA").isEmpty();
    }

    static synchronized State state() {
        if (context == null) return null;
        if (cacheLoaded) return cache;
        cacheLoaded = true;
        cache = load();
        return cache;
    }

    /** Cookie header for Bilibili requests: only the user's own login cookies. */
    static synchronized String getCookieHeader() {
        State state = state();
        if (state == null) return "";
        StringBuilder header = new StringBuilder();
        for (Map.Entry<String, String> entry : state.cookies.entrySet()) {
            if (entry.getValue().isEmpty()) continue;
            if (header.length() > 0) header.append("; ");
            header.append(entry.getKey()).append('=').append(entry.getValue());
        }
        return header.toString();
    }

    /**
     * Saves a fresh QR login, or the rotated cookies of the current login when {@code renewal}
     * is set. Only the known login cookies are kept.
     */
    static synchronized void saveLogin(Map<String, String> received, String refreshToken, boolean renewal) throws Exception {
        if (context == null) throw new IllegalStateException("播放器未初始化");
        State previous = renewal ? state() : null;
        Map<String, String> cookies = new LinkedHashMap<>();
        if (previous != null) cookies.putAll(previous.cookies);
        for (String key : KEPT) {
            String value = received.get(key);
            if (value != null && validCookieValue(value)) cookies.put(key, value);
        }
        if (cookies.get("SESSDATA") == null) throw new IllegalStateException("B 站没有返回登录凭证");
        String name = previous == null ? "" : previous.name;
        String face = previous == null ? "" : previous.face;
        int level = previous == null ? -1 : previous.level;
        persist(new State(cookies, refreshToken, METHOD_QR, name, face, level, System.currentTimeMillis()));
        storage().edit().putBoolean(EXPIRED, false).putLong(CHECKED_AT, System.currentTimeMillis()).apply();
    }

    static synchronized void saveProfile(String name, String face, int level) {
        State state = state();
        if (state == null) return;
        try { persist(state.withProfile(name, face, level)); } catch (Exception ignored) { }
    }

    static synchronized void clear() {
        if (context == null) return;
        storage().edit().remove(VALUE).remove(CHECKED_AT).remove(EXPIRED).apply();
        cache = null;
        cacheLoaded = true;
    }

    static synchronized long lastChecked() {
        return context == null ? 0 : storage().getLong(CHECKED_AT, 0);
    }

    static synchronized void markChecked() {
        if (context != null) storage().edit().putLong(CHECKED_AT, System.currentTimeMillis()).apply();
    }

    /** Bilibili reported this login as signed out and it could not be renewed. */
    static synchronized boolean isExpired() {
        return context != null && hasSession() && storage().getBoolean(EXPIRED, false);
    }

    static synchronized void setExpired(boolean expired) {
        if (context != null) storage().edit().putBoolean(EXPIRED, expired).apply();
    }

    static boolean validCookieValue(String value) {
        return value != null && !value.isEmpty() && value.length() <= 4096
                && value.matches("[a-zA-Z0-9_%.,=+\\-/*]+");
    }

    private static void persist(State state) throws Exception {
        byte[] plaintext = state.toJson().toString().getBytes(StandardCharsets.UTF_8);
        Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
        cipher.init(Cipher.ENCRYPT_MODE, encryptionKey());
        byte[] encrypted = cipher.doFinal(plaintext);
        byte[] iv = cipher.getIV();
        byte[] joined = new byte[iv.length + encrypted.length];
        System.arraycopy(iv, 0, joined, 0, iv.length);
        System.arraycopy(encrypted, 0, joined, iv.length, encrypted.length);
        if (!storage().edit().putString(VALUE, Base64.encodeToString(joined, Base64.NO_WRAP)).commit()) {
            throw new IllegalStateException("无法保存 B 站登录信息");
        }
        cache = state;
        cacheLoaded = true;
    }

    private static State load() {
        String ciphertext = storage().getString(VALUE, "");
        if (ciphertext == null || ciphertext.isEmpty()) return null;
        try {
            byte[] bytes = Base64.decode(ciphertext, Base64.NO_WRAP);
            if (bytes.length < 13) return null;
            byte[] iv = new byte[12];
            byte[] encrypted = new byte[bytes.length - iv.length];
            System.arraycopy(bytes, 0, iv, 0, iv.length);
            System.arraycopy(bytes, iv.length, encrypted, 0, encrypted.length);
            Cipher cipher = Cipher.getInstance("AES/GCM/NoPadding");
            cipher.init(Cipher.DECRYPT_MODE, encryptionKey(), new GCMParameterSpec(128, iv));
            String text = new String(cipher.doFinal(encrypted), StandardCharsets.UTF_8);
            if (text.startsWith("{")) return State.fromJson(text);
            // Version 2.0.x stored only the SESSDATA value.
            Map<String, String> cookies = new LinkedHashMap<>();
            cookies.put("SESSDATA", text);
            return new State(cookies, "", METHOD_LEGACY, "", "", -1, 0);
        } catch (Exception ignored) {
            // A restored preference without its device-specific key must not crash YouTube.
            return null;
        }
    }

    private static SharedPreferences storage() {
        return context.getSharedPreferences(STORE, Context.MODE_PRIVATE);
    }

    private static SecretKey encryptionKey() throws Exception {
        KeyStore keystore = KeyStore.getInstance("AndroidKeyStore");
        keystore.load(null);
        if (keystore.containsAlias(ALIAS)) {
            return (SecretKey) keystore.getKey(ALIAS, null);
        }
        KeyGenerator generator = KeyGenerator.getInstance(KeyProperties.KEY_ALGORITHM_AES, "AndroidKeyStore");
        generator.init(new KeyGenParameterSpec.Builder(ALIAS,
                KeyProperties.PURPOSE_ENCRYPT | KeyProperties.PURPOSE_DECRYPT)
                .setBlockModes(KeyProperties.BLOCK_MODE_GCM)
                .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE)
                .setKeySize(256)
                .build());
        return generator.generateKey();
    }
}
