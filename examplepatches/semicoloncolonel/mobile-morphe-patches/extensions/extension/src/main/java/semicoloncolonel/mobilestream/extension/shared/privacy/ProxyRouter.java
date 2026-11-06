package semicoloncolonel.mobilestream.extension.shared.privacy;

import android.util.Log;

import java.io.IOException;
import java.net.Authenticator;
import java.net.InetSocketAddress;
import java.net.PasswordAuthentication;
import java.net.Proxy;
import java.net.ProxySelector;
import java.net.SocketAddress;
import java.net.URI;
import java.net.URLDecoder;
import java.util.Collections;
import java.util.List;
import java.util.Locale;

/**
 * "Route traffic through a proxy".
 *
 * Replaces the app's default ProxySelector with one that sends every
 * connection through the proxy chosen in the patch option. OkHttp (renamed
 * or not) and HttpURLConnection both ask the default ProxySelector, so this
 * covers the app's native and JavaScript traffic. If the proxy cannot be
 * reached, connections fail instead of going out directly. WebViews do not
 * use it.
 *
 * A SOCKS5 proxy can take a username and password, written as
 * socks5://user:pass@host:port. They are given to Android's SOCKS client
 * through java.net.Authenticator, and only for that proxy's host and port.
 */
@SuppressWarnings("unused")
public final class ProxyRouter {
    private static final String TAG = "MSP-PROXY";
    private static volatile boolean installed;

    private ProxyRouter() {
    }

    /** Username and password for the proxy, or null. */
    private static volatile String user;
    private static volatile char[] password;

    /** The proxy, as socks5://[user:pass@]host:port or http://host:port. The patch replaces this method's body. */
    private static String proxySpec() {
        return "";
    }

    static Proxy parse(String spec) {
        String s = spec.trim();
        Proxy.Type type = Proxy.Type.SOCKS;
        String lower = s.toLowerCase(Locale.US);
        if (lower.startsWith("http://") || lower.startsWith("https://")) {
            type = Proxy.Type.HTTP;
        }
        int scheme = s.indexOf("://");
        if (scheme >= 0) {
            s = s.substring(scheme + 3);
        }
        int at = s.lastIndexOf('@');
        if (at >= 0) {
            String credentials = s.substring(0, at);
            s = s.substring(at + 1);
            int split = credentials.indexOf(':');
            user = decode(split < 0 ? credentials : credentials.substring(0, split));
            password = (split < 0 ? "" : decode(credentials.substring(split + 1))).toCharArray();
        }
        int colon = s.lastIndexOf(':');
        if (colon <= 0) {
            throw new IllegalArgumentException("missing port in " + spec);
        }
        String host = s.substring(0, colon);
        int port = Integer.parseInt(s.substring(colon + 1).replace("/", ""));
        // Unresolved, so a SOCKS proxy resolves the app's hostnames itself.
        return new Proxy(type, InetSocketAddress.createUnresolved(host, port));
    }

    private static String decode(String value) {
        try {
            return URLDecoder.decode(value.replace("+", "%2B"), "UTF-8");
        } catch (Exception e) {
            return value;
        }
    }

    public static void install() {
        if (installed) {
            return;
        }
        installed = true;
        try {
            final Proxy proxy = parse(proxySpec());
            final List<Proxy> route = Collections.singletonList(proxy);
            if (user != null) {
                final InetSocketAddress address = (InetSocketAddress) proxy.address();
                Authenticator.setDefault(new Authenticator() {
                    @Override
                    protected PasswordAuthentication getPasswordAuthentication() {
                        String host = getRequestingHost();
                        boolean forProxy = getRequestingPort() == address.getPort()
                                && host != null && host.equalsIgnoreCase(address.getHostString());
                        return forProxy ? new PasswordAuthentication(user, password) : null;
                    }
                });
            }
            ProxySelector.setDefault(new ProxySelector() {
                @Override
                public List<Proxy> select(URI uri) {
                    String host = uri == null ? null : uri.getHost();
                    if (host != null && (host.equals("localhost") || host.equals("127.0.0.1"))) {
                        return Collections.singletonList(Proxy.NO_PROXY);
                    }
                    return route;
                }

                @Override
                public void connectFailed(URI uri, SocketAddress address, IOException e) {
                    Log.w(TAG, "proxy connection failed for " + (uri == null ? "?" : uri.getHost()) + ": " + e);
                }
            });
            Log.i(TAG, "routing traffic through " + proxy);
        } catch (Throwable t) {
            Log.e(TAG, "proxy not installed: " + t);
        }
    }
}
