package defpackage;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p41 extends ConnectivityManager.NetworkCallback implements ge8 {
    public final l01 a;
    public final f66 b;
    public volatile fe8 c;

    public p41(f66 f66Var) {
        l01.a.getClass();
        j01 j01Var = k01.b;
        f66Var.getClass();
        this.a = j01Var;
        this.b = f66Var;
        this.c = new fe8(null, null, null, null, null, null, null, 127);
    }

    @Override // defpackage.ge8
    public final fe8 K0() {
        return this.c;
    }

    @Override // defpackage.ge8
    public final void a(Context context) {
        Object systemService = context.getSystemService("connectivity");
        ConnectivityManager connectivityManager = systemService instanceof ConnectivityManager ? (ConnectivityManager) systemService : null;
        if (connectivityManager == null) {
            f49.K(this.b, d66.ERROR, e66.USER, co.x, null, false, 56);
            return;
        }
        try {
            connectivityManager.unregisterNetworkCallback(this);
        } catch (SecurityException e) {
            f49.K(this.b, d66.ERROR, e66.USER, co.y, e, false, 48);
        } catch (RuntimeException e2) {
            f49.K(this.b, d66.ERROR, e66.USER, co.z, e2, false, 48);
        }
    }

    @Override // defpackage.ge8
    public final void l0(Context context) {
        context.getClass();
        Object systemService = context.getSystemService("connectivity");
        ConnectivityManager connectivityManager = systemService instanceof ConnectivityManager ? (ConnectivityManager) systemService : null;
        if (connectivityManager == null) {
            f49.K(this.b, d66.ERROR, e66.USER, co.u, null, false, 56);
            return;
        }
        try {
            connectivityManager.registerDefaultNetworkCallback(this);
            Network activeNetwork = connectivityManager.getActiveNetwork();
            NetworkCapabilities networkCapabilities = connectivityManager.getNetworkCapabilities(activeNetwork);
            if (activeNetwork == null || networkCapabilities == null) {
                return;
            }
            onCapabilitiesChanged(activeNetwork, networkCapabilities);
        } catch (SecurityException e) {
            f49.K(this.b, d66.ERROR, e66.USER, co.v, e, false, 48);
            this.c = new fe8(ee8.NETWORK_OTHER, null, null, null, null, null, null, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
        } catch (Exception e2) {
            f49.K(this.b, d66.ERROR, e66.USER, co.w, e2, false, 48);
            this.c = new fe8(ee8.NETWORK_OTHER, null, null, null, null, null, null, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
        }
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public final void onCapabilitiesChanged(Network network, NetworkCapabilities networkCapabilities) {
        network.getClass();
        networkCapabilities.getClass();
        super.onCapabilitiesChanged(network, networkCapabilities);
        ee8 ee8Var = networkCapabilities.hasTransport(1) ? ee8.NETWORK_WIFI : networkCapabilities.hasTransport(3) ? ee8.NETWORK_ETHERNET : networkCapabilities.hasTransport(0) ? ee8.NETWORK_CELLULAR : networkCapabilities.hasTransport(2) ? ee8.NETWORK_BLUETOOTH : ee8.NETWORK_OTHER;
        Long lValueOf = null;
        Long lValueOf2 = networkCapabilities.getLinkUpstreamBandwidthKbps() > 0 ? Long.valueOf(networkCapabilities.getLinkUpstreamBandwidthKbps()) : null;
        Long lValueOf3 = networkCapabilities.getLinkDownstreamBandwidthKbps() > 0 ? Long.valueOf(networkCapabilities.getLinkDownstreamBandwidthKbps()) : null;
        if (((j01) this.a).e && networkCapabilities.getSignalStrength() != Integer.MIN_VALUE) {
            lValueOf = Long.valueOf(networkCapabilities.getSignalStrength());
        }
        this.c = new fe8(ee8Var, null, null, lValueOf2, lValueOf3, lValueOf, null, 70);
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public final void onLost(Network network) {
        network.getClass();
        super.onLost(network);
        this.c = new fe8(ee8.NETWORK_NOT_CONNECTED, null, null, null, null, null, null, ReconyxHyperFire2MakernoteDirectory.TAG_SERIAL_NUMBER);
    }
}
