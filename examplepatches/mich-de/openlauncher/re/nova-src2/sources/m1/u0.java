package m1;

import h6.c1;

/* loaded from: classes2.dex */
public final class u0 implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final b2.j f75779a;

    /* renamed from: b, reason: collision with root package name */
    public final int f75780b;

    public u0(b2.j jVar, int i5) {
        this.f75779a = jVar;
        this.f75780b = i5;
    }

    @Override // m1.f0
    public final int a(y3.l lVar, long j11, int i5) {
        int i11 = (int) (j11 & 4294967295L);
        int i12 = this.f75780b;
        if (i5 < i11 - (i12 * 2)) {
            return kotlin.ranges.a.e0(this.f75779a.a(i5, i11), i12, (i11 - i12) - i5);
        }
        return c1.g(1, 0.0f, (i11 - i5) / 2.0f);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u0)) {
            return false;
        }
        u0 u0Var = (u0) obj;
        return this.f75779a.equals(u0Var.f75779a) && this.f75780b == u0Var.f75780b;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f75780b) + (Float.hashCode(this.f75779a.f17013a) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Vertical(alignment=");
        sb2.append(this.f75779a);
        sb2.append(", margin=");
        return a2.c.m(sb2, this.f75780b, ')');
    }
}
