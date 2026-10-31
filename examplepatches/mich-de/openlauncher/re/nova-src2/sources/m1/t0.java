package m1;

import h6.c1;

/* loaded from: classes2.dex */
public final class t0 implements e0 {

    /* renamed from: a, reason: collision with root package name */
    public final b2.g f75775a;

    public t0(b2.g gVar) {
        this.f75775a = gVar;
    }

    @Override // m1.e0
    public final int a(y3.l lVar, long j11, int i5, y3.n nVar) {
        int i11 = (int) (j11 >> 32);
        if (i5 < i11) {
            return kotlin.ranges.a.e0(this.f75775a.a(i5, i11, nVar), 0, i11 - i5);
        }
        return c1.g(1, nVar != y3.n.f96612a ? 0.0f * (-1) : 0.0f, (i11 - i5) / 2.0f);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof t0) && this.f75775a.equals(((t0) obj).f75775a);
    }

    public final int hashCode() {
        return Integer.hashCode(0) + (Float.hashCode(this.f75775a.f17010a) * 31);
    }

    public final String toString() {
        return "Horizontal(alignment=" + this.f75775a + ", margin=0)";
    }
}
