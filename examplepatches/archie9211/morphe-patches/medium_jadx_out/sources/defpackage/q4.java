package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q4 extends n4 {
    public static q4 e;
    public static final mcb f = mcb.Rtl;
    public static final mcb g = mcb.Ltr;
    public qjd c;
    public zxb d;

    @Override // defpackage.n4
    public final int[] f(int i) {
        int iE;
        if (j().length() > 0 && i < j().length()) {
            try {
                zxb zxbVar = this.d;
                if (zxbVar == null) {
                    g76.g0("node");
                    throw null;
                }
                zwa zwaVarG = zxbVar.g();
                int iRound = Math.round(zwaVarG.d - zwaVarG.b);
                if (i <= 0) {
                    i = 0;
                }
                qjd qjdVar = this.c;
                if (qjdVar == null) {
                    g76.g0("layoutResult");
                    throw null;
                }
                int iD = qjdVar.b.d(i);
                qjd qjdVar2 = this.c;
                if (qjdVar2 == null) {
                    g76.g0("layoutResult");
                    throw null;
                }
                float f2 = qjdVar2.b.f(iD) + iRound;
                qjd qjdVar3 = this.c;
                if (qjdVar3 == null) {
                    g76.g0("layoutResult");
                    throw null;
                }
                float f3 = qjdVar3.b.f(r0.f - 1);
                qjd qjdVar4 = this.c;
                if (f2 < f3) {
                    if (qjdVar4 == null) {
                        g76.g0("layoutResult");
                        throw null;
                    }
                    iE = qjdVar4.b.e(f2);
                } else {
                    if (qjdVar4 == null) {
                        g76.g0("layoutResult");
                        throw null;
                    }
                    iE = qjdVar4.b.f;
                }
                return i(i, u(iE - 1, g) + 1);
            } catch (IllegalStateException unused) {
            }
        }
        return null;
    }

    @Override // defpackage.n4
    public final int[] r(int i) {
        int iE;
        if (j().length() > 0 && i > 0) {
            try {
                zxb zxbVar = this.d;
                if (zxbVar == null) {
                    g76.g0("node");
                    throw null;
                }
                zwa zwaVarG = zxbVar.g();
                int iRound = Math.round(zwaVarG.d - zwaVarG.b);
                int length = j().length();
                if (length <= i) {
                    i = length;
                }
                qjd qjdVar = this.c;
                if (qjdVar == null) {
                    g76.g0("layoutResult");
                    throw null;
                }
                int iD = qjdVar.b.d(i);
                qjd qjdVar2 = this.c;
                if (qjdVar2 == null) {
                    g76.g0("layoutResult");
                    throw null;
                }
                float f2 = qjdVar2.b.f(iD) - iRound;
                if (f2 > 0.0f) {
                    qjd qjdVar3 = this.c;
                    if (qjdVar3 == null) {
                        g76.g0("layoutResult");
                        throw null;
                    }
                    iE = qjdVar3.b.e(f2);
                } else {
                    iE = 0;
                }
                if (i == j().length() && iE < iD) {
                    iE++;
                }
                return i(u(iE, f), i);
            } catch (IllegalStateException unused) {
            }
        }
        return null;
    }

    public final int u(int i, mcb mcbVar) {
        qjd qjdVar = this.c;
        if (qjdVar == null) {
            g76.g0("layoutResult");
            throw null;
        }
        int iG = qjdVar.g(i);
        qjd qjdVar2 = this.c;
        if (qjdVar2 == null) {
            g76.g0("layoutResult");
            throw null;
        }
        mcb mcbVarH = qjdVar2.h(iG);
        qjd qjdVar3 = this.c;
        if (mcbVar != mcbVarH) {
            if (qjdVar3 != null) {
                return qjdVar3.g(i);
            }
            g76.g0("layoutResult");
            throw null;
        }
        if (qjdVar3 != null) {
            return qjdVar3.b.c(i, false) - 1;
        }
        g76.g0("layoutResult");
        throw null;
    }
}
