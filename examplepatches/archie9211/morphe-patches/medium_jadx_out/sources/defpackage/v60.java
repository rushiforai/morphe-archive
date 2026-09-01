package defpackage;

import android.app.Application;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.os.Build;
import com.google.android.recaptcha.internal.zzfx;
import j$.util.concurrent.ConcurrentHashMap;
import java.util.LinkedHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class v60 {
    public final Context a;

    public v60(Application application) {
        this.a = application;
        new ConcurrentHashMap();
        LinkedHashMap linkedHashMapR = ei7.R(new f09(0, xpf.NET_CAPABILITY_MMS), new f09(1, xpf.NET_CAPABILITY_SUPL), new f09(2, xpf.NET_CAPABILITY_DUN), new f09(3, xpf.NET_CAPABILITY_FOTA), new f09(4, xpf.NET_CAPABILITY_IMS), new f09(5, xpf.NET_CAPABILITY_CBS), new f09(6, xpf.NET_CAPABILITY_WIFI_P2P), new f09(7, xpf.NET_CAPABILITY_IA), new f09(8, xpf.NET_CAPABILITY_RCS), new f09(9, xpf.NET_CAPABILITY_XCAP), new f09(10, xpf.NET_CAPABILITY_EIMS), new f09(11, xpf.NET_CAPABILITY_NOT_METERED), new f09(12, xpf.NET_CAPABILITY_INTERNET), new f09(13, xpf.NET_CAPABILITY_NOT_RESTRICTED), new f09(14, xpf.NET_CAPABILITY_TRUSTED), new f09(15, xpf.NET_CAPABILITY_NOT_VPN));
        linkedHashMapR.put(17, xpf.NET_CAPABILITY_CAPTIVE_PORTAL);
        linkedHashMapR.put(16, xpf.NET_CAPABILITY_VALIDATED);
        int i = Build.VERSION.SDK_INT;
        if (i >= 28) {
            linkedHashMapR.put(18, xpf.NET_CAPABILITY_NOT_ROAMING);
            linkedHashMapR.put(19, xpf.NET_CAPABILITY_FOREGROUND);
            linkedHashMapR.put(20, xpf.NET_CAPABILITY_NOT_CONGESTED);
            linkedHashMapR.put(21, xpf.NET_CAPABILITY_NOT_SUSPENDED);
        }
        if (i >= 29) {
            linkedHashMapR.put(23, xpf.NET_CAPABILITY_MCX);
        }
        if (i >= 30) {
            linkedHashMapR.put(25, xpf.NET_CAPABILITY_TEMPORARILY_NOT_METERED);
        }
        if (i >= 31) {
            linkedHashMapR.put(32, xpf.NET_CAPABILITY_HEAD_UNIT);
            linkedHashMapR.put(29, xpf.NET_CAPABILITY_ENTERPRISE);
        }
        if (i >= 33) {
            linkedHashMapR.put(35, xpf.NET_CAPABILITY_PRIORITIZE_BANDWIDTH);
            linkedHashMapR.put(34, xpf.NET_CAPABILITY_PRIORITIZE_LATENCY);
            linkedHashMapR.put(33, xpf.NET_CAPABILITY_MMTEL);
        }
    }

    public zzfx a(Exception exc, zzfx zzfxVar) {
        NetworkCapabilities networkCapabilities;
        try {
            Object systemService = this.a.getSystemService("connectivity");
            systemService.getClass();
            ConnectivityManager connectivityManager = (ConnectivityManager) systemService;
            Network activeNetwork = connectivityManager.getActiveNetwork();
            if (activeNetwork != null && (networkCapabilities = connectivityManager.getNetworkCapabilities(activeNetwork)) != null) {
                if (networkCapabilities.hasCapability(16)) {
                    return zzfxVar;
                }
            }
        } catch (Exception unused) {
        }
        return new zzfx(d87.U0, d87.C, exc.getMessage(), 8);
    }
}
