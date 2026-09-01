package defpackage;

import android.os.SystemClock;
import com.google.android.gms.common.api.ApiException;
import com.google.android.gms.common.api.Status;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class pre implements mre, xq8 {
    public final int a;
    public final long b;
    public final long c;
    public final Object d;
    public final Object e;

    public pre(int i, lre lreVar, v4b v4bVar, long j) {
        this.a = i;
        this.d = lreVar;
        this.e = v4bVar;
        if (i < 1) {
            ay0.e("Iterations count can't be less than 1");
            throw null;
        }
        this.b = ((long) (lreVar.q() + lreVar.m())) * 1000000;
        this.c = j * 1000000;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0031 A[RETURN] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static defpackage.k42 d(defpackage.uif r4, defpackage.mn0 r5, int r6) {
        /*
            fag r5 = r5.v
            r0 = 0
            if (r5 != 0) goto L7
            r5 = r0
            goto L9
        L7:
            k42 r5 = r5.d
        L9:
            if (r5 == 0) goto L35
            boolean r1 = r5.b
            if (r1 == 0) goto L35
            int[] r1 = r5.d
            r2 = 0
            if (r1 != 0) goto L24
            int[] r1 = r5.f
            if (r1 != 0) goto L19
            goto L2b
        L19:
            int r3 = r1.length
            if (r2 >= r3) goto L2b
            r3 = r1[r2]
            if (r3 != r6) goto L21
            goto L35
        L21:
            int r2 = r2 + 1
            goto L19
        L24:
            int r3 = r1.length
            if (r2 >= r3) goto L35
            r3 = r1[r2]
            if (r3 != r6) goto L32
        L2b:
            int r4 = r4.p
            int r6 = r5.e
            if (r4 >= r6) goto L35
            return r5
        L32:
            int r2 = r2 + 1
            goto L24
        L35:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.pre.d(uif, mn0, int):k42");
    }

    @Override // defpackage.xq8
    public void N(jrg jrgVar) {
        int i;
        int i2;
        int i3;
        int i4;
        int i5;
        long j;
        long j2;
        ee5 ee5Var = (ee5) this.d;
        if (ee5Var.e()) {
            plb plbVar = (plb) olb.k().b;
            if (plbVar == null || plbVar.b) {
                uif uifVar = (uif) ee5Var.j.get((gz) this.e);
                if (uifVar != null) {
                    wd5 wd5Var = uifVar.f;
                    if (wd5Var instanceof mn0) {
                        wd5 wd5Var2 = wd5Var;
                        long j3 = this.b;
                        int i6 = 0;
                        boolean z = j3 > 0;
                        int i7 = wd5Var2.p;
                        if (plbVar != null) {
                            z &= plbVar.c;
                            i = plbVar.d;
                            i3 = plbVar.e;
                            i2 = plbVar.a;
                            if (wd5Var2.v != null && !wd5Var2.m()) {
                                k42 k42VarD = d(uifVar, wd5Var2, this.a);
                                if (k42VarD == null) {
                                    return;
                                }
                                boolean z2 = k42VarD.c && j3 > 0;
                                i3 = k42VarD.e;
                                z = z2;
                            }
                        } else {
                            i = 5000;
                            i2 = 0;
                            i3 = 100;
                        }
                        int i8 = i;
                        int iElapsedRealtime = -1;
                        if (jrgVar.k()) {
                            i5 = 0;
                        } else if (jrgVar.d) {
                            i6 = -1;
                            i5 = 100;
                        } else {
                            Exception excH = jrgVar.h();
                            if (excH instanceof ApiException) {
                                Status status = ((ApiException) excH).a;
                                i4 = status.a;
                                h42 h42Var = status.d;
                                if (h42Var != null) {
                                    i5 = i4;
                                    i6 = h42Var.b;
                                }
                            } else {
                                i4 = 101;
                            }
                            i5 = i4;
                            i6 = -1;
                        }
                        if (z) {
                            long j4 = this.c;
                            long jCurrentTimeMillis = System.currentTimeMillis();
                            iElapsedRealtime = (int) (SystemClock.elapsedRealtime() - j4);
                            j2 = jCurrentTimeMillis;
                            j = j3;
                        } else {
                            j = 0;
                            j2 = 0;
                        }
                        xif xifVar = new xif(new e08(this.a, i5, i6, j, j2, null, null, i7, iElapsedRealtime), i2, i8, i3);
                        tjf tjfVar = ee5Var.m;
                        tjfVar.sendMessage(tjfVar.obtainMessage(18, xifVar));
                    }
                }
            }
        }
    }

    public long a(long j) {
        long j2 = j + this.c;
        if (j2 <= 0) {
            return 0L;
        }
        long j3 = this.b;
        long jMin = Math.min(j2 / j3, ((long) this.a) - 1);
        if (((v4b) this.e) != v4b.Restart && jMin % 2 != 0) {
            return ((jMin + 1) * j3) - j2;
        }
        Long.signum(jMin);
        return j2 - (jMin * j3);
    }

    @Override // defpackage.jre
    public boolean b() {
        return false;
    }

    public dx c(long j, dx dxVar, dx dxVar2, dx dxVar3) {
        long j2 = this.c;
        long j3 = j + j2;
        long j4 = this.b;
        return j3 > j4 ? j(j4 - j2, dxVar, dxVar2, dxVar3) : dxVar2;
    }

    @Override // defpackage.jre
    public dx j(long j, dx dxVar, dx dxVar2, dx dxVar3) {
        return ((lre) this.d).j(a(j), dxVar, dxVar2, c(j, dxVar, dxVar3, dxVar2));
    }

    @Override // defpackage.jre
    public dx r(long j, dx dxVar, dx dxVar2, dx dxVar3) {
        return ((lre) this.d).r(a(j), dxVar, dxVar2, c(j, dxVar, dxVar3, dxVar2));
    }

    @Override // defpackage.jre
    public dx s(dx dxVar, dx dxVar2, dx dxVar3) {
        return j(t(dxVar, dxVar2, dxVar3), dxVar, dxVar2, dxVar3);
    }

    @Override // defpackage.jre
    public long t(dx dxVar, dx dxVar2, dx dxVar3) {
        return (((long) this.a) * this.b) - this.c;
    }

    public pre(ee5 ee5Var, int i, gz gzVar, long j, long j2) {
        this.d = ee5Var;
        this.a = i;
        this.e = gzVar;
        this.b = j;
        this.c = j2;
    }
}
