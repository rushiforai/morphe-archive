package f1;

import kotlin.ULong;

/* loaded from: classes2.dex */
public final class o3 implements e0.b1 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f53820a;

    /* renamed from: b, reason: collision with root package name */
    public final float f53821b;

    /* renamed from: c, reason: collision with root package name */
    public final long f53822c;

    public o3(boolean z11, float f11, long j11) {
        this.f53820a = z11;
        this.f53821b = f11;
        this.f53822c = j11;
    }

    @Override // e0.b1
    public final b3.n a(i0.i iVar) {
        o1 o1Var = new o1(this, 1);
        return new p1(iVar, this.f53820a, this.f53821b, o1Var, 0);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o3)) {
            return false;
        }
        o3 o3Var = (o3) obj;
        if (this.f53820a != o3Var.f53820a || !y3.f.a(this.f53821b, o3Var.f53821b)) {
            return false;
        }
        long j11 = o3Var.f53822c;
        int i5 = i2.s.n;
        return ULong.a(this.f53822c, j11);
    }

    @Override // e0.b1
    public final int hashCode() {
        int iD = a80.m.d(this.f53821b, Boolean.hashCode(this.f53820a) * 31, 961);
        int i5 = i2.s.n;
        ULong.Companion companion = ULong.f71699b;
        return Long.hashCode(this.f53822c) + iD;
    }
}
