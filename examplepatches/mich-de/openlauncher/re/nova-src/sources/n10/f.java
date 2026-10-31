package n10;

import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.wifi.WifiInfo;
import android.os.Build;
import db0.b0;
import db0.c0;
import db0.e0;
import db0.f0;
import db0.m;
import db0.n0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class f extends ConnectivityManager.NetworkCallback {

    /* renamed from: a, reason: collision with root package name */
    public int f77690a = -1;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ h f77691b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ n0 f77692c;

    public f(h hVar, n0 n0Var) {
        this.f77691b = hVar;
        this.f77692c = n0Var;
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public final void onCapabilitiesChanged(Network network, NetworkCapabilities networkCapabilities) throws Throwable {
        WifiInfo wifiInfo;
        if (Build.VERSION.SDK_INT < 29 || (wifiInfo = (WifiInfo) networkCapabilities.getTransportInfo()) == null || this.f77690a == wifiInfo.getNetworkId()) {
            return;
        }
        m mVar = c0.Companion;
        String ssid = wifiInfo.getSSID();
        int networkId = wifiInfo.getNetworkId();
        long jCurrentTimeMillis = System.currentTimeMillis();
        mVar.getClass();
        f0.Companion.getClass();
        this.f77692c.invoke(new b0(true, e0.a(ssid), networkId, jCurrentTimeMillis));
        this.f77690a = wifiInfo.getNetworkId();
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public final void onLost(Network network) throws Throwable {
        if (Build.VERSION.SDK_INT < 29) {
            return;
        }
        ConnectivityManager connectivityManager = this.f77691b.f77698e;
        Intrinsics.d(connectivityManager);
        NetworkCapabilities networkCapabilities = connectivityManager.getNetworkCapabilities(network);
        WifiInfo wifiInfo = (WifiInfo) (networkCapabilities != null ? networkCapabilities.getTransportInfo() : null);
        if (wifiInfo != null) {
            this.f77690a = -1;
            m mVar = c0.Companion;
            String ssid = wifiInfo.getSSID();
            int networkId = wifiInfo.getNetworkId();
            long jCurrentTimeMillis = System.currentTimeMillis();
            mVar.getClass();
            f0.Companion.getClass();
            this.f77692c.invoke(new b0(false, e0.a(ssid), networkId, jCurrentTimeMillis));
        }
    }
}
