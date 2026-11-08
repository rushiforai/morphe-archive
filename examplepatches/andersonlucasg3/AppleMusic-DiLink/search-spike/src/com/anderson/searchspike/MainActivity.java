package com.anderson.searchspike;

import android.app.Activity;
import android.content.pm.ApplicationInfo;
import android.os.Bundle;
import android.security.keystore.KeyGenParameterSpec;
import android.util.Base64;
import android.util.Log;
import android.view.Gravity;
import android.widget.ScrollView;
import android.widget.TextView;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.security.KeyStore;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;

/**
 * Spike: can a companion (same android:sharedUserId = com.apple.android) reuse the
 * engine's MediaApi tokens and call the catalogue search endpoint directly?
 *
 * The engine keeps them in files/datastore/encrypted_tokens.preferences_pb, each value
 * AES/GCM-encrypted (p201ja/T.java:110-121) with a key in AndroidKeyStore aliased
 * "music_token_store_key" (p201ja/T.java:55-63). Same UID => same keystore namespace.
 *
 * adb shell am start -n com.anderson.searchspike/.MainActivity
 * adb logcat -s SPK
 */
public class MainActivity extends Activity {
    private static final String TAG = "SPK";
    private static final String ENGINE = "com.apple.android.music";
    private static final String PB = "/data/data/" + ENGINE + "/files/datastore/encrypted_tokens.preferences_pb";
    private static final String KS_ALIAS = "music_token_store_key";

    private TextView tv;
    private final StringBuilder all = new StringBuilder();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        ScrollView sc = new ScrollView(this);
        tv = new TextView(this);
        tv.setPadding(24, 24, 24, 24);
        tv.setGravity(Gravity.START);
        tv.setTextSize(11f);
        sc.addView(tv);
        setContentView(sc);
        new Thread(new Runnable() {
            @Override
            public void run() {
                work();
            }
        }).start();
    }

    private void log(String s) {
        Log.i(TAG, s);
        all.append(s).append('\n');
        runOnUiThread(new Runnable() {
            @Override
            public void run() {
                tv.setText(all.toString());
            }
        });
    }

    private void work() {
        log("uid=" + android.os.Process.myUid() + " pkg=" + getPackageName());
        try {
            ApplicationInfo ai = getPackageManager().getApplicationInfo(ENGINE, 0);
            log("engine uid=" + ai.uid);
        } catch (Throwable t) {
            log("engine ApplicationInfo failed: " + t);
        }

        byte[] pb;
        try {
            pb = bytes(new File(PB));
            log("pb read bytes=" + pb.length);
        } catch (Throwable t) {
            log("STOP: cannot read " + PB + ": " + t);
            return;
        }

        String dev = decrypt(pb, "key_api_token_musicAndroid");
        String user = decrypt(pb, "key_music_user_token");
        log("devToken=" + kind(dev));
        log("userToken=" + kind(user));
        if (dev == null) {
            log("STOP: developer token not recoverable");
            return;
        }

        for (String sf : new String[]{"br", "us"}) {
            get("search[" + sf + "]", "https://amp-api.music.apple.com/v1/catalog/" + sf
                    + "/search?term=" + enc("daft punk") + "&types=songs&limit=3&l=en-US", dev, user);
        }
        get("search[br,no-user-token]", "https://amp-api.music.apple.com/v1/catalog/br/search?term="
                + enc("daft punk") + "&types=songs&limit=3&l=en-US", dev, null);

        probeReflection();
    }

    /** Path 2: can the engine's own classes be loaded/instantiated in this process? */
    private void probeReflection() {
        try {
            ApplicationInfo ai = getPackageManager().getApplicationInfo(ENGINE, 0);
            ClassLoader cl = new dalvik.system.PathClassLoader(ai.sourceDir, getClassLoader());
            String[] names = {
                    "com.apple.android.music.mediaapi.network.MediaApiImpl",
                    "com.apple.android.music.mediaapi.repository.MediaApiRepositoryHolder",
                    "com.apple.android.music.mediaapi.token.MediaApiTokenProviderImpl",
                    "com.apple.android.music.mediaapi.repository.MediaApiSearchSessionImpl",
                    "com.apple.android.music.search.Search2PageResultsViewModel",
            };
            for (String n : names) {
                try {
                    Class<?> c = Class.forName(n, false, cl);
                    log("reflect load OK: " + n);
                    try {
                        Class.forName(n, true, cl);
                        log("reflect <clinit> OK: " + n);
                    } catch (Throwable t) {
                        log("reflect <clinit> FAILED: " + n + " -> " + t);
                    }
                } catch (Throwable t) {
                    log("reflect load FAILED: " + n + " -> " + t);
                }
            }
            try {
                Class<?> c = Class.forName("com.apple.android.music.mediaapi.network.MediaApiImpl", true, cl);
                Object o = c.getConstructor(boolean.class).newInstance(false);
                log("reflect new MediaApiImpl -> " + o);
            } catch (Throwable t) {
                log("reflect new MediaApiImpl FAILED -> " + t);
            }
        } catch (Throwable t) {
            log("reflect probe FAILED -> " + t);
        }
    }

    /** Reads <key>__cipher / <key>__iv from the DataStore protobuf and decrypts with the engine's key. */
    private String decrypt(byte[] pb, String key) {
        try {
            String ct = prefValue(pb, key + "__cipher");
            String iv = prefValue(pb, key + "__iv");
            log(key + ": ct=" + (ct == null ? "null" : ct.length()) + " iv=" + (iv == null ? "null" : iv.length()));
            if (ct == null || iv == null) {
                log(key + ": cipher/iv not found in pb");
                return null;
            }
            KeyStore ks = KeyStore.getInstance("AndroidKeyStore");
            ks.load(null);
            KeyStore.Entry e = ks.getEntry(KS_ALIAS, null);
            if (e == null) {
                log(key + ": AndroidKeyStore alias " + KS_ALIAS + " not visible to this UID");
                return null;
            }
            SecretKey sk = ((KeyStore.SecretKeyEntry) e).getSecretKey();
            Cipher c = Cipher.getInstance("AES/GCM/NoPadding");
            c.init(Cipher.DECRYPT_MODE, sk, new GCMParameterSpec(128, Base64.decode(iv, 0)));
            return new String(c.doFinal(Base64.decode(ct, 0)), "UTF-8");
        } catch (Throwable t) {
            log(key + ": decrypt failed: " + t);
            return null;
        }
    }

    /**
     * androidx.datastore PreferenceMap: entry = { 1:key, 2:{ 5:value } }, so right after the key
     * bytes come [0x12][varint L][0x2A][varint M][M bytes of value].
     */
    private static String prefValue(byte[] pb, String key) {
        byte[] k = key.getBytes(java.nio.charset.StandardCharsets.UTF_8);
        int i = indexOf(pb, k);
        if (i < 0) return null;
        int p = i + k.length;
        if (p + 1 >= pb.length || (pb[p] & 0xFF) != 0x12) return null;
        p++;
        long[] l = readVarint(pb, p);
        if (l == null) return null;
        p = (int) l[1];
        if (p >= pb.length || (pb[p] & 0xFF) != 0x2A) return null;
        p++;
        long[] m = readVarint(pb, p);
        if (m == null) return null;
        int off = (int) m[1];
        int len = (int) m[0];
        if (off + len > pb.length) return null;
        return new String(pb, off, len, java.nio.charset.StandardCharsets.UTF_8);
    }

    private static int indexOf(byte[] hay, byte[] needle) {
        outer:
        for (int i = 0; i + needle.length <= hay.length; i++) {
            for (int j = 0; j < needle.length; j++) if (hay[i + j] != needle[j]) continue outer;
            return i;
        }
        return -1;
    }

    /** @return {value, nextOffset} */
    private static long[] readVarint(byte[] b, int p) {
        long v = 0;
        int shift = 0;
        while (p < b.length && shift < 64) {
            int x = b[p++] & 0xFF;
            v |= (long) (x & 0x7F) << shift;
            if ((x & 0x80) == 0) return new long[]{v, p};
            shift += 7;
        }
        return null;
    }

    private static String kind(String v) {
        if (v == null) return "MISSING";
        return "present(len=" + v.length() + ", head=" + v.substring(0, Math.min(10, v.length())) + "…)";
    }

    private static String enc(String s) {
        try {
            return URLEncoder.encode(s, "UTF-8");
        } catch (Exception e) {
            return s;
        }
    }

    private void get(String label, String url, String dev, String user) {
        HttpURLConnection c = null;
        try {
            c = (HttpURLConnection) new URL(url).openConnection();
            c.setConnectTimeout(15000);
            c.setReadTimeout(20000);
            c.setRequestProperty("Authorization", "Bearer " + dev);
            if (user != null) c.setRequestProperty("Music-User-Token", user);
            c.setRequestProperty("Origin", "https://music.apple.com");
            c.setRequestProperty("User-Agent",
                    "Mozilla/5.0 (Linux; Android 14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120 Mobile Safari/537.36");
            int code = c.getResponseCode();
            InputStream is = code >= 400 ? c.getErrorStream() : c.getInputStream();
            String body = is == null ? "" : text(is);
            log(label + " HTTP " + code + " bytes=" + body.length());
            if (label.equals("search[br]")) {
                for (int off = 0; off < body.length(); off += 1200) {
                    log("BODY[" + off + "] " + body.substring(off, Math.min(body.length(), off + 1200)));
                }
            } else {
                log(label + " BODY " + body.substring(0, Math.min(1600, body.length())));
            }
        } catch (Throwable t) {
            log(label + " FAILED: " + t);
        } finally {
            if (c != null) c.disconnect();
        }
    }

    private static byte[] bytes(File f) throws Exception {
        FileInputStream in = new FileInputStream(f);
        ByteArrayOutputStream bo = new ByteArrayOutputStream();
        byte[] buf = new byte[8192];
        int n;
        while ((n = in.read(buf)) > 0) bo.write(buf, 0, n);
        in.close();
        return bo.toByteArray();
    }

    private static String text(InputStream is) throws Exception {
        ByteArrayOutputStream bo = new ByteArrayOutputStream();
        byte[] buf = new byte[8192];
        int n;
        while ((n = is.read(buf)) > 0) bo.write(buf, 0, n);
        is.close();
        return bo.toString("UTF-8");
    }
}
