package app.morphe.extension.syncforreddit.redirects;

import androidx.annotation.Nullable;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.PasswordAuthentication;
import java.net.Proxy;
import java.util.Locale;
import java.util.concurrent.TimeUnit;


import app.morphe.extension.shared.Logger;

import okhttp3.Credentials;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

/**
 * A client of our own that speaks through a proxy, for the requests that are to go that way.
 *
 * <p>An interceptor cannot change the proxy of the client it is sitting on — that is settled
 * when the client is built, and Sync's clients are built for Sync. So the request is carried out
 * here instead, on a client built for this and nothing else, and the reply is handed back to the
 * chain as though it had come the usual way. Only the requests this bundle decides to send this
 * way ever touch it; everything else in the app goes on exactly as before, which is the whole
 * point of doing it per request rather than setting a proxy for the app.
 *
 * <p>The client is kept for as long as the settings behind it are unchanged, since building one
 * sets up TLS and that is not worth doing per picture.
 *
 * <h2>The certificate</h2>
 *
 * <p>A client certificate is pasted in rather than chosen from a file. Sync asks for no storage
 * permission at all and targets Android 13, so there is no path on the device it could read a
 * file from; pasting is what is actually available, and it is how the two API keys in the
 * translation settings are already given. Either a PKCS#12 keystore written out as base64, which
 * is what most things hand you, or the PEM blocks for a certificate and its key.
 */
public final class ProxyRoute {
    private static final int CONNECT_SECONDS = 15;

    private static final int READ_SECONDS = 30;

    /** What the client was built for, so that it is rebuilt when any of it changes. */
    private static volatile String builtFor;

    private static volatile OkHttpClient client;

    /** Whether a name and password have been offered for a SOCKS proxy yet. */
    private static volatile boolean answeringForSocks;

    private ProxyRoute() {}

    /** @return Whether there is enough set for a proxy to be used at all. */
    public static boolean configured() {
        return address() != null;
    }

    /** @return host and port, or null where what is set is not an address with a port. */
    @Nullable
    public static InetSocketAddress address() {
        String said = RedirectSettings.privately(RedirectSettings.PROXY_ADDRESS).trim();
        if (said.isEmpty()) {
            return null;
        }
        try {
            // Written as host:port. A bare host is not enough: there is no port a proxy is
            // assumed to be on, and guessing one would fail in a way nothing explains.
            int colon = said.lastIndexOf(':');
            if (colon <= 0 || colon == said.length() - 1) {
                return null;
            }
            String host = said.substring(0, colon).trim();
            int port = Integer.parseInt(said.substring(colon + 1).trim());
            if (host.isEmpty() || port <= 0 || port > 65535) {
                return null;
            }
            // Unresolved, so that the name is looked up by whatever is doing the connecting
            // rather than here, where a lookup would block whatever thread this is on.
            return InetSocketAddress.createUnresolved(host, port);
        } catch (Exception ex) {
            Logger.printInfo(() -> "proxy: " + said + " is not an address and port: " + ex);
            return null;
        }
    }

    /** @return A client that speaks through the configured proxy, or null where none is set. */
    @Nullable
    public static synchronized OkHttpClient client() {
        InetSocketAddress where = address();
        if (where == null) {
            return null;
        }

        String wanted = describeSettings(where);
        if (client != null && wanted.equals(builtFor)) {
            return client;
        }

        try {
            boolean socks = RedirectSettings.KIND_SOCKS.equals(
                    RedirectSettings.text(RedirectSettings.PROXY_KIND, RedirectSettings.KIND_HTTP));
            Proxy through = new Proxy(socks ? Proxy.Type.SOCKS : Proxy.Type.HTTP, where);

            OkHttpClient.Builder building = new OkHttpClient.Builder()
                    .proxy(through)
                    .connectTimeout(CONNECT_SECONDS, TimeUnit.SECONDS)
                    .readTimeout(READ_SECONDS, TimeUnit.SECONDS);

            String user = RedirectSettings.privately(RedirectSettings.PROXY_USER);
            String password = RedirectSettings.privately(RedirectSettings.PROXY_PASSWORD);
            if (!user.isEmpty()) {
                if (socks) {
                    answerForSocks(where, user, password);
                } else {
                    // Offered when the proxy asks, and only once: answering a second challenge
                    // with the same credentials is how a wrong password becomes a loop.
                    building.proxyAuthenticator((route, response) -> {
                        if (response.request().header("Proxy-Authorization") != null) {
                            return null;
                        }
                        return response.request().newBuilder()
                                .header("Proxy-Authorization", Credentials.basic(user, password))
                                .build();
                    });
                }
            }

            if (RedirectSettings.sendingACertificate()) {
                ClientCertificate.offerOn(building,
                        RedirectSettings.privately(RedirectSettings.PROXY_CERTIFICATE),
                        RedirectSettings.privately(
                                RedirectSettings.PROXY_CERTIFICATE_PASSWORD));
            }

            client = building.build();
            builtFor = wanted;
            Logger.printDebug(() -> "proxy: speaking to " + where.getHostName() + ":"
                    + where.getPort() + (socks ? " as SOCKS" : " as HTTP"));
            return client;
        } catch (Throwable ex) {
            // Throwable: a missing algorithm arrives as an Error, and a proxy that cannot be
            // built has to leave the app loading pictures the way it did rather than failing.
            Logger.printInfo(() -> "proxy: could not be set up: " + ex);
            client = null;
            builtFor = null;
            return null;
        }
    }

    /**
     * Carries one request through the proxy.
     *
     * @return What the proxy answered, or null where there is no proxy to ask or it could not
     *         be reached.
     */
    @Nullable
    public static Response carry(Request request) {
        OkHttpClient through = client();
        if (through == null) {
            return null;
        }
        try {
            return through.newCall(request).execute();
        } catch (IOException ex) {
            Logger.printInfo(() -> "proxy: could not carry " + request.url() + ": " + ex);
            return null;
        }
    }

    /** @return What to tell someone who has just asked for the proxy to be tried. */
    public static String tryIt() {
        InetSocketAddress where = address();
        if (where == null) {
            return "Set the proxy address first";
        }
        OkHttpClient through = client();
        if (through == null) {
            return "The proxy could not be set up";
        }

        String canary = "https://i.imgur.com/removed.png";
        Response answered = null;
        try {
            answered = through.newCall(new Request.Builder().url(canary).build()).execute();
            String kind = answered.header("Content-Type", "");
            long length = answered.body() == null ? 0 : answered.body().contentLength();
            if (answered.isSuccessful() && kind != null
                    && kind.toLowerCase(Locale.ROOT).startsWith("image/")) {
                return "Working: Imgur answered with a picture through the proxy";
            }
            return "Reached the proxy, but Imgur answered " + answered.code()
                    + " " + kind + (length > 0 ? " (" + length + " bytes)" : "");
        } catch (Exception ex) {
            // What went wrong is almost always in the cause rather than in the message —
            // "Failed to connect to /10.0.0.1:8080" says nothing about whether it was refused,
            // timed out or could not be resolved, and that is the whole question when a proxy
            // will not answer.
            Throwable why = ex;
            while (why.getCause() != null && why.getCause() != why) {
                why = why.getCause();
            }
            Logger.printInfo(() -> "proxy: trying it failed", ex);
            String said = why.getMessage() == null ? why.getClass().getSimpleName()
                    : why.getMessage();
            return why == ex ? "Could not be reached: " + said
                    : "Could not be reached: " + ex.getMessage() + " (" + said + ")";
        } finally {
            if (answered != null) {
                answered.close();
            }
        }
    }

    /**
     * A name and password for a SOCKS proxy, which the platform asks for rather than okhttp.
     *
     * <p>There is one place to answer that, and it belongs to the whole process, so this answers
     * for the one address the proxy is at and nothing else: anything else asking gets null and
     * is left to whatever asked before. Installed only where a name has actually been set, which
     * for most SOCKS proxies never happens.
     */
    private static synchronized void answerForSocks(
            InetSocketAddress where, String user, String password) {
        if (answeringForSocks) {
            return;
        }
        try {
            java.net.Authenticator.setDefault(new java.net.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    InetSocketAddress asking = address();
                    if (asking == null
                            || !asking.getHostName().equalsIgnoreCase(getRequestingHost())
                            || asking.getPort() != getRequestingPort()) {
                        return null;
                    }
                    return new PasswordAuthentication(
                            RedirectSettings.privately(RedirectSettings.PROXY_USER),
                            RedirectSettings.privately(RedirectSettings.PROXY_PASSWORD)
                                    .toCharArray());
                }
            });
            answeringForSocks = true;
            Logger.printDebug(() -> "proxy: answering for the SOCKS proxy at "
                    + where.getHostName());
        } catch (Throwable ex) {
            Logger.printInfo(() -> "proxy: could not offer a name to the SOCKS proxy: " + ex);
        }
    }

    /**
     * @return Everything the client is built out of, so that a change to any of it rebuilds it.
     *         The password and the certificate go in as a hash rather than as themselves —
     *         what is wanted is only whether they are the same as last time, and keeping a
     *         second copy of a secret lying about to answer that would be careless. Not as
     *         their length, which was the first attempt and is why correcting a password to
     *         another of the same length went on failing against the client built for the
     *         first one.
     */
    private static String describeSettings(InetSocketAddress where) {
        return where.getHostName() + ":" + where.getPort()
                + "|" + RedirectSettings.text(RedirectSettings.PROXY_KIND,
                        RedirectSettings.KIND_HTTP)
                + "|" + RedirectSettings.privately(RedirectSettings.PROXY_USER)
                + "|" + RedirectSettings.privately(RedirectSettings.PROXY_PASSWORD).hashCode()
                + "|" + RedirectSettings.sendingACertificate()
                + "|" + RedirectSettings.privately(RedirectSettings.PROXY_CERTIFICATE).hashCode()
                + "|" + RedirectSettings.privately(
                        RedirectSettings.PROXY_CERTIFICATE_PASSWORD).hashCode();
    }
}
