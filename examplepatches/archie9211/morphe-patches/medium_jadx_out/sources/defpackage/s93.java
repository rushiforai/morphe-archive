package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class s93 extends f0 implements yv2 {
    public final k5a e;
    public final mr0 f;
    public final jkc g;
    public final mn1 h;
    public final c28 i;
    public final g93 j;
    public final qn1 k;
    public final sj0 l;
    public final fv7 m;
    public final r93 n;
    public final hrb o;
    public final n0c p;
    public final yv2 q;
    public final t67 r;
    public final u67 s;
    public final t67 t;
    public final h7a u;
    public final ly v;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public s93(sj0 sj0Var, k5a k5aVar, p98 p98Var, mr0 mr0Var, jkc jkcVar) {
        qn1 qn1Var;
        fv7 mqcVar;
        super(((i93) sj0Var.a).a, vn7.z(p98Var, k5aVar.e).f());
        sj0Var.getClass();
        k5aVar.getClass();
        p98Var.getClass();
        jkcVar.getClass();
        this.e = k5aVar;
        this.f = mr0Var;
        this.g = jkcVar;
        this.h = vn7.z(p98Var, k5aVar.e);
        this.i = zi5.m((c6a) cm4.e.d(k5aVar.d));
        this.j = en7.t((g7a) cm4.d.d(k5aVar.d));
        j5a j5aVar = (j5a) cm4.f.d(k5aVar.d);
        switch (j5aVar == null ? -1 : n7a.b[j5aVar.ordinal()]) {
            case 1:
                qn1Var = qn1.CLASS;
                break;
            case 2:
                qn1Var = qn1.INTERFACE;
                break;
            case 3:
                qn1Var = qn1.ENUM_CLASS;
                break;
            case 4:
                qn1Var = qn1.ENUM_ENTRY;
                break;
            case 5:
                qn1Var = qn1.ANNOTATION_CLASS;
                break;
            case 6:
            case 7:
                qn1Var = qn1.OBJECT;
                break;
            default:
                qn1Var = qn1.CLASS;
                break;
        }
        qn1 qn1Var2 = qn1Var;
        this.k = qn1Var2;
        List list = k5aVar.g;
        list.getClass();
        y6a y6aVar = k5aVar.A;
        y6aVar.getClass();
        wjc wjcVar = new wjc(y6aVar);
        kse kseVar = kse.b;
        f7a f7aVar = k5aVar.C;
        f7aVar.getClass();
        sj0 sj0VarA = sj0Var.a(this, list, p98Var, wjcVar, il7.p(f7aVar), mr0Var);
        i93 i93Var = (i93) sj0VarA.a;
        x67 x67Var = i93Var.a;
        this.l = sj0VarA;
        boolean zBooleanValue = cm4.m.d(k5aVar.d).booleanValue();
        qn1 qn1Var3 = qn1.ENUM_CLASS;
        int i = 0;
        if (qn1Var2 == qn1Var3) {
            mqcVar = new mqc(x67Var, this, zBooleanValue || g76.L(i93Var.s.q(), Boolean.TRUE));
        } else {
            mqcVar = dv7.b;
        }
        this.m = mqcVar;
        this.n = new r93(this);
        uob uobVar = hrb.d;
        ((df8) i93Var.q).getClass();
        k0 k0Var = new k0(1, this, q93.class, "<init>", "<init>(Lorg/jetbrains/kotlin/serialization/deserialization/descriptors/DeserializedClassDescriptor;Lorg/jetbrains/kotlin/types/checker/KotlinTypeRefiner;)V", 0, 10);
        uobVar.getClass();
        x67Var.getClass();
        this.o = new hrb(this, x67Var, k0Var);
        this.p = qn1Var2 == qn1Var3 ? new n0c(this) : null;
        yv2 yv2Var = (yv2) sj0Var.c;
        this.q = yv2Var;
        this.r = new t67(x67Var, new m93(this, i));
        this.s = new u67(x67Var, new m93(this, 1));
        new t67(x67Var, new m93(this, 2));
        x67Var.a(new m93(this, 3));
        this.t = new t67(x67Var, new m93(this, 4));
        p98 p98Var2 = (p98) sj0VarA.b;
        wjc wjcVar2 = (wjc) sj0VarA.d;
        s93 s93Var = yv2Var instanceof s93 ? (s93) yv2Var : null;
        this.u = new h7a(k5aVar, p98Var2, wjcVar2, jkcVar, s93Var != null ? s93Var.u : null);
        this.v = !cm4.c.d(k5aVar.d).booleanValue() ? cd7.e : new mh8(x67Var, new m93(this, 5));
    }

    @Override // defpackage.f0, defpackage.y28
    public final List a0() {
        sj0 sj0Var = this.l;
        List listJ = vn7.j(this.e, (wjc) sj0Var.d);
        ArrayList arrayList = new ArrayList(cu1.k0(listJ, 10));
        Iterator it2 = listJ.iterator();
        while (it2.hasNext()) {
            arrayList.add(new yq6(k0(), new d92(this, ((jz1) sj0Var.h).G((s6a) it2.next()), (n98) null), cd7.e));
        }
        return arrayList;
    }

    @Override // defpackage.y28
    public final qn1 b0() {
        return this.k;
    }

    @Override // defpackage.aw2
    public final jkc d() {
        return this.g;
    }

    @Override // defpackage.tu7
    public final boolean e0() {
        return false;
    }

    @Override // defpackage.do1
    public final boolean g() {
        return cm4.g.d(this.e.d).booleanValue();
    }

    @Override // defpackage.y28, defpackage.do1
    public final List g0() {
        return ((jz1) this.l.h).u();
    }

    @Override // defpackage.gx
    public final ly getAnnotations() {
        return this.v;
    }

    @Override // defpackage.y28, defpackage.tu7, defpackage.dw2
    public final g93 getVisibility() {
        return this.j;
    }

    @Override // defpackage.yv2
    public final yv2 h() {
        return this.q;
    }

    @Override // defpackage.tu7
    public final boolean isExternal() {
        return cm4.i.d(this.e.d).booleanValue();
    }

    @Override // defpackage.y28
    public final boolean isInline() {
        if (!cm4.k.d(this.e.d).booleanValue()) {
            return false;
        }
        mr0 mr0Var = this.f;
        int i = mr0Var.b;
        if (i >= 1) {
            if (i > 1) {
                return false;
            }
            int i2 = mr0Var.c;
            if (i2 >= 4 && (i2 > 4 || mr0Var.d > 1)) {
                return false;
            }
        }
        return true;
    }

    @Override // defpackage.y28
    public final ev7 j0() {
        return this.m;
    }

    @Override // defpackage.co1
    public final zvd n() {
        return this.n;
    }

    @Override // defpackage.y28
    public final ev7 n0(sn6 sn6Var) {
        hrb hrbVar = this.o;
        f0 f0Var = hrbVar.a;
        int i = f93.a;
        d93.d(f0Var).getClass();
        return (ev7) mk7.z(hrbVar.c, hrb.e[0]);
    }

    @Override // defpackage.y28, defpackage.tu7
    public final c28 o() {
        return this.i;
    }

    @Override // defpackage.y28
    public final zm1 o0() {
        return (zm1) this.r.invoke();
    }

    @Override // defpackage.y28
    public final cqe p0() {
        return (cqe) this.t.invoke();
    }

    @Override // defpackage.y28
    public final boolean q0() {
        return cm4.f.d(this.e.d) == j5a.COMPANION_OBJECT;
    }

    @Override // defpackage.y28
    public final boolean r0() {
        return cm4.h.d(this.e.d).booleanValue();
    }

    @Override // defpackage.y28
    public final boolean s0() {
        return cm4.l.d(this.e.d).booleanValue();
    }

    @Override // defpackage.y28
    public final boolean t0() {
        return cm4.k.d(this.e.d).booleanValue() && this.f.a(1, 4, 2);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("deserialized ");
        sb.append(y() ? "expect " : "");
        sb.append("class ");
        sb.append(getName());
        return sb.toString();
    }

    @Override // defpackage.y28
    public final Collection w() {
        return (Collection) this.s.invoke();
    }

    public final q93 w0() {
        ((df8) ((i93) this.l.a).q).getClass();
        hrb hrbVar = this.o;
        hrbVar.getClass();
        f0 f0Var = hrbVar.a;
        int i = f93.a;
        d93.d(f0Var).getClass();
        return (q93) ((ev7) mk7.z(hrbVar.c, hrb.e[0]));
    }

    public final hec x0(n98 n98Var) {
        Iterator it2 = w0().f(n98Var, ng8.FROM_DESERIALIZATION).iterator();
        boolean z = false;
        Object obj = null;
        while (true) {
            if (!it2.hasNext()) {
                if (!z) {
                    break;
                }
            } else {
                Object next = it2.next();
                if (((q4a) next).P() == null) {
                    if (z) {
                        break;
                    }
                    z = true;
                    obj = next;
                }
            }
        }
        obj = null;
        q4a q4aVar = (q4a) obj;
        return (hec) (q4aVar != null ? q4aVar.getType() : null);
    }

    @Override // defpackage.tu7
    public final boolean y() {
        return cm4.j.d(this.e.d).booleanValue();
    }
}
