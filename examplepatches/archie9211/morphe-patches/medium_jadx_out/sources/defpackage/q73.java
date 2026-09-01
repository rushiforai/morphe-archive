package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q73 implements m73 {
    public final float a;
    public final float b;
    public final wz4 c;

    public q73(float f, float f2, wz4 wz4Var) {
        this.a = f;
        this.b = f2;
        this.c = wz4Var;
    }

    @Override // defpackage.m73
    public final long J(float f) {
        return en7.M(this.c.a(Q(f)), 4294967296L);
    }

    @Override // defpackage.m73
    public final float N(int i) {
        return i / b();
    }

    @Override // defpackage.m73
    public final float Q(float f) {
        return f / b();
    }

    @Override // defpackage.m73
    public final float U() {
        return this.b;
    }

    @Override // defpackage.m73
    public final float Z(float f) {
        return b() * f;
    }

    @Override // defpackage.m73
    public final float b() {
        return this.a;
    }

    @Override // defpackage.m73
    public final int c0(long j) {
        throw null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q73)) {
            return false;
        }
        q73 q73Var = (q73) obj;
        return Float.compare(this.a, q73Var.a) == 0 && Float.compare(this.b, q73Var.b) == 0 && this.c.equals(q73Var.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + km4.p(this.b, Float.floatToIntBits(this.a) * 31, 31);
    }

    @Override // defpackage.m73
    public final /* synthetic */ int i0(float f) {
        return ho2.d(this, f);
    }

    @Override // defpackage.m73
    public final /* synthetic */ long m0(long j) {
        return ho2.g(j, this);
    }

    @Override // defpackage.m73
    public final /* synthetic */ float p0(long j) {
        return ho2.f(j, this);
    }

    @Override // defpackage.m73
    public final /* synthetic */ long r(long j) {
        return ho2.e(j, this);
    }

    public final String toString() {
        return "DensityWithConverter(density=" + this.a + ", fontScale=" + this.b + ", converter=" + this.c + ')';
    }

    @Override // defpackage.m73
    public final float z(long j) {
        if (rkd.a(qkd.b(j), 4294967296L)) {
            return this.c.b(qkd.c(j));
        }
        ygf.f("Only Sp can convert to Px");
        return 0.0f;
    }
}
