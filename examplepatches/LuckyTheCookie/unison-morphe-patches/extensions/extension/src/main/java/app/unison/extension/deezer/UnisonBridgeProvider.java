package app.unison.extension.deezer;

import android.annotation.SuppressLint;
import android.content.ContentProvider;
import android.content.ContentValues;
import android.content.pm.PackageManager;
import android.content.pm.Signature;
import android.database.Cursor;
import android.net.Uri;
import android.os.Binder;
import android.os.Bundle;
import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.security.MessageDigest;

/**
 * Pont entre Unison et Deezer. Unison appelle {@code ContentResolver.call()} sur
 * {@code content://deezer.android.app.unison.bridge} ; seul l'APK d'Unison (certificat vérifié) est accepté.
 *
 * Méthodes : {@code info}, {@code playlists}, {@code addToPlaylist}.
 * Résultat : {@code ok} (boolean), {@code json} (String) ou {@code error} (String).
 */
public final class UnisonBridgeProvider extends ContentProvider {
    static final String TAG = "UnisonBridge";
    static final int PROTOCOL = 1;

    /** Empreintes SHA-256 (hexa minuscule) des certificats de signature autorisés à appeler le pont. */
    private static final String[] ALLOWED_CERTS = {
        "82913e13c234e958bbb7a269dd1d56688649798571d03c30e112a6728092cb1b", // Unison (release)
    };
    private static final String UNISON_PACKAGE = "fr.lulu.unison";

    @Override public boolean onCreate() { return true; }

    @Override
    public Bundle call(String method, String arg, Bundle extras) {
        if (!callerAllowed()) return error("forbidden");
        try {
            switch (method) {
                case "info": {
                    JSONObject o = new JSONObject()
                        .put("protocol", PROTOCOL)
                        .put("hasToken", JwtStore.valid() != null);
                    return ok(o.toString());
                }
                case "playlists":
                    return ok(PipeClient.playlists().toString());
                case "addToPlaylist": {
                    String playlistId = extras == null ? null : extras.getString("playlistId");
                    String[] ids = extras == null ? null : extras.getStringArray("trackIds");
                    if (playlistId == null || ids == null || ids.length == 0) return error("bad_args");
                    JSONArray arr = new JSONArray();
                    for (String id : ids) arr.put(id);
                    return ok(PipeClient.addTracks(playlistId, arr).toString());
                }
                default:
                    return error("unknown_method");
            }
        } catch (Throwable t) {
            Log.w(TAG, method + " a échoué", t);
            String m = t.getMessage();
            return error(m != null && m.length() < 120 ? m : t.getClass().getSimpleName());
        }
    }

    @SuppressLint({"NewApi", "InlinedApi"}) // Deezer exige Android 12+ (API 32)
    private boolean callerAllowed() {
        try {
            PackageManager pm = getContext().getPackageManager();
            String[] pkgs = pm.getPackagesForUid(Binder.getCallingUid());
            if (pkgs == null) return false;
            for (String pkg : pkgs) {
                if (!UNISON_PACKAGE.equals(pkg)) continue;
                Signature[] sigs = pm.getPackageInfo(pkg, PackageManager.GET_SIGNING_CERTIFICATES)
                    .signingInfo.getApkContentsSigners();
                for (Signature s : sigs) {
                    String hex = hex(MessageDigest.getInstance("SHA-256").digest(s.toByteArray()));
                    for (String allowed : ALLOWED_CERTS) if (allowed.equals(hex)) return true;
                }
            }
        } catch (Throwable t) {
            Log.w(TAG, "vérification de l'appelant impossible", t);
        }
        return false;
    }

    private static String hex(byte[] b) {
        StringBuilder sb = new StringBuilder();
        for (byte x : b) sb.append(String.format("%02x", x));
        return sb.toString();
    }

    private static Bundle ok(String json) {
        Bundle b = new Bundle();
        b.putBoolean("ok", true);
        b.putString("json", json);
        return b;
    }

    private static Bundle error(String message) {
        Bundle b = new Bundle();
        b.putBoolean("ok", false);
        b.putString("error", message);
        return b;
    }

    // Pas de données exposées par les requêtes classiques.
    @Override public Cursor query(Uri u, String[] p, String s, String[] a, String o) { return null; }
    @Override public String getType(Uri uri) { return null; }
    @Override public Uri insert(Uri uri, ContentValues v) { return null; }
    @Override public int delete(Uri uri, String s, String[] a) { return 0; }
    @Override public int update(Uri uri, ContentValues v, String s, String[] a) { return 0; }
}
