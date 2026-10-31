package com.fyber.inneractive.sdk.mraid;

/* loaded from: classes3.dex */
public final class c0 extends y {

    /* renamed from: a, reason: collision with root package name */
    public final int f28658a;

    /* renamed from: b, reason: collision with root package name */
    public final int f28659b;

    public c0(int i5, int i11) {
        this.f28658a = i5;
        this.f28659b = i11;
    }

    @Override // com.fyber.inneractive.sdk.mraid.y
    public final String a() {
        StringBuilder sb2 = new StringBuilder("screenSize: { width: ");
        sb2.append(this.f28658a);
        sb2.append(", height: ");
        return b.c0.o(sb2, this.f28659b, " }");
    }
}
