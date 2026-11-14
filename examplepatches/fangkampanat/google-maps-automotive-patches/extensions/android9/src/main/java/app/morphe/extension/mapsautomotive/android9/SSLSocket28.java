package app.morphe.extension.mapsautomotive.android9;

import android.os.Build;

import javax.net.ssl.SSLSocket;

/** SSLSocket.getApplicationProtocol (patch "Android 9 (API 28)"): no protocol negotiated through it on Android 9. */
public final class SSLSocket28 {
    public static final String OWNER = "Ljavax/net/ssl/SSLSocket;";

    private SSLSocket28() {
    }

    public static String getApplicationProtocol(SSLSocket socket) {
        if (Build.VERSION.SDK_INT >= 29) return socket.getApplicationProtocol();
        return null;
    }
}
