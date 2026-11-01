package semicoloncolonel.mobilestream.extension.shared.privacy;

import android.annotation.SuppressLint;
import android.app.Application;
import android.app.DownloadManager;
import android.app.job.JobInfo;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.LinkProperties;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkInfo;
import android.net.NetworkRequest;
import android.util.Log;

import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * "Report Wi-Fi connection" and "Hide VPN connection" (both opt-in) runtime.
 *
 * Every app call to the network-state APIs below is rewritten to the static
 * method of the same name here, with the receiver passed first. Each method
 * answers from the real API and then adjusts the answer for whichever of the
 * two patches is enabled. Each patch turns its switch on by overwriting
 * {@link #reportWifi()} or {@link #hideVpn()} to return true.
 *
 * Report Wi-Fi: the active network looks like unmetered Wi-Fi. Cellular
 * transport, the metered flag, cellular NetworkInfo types, the cellular
 * interface name and APN, and Data Saver are hidden, and "Wi-Fi only" or
 * "unmetered only" requirements the app hands to JobScheduler,
 * DownloadManager, or a NetworkRequest are relaxed to any network, since the
 * system enforces those itself.
 *
 * Hide VPN: VPN transport, the NOT_VPN capability, the legacy VPN
 * NetworkInfo, and tun/ppp/ipsec/wireguard interfaces are hidden, so the app
 * sees the network the VPN runs over.
 *
 * Not covered: checks done in native code, and server-side checks of the
 * public IP address. Nothing leaves the device.
 */
@SuppressWarnings({"unused", "deprecation"})
public final class NetworkStateSpoofer {
    private static final String TAG = "MSP-NETWORK";

    private static final String[] VPN_INTERFACE_PREFIXES = {"tun", "ppp", "tap", "ipsec", "wg", "utun"};
    private static final String[] CELLULAR_INTERFACE_PREFIXES = {"rmnet", "ccmni", "pdp", "seth", "v4-rmnet"};

    private static final Set<String> logged = Collections.synchronizedSet(new HashSet<>());

    private NetworkStateSpoofer() {
    }

    /** Overwritten to return true by "Report Wi-Fi connection". */
    public static boolean reportWifi() {
        return false;
    }

    /** Overwritten to return true by "Hide VPN connection". */
    public static boolean hideVpn() {
        return false;
    }

    private static void logOnce(String what) {
        if (logged.add(what)) {
            Log.i(TAG, "spoofed " + what);
        }
    }

    // ── ConnectivityManager ────────────────────────────────────────────────

    public static boolean isActiveNetworkMetered(ConnectivityManager cm) {
        boolean real = cm.isActiveNetworkMetered();
        if (real && reportWifi()) {
            logOnce("isActiveNetworkMetered");
            return false;
        }
        return real;
    }

    public static int getRestrictBackgroundStatus(ConnectivityManager cm) {
        int real = cm.getRestrictBackgroundStatus();
        if (reportWifi() && real != ConnectivityManager.RESTRICT_BACKGROUND_STATUS_DISABLED) {
            logOnce("getRestrictBackgroundStatus");
            return ConnectivityManager.RESTRICT_BACKGROUND_STATUS_DISABLED;
        }
        return real;
    }

    public static NetworkInfo getNetworkInfo(ConnectivityManager cm, int type) {
        if (type == ConnectivityManager.TYPE_VPN && hideVpn()) {
            logOnce("getNetworkInfo(TYPE_VPN)");
            return null;
        }
        if (!reportWifi()) {
            return cm.getNetworkInfo(type);
        }
        if (type == ConnectivityManager.TYPE_WIFI) {
            NetworkInfo wifi = cm.getNetworkInfo(type);
            if (wifi != null && wifi.isConnected()) {
                return wifi;
            }
            // On cellular: answer with the active network, whose type reads as Wi-Fi.
            NetworkInfo active = cm.getActiveNetworkInfo();
            if (active != null && active.isConnected()) {
                logOnce("getNetworkInfo(TYPE_WIFI)");
                return active;
            }
            return wifi;
        }
        if (isMobileType(type)) {
            NetworkInfo mobile = cm.getNetworkInfo(type);
            if (mobile == null || !mobile.isConnected()) {
                return mobile;
            }
            // Cellular is up: answer with a disconnected record instead.
            logOnce("getNetworkInfo(TYPE_MOBILE)");
            NetworkInfo wifi = cm.getNetworkInfo(ConnectivityManager.TYPE_WIFI);
            return wifi != null && !wifi.isConnected() ? wifi : null;
        }
        return cm.getNetworkInfo(type);
    }

    // ── NetworkCapabilities ────────────────────────────────────────────────

    public static boolean hasTransport(NetworkCapabilities caps, int transport) {
        boolean real = caps.hasTransport(transport);
        switch (transport) {
            case NetworkCapabilities.TRANSPORT_WIFI:
                if (!real && reportWifi()) {
                    logOnce("hasTransport(WIFI)");
                    return true;
                }
                return real;
            case NetworkCapabilities.TRANSPORT_CELLULAR:
                if (real && reportWifi()) {
                    logOnce("hasTransport(CELLULAR)");
                    return false;
                }
                return real;
            case NetworkCapabilities.TRANSPORT_VPN:
                if (real && hideVpn()) {
                    logOnce("hasTransport(VPN)");
                    return false;
                }
                return real;
            default:
                return real;
        }
    }

    public static boolean hasCapability(NetworkCapabilities caps, int capability) {
        boolean real = caps.hasCapability(capability);
        if (real) {
            return true;
        }
        if (capability == NetworkCapabilities.NET_CAPABILITY_NOT_METERED && reportWifi()) {
            logOnce("hasCapability(NOT_METERED)");
            return true;
        }
        if (capability == NetworkCapabilities.NET_CAPABILITY_NOT_VPN && hideVpn()) {
            logOnce("hasCapability(NOT_VPN)");
            return true;
        }
        return false;
    }

    // ── NetworkInfo ────────────────────────────────────────────────────────

    public static int getType(NetworkInfo info) {
        int real = info.getType();
        if (reportWifi() && (isMobileType(real) || real == ConnectivityManager.TYPE_VPN)) {
            logOnce("NetworkInfo.getType");
            return ConnectivityManager.TYPE_WIFI;
        }
        if (real == ConnectivityManager.TYPE_VPN && hideVpn()) {
            logOnce("NetworkInfo.getType(VPN)");
            return underlyingIsWifi() ? ConnectivityManager.TYPE_WIFI : ConnectivityManager.TYPE_MOBILE;
        }
        return real;
    }

    public static String getTypeName(NetworkInfo info) {
        int type = getType(info);
        if (type != info.getType()) {
            return type == ConnectivityManager.TYPE_WIFI ? "WIFI" : "MOBILE";
        }
        return info.getTypeName();
    }

    public static int getSubtype(NetworkInfo info) {
        return reportsAsWifi(info) ? 0 : info.getSubtype();
    }

    public static String getSubtypeName(NetworkInfo info) {
        return reportsAsWifi(info) ? "" : info.getSubtypeName();
    }

    /** The APN name of a cellular connection ("fast.t-mobile.com"). */
    public static String getExtraInfo(NetworkInfo info) {
        return reportsAsWifi(info) ? null : info.getExtraInfo();
    }

    private static boolean reportsAsWifi(NetworkInfo info) {
        return reportWifi() && isMobileType(info.getType());
    }

    // ── LinkProperties and network interfaces ──────────────────────────────

    public static String getInterfaceName(LinkProperties properties) {
        String real = properties.getInterfaceName();
        if (real == null) {
            return null;
        }
        if (hideVpn() && startsWithAny(real, VPN_INTERFACE_PREFIXES)) {
            logOnce("getInterfaceName(VPN)");
            return reportWifi() || underlyingIsWifi() ? "wlan0" : "rmnet_data0";
        }
        if (reportWifi() && startsWithAny(real, CELLULAR_INTERFACE_PREFIXES)) {
            logOnce("getInterfaceName(CELLULAR)");
            return "wlan0";
        }
        return real;
    }

    public static Enumeration<NetworkInterface> getNetworkInterfaces() throws SocketException {
        Enumeration<NetworkInterface> real = NetworkInterface.getNetworkInterfaces();
        if (real == null || !hideVpn()) {
            return real;
        }
        List<NetworkInterface> kept = new ArrayList<>();
        while (real.hasMoreElements()) {
            NetworkInterface nif = real.nextElement();
            if (nif.getName() != null && startsWithAny(nif.getName(), VPN_INTERFACE_PREFIXES)) {
                logOnce("getNetworkInterfaces");
                continue;
            }
            kept.add(nif);
        }
        return Collections.enumeration(kept);
    }

    public static NetworkInterface getByName(String name) throws SocketException {
        if (name != null && hideVpn() && startsWithAny(name, VPN_INTERFACE_PREFIXES)) {
            logOnce("NetworkInterface.getByName");
            return null;
        }
        return NetworkInterface.getByName(name);
    }

    // ── Requirements the system enforces ───────────────────────────────────

    public static JobInfo.Builder setRequiredNetworkType(JobInfo.Builder builder, int type) {
        if (type == JobInfo.NETWORK_TYPE_UNMETERED && reportWifi()) {
            logOnce("JobInfo.setRequiredNetworkType");
            type = JobInfo.NETWORK_TYPE_ANY;
        }
        return builder.setRequiredNetworkType(type);
    }

    public static NetworkRequest.Builder addCapability(NetworkRequest.Builder builder, int capability) {
        if (capability == NetworkCapabilities.NET_CAPABILITY_NOT_METERED && reportWifi()) {
            logOnce("NetworkRequest.addCapability(NOT_METERED)");
            return builder;
        }
        return builder.addCapability(capability);
    }

    public static NetworkRequest.Builder addTransportType(NetworkRequest.Builder builder, int transport) {
        if (transport == NetworkCapabilities.TRANSPORT_WIFI && reportWifi()) {
            logOnce("NetworkRequest.addTransportType(WIFI)");
            return builder;
        }
        return builder.addTransportType(transport);
    }

    public static DownloadManager.Request setAllowedNetworkTypes(DownloadManager.Request request, int flags) {
        if ((flags & DownloadManager.Request.NETWORK_WIFI) != 0 && reportWifi()) {
            logOnce("DownloadManager.setAllowedNetworkTypes");
            flags |= DownloadManager.Request.NETWORK_MOBILE;
        }
        return request.setAllowedNetworkTypes(flags);
    }

    public static DownloadManager.Request setAllowedOverMetered(DownloadManager.Request request, boolean allow) {
        if (!allow && reportWifi()) {
            logOnce("DownloadManager.setAllowedOverMetered");
            allow = true;
        }
        return request.setAllowedOverMetered(allow);
    }

    // ── Helpers ────────────────────────────────────────────────────────────

    private static boolean isMobileType(int type) {
        switch (type) {
            case ConnectivityManager.TYPE_MOBILE:
            case ConnectivityManager.TYPE_MOBILE_MMS:
            case ConnectivityManager.TYPE_MOBILE_SUPL:
            case ConnectivityManager.TYPE_MOBILE_DUN:
            case ConnectivityManager.TYPE_MOBILE_HIPRI:
                return true;
            default:
                return false;
        }
    }

    private static boolean startsWithAny(String value, String[] prefixes) {
        for (String prefix : prefixes) {
            if (value.startsWith(prefix)) {
                return true;
            }
        }
        return false;
    }

    /** Whether the real default network has Wi-Fi under it (used when only the VPN is hidden). */
    @SuppressLint({"PrivateApi", "DiscouragedPrivateApi", "MissingPermission"})
    private static boolean underlyingIsWifi() {
        try {
            Application app = (Application) Class.forName("android.app.ActivityThread")
                    .getMethod("currentApplication")
                    .invoke(null);
            if (app == null) {
                return false;
            }
            ConnectivityManager cm = (ConnectivityManager) app.getSystemService(Context.CONNECTIVITY_SERVICE);
            Network network = cm.getActiveNetwork();
            NetworkCapabilities caps = network != null ? cm.getNetworkCapabilities(network) : null;
            return caps != null && caps.hasTransport(NetworkCapabilities.TRANSPORT_WIFI);
        } catch (Throwable t) {
            return false;
        }
    }
}
