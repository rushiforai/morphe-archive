package com.facebook.ads.redexgen.X;

import java.lang.ref.WeakReference;

/* loaded from: assets/audience_network/classes.dex */
public abstract class G2<T> extends AbstractRunnableC2319oq {
    public final WeakReference<T> A00;

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.G2 != com.facebook.ads.internal.util.common.WeakRunnable<T> */
    public G2(T reference) {
        this.A00 = new WeakReference<>(reference);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.G2 != com.facebook.ads.internal.util.common.WeakRunnable<T> */
    public final T A08() {
        return this.A00.get();
    }
}
