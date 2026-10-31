package com.amplitude;

/* loaded from: classes2.dex */
public final class P3 {

    /* renamed from: a, reason: collision with root package name */
    public int f20359a;

    /* renamed from: b, reason: collision with root package name */
    public String f20360b;

    /* renamed from: c, reason: collision with root package name */
    public int f20361c;

    public P3(String str, int i5) {
        int i11 = (i5 & 1) != 0 ? -1 : 200;
        str = (i5 & 2) != 0 ? null : str;
        this.f20359a = i11;
        this.f20360b = str;
        this.f20361c = 0;
    }

    public final String toString() {
        return "SimpleUrlResponse(code=" + this.f20359a + ", body=" + this.f20360b + ")";
    }
}
