package app.morphe.extension.mapsautomotive.android9;

import android.os.Build;

import javax.net.ssl.SSLParameters;

/** SSLParameters.setApplicationProtocols (patch "Android 9 (API 28)"): no ALPN through it on Android 9. */
public final class SSLParameters28 {
    public static final String OWNER = "Ljavax/net/ssl/SSLParameters;";

    private SSLParameters28() {
    }

    public static void setApplicationProtocols(SSLParameters parameters, String[] protocols) {
        if (Build.VERSION.SDK_INT >= 29) parameters.setApplicationProtocols(protocols);
    }
}
