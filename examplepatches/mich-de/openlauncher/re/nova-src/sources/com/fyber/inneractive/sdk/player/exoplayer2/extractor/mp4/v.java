package com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp4;

/* loaded from: classes3.dex */
public final class v {

    /* renamed from: a, reason: collision with root package name */
    public final int f29650a;

    /* renamed from: b, reason: collision with root package name */
    public final long[] f29651b;

    /* renamed from: c, reason: collision with root package name */
    public final int[] f29652c;

    /* renamed from: d, reason: collision with root package name */
    public final int f29653d;

    /* renamed from: e, reason: collision with root package name */
    public final long[] f29654e;

    /* renamed from: f, reason: collision with root package name */
    public final int[] f29655f;

    public v(long[] jArr, int[] iArr, int i5, long[] jArr2, int[] iArr2) {
        if (iArr.length != jArr2.length) {
            throw new IllegalArgumentException();
        }
        if (jArr.length != jArr2.length) {
            throw new IllegalArgumentException();
        }
        if (iArr2.length != jArr2.length) {
            throw new IllegalArgumentException();
        }
        this.f29651b = jArr;
        this.f29652c = iArr;
        this.f29653d = i5;
        this.f29654e = jArr2;
        this.f29655f = iArr2;
        this.f29650a = jArr.length;
    }
}
