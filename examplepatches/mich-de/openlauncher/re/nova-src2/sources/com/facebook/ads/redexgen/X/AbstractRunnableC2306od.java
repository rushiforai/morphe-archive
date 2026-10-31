package com.facebook.ads.redexgen.X;

import java.util.concurrent.atomic.AtomicReference;

/* renamed from: com.facebook.ads.redexgen.X.od, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractRunnableC2306od implements Runnable {
    public static final AtomicReference<Throwable> A00 = new AtomicReference<>();

    public abstract void A01();

    public static Throwable A00() {
        return A00.get();
    }

    @Override // java.lang.Runnable
    public final void run() {
        try {
            A01();
        } catch (Throwable th2) {
            A00.set(th2);
            throw th2;
        }
    }
}
