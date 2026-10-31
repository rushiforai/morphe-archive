package com.facebook.ads.redexgen.X;

import java.util.Collections;
import java.util.Set;
import java.util.WeakHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;

/* renamed from: com.facebook.ads.redexgen.X.oi, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2311oi {
    public static final Set<Object> A00 = Collections.newSetFromMap(new WeakHashMap());
    public static final AtomicBoolean A01 = new AtomicBoolean(true);
    public static final AtomicReference<InterfaceC2309og> A02 = new AtomicReference<>();

    public static void A00(Throwable th2, Object obj) throws Throwable {
        if (A01.get()) {
            A00.add(obj);
            AbstractC2326ox.A00().ABf(3306, th2);
            InterfaceC2309og contextRepairHelper = A02.get();
            if (contextRepairHelper != null) {
                contextRepairHelper.AJr(th2, obj);
                return;
            }
            return;
        }
        throw th2;
    }

    public static void A01(boolean z11, InterfaceC2309og interfaceC2309og) {
        A01.set(z11);
        A02.set(interfaceC2309og);
    }

    public static boolean A02(Object obj) {
        return A00.contains(obj);
    }
}
