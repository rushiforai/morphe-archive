package l1;

import kotlin.ULong;

/* loaded from: classes2.dex */
public final class r5 implements e0.b1 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f73913a;

    /* renamed from: b, reason: collision with root package name */
    public final float f73914b;

    /* renamed from: c, reason: collision with root package name */
    public final long f73915c;

    public r5(boolean z11, float f11, long j11) {
        this.f73913a = z11;
        this.f73914b = f11;
        this.f73915c = j11;
    }

    @Override // e0.b1
    public final b3.n a(i0.i iVar) {
        f1.o1 o1Var = new f1.o1(this, 3);
        return new f1.p1(iVar, this.f73913a, this.f73914b, o1Var, 1);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r5)) {
            return false;
        }
        r5 r5Var = (r5) obj;
        if (this.f73913a != r5Var.f73913a || !y3.f.a(this.f73914b, r5Var.f73914b)) {
            return false;
        }
        long j11 = r5Var.f73915c;
        int i5 = i2.s.n;
        return ULong.a(this.f73915c, j11);
    }

    @Override // e0.b1
    public final int hashCode() {
        int iD = a80.m.d(this.f73914b, Boolean.hashCode(this.f73913a) * 31, 961);
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f73915c) + iD;
    }
}
