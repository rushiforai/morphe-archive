package app.ytmusicproxy.extension;

import java.io.IOException;
import java.net.Authenticator;
import java.net.InetSocketAddress;
import java.net.PasswordAuthentication;
import java.net.Proxy;
import java.net.ProxySelector;
import java.net.SocketAddress;
import java.net.URI;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public final class ProxyInstaller {
    private static volatile Trace trace;
    private static volatile Snapshot snapshot;
    private static volatile ProxySelector previousProxySelector;
    private static volatile boolean installed;

    private ProxyInstaller() {
    }

    public interface Trace {
        void onSelect(URI uri, Proxy proxy);

        void onConnectFailed(URI uri, SocketAddress socketAddress, IOException exception);
    }

    public static void setTrace(Trace trace) {
        ProxyInstaller.trace = trace;
    }

    public static boolean apply(ProxySettings settings) {
        if (settings == null) {
            return false;
        }

        String host = trim(settings.getHost());
        Integer port = parsePort(settings.getPort());
        if (host.isEmpty() || port == null) {
            return false;
        }

        String username = nullToEmpty(settings.getUsername());
        String password = nullToEmpty(settings.getPassword());
        Proxy proxy = new Proxy(Proxy.Type.HTTP, InetSocketAddress.createUnresolved(host, port));
        if (!installed) {
            previousProxySelector = ProxySelector.getDefault();
            installed = true;
        }
        ProxySelector.setDefault(new FixedProxySelector(proxy));
        applySystemProperties(host, port);
        applyAuthenticator(username, password);
        snapshot = new Snapshot(host, port, username, password);
        return true;
    }

    public static void reset() {
        if (installed) {
            ProxySelector.setDefault(previousProxySelector);
            previousProxySelector = null;
            installed = false;
        }
        clearProxyProperties();
        Authenticator.setDefault(null);
        snapshot = null;
    }

    public static Snapshot getSnapshot() {
        return snapshot;
    }

    public static String describeState() {
        ProxySelector selector = ProxySelector.getDefault();
        return "selector=" + (selector == null ? "null" : selector.getClass().getName())
                + ", http=" + describeHostPort("http.proxyHost", "http.proxyPort")
                + ", https=" + describeHostPort("https.proxyHost", "https.proxyPort");
    }

    private static void applySystemProperties(String host, int port) {
        clearProxyProperties();
        System.setProperty("http.proxyHost", host);
        System.setProperty("http.proxyPort", Integer.toString(port));
        System.setProperty("https.proxyHost", host);
        System.setProperty("https.proxyPort", Integer.toString(port));
    }

    private static void clearProxyProperties() {
        System.clearProperty("http.proxyHost");
        System.clearProperty("http.proxyPort");
        System.clearProperty("https.proxyHost");
        System.clearProperty("https.proxyPort");
    }

    private static String describeHostPort(String hostProperty, String portProperty) {
        String host = System.getProperty(hostProperty);
        String port = System.getProperty(portProperty);
        if (host == null && port == null) {
            return "unset";
        }

        return nullToEmpty(host) + ":" + nullToEmpty(port);
    }

    private static void applyAuthenticator(String username, String password) {
        if (username.isEmpty() && password.isEmpty()) {
            Authenticator.setDefault(null);
            return;
        }

        Authenticator.setDefault(new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                if (getRequestorType() != RequestorType.PROXY) {
                    return null;
                }

                return new PasswordAuthentication(username, password.toCharArray());
            }
        });
    }

    private static Integer parsePort(String value) {
        try {
            int port = Integer.parseInt(trim(value));
            return port >= 1 && port <= 65535 ? port : null;
        } catch (NumberFormatException ex) {
            return null;
        }
    }

    private static String trim(String value) {
        return nullToEmpty(value).trim();
    }

    private static String nullToEmpty(String value) {
        return value == null ? "" : value;
    }

    public static final class Snapshot {
        private final String host;
        private final int port;
        private final String username;
        private final String password;

        private Snapshot(String host, int port, String username, String password) {
            this.host = host;
            this.port = port;
            this.username = username;
            this.password = password;
        }

        public String getHost() {
            return host;
        }

        public int getPort() {
            return port;
        }

        public String getUsername() {
            return username;
        }

        public String getPassword() {
            return password;
        }

        public boolean hasAuthentication() {
            return !username.isEmpty() || !password.isEmpty();
        }
    }

    private static final class FixedProxySelector extends ProxySelector {
        private final List<Proxy> proxies;
        private final Set<String> seenUris = Collections.synchronizedSet(new HashSet<String>());

        private FixedProxySelector(Proxy proxy) {
            proxies = Collections.singletonList(proxy);
        }

        @Override
        public List<Proxy> select(URI uri) {
            Trace currentTrace = trace;
            if (currentTrace != null && uri != null && seenUris.add(describeUri(uri))) {
                currentTrace.onSelect(uri, proxies.get(0));
            }

            return proxies;
        }

        @Override
        public void connectFailed(URI uri, SocketAddress socketAddress, IOException exception) {
            Trace currentTrace = trace;
            if (currentTrace != null) {
                currentTrace.onConnectFailed(uri, socketAddress, exception);
            }
        }

        private static String describeUri(URI uri) {
            return nullToEmpty(uri.getScheme()) + "://" + nullToEmpty(uri.getHost()) + ":" + uri.getPort();
        }
    }
}
