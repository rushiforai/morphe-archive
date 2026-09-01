package defpackage;

import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.zip.Inflater;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class yff extends ch4 {
    public static final g59 f;
    public final g59 c;
    public final ch4 d;
    public final LinkedHashMap e;

    static {
        String str = g59.b;
        f = cd7.r("/");
    }

    public yff(g59 g59Var, ch4 ch4Var, LinkedHashMap linkedHashMap) {
        ch4Var.getClass();
        this.c = g59Var;
        this.d = ch4Var;
        this.e = linkedHashMap;
    }

    @Override // defpackage.ch4
    public final void B(g59 g59Var) throws IOException {
        g59Var.getClass();
        throw new IOException("zip file systems are read-only");
    }

    @Override // defpackage.ch4
    public final void D(g59 g59Var) throws IOException {
        g59Var.getClass();
        throw new IOException("zip file systems are read-only");
    }

    @Override // defpackage.ch4
    public final List N(g59 g59Var) throws IOException {
        g59 g59Var2 = f;
        g59Var2.getClass();
        xff xffVar = (xff) this.e.get(d.a(g59Var2, g59Var, true));
        if (xffVar != null) {
            return bu1.m1(xffVar.q);
        }
        ywb.o("not a directory: ", g59Var);
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:59:0x00cf  */
    @Override // defpackage.ch4
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.w73 R(defpackage.g59 r24) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 306
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.yff.R(g59):w73");
    }

    @Override // defpackage.ch4
    public final we6 T(g59 g59Var) {
        throw new UnsupportedOperationException("not implemented yet!");
    }

    @Override // defpackage.ch4
    public final bfc U(g59 g59Var, boolean z) throws IOException {
        g59Var.getClass();
        throw new IOException("zip file systems are read-only");
    }

    @Override // defpackage.ch4
    public final bfc f(g59 g59Var) throws IOException {
        g59Var.getClass();
        throw new IOException("zip file systems are read-only");
    }

    @Override // defpackage.ch4
    public final ikc g0(g59 g59Var) throws Throwable {
        Throwable th;
        yua yuaVar;
        g59Var.getClass();
        g59 g59Var2 = f;
        g59Var2.getClass();
        xff xffVar = (xff) this.e.get(d.a(g59Var2, g59Var, true));
        if (xffVar == null) {
            fm3.g("no such file: ", g59Var);
            return null;
        }
        long j = xffVar.f;
        we6 we6VarT = this.d.T(this.c);
        try {
            yuaVar = new yua(we6VarT.f(xffVar.h));
            try {
                we6VarT.close();
                th = null;
            } catch (Throwable th2) {
                th = th2;
            }
        } catch (Throwable th3) {
            if (we6VarT != null) {
                try {
                    we6VarT.close();
                } catch (Throwable th4) {
                    kyd.D(th3, th4);
                }
            }
            th = th3;
            yuaVar = null;
        }
        if (th != null) {
            throw th;
        }
        yuaVar.getClass();
        gq7.O(yuaVar, null);
        if (xffVar.g == 0) {
            return new il4(yuaVar, j, true);
        }
        return new il4(new o16(new yua(new il4(yuaVar, xffVar.e, true)), new Inflater(true)), j, false);
    }

    @Override // defpackage.ch4
    public final void m(g59 g59Var, g59 g59Var2) throws IOException {
        g59Var.getClass();
        g59Var2.getClass();
        throw new IOException("zip file systems are read-only");
    }
}
