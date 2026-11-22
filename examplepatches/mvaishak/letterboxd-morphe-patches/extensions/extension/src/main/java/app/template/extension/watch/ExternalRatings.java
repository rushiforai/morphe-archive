package app.template.extension.watch;

import android.content.Context;
import android.util.AtomicFile;

import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.KeyStore;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.GCMParameterSpec;
import android.security.keystore.KeyGenParameterSpec;
import android.security.keystore.KeyProperties;

/** MDBList multi-source ratings and device-bound API key storage. */
public final class ExternalRatings {
    private static final String ALIAS = "morphe_external_ratings_mdblist_v1";
    private static final int IV_BYTES = 12;
    private static final ExecutorService IO = Executors.newSingleThreadExecutor();
    public static final String DEFAULT_SOURCES = "imdb,tomatoes,popcorn,metacritic,tmdb,trakt,mal";
    private static final String[][] SOURCES = {
            {"imdb", "IMDb"}, {"tomatoes", "RT Tomatometer (critics)"}, {"popcorn", "RT Popcornmeter (audience)"},
            {"metacritic", "Metacritic"}, {"tmdb", "TMDB"}, {"trakt", "Trakt"},
            {"mal", "MyAnimeList"}
    };

    private ExternalRatings() {}

    public static String[] sourceIds() { String[] a = new String[SOURCES.length]; for (int i=0;i<a.length;i++) a[i]=SOURCES[i][0]; return a; }
    public static String[] sourceNames() { String[] a = new String[SOURCES.length]; for (int i=0;i<a.length;i++) a[i]=SOURCES[i][1]; return a; }

    public static synchronized String key(Context context) {
        try {
            byte[] data = file(context).readFully();
            SecretKey k = (SecretKey) keys().getKey(ALIAS, null);
            if (k == null || data.length <= IV_BYTES + 16) return null;
            Cipher c = Cipher.getInstance("AES/GCM/NoPadding");
            c.init(Cipher.DECRYPT_MODE, k, new GCMParameterSpec(128, data, 0, IV_BYTES));
            byte[] plain = c.doFinal(data, IV_BYTES, data.length - IV_BYTES);
            try { return new String(plain, StandardCharsets.UTF_8); }
            finally { Arrays.fill(plain, (byte) 0); }
        } catch (Exception ignored) { return null; }
    }

    public static synchronized void saveKey(Context context, String value) throws Exception {
        String clean = value == null ? "" : value.trim();
        if (!validKey(clean)) throw new IllegalArgumentException("Check the API key.");
        SecretKey k = (SecretKey) keys().getKey(ALIAS, null);
        if (k == null) {
            KeyGenerator g = KeyGenerator.getInstance(KeyProperties.KEY_ALGORITHM_AES, "AndroidKeyStore");
            g.init(new KeyGenParameterSpec.Builder(ALIAS, KeyProperties.PURPOSE_ENCRYPT | KeyProperties.PURPOSE_DECRYPT)
                    .setKeySize(256).setBlockModes(KeyProperties.BLOCK_MODE_GCM)
                    .setEncryptionPaddings(KeyProperties.ENCRYPTION_PADDING_NONE).build());
            k = g.generateKey();
        }
        Cipher c = Cipher.getInstance("AES/GCM/NoPadding"); c.init(Cipher.ENCRYPT_MODE, k);
        byte[] plain = clean.getBytes(StandardCharsets.UTF_8), encrypted;
        try { encrypted = c.doFinal(plain); } finally { Arrays.fill(plain, (byte) 0); }
        AtomicFile f = file(context); FileOutputStream out = f.startWrite();
        try { out.write(c.getIV()); out.write(encrypted); f.finishWrite(out); }
        catch (Exception e) { f.failWrite(out); throw e; }
    }

    public static synchronized void removeKey(Context context) {
        file(context).delete(); try { keys().deleteEntry(ALIAS); } catch (Exception ignored) { }
    }

    public static boolean validKey(String value) {
        return value != null && value.matches("[A-Za-z0-9_-]{8,256}");
    }

    /** Authenticate without saving a key or depending on a particular movie. */
    public static void validate(String candidate, Validation callback) {
        IO.execute(() -> {
            HttpURLConnection connection = null;
            try {
                URL url = new URL("https://api.mdblist.com/user?apikey="
                        + URLEncoder.encode(candidate, "UTF-8"));
                connection = (HttpURLConnection) url.openConnection();
                connection.setConnectTimeout(8000);
                connection.setReadTimeout(10000);
                int status = connection.getResponseCode();
                if (status == 200) callback.done(null);
                else if (status == 401 || status == 403) callback.done("MDBList rejected this API key.");
                else if (status == 429) callback.done("MDBList rate limit reached. Try again later.");
                else callback.done("MDBList couldn't verify the key. Try again.");
            } catch (Exception e) { callback.done("Couldn't reach MDBList. Check your connection and try again."); }
            finally { if (connection != null) connection.disconnect(); }
        });
    }

    public interface Validation { void done(String error); }

    public static void fetch(Context context, String tmdbId, Callback callback) {
        String apiKey = key(context);
        if (apiKey == null || tmdbId == null || !tmdbId.matches("[0-9]{1,10}")) { callback.done(null, "Connect MDBList and reopen this film."); return; }
        IO.execute(() -> {
            try {
                URL url = new URL("https://api.mdblist.com/tmdb/movie/" + tmdbId + "?apikey=" + apiKey);
                HttpURLConnection c = (HttpURLConnection) url.openConnection(); c.setConnectTimeout(8000); c.setReadTimeout(10000);
                int status = c.getResponseCode();
                if (status != 200) throw new Exception(status == 401 || status == 403 ? "MDBList rejected this API key." : status == 429 ? "MDBList rate limit reached. Try again later." : "MDBList ratings are unavailable.");
                byte[] bytes = c.getInputStream().readNBytes(512 * 1024); c.disconnect();
                JSONArray ratings = new JSONObject(new String(bytes, StandardCharsets.UTF_8)).optJSONArray("ratings");
                List<Rating> out = new ArrayList<>();
                if (ratings != null) for (int i=0;i<ratings.length();i++) {
                    JSONObject r=ratings.optJSONObject(i); if (r==null) continue;
                    String id=r.optString("source", ""); if ("letterboxd".equals(id) || "letter".equals(id)) continue;
                    String value=r.optString("value", "");
                    if (!value.isEmpty() && !"null".equals(value)) out.add(new Rating(id, value, r.optString("votes", "")));
                }
                callback.done(out, null);
            } catch (Exception e) { callback.done(null, e.getMessage() == null ? "Couldn't load external ratings." : e.getMessage()); }
        });
    }

    public static final class Rating {
        public final String source, value, votes;
        Rating(String s,String v,String n) { source=s;value=v;votes=n; }
    }
    public interface Callback { void done(List<Rating> ratings, String error); }
    private static AtomicFile file(Context c) { return new AtomicFile(new File(c.getNoBackupFilesDir(), ALIAS)); }
    private static KeyStore keys() throws Exception { KeyStore s=KeyStore.getInstance("AndroidKeyStore");s.load(null);return s; }
}
