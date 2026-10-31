package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts;

/* loaded from: classes3.dex */
public final class e0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f29800a;

    /* renamed from: b, reason: collision with root package name */
    public final int f29801b;

    /* renamed from: c, reason: collision with root package name */
    public final int f29802c;

    /* renamed from: d, reason: collision with root package name */
    public int f29803d;

    /* renamed from: e, reason: collision with root package name */
    public String f29804e;

    public e0(int i5, int i11, int i12) {
        this.f29800a = i5 != Integer.MIN_VALUE ? a2.c.h(i5, "/") : com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        this.f29801b = i11;
        this.f29802c = i12;
        this.f29803d = Integer.MIN_VALUE;
    }

    public final void a() {
        int i5 = this.f29803d;
        this.f29803d = i5 == Integer.MIN_VALUE ? this.f29801b : i5 + this.f29802c;
        this.f29804e = this.f29800a + this.f29803d;
    }

    public final void b() {
        if (this.f29803d == Integer.MIN_VALUE) {
            throw new IllegalStateException("generateNewId() must be called before retrieving ids.");
        }
    }
}
