package com.fyber.inneractive.sdk.util;

/* loaded from: classes3.dex */
public final class h1 {

    /* renamed from: a, reason: collision with root package name */
    public int f31191a;

    /* renamed from: b, reason: collision with root package name */
    public int f31192b;

    public h1(int i5, int i11) {
        this.f31191a = i5;
        this.f31192b = i11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj != null && h1.class == obj.getClass()) {
            h1 h1Var = (h1) obj;
            if (this.f31191a == h1Var.f31191a && this.f31192b == h1Var.f31192b) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return (this.f31191a * 31) + this.f31192b;
    }
}
