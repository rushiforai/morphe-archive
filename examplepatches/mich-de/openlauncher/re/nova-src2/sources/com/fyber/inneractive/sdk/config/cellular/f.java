package com.fyber.inneractive.sdk.config.cellular;

import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkCapabilities;
import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.a1;
import com.fyber.inneractive.sdk.util.k;

/* loaded from: classes3.dex */
public final class f extends ConnectivityManager.NetworkCallback {

    /* renamed from: a, reason: collision with root package name */
    public h f27786a;

    /* renamed from: b, reason: collision with root package name */
    public final ConnectivityManager f27787b;

    public f(ConnectivityManager connectivityManager, h hVar) {
        this.f27786a = hVar;
        this.f27787b = connectivityManager;
    }

    public final void a() {
        this.f27786a = null;
        ConnectivityManager connectivityManager = this.f27787b;
        if (connectivityManager != null) {
            try {
                connectivityManager.unregisterNetworkCallback(this);
            } catch (Throwable th2) {
                IAlog.a("failed to unregister network callback", th2, new Object[0]);
            }
        }
    }

    public final void b() {
        ConnectivityManager connectivityManager = this.f27787b;
        if (connectivityManager != null) {
            try {
                connectivityManager.registerDefaultNetworkCallback(this);
            } catch (Throwable th2) {
                IAlog.a("failed to register network callback", th2, new Object[0]);
            }
        }
    }

    public final void c() {
        ConnectivityManager connectivityManager = this.f27787b;
        if (connectivityManager != null) {
            try {
                connectivityManager.unregisterNetworkCallback(this);
            } catch (Throwable th2) {
                IAlog.a("failed to unregister network callback", th2, new Object[0]);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:24:0x003b  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x003b A[FALL_THROUGH] */
    @Override // android.net.ConnectivityManager.NetworkCallback
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onCapabilitiesChanged(Network network, NetworkCapabilities networkCapabilities) {
        a1 a1Var = a1.UNKNOWN;
        if (networkCapabilities.hasTransport(3)) {
            a1Var = a1.ETHERNET;
        } else if (networkCapabilities.hasTransport(0)) {
            int iH = k.h();
            if (iH != 0) {
                if (iH == 3) {
                    a1Var = a1.MOBILE_3G;
                } else if (iH == 18) {
                    a1Var = a1.WIFI;
                } else if (iH == 20) {
                    a1Var = a1.MOBILE_5G;
                } else if (iH != 5 && iH != 6) {
                    switch (iH) {
                        default:
                            switch (iH) {
                                case 12:
                                case 14:
                                case 15:
                                    break;
                                case 13:
                                    a1Var = a1.MOBILE_4G;
                                    break;
                                default:
                                    a1Var = a1.CELLULAR;
                                    break;
                            }
                        case 8:
                        case 9:
                        case 10:
                            break;
                    }
                }
            }
        } else if (networkCapabilities.hasTransport(1)) {
            a1Var = a1.WIFI;
        }
        h hVar = this.f27786a;
        if (hVar != null) {
            hVar.a(a1Var);
        }
    }
}
