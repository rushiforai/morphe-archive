package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class cb7 implements m73 {
    public boolean a;
    public long b = 9223372034707292159L;
    public long c = 0;
    public final /* synthetic */ fb7 d;

    public cb7(fb7 fb7Var) {
        this.d = fb7Var;
    }

    @Override // defpackage.m73
    public final long J(float f) {
        return km4.j(this, Q(f));
    }

    @Override // defpackage.m73
    public final float N(int i) {
        return i / this.d.b();
    }

    @Override // defpackage.m73
    public final float Q(float f) {
        return f / this.d.b();
    }

    @Override // defpackage.m73
    public final float U() {
        return this.d.U();
    }

    @Override // defpackage.m73
    public final float Z(float f) {
        return this.d.b() * f;
    }

    public final hp6 a() {
        this.a = true;
        fb7 fb7Var = this.d;
        hp6 hp6VarS0 = fb7Var.s0();
        if (k46.b(this.b, 9223372034707292159L)) {
            this.b = d46.c0(hp6VarS0.p(0L));
            this.c = hp6VarS0.j();
        }
        fb7Var.v0().G.b();
        return hp6VarS0;
    }

    @Override // defpackage.m73
    public final float b() {
        return this.d.b();
    }

    public final void c(lr5 lr5Var, float f) {
        fb7 fb7Var = this.d;
        e8 e8Var = fb7Var.m;
        if (e8Var == null) {
            e8Var = new e8();
            fb7Var.m = e8Var;
        }
        int iA0 = k80.A0(lr5Var, (lr5[]) e8Var.b);
        if (iA0 >= 0) {
            float[] fArr = (float[]) e8Var.c;
            if (fArr[iA0] != f) {
                fArr[iA0] = f;
                ((byte[]) e8Var.d)[iA0] = 1;
                return;
            } else {
                byte[] bArr = (byte[]) e8Var.d;
                if (bArr[iA0] == 2) {
                    bArr[iA0] = 0;
                    return;
                }
                return;
            }
        }
        int i = e8Var.a;
        lr5[] lr5VarArr = (lr5[]) e8Var.b;
        if (i == lr5VarArr.length) {
            int i2 = i * 2;
            e8Var.b = (lr5[]) Arrays.copyOf(lr5VarArr, i2);
            e8Var.c = Arrays.copyOf((float[]) e8Var.c, i2);
            e8Var.d = Arrays.copyOf((byte[]) e8Var.d, i2);
        }
        ((lr5[]) e8Var.b)[i] = lr5Var;
        ((byte[]) e8Var.d)[i] = 3;
        ((float[]) e8Var.c)[i] = f;
        e8Var.a++;
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
