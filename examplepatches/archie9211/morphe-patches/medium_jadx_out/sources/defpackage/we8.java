package defpackage;

import java.util.Collection;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class we8 implements m61 {
    public final xwd a;
    public m45 b;
    public final we8 c;
    public final swd d;
    public final vq6 e;

    public we8(xwd xwdVar, m45 m45Var, we8 we8Var, swd swdVar) {
        xwdVar.getClass();
        this.a = xwdVar;
        this.b = m45Var;
        this.c = we8Var;
        this.d = swdVar;
        this.e = vx0.d0(yw6.PUBLICATION, new bx6(3, this));
    }

    @Override // defpackage.zvd
    public final co1 a() {
        return null;
    }

    @Override // defpackage.zvd
    public final Collection b() {
        List list = (List) this.e.getValue();
        return list == null ? ey3.a : list;
    }

    @Override // defpackage.zvd
    public final boolean c() {
        return false;
    }

    @Override // defpackage.m61
    public final xwd d() {
        return this.a;
    }

    @Override // defpackage.zvd
    public final vm6 e() {
        mn6 mn6VarB = this.a.b();
        mn6VarB.getClass();
        return ok7.B(mn6VarB);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!we8.class.equals(obj != null ? obj.getClass() : null)) {
            return false;
        }
        obj.getClass();
        we8 we8Var = (we8) obj;
        we8 we8Var2 = this.c;
        if (we8Var2 != null) {
            this = we8Var2;
        }
        we8 we8Var3 = we8Var.c;
        if (we8Var3 != null) {
            obj = we8Var3;
        }
        return this == obj;
    }

    @Override // defpackage.zvd
    public final List getParameters() {
        return ey3.a;
    }

    public final int hashCode() {
        we8 we8Var = this.c;
        return we8Var != null ? we8Var.hashCode() : super.hashCode();
    }

    public final String toString() {
        return "CapturedType(" + this.a + ')';
    }

    public /* synthetic */ we8(xwd xwdVar, n93 n93Var, swd swdVar, int i) {
        this(xwdVar, (i & 2) != 0 ? null : n93Var, (we8) null, (i & 8) != 0 ? null : swdVar);
    }
}
