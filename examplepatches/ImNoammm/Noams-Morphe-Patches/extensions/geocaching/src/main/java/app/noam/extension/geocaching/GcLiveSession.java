package app.noam.extension.geocaching;

import android.app.Activity;
import android.content.SharedPreferences;
import android.view.Menu;
import android.view.MenuItem;

import org.json.JSONObject;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.lang.ref.WeakReference;
import java.net.CookieManager;
import java.net.CookiePolicy;
import java.net.HttpCookie;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.concurrent.CountDownLatch;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * The geocaching.com website session the map search and cache pages use, kept apart from the app's own
 * API session. Sign-in order: the saved session cookie, the site's form with the app's own sign-in,
 * then the site's sign-in page inside the app (the site can ask for a CAPTCHA, which the form can't
 * answer; c:geo falls back the same way).
 */
public final class GcLiveSession {
    private static final String SITE = "https://www.geocaching.com";
    private static final String SIGNIN_URL = SITE + "/account/signin?returnUrl=%2Faccount%2Fsettings%2Fhomelocation";
    private static final Pattern TOKEN_PATTERN =
        Pattern.compile("name=\"__RequestVerificationToken\" type=\"hidden\" value=\"([^\"]+)\"");
    private static final int SIGN_IN_MENU_ID = 0x4e474353;
    private static WeakReference<MenuItem> signInItem = new WeakReference<>(null);

    // Only for our own requests: installing it as the default CookieHandler would also change the
    // cookies of the app's own API clients.
    private static final CookieManager COOKIE_MANAGER = new CookieManager(null, CookiePolicy.ACCEPT_ALL);
    private static volatile boolean loggedIn = false;
    private static volatile boolean askedThisRun = false;

    private GcLiveSession() {}

    /**
     * Called as the app sends its own username/password sign-in: geocaching.com takes the same
     * account, so the website session can sign in with it without asking.
     */
    public static void rememberAppLogin(Object loginBody) {
        // The suspend function is entered again with no body when it resumes.
        if (loginBody == null) return;
        try {
            java.lang.reflect.Field handle = loginBody.getClass().getDeclaredField("a");
            java.lang.reflect.Field password = loginBody.getClass().getDeclaredField("b");
            handle.setAccessible(true);
            password.setAccessible(true);
            String user = (String) handle.get(loginBody), pass = (String) password.get(loginBody);
            if (user == null || user.isEmpty() || pass == null || pass.isEmpty()) return;
            SharedPreferences prefs = Utils.prefs();
            if (prefs == null) return;
            prefs.edit().putString("gc_username", user).putString("gc_password_sealed", seal(pass))
                .remove("gc_password").remove("gc_session_sealed").apply();
            synchronized (GcLiveSession.class) {
                loggedIn = false;
                askedThisRun = false;
            }
        } catch (Throwable t) {
            Utils.logError("App sign-in not shared with the website", t);
        }
    }

    static synchronized boolean ensureSession() {
        if (loggedIn) return true;
        SharedPreferences prefs = Utils.prefs();
        if (prefs == null) return false;

        if (restoreSession(prefs) && sessionWorks()) return loggedIn = true;

        String username = prefs.getString("gc_username", null);
        String password = savedPassword(prefs);
        if (username != null && password != null && formLogin(username, password) && sessionWorks()) {
            saveSession(prefs);
            return loggedIn = true;
        }

        if (askedThisRun) return false;
        askedThisRun = true;
        if (signInInApp() && sessionWorks()) {
            saveSession(prefs);
            return loggedIn = true;
        }
        Utils.toast("Sign in to geocaching.com from the map menu to load caches");
        return false;
    }

    /** Adds "geocaching.com sign-in" to the map's menu; called as the menu is created. */
    public static void addMenu(Menu menu) {
        MenuItem item = menu.add(Menu.NONE, SIGN_IN_MENU_ID, 1000, "geocaching.com sign-in");
        item.setShowAsAction(MenuItem.SHOW_AS_ACTION_NEVER);
        item.setOnMenuItemClickListener(m -> {
            signInAgain();
            return true;
        });
        signInItem = new WeakReference<>(item);
    }

    /** The map hides menu items it doesn't know each time it prepares the menu; this shows ours again. */
    public static void showMenu() {
        MenuItem item = signInItem.get();
        if (item != null) item.setVisible(true);
    }

    /** Forgets the website session and opens the site's sign-in page again. */
    private static void signInAgain() {
        new Thread(() -> {
            synchronized (GcLiveSession.class) {
                loggedIn = false;
                askedThisRun = false;
                cachedBearer = null;
                COOKIE_MANAGER.getCookieStore().removeAll();
                SharedPreferences prefs = Utils.prefs();
                if (prefs != null) prefs.edit().remove("gc_session_sealed").apply();
            }
            if (ensureSession()) Utils.toast("Signed in to geocaching.com");
        }).start();
    }

    /** The site's own sign-in page in the app; blocks this (background) thread until it's done. */
    private static boolean signInInApp() {
        Activity activity = Utils.resumedActivity();
        if (activity == null) return false;
        CountDownLatch latch = new CountDownLatch(1);
        String[] cookies = new String[1];
        Utils.runOnMain(() -> {
            try {
                android.webkit.CookieManager webCookies = android.webkit.CookieManager.getInstance();
                webCookies.removeAllCookies(null);
                GcWebDialog.signIn(activity, SIGNIN_URL, url -> {
                    String header = webCookies.getCookie(SITE);
                    if (header == null || !header.contains("gspkauth=") || url.contains("/account/signin")) return false;
                    cookies[0] = header;
                    return true;
                }, latch::countDown);
            } catch (Throwable t) {
                Utils.logError("Sign-in page failed", t);
                latch.countDown();
            }
        });
        try {
            latch.await();
        } catch (InterruptedException e) {
            Thread.currentThread().interrupt();
            return false;
        }
        if (cookies[0] == null) return false;
        addCookies(cookies[0]);
        return true;
    }

    /** True when the site hands this session an API token, which it only does when signed in. */
    private static boolean sessionWorks() {
        cachedBearer = null;
        return ensureToken() != null;
    }

    private static void saveSession(SharedPreferences prefs) {
        StringBuilder header = new StringBuilder();
        for (HttpCookie cookie : COOKIE_MANAGER.getCookieStore().getCookies()) {
            if (header.length() > 0) header.append("; ");
            header.append(cookie.getName()).append('=').append(cookie.getValue());
        }
        String sealed = seal(header.toString());
        if (sealed != null) prefs.edit().putString("gc_session_sealed", sealed).apply();
    }

    private static boolean restoreSession(SharedPreferences prefs) {
        String sealed = prefs.getString("gc_session_sealed", null);
        String header = sealed == null ? null : unseal(sealed);
        if (header == null || !header.contains("gspkauth=")) return false;
        addCookies(header);
        return true;
    }

    private static void addCookies(String header) {
        for (String part : header.split(";")) {
            int eq = part.indexOf('=');
            if (eq <= 0) continue;
            HttpCookie cookie = new HttpCookie(part.substring(0, eq).trim(), part.substring(eq + 1).trim());
            cookie.setDomain(".geocaching.com");
            cookie.setPath("/");
            cookie.setVersion(0);
            COOKIE_MANAGER.getCookieStore().add(URI.create(SITE), cookie);
        }
    }

    private static final String KEY_ALIAS = "geocaching_website_login";

    /** Secrets (the password, the session cookie) are encrypted with a key kept in the Android Keystore. */
    private static String seal(String plain) {
        try {
            javax.crypto.Cipher cipher = javax.crypto.Cipher.getInstance("AES/GCM/NoPadding");
            cipher.init(javax.crypto.Cipher.ENCRYPT_MODE, keystoreKey());
            byte[] iv = cipher.getIV();
            byte[] sealed = cipher.doFinal(plain.getBytes(StandardCharsets.UTF_8));
            byte[] stored = new byte[iv.length + sealed.length];
            System.arraycopy(iv, 0, stored, 0, iv.length);
            System.arraycopy(sealed, 0, stored, iv.length, sealed.length);
            return android.util.Base64.encodeToString(stored, android.util.Base64.NO_WRAP);
        } catch (Exception e) {
            Utils.logError("Could not encrypt the website sign-in", e);
            return null;
        }
    }

    private static String unseal(String sealed) {
        try {
            byte[] stored = android.util.Base64.decode(sealed, android.util.Base64.NO_WRAP);
            javax.crypto.Cipher cipher = javax.crypto.Cipher.getInstance("AES/GCM/NoPadding");
            cipher.init(javax.crypto.Cipher.DECRYPT_MODE, keystoreKey(),
                new javax.crypto.spec.GCMParameterSpec(128, stored, 0, 12));
            return new String(cipher.doFinal(stored, 12, stored.length - 12), StandardCharsets.UTF_8);
        } catch (Exception e) {
            Utils.logError("Saved website sign-in unreadable", e);
            return null;
        }
    }

    private static String savedPassword(SharedPreferences prefs) {
        String plain = prefs.getString("gc_password", null);
        if (plain != null) {
            prefs.edit().putString("gc_password_sealed", seal(plain)).remove("gc_password").apply();
            return plain;
        }
        String sealed = prefs.getString("gc_password_sealed", null);
        return sealed == null ? null : unseal(sealed);
    }

    private static javax.crypto.SecretKey keystoreKey() throws Exception {
        java.security.KeyStore store = java.security.KeyStore.getInstance("AndroidKeyStore");
        store.load(null);
        if (store.containsAlias(KEY_ALIAS)) return (javax.crypto.SecretKey) store.getKey(KEY_ALIAS, null);
        javax.crypto.KeyGenerator generator = javax.crypto.KeyGenerator.getInstance(
            android.security.keystore.KeyProperties.KEY_ALGORITHM_AES, "AndroidKeyStore");
        generator.init(new android.security.keystore.KeyGenParameterSpec.Builder(KEY_ALIAS,
            android.security.keystore.KeyProperties.PURPOSE_ENCRYPT | android.security.keystore.KeyProperties.PURPOSE_DECRYPT)
            .setBlockModes(android.security.keystore.KeyProperties.BLOCK_MODE_GCM)
            .setEncryptionPaddings(android.security.keystore.KeyProperties.ENCRYPTION_PADDING_NONE)
            .build());
        return generator.generateKey();
    }

    private static boolean formLogin(String username, String password) {
        try {
            String signinPage = get(SIGNIN_URL);
            Matcher matcher = TOKEN_PATTERN.matcher(signinPage);
            if (!matcher.find()) {
                Utils.log("No CSRF token on sign-in page");
                return false;
            }
            String body = "__RequestVerificationToken=" + urlEncode(matcher.group(1))
                + "&ReturnUrl=" + urlEncode("/account/settings/homelocation")
                + "&UsernameOrEmail=" + urlEncode(username)
                + "&Password=" + urlEncode(password);
            String result = post(SITE + "/account/signin", body);
            for (HttpCookie cookie : COOKIE_MANAGER.getCookieStore().getCookies()) {
                if ("gspkauth".equalsIgnoreCase(cookie.getName())) return true;
            }
            if (result.contains("g-recaptcha")) {
                Utils.log("The site asked for a CAPTCHA; using its sign-in page instead");
            } else if (result.contains("signup-validation-error")) {
                Utils.log("The site refused the saved password; using its sign-in page instead");
                SharedPreferences prefs = Utils.prefs();
                if (prefs != null) prefs.edit().remove("gc_password_sealed").apply();
            } else {
                Utils.log("Sign-in did not produce a session cookie");
            }
            return false;
        } catch (Throwable t) {
            Utils.logError("Sign-in failed", t);
            return false;
        }
    }

    static String get(String url) throws IOException {
        HttpURLConnection conn = open(url, "GET");
        return readBody(conn);
    }

    static byte[] getImage(String url) throws IOException {
        HttpURLConnection conn = open(url, "GET");
        conn.setConnectTimeout(10000);
        conn.setReadTimeout(10000);
        String type = conn.getContentType();
        if (type == null || !type.toLowerCase(java.util.Locale.ROOT).startsWith("image/")) {
            conn.disconnect();
            throw new IOException("Not an image: " + url);
        }
        if (conn.getContentLength() > 4 * 1024 * 1024) {
            conn.disconnect();
            throw new IOException("Image too large: " + url);
        }
        try (InputStream in = conn.getInputStream(); ByteArrayOutputStream out = new ByteArrayOutputStream()) {
            byte[] buffer = new byte[8192];
            int read;
            while ((read = in.read(buffer)) != -1) {
                if (out.size() + read > 4 * 1024 * 1024) throw new IOException("Image too large: " + url);
                out.write(buffer, 0, read);
            }
            return out.toByteArray();
        } finally {
            conn.disconnect();
        }
    }

    private static volatile String cachedBearer = null;
    private static volatile long bearerExpiresAt = 0;

    /** Bearer token for /api/proxy/* calls, fetched from the website's own token endpoint. */
    static synchronized String ensureToken() {
        if (cachedBearer != null && System.currentTimeMillis() < bearerExpiresAt) return cachedBearer;
        try {
            String json = get("https://www.geocaching.com/account/oauth/token");
            JSONObject obj = new JSONObject(json);
            String tokenType = obj.optString("token_type", "Bearer");
            String accessToken = obj.getString("access_token");
            long expiresInMs = obj.optLong("expires_in", 1800) * 1000L;
            cachedBearer = tokenType + " " + accessToken;
            bearerExpiresAt = System.currentTimeMillis() + (long) (expiresInMs * 0.8);
            return cachedBearer;
        } catch (Throwable t) {
            Utils.logError("Token fetch failed", t);
            return null;
        }
    }

    /** GET with an extra Authorization header, for /api/proxy/* calls. */
    static String getWithAuth(String url, String authorization) throws IOException {
        return readBody(open(url, "GET", null, authorization));
    }

    private static String post(String url, String body) throws IOException {
        return readBody(open(url, "POST", body.getBytes(StandardCharsets.UTF_8), null));
    }

    private static HttpURLConnection open(String url, String method) throws IOException {
        return open(url, method, null, null);
    }

    /** Sends our cookies and keeps the ones the site sets, following redirects by hand so none are lost. */
    private static HttpURLConnection open(String url, String method, byte[] form, String authorization) throws IOException {
        for (int hop = 0; ; hop++) {
            URI uri = URI.create(url);
            HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
            conn.setRequestMethod(method);
            conn.setInstanceFollowRedirects(false);
            conn.setRequestProperty("User-Agent", "Mozilla/5.0 (Android) geocaching-morphe");
            if (authorization != null) conn.setRequestProperty("Authorization", authorization);
            for (java.util.Map.Entry<String, java.util.List<String>> header
                    : COOKIE_MANAGER.get(uri, java.util.Collections.emptyMap()).entrySet()) {
                for (String value : header.getValue()) conn.addRequestProperty(header.getKey(), value);
            }
            if (form != null) {
                conn.setDoOutput(true);
                conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
                conn.setFixedLengthStreamingMode(form.length);
                try (OutputStream out = conn.getOutputStream()) {
                    out.write(form);
                }
            }
            int status = conn.getResponseCode();
            COOKIE_MANAGER.put(uri, conn.getHeaderFields());
            String location = conn.getHeaderField("Location");
            if (status / 100 != 3 || location == null || hop >= 8) return conn;
            conn.disconnect();
            url = uri.resolve(location).toString();
            method = "GET";
            form = null;
        }
    }

    private static String readBody(HttpURLConnection conn) throws IOException {
        InputStream stream;
        try {
            stream = conn.getInputStream();
        } catch (IOException e) {
            stream = conn.getErrorStream();
            if (stream == null) throw e;
        }
        StringBuilder sb = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(stream, StandardCharsets.UTF_8))) {
            char[] buffer = new char[8192];
            int read;
            while ((read = reader.read(buffer)) != -1) sb.append(buffer, 0, read);
        }
        return sb.toString();
    }

    private static String urlEncode(String value) {
        try {
            return java.net.URLEncoder.encode(value, "UTF-8");
        } catch (java.io.UnsupportedEncodingException e) {
            return value;
        }
    }
}
