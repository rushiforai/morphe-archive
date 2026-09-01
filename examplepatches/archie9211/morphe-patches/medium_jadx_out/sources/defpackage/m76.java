package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m76 implements bl7, y66 {
    public final /* synthetic */ y66 a;
    public final ip6 b;

    public m76(y66 y66Var, ip6 ip6Var) {
        this.a = y66Var;
        this.b = ip6Var;
    }

    @Override // defpackage.m73
    public final long J(float f) {
        return this.a.J(f);
    }

    @Override // defpackage.m73
    public final float N(int i) {
        return this.a.N(i);
    }

    @Override // defpackage.m73
    public final float Q(float f) {
        return this.a.Q(f);
    }

    @Override // defpackage.m73
    public final float U() {
        return this.a.U();
    }

    @Override // defpackage.y66
    public final boolean W() {
        return this.a.W();
    }

    @Override // defpackage.m73
    public final float Z(float f) {
        return this.a.Z(f);
    }

    @Override // defpackage.m73
    public final float b() {
        return this.a.b();
    }

    @Override // defpackage.m73
    public final int c0(long j) {
        return this.a.c0(j);
    }

    @Override // defpackage.y66
    public final ip6 getLayoutDirection() {
        return this.b;
    }

    @Override // defpackage.bl7
    public final al7 h0(int i, int i2, Map map, x45 x45Var, x45 x45Var2) {
        if (i < 0) {
            i = 0;
        }
        if (i2 < 0) {
            i2 = 0;
        }
        if ((i & (-16777216)) != 0 || ((-16777216) & i2) != 0) {
            b26.b("Size(" + i + " x " + i2 + ") is out of range. Each dimension must be between 0 and 16777215.");
        }
        return new l76(i, i2, map, x45Var);
    }

    @Override // defpackage.m73
    public final int i0(float f) {
        return this.a.i0(f);
    }

    @Override // defpackage.m73
    public final long m0(long j) {
        return this.a.m0(j);
    }

    @Override // defpackage.m73
    public final float p0(long j) {
        return this.a.p0(j);
    }

    @Override // defpackage.bl7
    public final al7 q0(int i, int i2, Map map, x45 x45Var) {
        return h0(i, i2, map, null, x45Var);
    }

    @Override // defpackage.m73
    public final long r(long j) {
        return this.a.r(j);
    }

    @Override // defpackage.m73
    public final float z(long j) {
        return this.a.z(j);
    }
}
