package app.morphe.extension.syncforreddit.redirects.imgur;

import androidx.annotation.Nullable;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import javax.net.ssl.SSLContext;

import app.morphe.extension.shared.Logger;
import app.morphe.extension.syncforreddit.redirects.ClientCertificate;
import app.morphe.extension.syncforreddit.redirects.RedirectSettings;

import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

/**
 * Carrying a request to a Rimgo instance that asks us to prove who we are.
 *
 * <p>An instance can be put behind mTLS as readily as a proxy can — somebody running one for
 * themselves and a few friends is exactly who would. Sync's own clients know nothing about any
 * of that, and an interceptor cannot give the client it is sitting on a certificate, so where
 * an instance has one attached the request is carried out here and the reply handed back to
 * the chain.
 *
 * <p><b>A certificate belongs to one instance.</b> A server decides when to ask for a client
 * certificate, and the certificate names whoever holds it — so a certificate kept for "Rimgo"
 * rather than for an instance would be handed over by whichever instance asked for one,
 * including an instance asking in order to find out who is reading. Each instance is therefore
 * offered its own and nothing else, and an instance with none attached is spoken to exactly as
 * before: down Sync's own chain, with no certificate to give away.
 */
public final class RimgoRoute {
    private static final int CONNECT_SECONDS = 15;

    private static final int READ_SECONDS = 30;

    /** A client per instance that has a certificate, against what it was built from. */
    private static final Map<String, OkHttpClient> clients = new HashMap<>();

    private static final Map<String, String> builtFrom = new HashMap<>();

    private RimgoRoute() {}

    /**
     * @return Whether this instance's requests have to be carried here rather than sent down
     *         the chain, which is so only where it has a certificate that can be read.
     */
    public static boolean carrying(String instance) {
        return clientFor(instance) != null;
    }

    /** @return A client offering this instance's certificate, or null where it has none. */
    @Nullable
    public static synchronized OkHttpClient clientFor(String instance) {
        String pasted = RedirectSettings.certificateFor(instance);
        if (!ClientCertificate.looksSet(pasted)) {
            return null;
        }
        String password = RedirectSettings.certificatePasswordFor(instance);

        String wanted = pasted.hashCode() + ":" + password.hashCode();
        OkHttpClient already = clients.get(instance);
        if (already != null && wanted.equals(builtFrom.get(instance))) {
            return already;
        }

        SSLContext context = ClientCertificate.contextFor(pasted, password);
        if (context == null) {
            // Whatever could not read it has said so. Nothing is offered rather than the
            // request being sent without one, since an instance that asks for a certificate
            // will refuse it anyway and this way the reason is already in the log.
            return null;
        }

        try {
            OkHttpClient.Builder building = new OkHttpClient.Builder()
                    .connectTimeout(CONNECT_SECONDS, TimeUnit.SECONDS)
                    .readTimeout(READ_SECONDS, TimeUnit.SECONDS);
            ClientCertificate.offerOn(building, pasted, password);
            OkHttpClient built = building.build();
            clients.put(instance, built);
            builtFrom.put(instance, wanted);
            Logger.printDebug(() -> "rimgo: offering " + instance + " its certificate");
            return built;
        } catch (Throwable ex) {
            Logger.printInfo(() -> "rimgo: no certificate client for " + instance + ": " + ex);
            clients.remove(instance);
            builtFrom.remove(instance);
            return null;
        }
    }

    /** @return What the instance answered, or null where it could not be reached. */
    @Nullable
    public static Response carry(String instance, Request request) {
        OkHttpClient through = clientFor(instance);
        if (through == null) {
            return null;
        }
        try {
            return through.newCall(request).execute();
        } catch (IOException ex) {
            Logger.printInfo(() -> "rimgo: could not carry " + request.url() + ": " + ex);
            return null;
        }
    }

    /**
     * Offers this instance's certificate on a plain connection, which is what the instance
     * checks and the album pages are fetched with. Nothing is offered where it has none.
     */
    public static void offerOn(HttpURLConnection asking, String instance) {
        String pasted = RedirectSettings.certificateFor(instance);
        if (ClientCertificate.looksSet(pasted)) {
            ClientCertificate.offerOn(asking, pasted,
                    RedirectSettings.certificatePasswordFor(instance));
        }
    }
}
