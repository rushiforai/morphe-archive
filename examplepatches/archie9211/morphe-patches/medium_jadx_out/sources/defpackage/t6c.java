package defpackage;

import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import android.net.NetworkRequest;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class t6c extends ConnectivityManager.NetworkCallback {
    public static final t6c a = new t6c();
    public static final Object b = new Object();
    public static final LinkedHashMap c = new LinkedHashMap();
    public static NetworkCapabilities d;
    public static boolean e;
    public static Boolean f;

    public static nbb a(ConnectivityManager connectivityManager, NetworkRequest networkRequest, q58 q58Var) {
        synchronized (b) {
            try {
                LinkedHashMap linkedHashMap = c;
                boolean zIsEmpty = linkedHashMap.isEmpty();
                linkedHashMap.put(q58Var, networkRequest);
                if (zIsEmpty) {
                    d87.h().d(a7f.a, "NetworkRequestConstraintController register shared callback");
                    connectivityManager.registerDefaultNetworkCallback(a);
                } else if (e && f != null) {
                    d87.h().d(a7f.a, "NetworkRequestConstraintController send initial capabilities");
                    NetworkCapabilities networkCapabilities = d;
                    a.getClass();
                    Boolean bool = f;
                    bool.getClass();
                    q58Var.invoke(!bool.booleanValue() && networkRequest.canBeSatisfiedBy(networkCapabilities) ? k72.a : new l72(7));
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        return new nbb(q58Var, 8, connectivityManager);
    }

    public static void b() {
        ArrayList<f09> arrayList = new ArrayList();
        synchronized (b) {
            try {
                if (e && f != null) {
                    for (Map.Entry entry : c.entrySet()) {
                        x45 x45Var = (x45) entry.getKey();
                        NetworkRequest networkRequest = (NetworkRequest) entry.getValue();
                        t6c t6cVar = a;
                        NetworkCapabilities networkCapabilities = d;
                        t6cVar.getClass();
                        Boolean bool = f;
                        bool.getClass();
                        arrayList.add(new f09(x45Var, !bool.booleanValue() && networkRequest.canBeSatisfiedBy(networkCapabilities) ? k72.a : new l72(7)));
                    }
                    for (f09 f09Var : arrayList) {
                        ((x45) f09Var.a).invoke((m72) f09Var.b);
                    }
                    return;
                }
                d87.h().d(a7f.a, "Not dispatching constraint state yet: isBlocked=" + f + ", capabilitiesInitialized=" + e);
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public final void onBlockedStatusChanged(Network network, boolean z) {
        network.getClass();
        d87.h().d(a7f.a, "NetworkRequestConstraintController onBlockedStatusChanged callback " + z);
        synchronized (b) {
            if (g76.L(f, Boolean.valueOf(z))) {
                return;
            }
            f = Boolean.valueOf(z);
            b();
        }
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public final void onCapabilitiesChanged(Network network, NetworkCapabilities networkCapabilities) {
        network.getClass();
        networkCapabilities.getClass();
        d87.h().d(a7f.a, "NetworkRequestConstraintController onCapabilitiesChanged callback");
        synchronized (b) {
            d = networkCapabilities;
            e = true;
        }
        b();
    }

    @Override // android.net.ConnectivityManager.NetworkCallback
    public final void onLost(Network network) {
        network.getClass();
        d87.h().d(a7f.a, "NetworkRequestConstraintController onLost callback");
        synchronized (b) {
            d = null;
            Iterator it2 = c.keySet().iterator();
            while (it2.hasNext()) {
                ((x45) it2.next()).invoke(new l72(7));
            }
        }
    }
}
