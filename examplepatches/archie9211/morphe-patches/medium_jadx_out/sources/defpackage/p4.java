package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p4 extends n4 {
    public static p4 d;
    public static final mcb e = mcb.Rtl;
    public static final mcb f = mcb.Ltr;
    public qjd c;

    @Override // defpackage.n4
    public final int[] f(int i) {
        int iD;
        if (j().length() > 0 && i < j().length()) {
            qjd qjdVar = this.c;
            mcb mcbVar = e;
            if (i < 0) {
                if (qjdVar == null) {
                    g76.g0("layoutResult");
                    throw null;
                }
                iD = qjdVar.b.d(0);
            } else {
                if (qjdVar == null) {
                    g76.g0("layoutResult");
                    throw null;
                }
                int iD2 = qjdVar.b.d(i);
                iD = u(iD2, mcbVar) == i ? iD2 : iD2 + 1;
            }
            qjd qjdVar2 = this.c;
            if (qjdVar2 == null) {
                g76.g0("layoutResult");
                throw null;
            }
            if (iD < qjdVar2.b.f) {
                return i(u(iD, mcbVar), u(iD, f) + 1);
            }
        }
        return null;
    }

    @Override // defpackage.n4
    public final int[] r(int i) {
        int iD;
        if (j().length() > 0 && i > 0) {
            int length = j().length();
            qjd qjdVar = this.c;
            mcb mcbVar = f;
            if (i > length) {
                if (qjdVar == null) {
                    g76.g0("layoutResult");
                    throw null;
                }
                iD = qjdVar.b.d(j().length());
            } else {
                if (qjdVar == null) {
                    g76.g0("layoutResult");
                    throw null;
                }
                int iD2 = qjdVar.b.d(i);
                iD = u(iD2, mcbVar) + 1 == i ? iD2 : iD2 - 1;
            }
            if (iD >= 0) {
                return i(u(iD, e), u(iD, mcbVar) + 1);
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
