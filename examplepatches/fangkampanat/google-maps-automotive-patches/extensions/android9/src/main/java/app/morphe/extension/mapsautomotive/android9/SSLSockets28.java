package app.morphe.extension.mapsautomotive.android9;

import android.net.ssl.SSLSockets;
import android.os.Build;

import javax.net.ssl.SSLSocket;

/**
 * SSLSockets, an Android 10 class with only static methods (patch "Android 9 (API 28)"). Maps only calls them, so they
 * are routed here instead of shipping the class (javac cannot build android.net.ssl, a package of the JDK image's
 * java.base). On Android 9 no socket is supported: OkHttp's Android 10 socket adapter does not take the socket and the
 * connection uses plain TLS without ALPN (HTTP/1.1). setEchConfigList (Android 17, EchConfigList) is not routed:
 * Maps calls it only on Android 17 and newer.
 */
public final class SSLSockets28 {
    public static final String OWNER = "Landroid/net/ssl/SSLSockets;";

    private SSLSockets28() {
    }

    public static boolean isSupportedSocket(SSLSocket socket) {
        if (Build.VERSION.SDK_INT >= 29) return SSLSockets.isSupportedSocket(socket);
        return false;
    }

    public static void setUseSessionTickets(SSLSocket socket, boolean useSessionTickets) {
        if (Build.VERSION.SDK_INT >= 29) SSLSockets.setUseSessionTickets(socket, useSessionTickets);
    }
}
