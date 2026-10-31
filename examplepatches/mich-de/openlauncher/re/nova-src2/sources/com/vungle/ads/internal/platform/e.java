package com.vungle.ads.internal.platform;

import android.content.Context;
import android.hardware.SensorManager;
import android.net.ConnectivityManager;
import android.net.LinkProperties;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.ProxyInfo;
import android.net.Uri;
import android.os.Build;
import android.provider.Settings;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import java.net.ConnectException;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.UnknownHostException;
import java.security.cert.CertificateException;
import java.util.Iterator;
import java.util.Locale;
import javax.net.ssl.SSLException;
import javax.net.ssl.SSLHandshakeException;
import javax.net.ssl.SSLPeerUnverifiedException;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.jvm.internal.Intrinsics;
import r70.k;

/* loaded from: classes4.dex */
public abstract class e {
    public static boolean a() {
        String lowerCase;
        String lowerCase2;
        String lowerCase3;
        String lowerCase4;
        String lowerCase5;
        String str = Build.FINGERPRINT;
        String lowerCase6 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        if (str != null) {
            lowerCase = str.toLowerCase(Locale.ROOT);
            Intrinsics.f(lowerCase, "this as java.lang.String).toLowerCase(Locale.ROOT)");
        } else {
            lowerCase = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        String str2 = Build.MODEL;
        if (str2 != null) {
            lowerCase2 = str2.toLowerCase(Locale.ROOT);
            Intrinsics.f(lowerCase2, "this as java.lang.String).toLowerCase(Locale.ROOT)");
        } else {
            lowerCase2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        String str3 = Build.PRODUCT;
        if (str3 != null) {
            lowerCase3 = str3.toLowerCase(Locale.ROOT);
            Intrinsics.f(lowerCase3, "this as java.lang.String).toLowerCase(Locale.ROOT)");
        } else {
            lowerCase3 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        String str4 = Build.BRAND;
        if (str4 != null) {
            lowerCase4 = str4.toLowerCase(Locale.ROOT);
            Intrinsics.f(lowerCase4, "this as java.lang.String).toLowerCase(Locale.ROOT)");
        } else {
            lowerCase4 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        String str5 = Build.MANUFACTURER;
        if (str5 != null) {
            lowerCase5 = str5.toLowerCase(Locale.ROOT);
            Intrinsics.f(lowerCase5, "this as java.lang.String).toLowerCase(Locale.ROOT)");
        } else {
            lowerCase5 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        String str6 = Build.BOARD;
        if (str6 != null) {
            lowerCase6 = str6.toLowerCase(Locale.ROOT);
            Intrinsics.f(lowerCase6, "this as java.lang.String).toLowerCase(Locale.ROOT)");
        }
        String[] SUPPORTED_ABIS = Build.SUPPORTED_ABIS;
        Intrinsics.f(SUPPORTED_ABIS, "SUPPORTED_ABIS");
        String lowerCase7 = kotlin.collections.c.O0(SUPPORTED_ABIS, null, null, null, null, 63).toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase7, "this as java.lang.String).toLowerCase(Locale.ROOT)");
        return k.K0(lowerCase, "generic", false) || k.K0(lowerCase, "emulator", false) || k.K0(lowerCase2, "google_sdk", false) || k.K0(lowerCase2, "emulator", false) || k.K0(lowerCase3, "sdk", false) || k.K0(lowerCase3, "vbox", false) || k.K0(lowerCase4, "generic", false) || k.K0(lowerCase5, "genymotion", false) || k.K0(lowerCase6, "nox", false) || k.K0(lowerCase7, "x86", false);
    }

    public static String b(Context context) {
        Object objA;
        Intrinsics.g(context, "context");
        if (Build.VERSION.SDK_INT < 28) {
            return "n/a";
        }
        try {
            int i5 = Result.f71687b;
            objA = Settings.Global.getString(context.getContentResolver(), "private_dns_mode");
            if (objA == null) {
                objA = "opportunistic";
            }
            if (objA.equals("hostname")) {
                String string = Settings.Global.getString(context.getContentResolver(), "private_dns_specifier");
                if (string == null) {
                    string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
                }
                objA = "hostname(" + string + ')';
            }
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        if (objA instanceof Result.Failure) {
            objA = "unknown";
        }
        return (String) objA;
    }

    public static int c(Context context) {
        Intrinsics.g(context, "context");
        Object systemService = context.getSystemService("sensor");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.hardware.SensorManager");
        return ((SensorManager) systemService).getSensorList(-1).size();
    }

    public static boolean d(Context context) {
        Intrinsics.g(context, "context");
        return Settings.canDrawOverlays(context);
    }

    public static boolean e(Context context) {
        Object objA;
        boolean zA;
        Intrinsics.g(context, "context");
        try {
            int i5 = Result.f71687b;
            Object systemService = context.getSystemService("connectivity");
            Intrinsics.e(systemService, "null cannot be cast to non-null type android.net.ConnectivityManager");
            ConnectivityManager connectivityManager = (ConnectivityManager) systemService;
            Network activeNetwork = connectivityManager.getActiveNetwork();
            if (activeNetwork == null) {
                zA = false;
            } else {
                LinkProperties linkProperties = connectivityManager.getLinkProperties(activeNetwork);
                zA = a(linkProperties != null ? linkProperties.getHttpProxy() : null);
            }
            objA = Boolean.valueOf(zA);
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Object obj = Boolean.FALSE;
        if (objA instanceof Result.Failure) {
            objA = obj;
        }
        return ((Boolean) objA).booleanValue();
    }

    public static boolean f(Context context) {
        Object objA;
        Intrinsics.g(context, "context");
        try {
            int i5 = Result.f71687b;
            Object systemService = context.getSystemService("connectivity");
            Intrinsics.e(systemService, "null cannot be cast to non-null type android.net.ConnectivityManager");
            ConnectivityManager connectivityManager = (ConnectivityManager) systemService;
            Network[] allNetworks = connectivityManager.getAllNetworks();
            Intrinsics.f(allNetworks, "cm.allNetworks");
            int length = allNetworks.length;
            boolean z11 = false;
            int i11 = 0;
            while (true) {
                if (i11 < length) {
                    NetworkCapabilities networkCapabilities = connectivityManager.getNetworkCapabilities(allNetworks[i11]);
                    if (networkCapabilities != null && networkCapabilities.hasTransport(4)) {
                        z11 = true;
                        break;
                    }
                    i11++;
                } else {
                    break;
                }
            }
            objA = Boolean.valueOf(z11);
        } catch (Throwable th2) {
            int i12 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        Object obj = Boolean.FALSE;
        int i13 = Result.f71687b;
        if (objA instanceof Result.Failure) {
            objA = obj;
        }
        return ((Boolean) objA).booleanValue();
    }

    public static boolean a(ProxyInfo proxyInfo) {
        if (proxyInfo == null) {
            return false;
        }
        String host = proxyInfo.getHost();
        return (host != null && host.length() > 0 && proxyInfo.getPort() > 0) || (proxyInfo.getPacFileUrl() != null && !Intrinsics.b(proxyInfo.getPacFileUrl(), Uri.EMPTY));
    }

    public static String a(Context context) {
        Object objA;
        Intrinsics.g(context, "context");
        try {
            int i5 = Result.f71687b;
            Object systemService = context.getSystemService("connectivity");
            Intrinsics.e(systemService, "null cannot be cast to non-null type android.net.ConnectivityManager");
            ConnectivityManager connectivityManager = (ConnectivityManager) systemService;
            Network activeNetwork = connectivityManager.getActiveNetwork();
            if (activeNetwork == null) {
                objA = "none";
            } else {
                NetworkCapabilities networkCapabilities = connectivityManager.getNetworkCapabilities(activeNetwork);
                if (networkCapabilities == null) {
                    objA = "unknown";
                } else {
                    StringBuilder sb2 = new StringBuilder();
                    if (networkCapabilities.hasTransport(1)) {
                        sb2.append("wifi");
                    } else if (networkCapabilities.hasTransport(0)) {
                        sb2.append("cellular");
                    } else if (networkCapabilities.hasTransport(3)) {
                        sb2.append("ethernet");
                    } else {
                        sb2.append(InneractiveMediationNameConsts.OTHER);
                    }
                    if (networkCapabilities.hasTransport(4)) {
                        sb2.append("+vpn");
                    }
                    if (connectivityManager.isActiveNetworkMetered()) {
                        sb2.append("+metered");
                    }
                    objA = sb2.toString();
                    Intrinsics.f(objA, "StringBuilder().apply(builderAction).toString()");
                }
            }
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            objA = ResultKt.a(th2);
        }
        return (String) (objA instanceof Result.Failure ? "unknown" : objA);
    }

    public static String a(Throwable th2) {
        boolean z11;
        if (th2 == null) {
            return "none";
        }
        Iterator f71970a = q70.d.p0(th2, d.f47351a).getF71970a();
        while (true) {
            if (!f71970a.hasNext()) {
                z11 = false;
                break;
            }
            if (((Throwable) f71970a.next()) instanceof CertificateException) {
                z11 = true;
                break;
            }
        }
        boolean z12 = th2 instanceof SSLHandshakeException;
        if (z12 && z11) {
            return "SSL_CERT_ERROR";
        }
        if (z12) {
            return "SSL_HANDSHAKE";
        }
        if (th2 instanceof SSLPeerUnverifiedException) {
            return "SSL_PEER_UNVERIFIED";
        }
        if (th2 instanceof SSLException) {
            return "SSL_ERROR";
        }
        if (th2 instanceof UnknownHostException) {
            return "DNS_FAILURE";
        }
        if (th2 instanceof ConnectException) {
            return "CONNECT_FAILURE";
        }
        if (th2 instanceof SocketTimeoutException) {
            return "TIMEOUT";
        }
        if (th2 instanceof SocketException) {
            SocketException socketException = (SocketException) th2;
            String message = socketException.getMessage();
            if (message != null && k.K0(message, "reset", true)) {
                return "CONNECTION_RESET";
            }
            String message2 = socketException.getMessage();
            if (message2 != null && k.K0(message2, "abort", true)) {
                return "CONNECTION_ABORT";
            }
            String message3 = socketException.getMessage();
            return (message3 == null || !k.K0(message3, "closed", true)) ? "SOCKET_ERROR" : "CONNECTION_CLOSED";
        }
        return th2.getClass().getSimpleName();
    }
}
