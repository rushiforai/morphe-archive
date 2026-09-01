package defpackage;

import java.util.Collection;
import java.util.List;
import java.util.Map;
import kotlin.reflect.jvm.internal.impl.descriptors.InvalidModuleException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class c38 extends zv2 implements b38 {
    public final x67 d;
    public final vm6 e;
    public final Map f;
    public final ey8 g;
    public a38 h;
    public zx8 i;
    public final boolean j;
    public final r67 k;
    public final w5d l;

    public c38(n98 n98Var, x67 x67Var, vm6 vm6Var, int i) {
        super(cd7.e, n98Var);
        this.d = x67Var;
        this.e = vm6Var;
        if (!n98Var.b) {
            ik4.h("Module name must be special: ", n98Var);
            throw null;
        }
        this.f = fy3.a;
        ey8.a.getClass();
        ey8 ey8Var = (ey8) G(cy8.b);
        this.g = ey8Var == null ? dy8.b : ey8Var;
        this.j = true;
        this.k = x67Var.b(new z(23, this));
        this.l = new w5d(new ge6(this, 1));
    }

    @Override // defpackage.yv2
    public final Object F(cw2 cw2Var, Object obj) {
        return cw2Var.D(this, obj);
    }

    @Override // defpackage.b38
    public final Object G(d1g d1gVar) {
        d1gVar.getClass();
        Object obj = this.f.get(d1gVar);
        if (obj == null) {
            return null;
        }
        return obj;
    }

    @Override // defpackage.b38
    public final List W() {
        if (this.h != null) {
            return ey3.a;
        }
        String str = getName().a;
        str.getClass();
        rd6.h("Dependencies of module ", str, " were not set");
        return null;
    }

    @Override // defpackage.b38
    public final rv6 X(y05 y05Var) {
        y05Var.getClass();
        x0();
        return (rv6) this.k.invoke(y05Var);
    }

    @Override // defpackage.b38
    public final vm6 e() {
        return this.e;
    }

    @Override // defpackage.yv2
    public final yv2 h() {
        return null;
    }

    @Override // defpackage.b38
    public final Collection k(y05 y05Var, x45 x45Var) {
        y05Var.getClass();
        x0();
        x0();
        return ((j22) this.l.getValue()).k(y05Var, x45Var);
    }

    @Override // defpackage.zv2, defpackage.b2
    public final String toString() {
        StringBuilder sb = new StringBuilder(zv2.w0(this));
        if (!this.j) {
            sb.append(" !isValid");
        }
        sb.append(" packageFragmentProvider: ");
        zx8 zx8Var = this.i;
        sb.append(zx8Var != null ? zx8Var.getClass().getSimpleName() : null);
        return sb.toString();
    }

    @Override // defpackage.b38
    public final boolean v(b38 b38Var) {
        b38Var.getClass();
        if (this == b38Var) {
            return true;
        }
        this.h.getClass();
        if (bu1.p0(ny3.a, b38Var)) {
            return true;
        }
        W();
        return b38Var.W().contains(this);
    }

    public final void x0() {
        if (this.j) {
            return;
        }
        if (G(kyd.h) != null) {
            rd6.m();
        } else {
            throw new InvalidModuleException("Accessing invalid module descriptor " + this);
        }
    }
}
