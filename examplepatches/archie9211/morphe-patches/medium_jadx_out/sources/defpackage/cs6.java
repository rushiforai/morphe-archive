package defpackage;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Modifier;
import java.util.Collection;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class cs6 extends dn1 {
    public final n0c g;
    public final q0b h;
    public final y28 i;
    public final n0c j;
    public final w5d k;
    public final qn1 l;
    public final c28 m;
    public final l6 n;
    public final boolean o;
    public final r93 p;
    public final gs6 q;
    public final hrb r;
    public final j26 s;
    public final vs6 t;
    public final as6 u;
    public final u67 v;

    static {
        k80.S0(new String[]{"equals", "hashCode", "getClass", "wait", "notify", "notifyAll", "toString"});
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public cs6(n0c n0cVar, yv2 yv2Var, q0b q0bVar, y28 y28Var) throws IllegalAccessException, InvocationTargetException {
        c28 c28Var;
        super(((k96) n0cVar.b).a, yv2Var, q0bVar.e(), rz5.I(q0bVar));
        n0cVar.getClass();
        yv2Var.getClass();
        q0bVar.getClass();
        this.g = n0cVar;
        this.h = q0bVar;
        this.i = y28Var;
        n0c n0cVarX = vv2.x(n0cVar, this, q0bVar, 4);
        this.j = n0cVarX;
        x67 x67Var = ((k96) n0cVarX.b).a;
        this.k = new w5d(new bs6(this, 0));
        Class cls = q0bVar.a;
        this.l = cls.isAnnotation() ? qn1.ANNOTATION_CLASS : cls.isInterface() ? qn1.INTERFACE : cls.isEnum() ? qn1.ENUM_CLASS : qn1.CLASS;
        int i = 1;
        if (cls.isAnnotation() || cls.isEnum()) {
            c28Var = c28.FINAL;
        } else {
            a28 a28Var = c28.Companion;
            Boolean boolB = pxf.B(cls);
            boolean zBooleanValue = boolB != null ? boolB.booleanValue() : false;
            Boolean boolB2 = pxf.B(cls);
            boolean z = (boolB2 != null ? boolB2.booleanValue() : false) || Modifier.isAbstract(cls.getModifiers()) || cls.isInterface();
            boolean zIsFinal = Modifier.isFinal(cls.getModifiers());
            a28Var.getClass();
            c28Var = zBooleanValue ? c28.SEALED : z ? c28.ABSTRACT : !zIsFinal ? c28.OPEN : c28.FINAL;
        }
        this.m = c28Var;
        int modifiers = cls.getModifiers();
        this.n = Modifier.isPublic(modifiers) ? lwe.d : Modifier.isPrivate(modifiers) ? iwe.d : Modifier.isProtected(modifiers) ? Modifier.isStatic(modifiers) ? ua6.d : ta6.d : sa6.d;
        Class<?> declaringClass = cls.getDeclaringClass();
        this.o = ((declaringClass != null ? new q0b(declaringClass) : null) == null || Modifier.isStatic(cls.getModifiers())) ? false : true;
        this.p = new r93(this);
        gs6 gs6Var = new gs6(n0cVarX, this, q0bVar, y28Var != null, null);
        this.q = gs6Var;
        uob uobVar = hrb.d;
        z zVar = new z(20, this);
        uobVar.getClass();
        this.r = new hrb(this, x67Var, zVar);
        this.s = new j26(gs6Var);
        this.t = new vs6(n0cVarX, q0bVar, this);
        this.u = k50.h0(n0cVarX, q0bVar);
        this.v = new u67(x67Var, new bs6(this, i));
    }

    @Override // defpackage.y28
    public final qn1 b0() {
        return this.l;
    }

    @Override // defpackage.tu7
    public final boolean e0() {
        return false;
    }

    @Override // defpackage.do1
    public final boolean g() {
        return this.o;
    }

    @Override // defpackage.y28, defpackage.do1
    public final List g0() {
        return (List) this.v.invoke();
    }

    @Override // defpackage.gx
    public final ly getAnnotations() {
        return this.u;
    }

    @Override // defpackage.y28, defpackage.tu7, defpackage.dw2
    public final g93 getVisibility() {
        g93 g93Var = h93.a;
        l6 l6Var = this.n;
        if (g76.L(l6Var, g93Var)) {
            Class<?> declaringClass = this.h.a.getDeclaringClass();
            if ((declaringClass != null ? new q0b(declaringClass) : null) == null) {
                g93 g93Var2 = b96.a;
                g93Var2.getClass();
                return g93Var2;
            }
        }
        return pr7.p(l6Var);
    }

    @Override // defpackage.y28
    public final boolean isInline() {
        return false;
    }

    @Override // defpackage.y28
    public final ev7 j0() {
        return this.t;
    }

    @Override // defpackage.f0, defpackage.y28
    public final ev7 l0() {
        return this.s;
    }

    @Override // defpackage.f0, defpackage.y28
    public final ev7 m0() {
        return (gs6) super.m0();
    }

    @Override // defpackage.co1
    public final zvd n() {
        return this.p;
    }

    @Override // defpackage.y28
    public final ev7 n0(sn6 sn6Var) {
        hrb hrbVar = this.r;
        f0 f0Var = hrbVar.a;
        int i = f93.a;
        d93.d(f0Var).getClass();
        return (gs6) ((ev7) mk7.z(hrbVar.c, hrb.e[0]));
    }

    @Override // defpackage.y28, defpackage.tu7
    public final c28 o() {
        return this.m;
    }

    @Override // defpackage.y28
    public final zm1 o0() {
        return null;
    }

    @Override // defpackage.y28
    public final cqe p0() {
        return null;
    }

    @Override // defpackage.y28
    public final boolean q0() {
        return false;
    }

    @Override // defpackage.y28
    public final boolean r0() {
        return false;
    }

    @Override // defpackage.y28
    public final boolean s0() {
        return false;
    }

    @Override // defpackage.y28
    public final boolean t0() {
        return false;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Lazy Java class ");
        int i = f93.a;
        z05 z05VarG = d93.g(this);
        z05VarG.getClass();
        sb.append(z05VarG);
        return sb.toString();
    }

    @Override // defpackage.y28
    public final Collection w() {
        return (List) this.q.q.invoke();
    }

    public final gs6 w0() {
        return (gs6) super.m0();
    }

    @Override // defpackage.tu7
    public final boolean y() {
        return false;
    }
}
