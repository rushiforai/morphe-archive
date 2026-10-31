package com.pgl.ssdk;

/* loaded from: classes4.dex */
public final class o<A, B> {

    /* renamed from: a, reason: collision with root package name */
    private final A f42372a;

    /* renamed from: b, reason: collision with root package name */
    private final B f42373b;

    public o(A a11, B b11) {
        this.f42372a = a11;
        this.f42373b = b11;
    }

    public static <A, B> o<A, B> a(A a11, B b11) {
        return new o<>(a11, b11);
    }

    public B b() {
        return this.f42373b;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || o.class != obj.getClass()) {
            return false;
        }
        o oVar = (o) obj;
        A a11 = this.f42372a;
        if (a11 == null) {
            if (oVar.f42372a != null) {
                return false;
            }
        } else if (!a11.equals(oVar.f42372a)) {
            return false;
        }
        B b11 = this.f42373b;
        B b12 = oVar.f42373b;
        if (b11 == null) {
            if (b12 != null) {
                return false;
            }
        } else if (!b11.equals(b12)) {
            return false;
        }
        return true;
    }

    public int hashCode() {
        A a11 = this.f42372a;
        int iHashCode = ((a11 == null ? 0 : a11.hashCode()) + 31) * 31;
        B b11 = this.f42373b;
        return iHashCode + (b11 != null ? b11.hashCode() : 0);
    }

    public A a() {
        return this.f42372a;
    }
}
