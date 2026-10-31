package app.morphe.extension.syncforreddit.translate;

import android.os.Handler;
import android.os.Looper;

import org.json.JSONObject;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Locale;

import app.morphe.extension.shared.Logger;

/**
 * What DeepL says is left of the allowance an API key carries.
 *
 * <p>Asked of the service rather than counted here, since a key is used from more than one place
 * and only the service knows the whole of it.
 */
final class DeepLUsage {
    /** A key given away free ends this way, and is answered by a different host. */
    private static final String FREE_KEY_ENDS = ":fx";

    private static final String PAID = "https://api.deepl.com/v2/usage";
    private static final String FREE = "https://api-free.deepl.com/v2/usage";

    private static final int TIMEOUT_MS = 8_000;

    /** What was last heard, so that opening the settings again does not wait on the network. */
    private static volatile String lastSaid;

    private DeepLUsage() {}

    interface Said {
        /**
         * @param described What to put under the title.
         * @param used      Characters translated in the period.
         * @param allowed   The whole allowance, or zero where the service does not say.
         */
        void heard(String described, int used, int allowed);
    }

    static String lastSaid() {
        return lastSaid;
    }

    /** Asks, off the main thread, and answers on it. */
    static void ask(String key, Said tell) {
        if (key == null || key.trim().isEmpty()) {
            tell.heard("No API key set", 0, 0);
            return;
        }
        Handler onTheMainThread = new Handler(Looper.getMainLooper());
        new Thread(() -> {
            String described;
            int used = 0;
            int allowed = 0;
            try {
                JSONObject said = new JSONObject(fetch(key.trim()));
                used = said.optInt("character_count");
                allowed = said.optInt("character_limit");
                described = describe(used, allowed);
            } catch (Exception ex) {
                Logger.printInfo(() -> "Could not read the DeepL usage: " + ex);
                described = "Could not be read";
            }
            lastSaid = described;

            String saying = described;
            int wasUsed = used;
            int wasAllowed = allowed;
            onTheMainThread.post(() -> tell.heard(saying, wasUsed, wasAllowed));
        }, "sync-up-deepl-usage").start();
    }

    private static String describe(int used, int allowed) {
        if (allowed <= 0) {
            return String.format(Locale.US, "%,d characters translated", used);
        }
        int left = Math.max(0, allowed - used);
        return String.format(Locale.US, "%,d of %,d characters left (%d%% used)",
                left, allowed, Math.round(used * 100f / allowed));
    }

    private static String fetch(String key) throws Exception {
        URL where = new URL(key.endsWith(FREE_KEY_ENDS) ? FREE : PAID);
        HttpURLConnection connection = (HttpURLConnection) where.openConnection();
        try {
            connection.setRequestMethod("GET");
            connection.setRequestProperty("Authorization", "DeepL-Auth-Key " + key);
            connection.setConnectTimeout(TIMEOUT_MS);
            connection.setReadTimeout(TIMEOUT_MS);

            int answered = connection.getResponseCode();
            if (answered != HttpURLConnection.HTTP_OK) {
                throw new IllegalStateException("DeepL answered " + answered);
            }
            try (InputStream from = connection.getInputStream()) {
                ByteArrayOutputStream into = new ByteArrayOutputStream();
                byte[] chunk = new byte[4096];
                int read;
                while ((read = from.read(chunk)) != -1) {
                    into.write(chunk, 0, read);
                }
                return into.toString(StandardCharsets.UTF_8.name());
            }
        } finally {
            connection.disconnect();
        }
    }
}
