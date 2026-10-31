package n10;

import android.net.ConnectivityManager;
import android.net.LinkProperties;
import android.net.Network;
import android.net.NetworkCapabilities;

/* loaded from: classes.dex */
public final class g extends ConnectivityManager.NetworkCallback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ h f77693a;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g(h hVar) {
        super(1);
        this.f77693a = hVar;
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public final void onAvailable(Network network) {
        this.f77693a.f77695b.onAvailable(network);
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public final void onBlockedStatusChanged(Network network, boolean z11) {
        this.f77693a.f77695b.onBlockedStatusChanged(network, z11);
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public final void onCapabilitiesChanged(Network network, NetworkCapabilities networkCapabilities) throws Throwable {
        this.f77693a.f77695b.onCapabilitiesChanged(network, networkCapabilities);
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public final void onLinkPropertiesChanged(Network network, LinkProperties linkProperties) {
        this.f77693a.f77695b.onLinkPropertiesChanged(network, linkProperties);
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public final void onLosing(Network network, int i5) {
        this.f77693a.f77695b.onLosing(network, i5);
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public final void onLost(Network network) throws Throwable {
        this.f77693a.f77695b.onLost(network);
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public final void onUnavailable() {
        this.f77693a.f77695b.onUnavailable();
    }
}
