package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d31 implements m73 {
    public h01 a = wx3.a;
    public yl3 b;

    @Override // defpackage.m73
    public final long J(float f) {
        return km4.j(this, Q(f));
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
        return this.a.b().U();
    }

    @Override // defpackage.m73
    public final float Z(float f) {
        return b() * f;
    }

    public final yl3 a(x45 x45Var) {
        yl3 yl3Var = new yl3();
        yl3Var.a = x45Var;
        this.b = yl3Var;
        return yl3Var;
    }

    @Override // defpackage.m73
    public final float b() {
        return this.a.b().b();
    }

    @Override // defpackage.m73
    public final int c0(long j) {
        throw null;
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

    @Override // defpackage.m73
    public final /* synthetic */ float z(long j) {
        return km4.i(j, this);
    }
}
