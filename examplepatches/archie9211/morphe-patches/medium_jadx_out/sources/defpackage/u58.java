package defpackage;

import java.util.ArrayList;
import kotlin.NoWhenBranchMatchedException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u58 extends b2 {
    public final f78 c;
    public final ArrayList d;
    public final g78 e;
    public final f78 f;
    public final o19 g;

    public u58() {
        super(5);
        this.c = tp7.q();
        this.d = new ArrayList();
        g78 g78Var = iqb.a;
        this.e = new g78();
        this.f = new f78();
        v08 v08Var = new v08(4, this);
        uic.b(uic.a);
        synchronized (uic.c) {
            uic.h = bu1.R0(uic.h, v08Var);
        }
        this.g = new o19(7, v08Var);
    }

    @Override // defpackage.b2
    public final void j0(xyb xybVar) {
        this.d.add(new s58(xybVar));
    }

    @Override // defpackage.b2
    public final void k0() {
        synchronized (this.b) {
            try {
                ArrayList arrayList = this.d;
                int size = arrayList.size();
                for (int i = 0; i < size; i++) {
                    t58 t58Var = (t58) arrayList.get(i);
                    if (t58Var instanceof r58) {
                        tp7.o(this.c, ((r58) t58Var).a, ((r58) t58Var).b);
                    } else {
                        if (!(t58Var instanceof s58)) {
                            throw new NoWhenBranchMatchedException();
                        }
                        tp7.A(this.c, ((s58) t58Var).a);
                    }
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        this.d.clear();
    }

    @Override // defpackage.b2
    public final void l0() {
        this.g.b();
        this.d.clear();
        this.f.a();
        synchronized (this.b) {
            this.c.a();
        }
    }

    @Override // defpackage.b2
    public final x45 r0(xyb xybVar) {
        f78 f78Var = this.f;
        x45 si3Var = (x45) f78Var.g(xybVar);
        if (si3Var == null) {
            si3Var = new si3(this, 29, xybVar);
            int iF = f78Var.f(xybVar);
            if (iF < 0) {
                iF = ~iF;
            }
            Object[] objArr = f78Var.c;
            Object obj = objArr[iF];
            f78Var.b[iF] = xybVar;
            objArr[iF] = si3Var;
        }
        return si3Var;
    }

    @Override // defpackage.b2
    public final void s0(wj1 wj1Var) {
        this.f.k(wj1Var);
        j0(wj1Var);
        k0();
    }
}
