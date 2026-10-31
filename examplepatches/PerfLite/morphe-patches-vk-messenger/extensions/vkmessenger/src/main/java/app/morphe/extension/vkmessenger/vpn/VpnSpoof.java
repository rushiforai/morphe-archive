package app.morphe.extension.vkmessenger.vpn;

import android.net.ConnectivityManager;
import android.net.NetworkCapabilities;
import android.net.NetworkInfo;

/**
 * Spoofs Android network checks so VK Messenger and embedded libraries cannot detect active VPN or proxy connections.
 */
@SuppressWarnings("unused")
public final class VpnSpoof {
    public static final int TRANSPORT_VPN = 4;
    public static final int NET_CAPABILITY_NOT_VPN = 15;
    public static final int TYPE_VPN = 17;

    /**
     * Intercepts NetworkCapabilities.hasTransport(int).
     * Always returns false for TRANSPORT_VPN (4) so VK believes the connection is not a VPN.
     */
    public static boolean hasTransport(NetworkCapabilities caps, int transport) {
        if (transport == TRANSPORT_VPN) {
            return false;
        }
        return caps != null && caps.hasTransport(transport);
    }

    /**
     * Intercepts NetworkCapabilities.hasCapability(int).
     * Always returns true for NET_CAPABILITY_NOT_VPN (15) indicating no VPN is in use.
     */
    public static boolean hasCapability(NetworkCapabilities caps, int capability) {
        if (capability == NET_CAPABILITY_NOT_VPN) {
            return true;
        }
        return caps != null && caps.hasCapability(capability);
    }

    /**
     * Intercepts ConnectivityManager.getNetworkInfo(int).
     * Always returns null for TYPE_VPN (17) to hide active VPN network info.
     */
    @android.annotation.SuppressLint("MissingPermission")
    public static NetworkInfo getNetworkInfo(ConnectivityManager cm, int networkType) {
        if (networkType == TYPE_VPN) {
            return null;
        }
        return cm != null ? cm.getNetworkInfo(networkType) : null;
    }

    /**
     * Intercepts System.getProperty(String).
     * Masks proxy-related system properties (http.proxyHost, etc.).
     */
    public static String getSystemProperty(String key) {
        if (isProxyProperty(key)) {
            return null;
        }
        return System.getProperty(key);
    }

    /**
     * Intercepts System.getProperty(String, String).
     * Masks proxy-related system properties.
     */
    public static String getSystemProperty(String key, String def) {
        if (isProxyProperty(key)) {
            return def;
        }
        return System.getProperty(key, def);
    }

    private static boolean isProxyProperty(String key) {
        if (key == null) {
            return false;
        }
        return key.equals("http.proxyHost") ||
               key.equals("https.proxyHost") ||
               key.equals("http.proxyPort") ||
               key.equals("https.proxyPort") ||
               key.equals("socksProxyHost") ||
               key.equals("socksProxyPort") ||
               key.equals("http.nonProxyHosts") ||
               key.equals("https.nonProxyHosts");
    }
}
