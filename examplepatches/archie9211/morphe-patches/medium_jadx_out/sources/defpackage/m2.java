package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class m2 {
    public n2[] a;
    public int b;
    public int c;
    public uxc d;

    public final n2 d() {
        n2 n2VarE;
        uxc uxcVar;
        synchronized (this) {
            try {
                n2[] n2VarArrF = this.a;
                if (n2VarArrF == null) {
                    n2VarArrF = f();
                    this.a = n2VarArrF;
                } else if (this.b >= n2VarArrF.length) {
                    Object[] objArrCopyOf = Arrays.copyOf(n2VarArrF, n2VarArrF.length * 2);
                    this.a = (n2[]) objArrCopyOf;
                    n2VarArrF = (n2[]) objArrCopyOf;
                }
                int i = this.c;
                do {
                    n2VarE = n2VarArrF[i];
                    if (n2VarE == null) {
                        n2VarE = e();
                        n2VarArrF[i] = n2VarE;
                    }
                    i++;
                    if (i >= n2VarArrF.length) {
                        i = 0;
                    }
                } while (!n2VarE.a(this));
                this.c = i;
                this.b++;
                uxcVar = this.d;
            } catch (Throwable th) {
                throw th;
            }
        }
        if (uxcVar != null) {
            uxcVar.x(1);
        }
        return n2VarE;
    }

    public abstract n2 e();

    public abstract n2[] f();

    public final void i(n2 n2Var) {
        uxc uxcVar;
        int i;
        n92[] n92VarArrB;
        synchronized (this) {
            try {
                int i2 = this.b - 1;
                this.b = i2;
                uxcVar = this.d;
                if (i2 == 0) {
                    this.c = 0;
                }
                n2Var.getClass();
                n92VarArrB = n2Var.b(this);
            } catch (Throwable th) {
                throw th;
            }
        }
        for (n92 n92Var : n92VarArrB) {
            if (n92Var != null) {
                n92Var.resumeWith(c1e.a);
            }
        }
        if (uxcVar != null) {
            uxcVar.x(-1);
        }
    }

    public final uxc j() {
        uxc uxcVar;
        synchronized (this) {
            uxcVar = this.d;
            if (uxcVar == null) {
                int i = this.b;
                uxcVar = new uxc(1, Integer.MAX_VALUE, nz0.DROP_OLDEST);
                uxcVar.h(Integer.valueOf(i));
                this.d = uxcVar;
            }
        }
        return uxcVar;
    }
}
