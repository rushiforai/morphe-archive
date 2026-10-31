package com.fyber.inneractive.sdk.util;

import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import com.fyber.inneractive.sdk.config.IAConfigManager;

/* loaded from: classes.dex */
public enum a1 {
    UNKNOWN(com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b),
    ETHERNET("3g"),
    WIFI("wifi"),
    MOBILE_3G("3g"),
    MOBILE_4G("4g"),
    MOBILE_5G("5g"),
    CELLULAR("Cellular");

    final String key;

    a1(String str) {
        this.key = str;
    }

    /* JADX WARN: Removed duplicated region for block: B:46:0x006e  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x006e A[FALL_THROUGH] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public static a1 a() {
        a1 a1Var;
        NetworkInfo activeNetworkInfo;
        int type = (!o.a("android.permission.ACCESS_NETWORK_STATE") || (activeNetworkInfo = ((ConnectivityManager) o.f31210a.getSystemService("connectivity")).getActiveNetworkInfo()) == null) ? 8 : activeNetworkInfo.getType();
        if (type == 9) {
            return ETHERNET;
        }
        if (type != 0) {
            if (type == 1) {
                return WIFI;
            }
            if (type != 2 && type != 3 && type != 4 && type != 5) {
                return UNKNOWN;
            }
        }
        com.fyber.inneractive.sdk.config.cellular.a aVar = IAConfigManager.Q.O;
        if (aVar == null || aVar.f27776a == null) {
            int iH = k.h();
            if (iH == 0) {
                a1Var = UNKNOWN;
            } else if (iH == 3) {
                a1Var = MOBILE_3G;
            } else if (iH == 18) {
                a1Var = WIFI;
            } else if (iH == 20) {
                a1Var = MOBILE_5G;
            } else if (iH != 5 && iH != 6) {
                switch (iH) {
                    default:
                        switch (iH) {
                            case 12:
                            case 14:
                            case 15:
                                break;
                            case 13:
                                a1Var = MOBILE_4G;
                                break;
                            default:
                                a1Var = CELLULAR;
                                break;
                        }
                    case 8:
                    case 9:
                    case 10:
                        break;
                }
            }
        } else {
            a1Var = aVar.f27777b;
        }
        return a1Var == UNKNOWN ? k.h() == 13 ? MOBILE_4G : MOBILE_3G : a1Var;
    }

    public final String b() {
        return this.key;
    }
}
