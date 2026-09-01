package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yhd {
    public final mx a;
    public final long b;
    public final qjd c;
    public final yqa d;
    public final akd e;
    public long f;
    public final mx g;
    public final uid h;
    public final rjd i;

    public yhd(uid uidVar, yqa yqaVar, rjd rjdVar, akd akdVar) {
        mx mxVar = uidVar.a;
        long j = uidVar.b;
        qjd qjdVar = rjdVar != null ? rjdVar.a : null;
        this.a = mxVar;
        this.b = j;
        this.c = qjdVar;
        this.d = yqaVar;
        this.e = akdVar;
        this.f = j;
        this.g = mxVar;
        this.h = uidVar;
        this.i = rjdVar;
    }

    public final List a(x45 x45Var) {
        if (!bkd.c(this.f)) {
            return d46.R(new ax1("", 0), new t1c(bkd.f(this.f), bkd.f(this.f)));
        }
        fp3 fp3Var = (fp3) x45Var.invoke(this);
        if (fp3Var != null) {
            return d46.Q(fp3Var);
        }
        return null;
    }

    public final Integer b() {
        qjd qjdVar = this.c;
        if (qjdVar == null) {
            return null;
        }
        f58 f58Var = qjdVar.b;
        int iE = bkd.e(this.f);
        yqa yqaVar = this.d;
        yqaVar.a(iE);
        int iC = f58Var.c(f58Var.d(iE), true);
        yqaVar.c(iC);
        return Integer.valueOf(iC);
    }

    public final Integer c() {
        qjd qjdVar = this.c;
        if (qjdVar == null) {
            return null;
        }
        int iF = bkd.f(this.f);
        yqa yqaVar = this.d;
        yqaVar.a(iF);
        int iG = qjdVar.g(qjdVar.b.d(iF));
        yqaVar.c(iG);
        return Integer.valueOf(iG);
    }

    public final Integer d() {
        int length;
        qjd qjdVar = this.c;
        if (qjdVar == null) {
            return null;
        }
        int iR = r();
        while (true) {
            mx mxVar = this.a;
            if (iR < mxVar.b.length()) {
                int length2 = this.g.b.length() - 1;
                if (iR <= length2) {
                    length2 = iR;
                }
                long j = qjdVar.j(length2);
                int i = bkd.c;
                int i2 = (int) (j & 4294967295L);
                if (i2 > iR) {
                    this.d.c(i2);
                    length = i2;
                    break;
                }
                iR++;
            } else {
                length = mxVar.b.length();
                break;
            }
        }
        return Integer.valueOf(length);
    }

    public final Integer e() {
        int i;
        qjd qjdVar = this.c;
        if (qjdVar == null) {
            return null;
        }
        int iR = r();
        while (true) {
            if (iR <= 0) {
                i = 0;
                break;
            }
            int length = this.g.b.length() - 1;
            if (iR <= length) {
                length = iR;
            }
            long j = qjdVar.j(length);
            int i2 = bkd.c;
            int i3 = (int) (j >> 32);
            if (i3 < iR) {
                this.d.c(i3);
                i = i3;
                break;
            }
            iR--;
        }
        return Integer.valueOf(i);
    }

    public final boolean f() {
        qjd qjdVar = this.c;
        return (qjdVar != null ? qjdVar.h(r()) : null) != mcb.Rtl;
    }

    public final int g(qjd qjdVar, int i) {
        int iR = r();
        akd akdVar = this.e;
        if (akdVar.a == null) {
            akdVar.a = Float.valueOf(qjdVar.c(iR).a);
        }
        f58 f58Var = qjdVar.b;
        int iD = f58Var.d(iR) + i;
        if (iD < 0) {
            return 0;
        }
        if (iD >= f58Var.f) {
            return this.g.b.length();
        }
        float fB = f58Var.b(iD) - 1.0f;
        Float f = akdVar.a;
        f.getClass();
        float fFloatValue = f.floatValue();
        if ((f() && fFloatValue >= qjdVar.f(iD)) || (!f() && fFloatValue <= qjdVar.e(iD))) {
            return f58Var.c(iD, true);
        }
        int iG = f58Var.g((((long) Float.floatToRawIntBits(fB)) & 4294967295L) | (Float.floatToRawIntBits(f.floatValue()) << 32));
        this.d.c(iG);
        return iG;
    }

    /* JADX WARN: Removed duplicated region for block: B:9:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int h(defpackage.rjd r9, int r10) {
        /*
            r8 = this;
            hp6 r0 = r9.b
            qjd r1 = r9.a
            if (r0 == 0) goto L13
            hp6 r9 = r9.c
            if (r9 == 0) goto L10
            r2 = 1
            zwa r9 = r9.H(r0, r2)
            goto L11
        L10:
            r9 = 0
        L11:
            if (r9 != 0) goto L15
        L13:
            zwa r9 = defpackage.zwa.e
        L15:
            uid r0 = r8.h
            long r2 = r0.b
            int r0 = defpackage.bkd.c
            r4 = 4294967295(0xffffffff, double:2.1219957905E-314)
            long r2 = r2 & r4
            int r0 = (int) r2
            yqa r8 = r8.d
            r8.a(r0)
            zwa r0 = r1.c(r0)
            float r2 = r0.a
            float r0 = r0.b
            long r6 = r9.c()
            long r6 = r6 & r4
            int r9 = (int) r6
            float r9 = java.lang.Float.intBitsToFloat(r9)
            float r10 = (float) r10
            float r9 = r9 * r10
            float r9 = r9 + r0
            int r10 = java.lang.Float.floatToRawIntBits(r2)
            long r2 = (long) r10
            int r9 = java.lang.Float.floatToRawIntBits(r9)
            long r9 = (long) r9
            r0 = 32
            long r2 = r2 << r0
            long r9 = r9 & r4
            long r9 = r9 | r2
            f58 r0 = r1.b
            int r9 = r0.g(r9)
            r8.c(r9)
            return r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yhd.h(rjd, int):int");
    }

    public final void i() {
        akd akdVar = this.e;
        akdVar.a = null;
        mx mxVar = this.g;
        if (mxVar.b.length() > 0) {
            if (f()) {
                k();
                return;
            }
            akdVar.a = null;
            if (mxVar.b.length() > 0) {
                String str = mxVar.b;
                long j = this.f;
                int i = bkd.c;
                int iQ = no7.q((int) (j & 4294967295L), str);
                if (iQ != -1) {
                    q(iQ, iQ);
                }
            }
        }
    }

    public final void j() {
        this.e.a = null;
        mx mxVar = this.g;
        String str = mxVar.b;
        String str2 = mxVar.b;
        if (str.length() > 0) {
            int iK = mo7.K(str2, bkd.e(this.f));
            if (iK == bkd.e(this.f) && iK != str2.length()) {
                iK = mo7.K(str2, iK + 1);
            }
            q(iK, iK);
        }
    }

    public final void k() {
        this.e.a = null;
        mx mxVar = this.g;
        if (mxVar.b.length() > 0) {
            String str = mxVar.b;
            long j = this.f;
            int i = bkd.c;
            int iR = no7.r((int) (j & 4294967295L), str);
            if (iR != -1) {
                q(iR, iR);
            }
        }
    }

    public final void l() {
        this.e.a = null;
        mx mxVar = this.g;
        String str = mxVar.b;
        String str2 = mxVar.b;
        if (str.length() > 0) {
            int iL = mo7.L(str2, bkd.f(this.f));
            if (iL == bkd.f(this.f) && iL != 0) {
                iL = mo7.L(str2, iL - 1);
            }
            q(iL, iL);
        }
    }

    public final void m() {
        akd akdVar = this.e;
        akdVar.a = null;
        mx mxVar = this.g;
        if (mxVar.b.length() > 0) {
            if (!f()) {
                k();
                return;
            }
            akdVar.a = null;
            if (mxVar.b.length() > 0) {
                String str = mxVar.b;
                long j = this.f;
                int i = bkd.c;
                int iQ = no7.q((int) (j & 4294967295L), str);
                if (iQ != -1) {
                    q(iQ, iQ);
                }
            }
        }
    }

    public final void n() {
        Integer numB;
        this.e.a = null;
        if (this.g.b.length() <= 0 || (numB = b()) == null) {
            return;
        }
        int iIntValue = numB.intValue();
        q(iIntValue, iIntValue);
    }

    public final void o() {
        Integer numC;
        this.e.a = null;
        if (this.g.b.length() <= 0 || (numC = c()) == null) {
            return;
        }
        int iIntValue = numC.intValue();
        q(iIntValue, iIntValue);
    }

    public final void p() {
        if (this.g.b.length() > 0) {
            int i = bkd.c;
            this.f = lk7.q((int) (this.b >> 32), (int) (this.f & 4294967295L));
        }
    }

    public final void q(int i, int i2) {
        this.f = lk7.q(i, i2);
    }

    public final int r() {
        long j = this.f;
        int i = bkd.c;
        int i2 = (int) (j & 4294967295L);
        this.d.a(i2);
        return i2;
    }
}
