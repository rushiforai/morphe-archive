package defpackage;

import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j16 extends ConnectivityManager.NetworkCallback {
    public static final /* synthetic */ int c = 0;
    public final /* synthetic */ int a = 0;
    public final Object b;

    public j16(re8 re8Var) {
        this.b = re8Var;
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public void onBlockedStatusChanged(Network network, boolean z) {
        switch (this.a) {
            case 1:
                network.getClass();
                if (network.equals(((re8) this.b).f.getActiveNetwork())) {
                    d87.h().d(pe8.a, "Network blocked status changed: " + z);
                    re8 re8Var = (re8) this.b;
                    Object objC = re8Var.d;
                    if (objC == null) {
                        objC = re8Var.c();
                    }
                    oe8 oe8Var = (oe8) objC;
                    re8 re8Var2 = (re8) this.b;
                    synchronized (re8Var2.g) {
                        if (re8Var2.h == z) {
                            return;
                        }
                        re8Var2.h = z;
                        ((re8) this.b).d(new oe8(oe8Var.a, oe8Var.b, oe8Var.c, oe8Var.d, z));
                        return;
                    }
                }
                return;
            default:
                super.onBlockedStatusChanged(network, z);
                return;
        }
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public final void onCapabilitiesChanged(Network network, NetworkCapabilities networkCapabilities) throws Exception {
        int i = this.a;
        network.getClass();
        networkCapabilities.getClass();
        switch (i) {
            case 0:
                d87.h().d(a7f.a, "NetworkRequestConstraintController onCapabilitiesChanged callback");
                ((q58) this.b).invoke(k72.a);
                break;
            default:
                d87.h().d(pe8.a, "Network capabilities changed: " + networkCapabilities);
                re8 re8Var = (re8) this.b;
                re8Var.d(pe8.a(re8Var.f, re8Var.h));
                break;
        }
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public final void onLost(Network network) throws Exception {
        int i = this.a;
        Object obj = this.b;
        network.getClass();
        switch (i) {
            case 0:
                d87.h().d(a7f.a, "NetworkRequestConstraintController onLost callback");
                ((q58) obj).invoke(new l72(7));
                break;
            default:
                d87.h().d(pe8.a, "Network connection lost");
                ((re8) obj).d(new oe8(false, false, false, false, false));
                break;
        }
    }

    public j16(q58 q58Var) {
        this.b = q58Var;
    }
}
