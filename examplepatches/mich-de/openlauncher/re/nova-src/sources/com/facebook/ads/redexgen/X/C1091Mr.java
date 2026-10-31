package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* renamed from: com.facebook.ads.redexgen.X.Mr, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public final class C1091Mr<V> {
    public int A00;
    public int A01;
    public long[] A02;
    public V[] A03;

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Mr != com.facebook.ads.androidx.media3.common.util.TimedValueQueue<V> */
    public C1091Mr() {
        this(10);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Mr != com.facebook.ads.androidx.media3.common.util.TimedValueQueue<V> */
    public C1091Mr(int i5) {
        this.A02 = new long[i5];
        this.A03 = (V[]) A00(i5);
    }

    public static <V> V[] A00(int i5) {
        return (V[]) new Object[i5];
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Mr != com.facebook.ads.androidx.media3.common.util.TimedValueQueue<V> */
    public final synchronized void A01() {
        this.A00 = 0;
        this.A01 = 0;
        Arrays.fill(this.A03, (Object) null);
    }
}
