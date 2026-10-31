package com.fyber.inneractive.sdk.mraid;

/* loaded from: classes3.dex */
public final class z extends y {

    /* renamed from: a, reason: collision with root package name */
    public final int f28675a;

    /* renamed from: b, reason: collision with root package name */
    public final int f28676b;

    /* renamed from: d, reason: collision with root package name */
    public final int f28678d = 0;

    /* renamed from: c, reason: collision with root package name */
    public final int f28677c = 0;

    public z(int i5, int i11) {
        this.f28675a = i5;
        this.f28676b = i11;
    }

    @Override // com.fyber.inneractive.sdk.mraid.y
    public final String a() {
        StringBuilder sb2 = new StringBuilder("currentPosition: { x: ");
        sb2.append(this.f28677c);
        sb2.append(", y: ");
        sb2.append(this.f28678d);
        sb2.append(", width: ");
        sb2.append(this.f28675a);
        sb2.append(", height: ");
        return b.c0.o(sb2, this.f28676b, " }");
    }
}
