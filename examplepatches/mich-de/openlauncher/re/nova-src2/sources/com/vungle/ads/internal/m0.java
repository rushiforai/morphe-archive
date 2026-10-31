package com.vungle.ads.internal;

/* loaded from: classes4.dex */
public final class m0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f46917a;

    /* renamed from: b, reason: collision with root package name */
    public final int f46918b;

    public m0(int i5, int i11) {
        this.f46917a = i5;
        this.f46918b = i11;
    }

    public final int a() {
        return this.f46917a;
    }

    public final int b() {
        return this.f46918b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m0)) {
            return false;
        }
        m0 m0Var = (m0) obj;
        return this.f46917a == m0Var.f46917a && this.f46918b == m0Var.f46918b;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f46918b) + (Integer.hashCode(this.f46917a) * 31);
    }

    public final String toString() {
        StringBuilder sbA = com.iab.omid.library.vungle.internal.l.a("Coordinate(x=");
        sbA.append(this.f46917a);
        sbA.append(", y=");
        return a2.c.m(sbA, this.f46918b, ')');
    }
}
