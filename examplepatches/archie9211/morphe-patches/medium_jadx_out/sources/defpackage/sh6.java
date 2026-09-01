package defpackage;

import java.io.IOException;
import java.io.Serializable;
import java.lang.reflect.Constructor;
import java.lang.reflect.Modifier;
import java.lang.reflect.Type;
import java.util.Iterator;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class sh6 extends vg6 implements l55, qh6, m45, x45, n45, o45, p45, q45, r45, s45, t45, u45, v45, w45, b55, y45, z45, a55, c55, d55, e55, f55, g55, h55, i55 {
    public static final /* synthetic */ fj6[] n = {n1b.a.g(new u4a(sh6.class, "descriptor", "getDescriptor()Lorg/jetbrains/kotlin/descriptors/FunctionDescriptor;", 0))};
    public final ph6 h;
    public final String i;
    public final Object j;
    public final k1b k;
    public final vq6 l;
    public final vq6 m;

    /* JADX WARN: Multi-variable type inference failed */
    public sh6(ph6 ph6Var, String str, String str2, s55 s55Var, Object obj) {
        this.h = ph6Var;
        this.i = str2;
        this.j = obj;
        this.k = no7.y(s55Var, new a3(this, str, false, 15));
        yw6 yw6Var = yw6.PUBLICATION;
        this.l = vx0.d0(yw6Var, new rh6(this, 0 == true ? 1 : 0));
        this.m = vx0.d0(yw6Var, new rh6(this, 1));
    }

    @Override // defpackage.vg6
    public final boolean B() {
        return this.j != h41.NO_RECEIVER;
    }

    public final l51 C(Constructor constructor, s55 s55Var, boolean z) {
        Object obj = this.j;
        Class cls = null;
        if (!z) {
            zm1 zm1Var = s55Var instanceof zm1 ? (zm1) s55Var : null;
            if (zm1Var != null && !h93.e(zm1Var.getVisibility())) {
                y28 y28VarR = zm1Var.r();
                y28VarR.getClass();
                if (!g26.e(y28VarR) && !d93.p(zm1Var.r())) {
                    List listI = zm1Var.I();
                    listI.getClass();
                    if (!listI.isEmpty()) {
                        Iterator it2 = listI.iterator();
                        while (it2.hasNext()) {
                            mn6 type = ((lqe) it2.next()).getType();
                            type.getClass();
                            if (n01.g0(type)) {
                                if (B()) {
                                    return new w41(constructor, kk7.s(obj, y()), 0);
                                }
                                Class declaringClass = constructor.getDeclaringClass();
                                declaringClass.getClass();
                                Type[] genericParameterTypes = constructor.getGenericParameterTypes();
                                genericParameterTypes.getClass();
                                return new x41(constructor, declaringClass, cls, (Type[]) (genericParameterTypes.length <= 1 ? new Type[0] : k80.m0(0, genericParameterTypes.length - 1, genericParameterTypes)), 0);
                            }
                        }
                    }
                }
            }
        }
        if (B()) {
            return new w41(constructor, kk7.s(obj, y()), 1);
        }
        Class declaringClass2 = constructor.getDeclaringClass();
        declaringClass2.getClass();
        Class declaringClass3 = constructor.getDeclaringClass();
        Class<?> declaringClass4 = declaringClass3.getDeclaringClass();
        Class<?> cls2 = (declaringClass4 == null || Modifier.isStatic(declaringClass3.getModifiers())) ? null : declaringClass4;
        Type[] genericParameterTypes2 = constructor.getGenericParameterTypes();
        genericParameterTypes2.getClass();
        return new x41(constructor, declaringClass2, cls2, genericParameterTypes2, 1);
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0042  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.f51 D(java.lang.reflect.Method r6, boolean r7) {
        /*
            r5 = this;
            boolean r0 = r5.B()
            r1 = 0
            if (r0 == 0) goto L4e
            i51 r0 = new i51
            s55 r2 = r5.y()
            yq6 r2 = r2.M()
            java.lang.Object r3 = r5.j
            if (r2 == 0) goto L42
            mn6 r2 = r2.getType()
            int r4 = defpackage.g26.a
            zvd r2 = r2.j0()
            co1 r2 = r2.a()
            if (r2 == 0) goto L29
            boolean r1 = defpackage.g26.b(r2)
        L29:
            r2 = 1
            if (r1 != r2) goto L42
            java.lang.Class[] r1 = r6.getParameterTypes()
            r1.getClass()
            java.lang.Object r1 = defpackage.k80.u0(r1)
            java.lang.Class r1 = (java.lang.Class) r1
            if (r1 == 0) goto L42
            boolean r1 = r1.isInterface()
            if (r1 != r2) goto L42
            goto L4a
        L42:
            s55 r5 = r5.y()
            java.lang.Object r3 = defpackage.kk7.s(r3, r5)
        L4a:
            r0.<init>(r6, r7, r3)
            return r0
        L4e:
            k51 r5 = new k51
            r7 = 6
            r0 = 2
            r5.<init>(r7, r0, r6, r1)
            return r5
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.sh6.D(java.lang.reflect.Method, boolean):f51");
    }

    @Override // defpackage.vg6
    /* JADX INFO: renamed from: E, reason: merged with bridge method [inline-methods] */
    public final s55 y() {
        fj6 fj6Var = n[0];
        Object objInvoke = this.k.invoke();
        objInvoke.getClass();
        return (s55) objInvoke;
    }

    @Override // defpackage.g55
    public final Object e(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Serializable serializable) {
        return call(obj, obj2, obj3, obj4, obj5, obj6, serializable);
    }

    public final boolean equals(Object obj) {
        sh6 sh6VarB = bpe.b(obj);
        return sh6VarB != null && g76.L(this.h, sh6VarB.h) && getName().equals(sh6VarB.getName()) && g76.L(this.i, sh6VarB.i) && g76.L(this.j, sh6VarB.j);
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        return call(obj, obj2, obj3);
    }

    @Override // defpackage.l55
    public final int getArity() {
        v41 v41VarV = v();
        v41VarV.getClass();
        return v41VarV.a().size();
    }

    @Override // defpackage.rg6
    public final String getName() {
        String strB = ((zv2) y()).getName().b();
        strB.getClass();
        return strB;
    }

    public final int hashCode() {
        return this.i.hashCode() + ((getName().hashCode() + (this.h.hashCode() * 31)) * 31);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return call(obj, obj2);
    }

    @Override // defpackage.qh6
    public final boolean isExternal() {
        return y().isExternal();
    }

    @Override // defpackage.qh6
    public final boolean isInfix() {
        return y().isInfix();
    }

    @Override // defpackage.qh6
    public final boolean isInline() {
        return y().isInline();
    }

    @Override // defpackage.qh6
    public final boolean isOperator() {
        return y().isOperator();
    }

    @Override // defpackage.rg6, defpackage.qh6
    public final boolean isSuspend() {
        return y().isSuspend();
    }

    @Override // defpackage.d55
    public final Object k(Object obj, Object obj2, Object obj3, Object obj4) {
        return call(obj, obj2, obj3, obj4);
    }

    @Override // defpackage.f55
    public final Object p(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6) {
        return call(obj, obj2, obj3, obj4, obj5, obj6);
    }

    @Override // defpackage.h55
    public final Object q(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, Object obj6, Object obj7, Serializable serializable) {
        return call(obj, obj2, obj3, obj4, obj5, obj6, obj7, serializable);
    }

    @Override // defpackage.e55
    public final Object s(Object obj, Object obj2, Object obj3, Object obj4, Object obj5) {
        return call(obj, obj2, obj3, obj4, obj5);
    }

    public final String toString() throws IOException {
        StringBuilder sb = new StringBuilder();
        vo7.p(sb, this);
        sb.append("fun ");
        vo7.q(sb, this);
        sb.append(aq7.z(n98.e(getName())));
        bu1.E0(yi2.M(this), sb, ", ", "(", ")", p79.l, 48);
        sb.append(": ");
        sb.append(vo7.L(getReturnType()));
        return sb.toString();
    }

    @Override // defpackage.vg6
    public final v41 v() {
        return (v41) this.l.getValue();
    }

    @Override // defpackage.vg6
    public final ph6 w() {
        return this.h;
    }

    @Override // defpackage.vg6
    public final v41 x() {
        return (v41) this.m.getValue();
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        return call(obj);
    }

    @Override // defpackage.m45
    public final Object invoke() {
        return call(new Object[0]);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /* JADX WARN: Multi-variable type inference failed */
    public sh6(ph6 ph6Var, s55 s55Var) {
        s55Var.getClass();
        String strB = ((zv2) s55Var).getName().b();
        strB.getClass();
        this(ph6Var, strB, xmb.c(s55Var).J(), s55Var, h41.NO_RECEIVER);
    }
}
