package app.unison.extension.deezer;

import android.util.Base64;

import org.json.JSONObject;

/**
 * Garde en mémoire le dernier jeton JWT que Deezer envoie à son API « pipe ».
 * Il est alimenté par le patch (hook sur l'en-tête Authorization) et ne quitte jamais le processus de Deezer.
 */
public final class JwtStore {
    private static volatile String token;

    private JwtStore() {}

    /** Appelé par le code patché avec la valeur complète de l'en-tête : « Bearer xxx ». */
    @SuppressWarnings("unused")
    public static void onAuthorization(String header) {
        if (header == null) return;
        String t = header.startsWith("Bearer ") ? header.substring(7) : header;
        if (t.length() > 20) token = t;
    }

    /** Jeton encore valable, ou null (pas encore capturé / expiré). */
    public static String valid() {
        String t = token;
        if (t == null) return null;
        long exp = expiryMs(t);
        return exp > 0 && exp < System.currentTimeMillis() + 5_000 ? null : t;
    }

    public static boolean hasAny() { return token != null; }

    private static long expiryMs(String jwt) {
        try {
            String[] parts = jwt.split("\\.");
            if (parts.length < 2) return 0;
            byte[] payload = Base64.decode(parts[1], Base64.URL_SAFE | Base64.NO_WRAP | Base64.NO_PADDING);
            return new JSONObject(new String(payload, "UTF-8")).optLong("exp", 0) * 1000;
        } catch (Throwable ignored) {
            return 0;
        }
    }
}
