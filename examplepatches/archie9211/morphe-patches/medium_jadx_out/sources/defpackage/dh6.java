package defpackage;

import java.lang.reflect.Modifier;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class dh6 extends ph6 implements wg6, jh6, yj6 {
    public static final HashSet d;
    public final Class b;
    public final vq6 c = vx0.d0(yw6.PUBLICATION, new xg6(this, 0));

    static {
        LinkedHashSet linkedHashSet = nlc.a;
        HashSet hashSet = new HashSet();
        Iterator it2 = linkedHashSet.iterator();
        while (it2.hasNext()) {
            hashSet.add(((mn1) it2.next()).a().a.toString());
        }
        d = hashSet;
    }

    public dh6(Class cls) {
        this.b = cls;
    }

    public static fn1 C(mn1 mn1Var, vmb vmbVar) {
        i93 i93Var = vmbVar.a;
        gy3 gy3Var = new gy3(i93Var.b, mn1Var.a, 0);
        n98 n98VarF = mn1Var.f();
        c28 c28Var = c28.FINAL;
        qn1 qn1Var = qn1.CLASS;
        List listQ = d46.Q(i93Var.b.e().k("Any").T());
        x67 x67Var = i93Var.a;
        fn1 fn1Var = new fn1(gy3Var, n98VarF, c28Var, qn1Var, listQ, x67Var);
        fn1Var.w0(new ch6(x67Var, fn1Var), ny3.a, null);
        return fn1Var;
    }

    public final mn1 D() {
        x0a primitiveType;
        mn1 mn1Var = xmb.a;
        Class cls = this.b;
        if (cls.isArray()) {
            Class<?> componentType = cls.getComponentType();
            componentType.getClass();
            primitiveType = componentType.isPrimitive() ? pf6.get(componentType.getSimpleName()).getPrimitiveType() : null;
            if (primitiveType != null) {
                return new mn1(mnc.k, primitiveType.getArrayTypeName());
            }
            y05 y05VarI = lnc.g.i();
            return new mn1(y05VarI.b(), y05VarI.a.g());
        }
        if (cls.equals(Void.TYPE)) {
            return xmb.a;
        }
        primitiveType = cls.isPrimitive() ? pf6.get(cls.getSimpleName()).getPrimitiveType() : null;
        if (primitiveType != null) {
            return new mn1(mnc.k, primitiveType.getTypeName());
        }
        mn1 mn1VarA = e0b.a(cls);
        if (!mn1VarA.c) {
            String str = s96.a;
            mn1 mn1VarF = s96.f(mn1VarA.a());
            if (mn1VarF != null) {
                return mn1VarF;
            }
        }
        return mn1VarA;
    }

    public final pn1 E() {
        pn1 pn1VarA;
        zl6 zl6VarG = G();
        if (zl6VarG != null && (pn1VarA = oa0.a(zl6VarG)) != null) {
            return pn1VarA;
        }
        Class cls = this.b;
        return cls.isAnnotation() ? pn1.ANNOTATION_CLASS : cls.isInterface() ? pn1.INTERFACE : cls.isEnum() ? pn1.ENUM_CLASS : cls.getSuperclass().isEnum() ? pn1.ENUM_ENTRY : pn1.CLASS;
    }

    @Override // defpackage.jh6
    /* JADX INFO: renamed from: F, reason: merged with bridge method [inline-methods] */
    public final y28 a() {
        return ((ah6) this.c.getValue()).b();
    }

    public final zl6 G() {
        return (zl6) ((ah6) this.c.getValue()).c.getValue();
    }

    public final b28 H() {
        b28 b28Var;
        zl6 zl6VarG = G();
        if (zl6VarG != null && (b28Var = (b28) oa0.b.z(oa0.a[7], zl6VarG)) != null) {
            return b28Var;
        }
        Class cls = this.b;
        return (cls.isAnnotation() || cls.isEnum()) ? b28.FINAL : g76.L(pxf.B(cls), Boolean.TRUE) ? b28.SEALED : Modifier.isAbstract(cls.getModifiers()) ? b28.ABSTRACT : !Modifier.isFinal(cls.getModifiers()) ? b28.OPEN : b28.FINAL;
    }

    @Override // defpackage.wg6
    public final String d() {
        k1b k1bVar = ((ah6) this.c.getValue()).g;
        fj6 fj6Var = ah6.q[3];
        return (String) k1bVar.invoke();
    }

    @Override // defpackage.ym1
    public final Class e() {
        return this.b;
    }

    public final boolean equals(Object obj) {
        return (obj instanceof dh6) && vx0.U(this).equals(vx0.U((wg6) obj));
    }

    @Override // defpackage.wg6
    public final boolean g() {
        zl6 zl6VarG = G();
        if (zl6VarG != null) {
            return oa0.d.I(oa0.a[10], zl6VarG);
        }
        Class cls = this.b;
        return (cls.getDeclaringClass() == null || Modifier.isStatic(cls.getModifiers())) ? false : true;
    }

    @Override // defpackage.qg6
    public final List getAnnotations() {
        k1b k1bVar = ((ah6) this.c.getValue()).e;
        fj6 fj6Var = ah6.q[1];
        Object objInvoke = k1bVar.invoke();
        objInvoke.getClass();
        return (List) objInvoke;
    }

    @Override // defpackage.wg6
    public final List getTypeParameters() {
        k1b k1bVar = ((ah6) this.c.getValue()).j;
        fj6 fj6Var = ah6.q[6];
        Object objInvoke = k1bVar.invoke();
        objInvoke.getClass();
        return (List) objInvoke;
    }

    @Override // defpackage.wg6
    public final int hashCode() {
        return vx0.U(this).hashCode();
    }

    @Override // defpackage.wg6
    public final boolean i() {
        zl6 zl6VarG = G();
        return zl6VarG != null && oa0.e.I(oa0.a[14], zl6VarG);
    }

    @Override // defpackage.wg6
    public final boolean isAbstract() {
        return H() == b28.ABSTRACT;
    }

    @Override // defpackage.wg6
    public final String j() {
        k1b k1bVar = ((ah6) this.c.getValue()).f;
        fj6 fj6Var = ah6.q[2];
        return (String) k1bVar.invoke();
    }

    @Override // defpackage.wg6
    public final Object l() {
        return ((ah6) this.c.getValue()).i.getValue();
    }

    @Override // defpackage.wg6
    public final boolean n() {
        return H() == b28.SEALED;
    }

    @Override // defpackage.ph6
    public final Collection q() {
        y28 y28VarA = a();
        if (y28VarA.b0() == qn1.INTERFACE || y28VarA.b0() == qn1.OBJECT) {
            return ey3.a;
        }
        Collection collectionW = y28VarA.w();
        collectionW.getClass();
        return collectionW;
    }

    @Override // defpackage.ph6
    public final Collection s(n98 n98Var) {
        ev7 ev7VarH = a().T().H();
        ng8 ng8Var = ng8.FROM_REFLECTION;
        Collection collectionA = ev7VarH.a(n98Var, ng8Var);
        ev7 ev7VarJ0 = a().j0();
        ev7VarJ0.getClass();
        return bu1.Q0(ev7VarJ0.a(n98Var, ng8Var), collectionA);
    }

    @Override // defpackage.wg6
    public final boolean t(Object obj) {
        Map map = e0b.d;
        Class cls = this.b;
        Integer num = (Integer) map.get(cls);
        if (num != null) {
            return pwd.S(num.intValue(), obj);
        }
        Class cls2 = (Class) e0b.c.get(cls);
        if (cls2 != null) {
            cls = cls2;
        }
        return cls.isInstance(obj);
    }

    public final String toString() {
        mn1 mn1VarD = D();
        y05 y05Var = mn1VarD.a;
        return "class ".concat((y05Var.a.c() ? "" : ev6.z(new StringBuilder(), y05Var.a.a, '.')).concat(tuc.K(mn1VarD.b.a.a, '.', '$')));
    }

    @Override // defpackage.ph6
    public final q4a u(int i) {
        Class<?> declaringClass;
        Class cls = this.b;
        if (cls.getSimpleName().equals("DefaultImpls") && (declaringClass = cls.getDeclaringClass()) != null && declaringClass.isInterface()) {
            return ((dh6) n1b.a.b(declaringClass)).u(i);
        }
        y28 y28VarA = a();
        s93 s93Var = y28VarA instanceof s93 ? (s93) y28VarA : null;
        if (s93Var != null) {
            k5a k5aVar = s93Var.e;
            o75 o75Var = gg6.j;
            o75Var.getClass();
            i6a i6aVar = (i6a) il7.A(k5aVar, o75Var, i);
            if (i6aVar != null) {
                sj0 sj0Var = s93Var.l;
                return (q4a) bpe.f(cls, i6aVar, (p98) sj0Var.b, (wjc) sj0Var.d, s93Var.f, a0.u);
            }
        }
        return null;
    }

    @Override // defpackage.ph6
    public final Collection x(n98 n98Var) {
        ev7 ev7VarH = a().T().H();
        ng8 ng8Var = ng8.FROM_REFLECTION;
        Collection collectionF = ev7VarH.f(n98Var, ng8Var);
        ev7 ev7VarJ0 = a().j0();
        ev7VarJ0.getClass();
        return bu1.Q0(ev7VarJ0.f(n98Var, ng8Var), collectionF);
    }
}
