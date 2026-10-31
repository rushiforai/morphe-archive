package com.facebook.ads.redexgen.X;

import android.os.Handler;
import android.os.Looper;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;

/* renamed from: com.facebook.ads.redexgen.X.ps, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C2380ps {
    public static String[] A05 = {"W6VRHda5gtLUaPITsfC2cAClSG72uAjU", "InoKloHDgq0CcxOKOjQiUbO9bflNgMc6", "vgOlHPB", "HwmPNB85GvgAoMoeYjamrZVzdR67lGy5", "97hqk2lgYZuMaDxZXyhsH", "HXsRqxuQhTkLhvYebPxTHkiqTIKIJvDr", "Ck564rSLCSvbweXx55nzkdwgcjUocV6X", b.f42142b};
    public boolean A00 = false;
    public final Handler A01 = new Handler(Looper.getMainLooper());
    public final LA A02;
    public final C0958Hi A03;
    public final InterfaceC2378pq A04;

    public C2380ps(C0958Hi c0958Hi, LA la2, InterfaceC2378pq interfaceC2378pq) {
        this.A03 = c0958Hi;
        this.A04 = interfaceC2378pq;
        this.A02 = la2;
    }

    public static C2380ps A00(C0958Hi c0958Hi, LA la2, InterfaceC2378pq interfaceC2378pq) {
        Object objA0I = c0958Hi.A0I();
        if (objA0I == null) {
            objA0I = new C2380ps(c0958Hi, la2, interfaceC2378pq);
            c0958Hi.A0P(objA0I);
        }
        C2380ps c2380ps = (C2380ps) objA0I;
        if (A05[7].length() == 7) {
            throw new RuntimeException();
        }
        String[] strArr = A05;
        strArr[1] = "ORnMxFNfeMb5MzGsY9WSDmc8ng0pMJPu";
        strArr[4] = "9RL1elpbdMmSftIqEAaOH";
        return c2380ps;
    }

    public static boolean A01(C0958Hi c0958Hi) {
        if (C2203mv.A1g(c0958Hi)) {
            boolean zA0J = C2347pK.A0J(c0958Hi);
            if (A05[7].length() == 7) {
                throw new RuntimeException();
            }
            A05[5] = "ksJFyNHjKkO0Jin5EGXZGwAyRPDGXujW";
            if (zA0J) {
                return true;
            }
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0033  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final C2379pr A02(LA la2) {
        boolean z11;
        if (C2203mv.A1m(this.A03)) {
            z11 = la2.A2O() && A01(this.A03);
            return new C2379pr(z11, z11);
        }
        boolean zA2O = la2.A2O();
        if (zA2O) {
            boolean shouldCreativeBeClickable = A01(this.A03);
            z11 = shouldCreativeBeClickable;
        }
        return new C2379pr(zA2O, z11);
    }

    public final void A03() {
        this.A00 = false;
        this.A01.removeCallbacksAndMessages(null);
    }
}
