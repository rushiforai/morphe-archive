package com.facebook.ads.redexgen.X;

import java.util.concurrent.atomic.AtomicBoolean;
import javax.annotation.Nullable;

/* renamed from: com.facebook.ads.redexgen.X.gJ, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC1802gJ {

    @Nullable
    public static HandlerC1801gI A00;
    public static final AtomicBoolean A01 = new AtomicBoolean();

    public static HandlerC1801gI A00(C0957Hh c0957Hh) {
        if (A00 == null) {
            A00 = new HandlerC1801gI(c0957Hh);
        }
        return A00;
    }

    public static void A01(C0957Hh c0957Hh) {
        if (AbstractC2206my.A0M(c0957Hh)) {
            A03(c0957Hh);
        }
    }

    public static void A02(C0957Hh c0957Hh) {
        if (AbstractC2206my.A0L(c0957Hh)) {
            A03(c0957Hh);
        }
    }

    public static void A03(C0957Hh c0957Hh) {
        if (A01.compareAndSet(false, true)) {
            ExecutorC2419qV.A01.execute(new C1005Je(c0957Hh));
        }
    }
}
