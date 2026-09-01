package defpackage;

import java.io.Closeable;
import java.io.File;
import java.io.Flushable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class x21 implements Closeable, Flushable {
    public final lg3 a;

    public x21(File file) {
        ig6 ig6Var = ch4.a;
        String str = g59.b;
        g59 g59VarS = cd7.s(file);
        ig6Var.getClass();
        cgd cgdVar = cgd.l;
        cgdVar.getClass();
        this.a = new lg3(ig6Var, g59VarS, cgdVar);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.a.close();
    }

    public final void f(kbb kbbVar) {
        kbbVar.getClass();
        lg3 lg3Var = this.a;
        String strG = rv8.G(kbbVar.a);
        synchronized (lg3Var) {
            strG.getClass();
            lg3Var.D();
            lg3Var.f();
            lg3.g0(strG);
            cg3 cg3Var = (cg3) lg3Var.i.get(strG);
            if (cg3Var == null) {
                return;
            }
            lg3Var.T(cg3Var);
            if (lg3Var.g <= lg3Var.c) {
                lg3Var.o = false;
            }
        }
    }

    @Override // java.io.Flushable
    public final void flush() {
        this.a.flush();
    }

    public final synchronized void m() {
    }
}
