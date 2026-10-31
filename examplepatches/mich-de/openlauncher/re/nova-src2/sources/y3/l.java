package y3;

import b.u4;

/* loaded from: classes2.dex */
public final class l {

    /* renamed from: e, reason: collision with root package name */
    public static final l f96606e = new l(0, 0, 0, 0);

    /* renamed from: a, reason: collision with root package name */
    public final int f96607a;

    /* renamed from: b, reason: collision with root package name */
    public final int f96608b;

    /* renamed from: c, reason: collision with root package name */
    public final int f96609c;

    /* renamed from: d, reason: collision with root package name */
    public final int f96610d;

    public l(int i5, int i11, int i12, int i13) {
        this.f96607a = i5;
        this.f96608b = i11;
        this.f96609c = i12;
        this.f96610d = i13;
    }

    public final int a() {
        return this.f96610d;
    }

    public final long b() {
        return (((c() / 2) + this.f96608b) & 4294967295L) | (((h() / 2) + this.f96607a) << 32);
    }

    public final int c() {
        return this.f96610d - this.f96608b;
    }

    public final int d() {
        return this.f96607a;
    }

    public final int e() {
        return this.f96609c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l)) {
            return false;
        }
        l lVar = (l) obj;
        return this.f96607a == lVar.f96607a && this.f96608b == lVar.f96608b && this.f96609c == lVar.f96609c && this.f96610d == lVar.f96610d;
    }

    public final int f() {
        return this.f96608b;
    }

    public final long g() {
        return (this.f96607a << 32) | (this.f96608b & 4294967295L);
    }

    public final int h() {
        return this.f96609c - this.f96607a;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f96610d) + u4.a(this.f96609c, u4.a(this.f96608b, Integer.hashCode(this.f96607a) * 31, 31), 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("IntRect.fromLTRB(");
        sb2.append(this.f96607a);
        sb2.append(", ");
        sb2.append(this.f96608b);
        sb2.append(", ");
        sb2.append(this.f96609c);
        sb2.append(", ");
        return a2.c.m(sb2, this.f96610d, ')');
    }
}
