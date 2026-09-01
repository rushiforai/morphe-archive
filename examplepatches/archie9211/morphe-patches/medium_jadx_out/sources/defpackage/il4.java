package defpackage;

import java.io.IOException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class il4 extends w05 {
    public final long b;
    public final boolean c;
    public long d;

    public il4(ikc ikcVar, long j, boolean z) {
        super(ikcVar);
        this.b = j;
        this.c = z;
    }

    @Override // defpackage.w05, defpackage.ikc
    public final long q0(kz0 kz0Var, long j) throws IOException {
        kz0Var.getClass();
        long j2 = this.d;
        long j3 = this.b;
        if (j2 > j3) {
            j = 0;
        } else if (this.c) {
            long j4 = j3 - j2;
            if (j4 == 0) {
                return -1L;
            }
            j = Math.min(j, j4);
        }
        long jQ0 = this.a.q0(kz0Var, j);
        if (jQ0 != -1) {
            this.d += jQ0;
        }
        long j5 = this.d;
        if ((j5 >= j3 || jQ0 != -1) && j5 <= j3) {
            return jQ0;
        }
        if (jQ0 > 0 && j5 > j3) {
            long j6 = kz0Var.b - (j5 - j3);
            kz0 kz0Var2 = new kz0();
            kz0Var2.J(kz0Var);
            kz0Var.c0(kz0Var2, j6);
            kz0Var2.B();
        }
        StringBuilder sbD = b09.D("expected ", " bytes but got ", j3);
        sbD.append(this.d);
        throw new IOException(sbD.toString());
    }
}
