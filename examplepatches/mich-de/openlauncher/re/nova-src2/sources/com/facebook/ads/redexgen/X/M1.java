package com.facebook.ads.redexgen.X;

import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;

/* loaded from: assets/audience_network/classes.dex */
public abstract class M1 {
    public static final Map<String, WeakReference<C1245Tb>> A00 = new HashMap();

    public static int A00() {
        return A00.size();
    }

    public static C1245Tb A01(C0958Hi c0958Hi, LA la2, int i5, YJ yj2) {
        C1245Tb c1245Tb = new C1245Tb(c0958Hi, la2, c0958Hi.A02().A0A(), i5);
        c1245Tb.A0h(yj2);
        c1245Tb.A0a();
        A00.put(la2.A1r(), new WeakReference<>(c1245Tb));
        return c1245Tb;
    }

    public static C1245Tb A02(String str) {
        WeakReference<C1245Tb> weakReference = A00.get(str);
        if (weakReference != null) {
            return weakReference.get();
        }
        return null;
    }

    public static void A03(LA la2, C1245Tb c1245Tb) {
        A00.put(la2.A1r(), new WeakReference<>(c1245Tb));
    }

    public static void A04(String str) {
        A00.remove(str);
    }
}
