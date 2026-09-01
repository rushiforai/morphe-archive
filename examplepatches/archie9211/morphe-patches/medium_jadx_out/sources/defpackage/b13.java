package defpackage;

import java.util.concurrent.CancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b13 implements zc8 {
    public final gz8 a;
    public final hw8 b;

    public b13(gz8 gz8Var, hw8 hw8Var) {
        this.a = gz8Var;
        this.b = hw8Var;
    }

    @Override // defpackage.zc8
    public final Object A(long j, long j2, n92 n92Var) {
        return new qre(this.b == hw8.Vertical ? qre.a(j2, 0.0f, 0.0f, 2) : qre.a(j2, 0.0f, 0.0f, 1));
    }

    @Override // defpackage.zc8
    public final long K(int i, long j) {
        if (i != 1) {
            return 0L;
        }
        gz8 gz8Var = this.a;
        if (Math.abs(gz8Var.l()) <= 1.0E-6d) {
            return 0L;
        }
        hw8 hw8Var = hw8.Horizontal;
        hw8 hw8Var2 = this.b;
        if (Math.abs(Float.intBitsToFloat((int) (hw8Var2 == hw8Var ? j >> 32 : j & 4294967295L))) <= 0.0f) {
            return 0L;
        }
        yy8 yy8VarN = gz8Var.n();
        float fL = gz8Var.l() * gz8Var.p();
        float f = ((yy8VarN.b + yy8VarN.c) * (-Math.signum(gz8Var.l()))) + fL;
        if (gz8Var.l() > 0.0f) {
            fL = f;
            f = fL;
        }
        float fIntBitsToFloat = -gz8Var.k.e(-iq7.u(Float.intBitsToFloat((int) (hw8Var2 == hw8Var ? j >> 32 : j & 4294967295L)), fL, f));
        float fIntBitsToFloat2 = hw8Var2 == hw8Var ? fIntBitsToFloat : Float.intBitsToFloat((int) (j >> 32));
        if (hw8Var2 != hw8.Vertical) {
            fIntBitsToFloat = Float.intBitsToFloat((int) (j & 4294967295L));
        }
        return (((long) Float.floatToRawIntBits(fIntBitsToFloat)) & 4294967295L) | (((long) Float.floatToRawIntBits(fIntBitsToFloat2)) << 32);
    }

    @Override // defpackage.zc8
    public final Object j0(long j, n92 n92Var) {
        return ev6.I();
    }

    @Override // defpackage.zc8
    public final long n0(long j, long j2, int i) {
        if (i != 2) {
            return 0L;
        }
        if (Float.intBitsToFloat((int) (this.b == hw8.Horizontal ? j2 >> 32 : 4294967295L & j2)) == 0.0f) {
            return 0L;
        }
        throw new CancellationException("Scroll cancelled");
    }
}
