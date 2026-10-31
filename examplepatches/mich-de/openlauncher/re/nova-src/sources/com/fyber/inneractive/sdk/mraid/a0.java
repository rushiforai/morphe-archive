package com.fyber.inneractive.sdk.mraid;

/* loaded from: classes3.dex */
public final class a0 extends y {

    /* renamed from: a, reason: collision with root package name */
    public final int f28654a;

    /* renamed from: b, reason: collision with root package name */
    public final int f28655b;

    public a0(int i5, int i11) {
        this.f28654a = i5;
        this.f28655b = i11;
    }

    @Override // com.fyber.inneractive.sdk.mraid.y
    public final String a() {
        StringBuilder sb2 = new StringBuilder("maxSize: { width: ");
        sb2.append(this.f28654a);
        sb2.append(", height: ");
        return b.c0.o(sb2, this.f28655b, " }");
    }
}
