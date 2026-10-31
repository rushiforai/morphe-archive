package com.fyber.inneractive.sdk.mraid;

/* loaded from: classes3.dex */
public final class x extends y {

    /* renamed from: a, reason: collision with root package name */
    public final int f28673a;

    /* renamed from: b, reason: collision with root package name */
    public final int f28674b;

    public x(int i5, int i11) {
        this.f28673a = i5;
        this.f28674b = i11;
    }

    @Override // com.fyber.inneractive.sdk.mraid.y
    public final String a() {
        StringBuilder sb2 = new StringBuilder("adSize: { width: ");
        sb2.append(this.f28673a);
        sb2.append(", height: ");
        return b.c0.o(sb2, this.f28674b, " }");
    }
}
