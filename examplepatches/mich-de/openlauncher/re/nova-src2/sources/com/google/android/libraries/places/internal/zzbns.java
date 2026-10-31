package com.google.android.libraries.places.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.net.Authenticator;
import java.net.InetAddress;
import java.net.MalformedURLException;
import java.net.PasswordAuthentication;
import java.net.URL;
import java.util.logging.Level;

/* loaded from: classes3.dex */
final class zzbns {
    public static final PasswordAuthentication zza(String str, InetAddress inetAddress, int i5, String str2, String str3, String str4) {
        URL url;
        try {
            url = new URL("https", str, i5, b.f42142b);
        } catch (MalformedURLException unused) {
            zzbnu.zza.logp(Level.WARNING, "io.grpc.internal.ProxyDetectorImpl$1", "requestPasswordAuthentication", "failed to create URL for Authenticator: {0} {1}", new Object[]{"https", str});
            url = null;
        }
        return Authenticator.requestPasswordAuthentication(str, inetAddress, i5, "https", b.f42142b, null, url, Authenticator.RequestorType.PROXY);
    }
}
