package jx;

import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.wifi.WifiInfo;

/* loaded from: classes4.dex */
public final class u extends ConnectivityManager.NetworkCallback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ v70.x f70428a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u(v70.x xVar) {
        super(1);
        this.f70428a = xVar;
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public final void onCapabilitiesChanged(Network network, NetworkCapabilities networkCapabilities) {
        WifiInfo wifiInfo = (WifiInfo) networkCapabilities.getTransportInfo();
        ((v70.w) this.f70428a).j(wifiInfo != null ? new w(r70.k.c1(wifiInfo.getSSID())) : new x());
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public final void onLost(Network network) {
        ((v70.w) this.f70428a).j(new x());
    }
}
