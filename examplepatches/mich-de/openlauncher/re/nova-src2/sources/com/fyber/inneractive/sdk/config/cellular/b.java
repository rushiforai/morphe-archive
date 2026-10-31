package com.fyber.inneractive.sdk.config.cellular;

import android.telephony.TelephonyCallback;
import android.telephony.TelephonyDisplayInfo;
import android.telephony.TelephonyManager;
import com.fyber.inneractive.sdk.util.a1;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/* loaded from: classes.dex */
public final class b extends TelephonyCallback implements TelephonyCallback.DisplayInfoListener {

    /* renamed from: a, reason: collision with root package name */
    public final ExecutorService f27779a = Executors.newSingleThreadExecutor();

    /* renamed from: b, reason: collision with root package name */
    public h f27780b;

    /* renamed from: c, reason: collision with root package name */
    public final TelephonyManager f27781c;

    public b(TelephonyManager telephonyManager, h hVar) {
        this.f27781c = telephonyManager;
        this.f27780b = hVar;
    }

    public final void a() {
        this.f27780b = null;
        TelephonyManager telephonyManager = this.f27781c;
        if (telephonyManager != null) {
            telephonyManager.unregisterTelephonyCallback(this);
        }
        this.f27779a.shutdownNow();
    }

    public final void b() {
        TelephonyManager telephonyManager = this.f27781c;
        if (telephonyManager != null) {
            telephonyManager.registerTelephonyCallback(this.f27779a, this);
        }
    }

    public final void c() {
        TelephonyManager telephonyManager = this.f27781c;
        if (telephonyManager != null) {
            telephonyManager.unregisterTelephonyCallback(this);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x0034  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0034 A[FALL_THROUGH] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onDisplayInfoChanged(TelephonyDisplayInfo telephonyDisplayInfo) {
        a1 a1Var;
        int networkType = telephonyDisplayInfo.getNetworkType();
        int overrideNetworkType = telephonyDisplayInfo.getOverrideNetworkType();
        if (overrideNetworkType == 2 || overrideNetworkType == 3 || overrideNetworkType == 5) {
            a1Var = a1.MOBILE_5G;
        } else if (networkType == 0) {
            a1Var = a1.UNKNOWN;
        } else if (networkType == 3) {
            a1Var = a1.MOBILE_3G;
        } else if (networkType == 18) {
            a1Var = a1.WIFI;
        } else if (networkType == 20) {
            a1Var = a1.MOBILE_5G;
        } else if (networkType != 5 && networkType != 6) {
            switch (networkType) {
                default:
                    switch (networkType) {
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
        h hVar = this.f27780b;
        if (hVar != null) {
            hVar.a(a1Var);
        }
    }
}
