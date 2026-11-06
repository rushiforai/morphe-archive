package app.proxypatches.extension;

/**
 * Starting values from the patch options in Morphe Manager. The "Proxy" patch replaces the body
 * of each method with the user's values. They are only used until the user saves settings in
 * the in-app "Proxy settings" screen (see {@link ProxySettings}).
 */
@SuppressWarnings("unused")
public final class ProxyConfig {
    private ProxyConfig() {}

    /** Proxy hostname or IP address, or empty if not set at patch time. */
    public static String host() {
        return "";
    }

    /** Proxy port. */
    public static int port() {
        return 443;
    }

    /** Proxy type: "http", "https" (TLS to the proxy) or "socks5". */
    public static String type() {
        return "https";
    }

    // No username/password here on purpose: patch options are stored as plain text in the APK,
    // which any app on the phone can read. The login is only entered in the app (ProxySettings).
}
