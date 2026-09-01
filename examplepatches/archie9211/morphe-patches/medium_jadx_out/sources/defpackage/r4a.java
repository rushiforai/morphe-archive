package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import pushnotifications.SY.eoLmc;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public class r4a extends oqe implements q4a {
    public hf4 A;
    public final boolean g;
    public t67 h;
    public m45 i;
    public final c28 j;
    public g93 k;
    public Collection l;
    public final q4a m;
    public final e41 n;
    public final boolean o;
    public final boolean p;
    public final boolean q;
    public final boolean r;
    public final boolean s;
    public List t;
    public yq6 u;
    public yq6 v;
    public ArrayList w;
    public s4a x;
    public x4a y;
    public hf4 z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public r4a(yv2 yv2Var, q4a q4aVar, ly lyVar, c28 c28Var, g93 g93Var, boolean z, n98 n98Var, e41 e41Var, jkc jkcVar, boolean z2, boolean z3, boolean z4, boolean z5, boolean z6) {
        super(yv2Var, lyVar, n98Var, null, jkcVar);
        if (yv2Var == null) {
            f0(0);
            throw null;
        }
        if (lyVar == null) {
            f0(1);
            throw null;
        }
        if (c28Var == null) {
            f0(2);
            throw null;
        }
        if (g93Var == null) {
            f0(3);
            throw null;
        }
        if (n98Var == null) {
            f0(4);
            throw null;
        }
        if (e41Var == null) {
            f0(5);
            throw null;
        }
        if (jkcVar == null) {
            f0(6);
            throw null;
        }
        this.g = z;
        this.l = null;
        this.t = Collections.EMPTY_LIST;
        this.j = c28Var;
        this.k = g93Var;
        this.m = q4aVar == null ? this : q4aVar;
        this.n = e41Var;
        this.o = z2;
        this.p = z3;
        this.q = z4;
        this.r = z5;
        this.s = z6;
    }

    public static s55 B0(ixd ixdVar, o4a o4aVar) {
        if (o4aVar == null) {
            f0(31);
            throw null;
        }
        s55 s55Var = o4aVar.m;
        if (s55Var != null) {
            return s55Var.f(ixdVar);
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x001a  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static /* synthetic */ void f0(int r11) {
        /*
            Method dump skipped, instruction units count: 538
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.r4a.f0(int):void");
    }

    public static r4a z0(yv2 yv2Var, c28 c28Var, g93 g93Var, boolean z, n98 n98Var, e41 e41Var, jkc jkcVar) {
        ky kyVar = cd7.e;
        if (yv2Var == null) {
            f0(7);
            throw null;
        }
        if (c28Var == null) {
            f0(9);
            throw null;
        }
        if (g93Var == null) {
            f0(10);
            throw null;
        }
        if (n98Var == null) {
            f0(11);
            throw null;
        }
        if (e41Var == null) {
            f0(12);
            throw null;
        }
        if (jkcVar != null) {
            return new r4a(yv2Var, null, kyVar, c28Var, g93Var, z, n98Var, e41Var, jkcVar, false, false, false, false, false);
        }
        f0(13);
        throw null;
    }

    public r4a A0(yv2 yv2Var, c28 c28Var, g93 g93Var, q4a q4aVar, e41 e41Var, n98 n98Var) {
        if (yv2Var == null) {
            f0(32);
            throw null;
        }
        if (c28Var == null) {
            f0(33);
            throw null;
        }
        if (g93Var == null) {
            f0(34);
            throw null;
        }
        if (e41Var == null) {
            f0(35);
            throw null;
        }
        if (n98Var == null) {
            f0(36);
            throw null;
        }
        return new r4a(yv2Var, q4aVar, getAnnotations(), c28Var, g93Var, this.g, n98Var, e41Var, jkc.g0, this.o, p(), this.q, isExternal(), this.s);
    }

    @Override // defpackage.q4a
    public final boolean B() {
        return this.s;
    }

    public final void C0(s4a s4aVar, x4a x4aVar, hf4 hf4Var, hf4 hf4Var2) {
        this.x = s4aVar;
        this.y = x4aVar;
        this.z = hf4Var;
        this.A = hf4Var2;
    }

    @Override // defpackage.nqe
    public final f52 E() {
        t67 t67Var = this.h;
        if (t67Var != null) {
            return (f52) t67Var.invoke();
        }
        return null;
    }

    public void E0(mn6 mn6Var) {
    }

    @Override // defpackage.yv2
    public final Object F(cw2 cw2Var, Object obj) {
        return cw2Var.H(this, obj);
    }

    public final void F0(mn6 mn6Var, List list, yq6 yq6Var, yq6 yq6Var2, List list2) {
        if (mn6Var == null) {
            f0(17);
            throw null;
        }
        if (list == null) {
            f0(18);
            throw null;
        }
        if (list2 == null) {
            f0(19);
            throw null;
        }
        this.f = mn6Var;
        this.w = new ArrayList(list);
        this.v = yq6Var2;
        this.u = yq6Var;
        this.t = list2;
    }

    @Override // defpackage.oqe, defpackage.c41
    public final yq6 M() {
        return this.u;
    }

    @Override // defpackage.nqe
    public final boolean O() {
        return this.g;
    }

    @Override // defpackage.oqe, defpackage.c41
    public final yq6 P() {
        return this.v;
    }

    @Override // defpackage.q4a
    public final hf4 Q() {
        return this.A;
    }

    @Override // defpackage.q4a
    public final hf4 S() {
        return this.z;
    }

    @Override // defpackage.c41
    public final List U() {
        List list = this.t;
        if (list != null) {
            return list;
        }
        f0(22);
        throw null;
    }

    @Override // defpackage.nqe
    public final boolean V() {
        return this.o;
    }

    @Override // defpackage.f41
    public final void Z(Collection collection) {
        if (collection != null) {
            this.l = collection;
        } else {
            f0(40);
            throw null;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v1, types: [q4a] */
    /* JADX WARN: Type inference failed for: r1v5 */
    /* JADX WARN: Type inference failed for: r1v6 */
    @Override // defpackage.bw2
    /* JADX INFO: renamed from: a */
    public final q4a x0() {
        q4a q4aVar = this.m;
        ?? X0 = this;
        if (q4aVar != this) {
            X0 = q4aVar.x0();
        }
        if (X0 != 0) {
            return X0;
        }
        f0(38);
        throw null;
    }

    @Override // defpackage.q4a
    public final s4a b() {
        return this.x;
    }

    @Override // defpackage.q4a
    public final x4a c() {
        return this.y;
    }

    @Override // defpackage.tu7
    public final boolean e0() {
        return false;
    }

    @Override // defpackage.s0d
    public final q4a f(ixd ixdVar) {
        if (ixdVar == null) {
            f0(27);
            throw null;
        }
        exd exdVar = ixdVar.a;
        if (exdVar.e()) {
            return this;
        }
        mtd mtdVar = new mtd(this);
        mtdVar.g = exdVar;
        mtdVar.e = x0();
        return mtdVar.b();
    }

    @Override // defpackage.oqe, defpackage.c41
    public final mn6 getReturnType() {
        mn6 type = getType();
        if (type != null) {
            return type;
        }
        f0(23);
        throw null;
    }

    @Override // defpackage.oqe, defpackage.c41
    public final List getTypeParameters() {
        ArrayList arrayList = this.w;
        if (arrayList != null) {
            return arrayList;
        }
        ik4.o("typeParameters == null for ", this);
        return null;
    }

    @Override // defpackage.dw2
    public final g93 getVisibility() {
        g93 g93Var = this.k;
        if (g93Var != null) {
            return g93Var;
        }
        f0(25);
        throw null;
    }

    @Override // defpackage.c41
    public final Collection i() {
        Collection collection = this.l;
        if (collection == null) {
            collection = Collections.EMPTY_LIST;
        }
        if (collection != null) {
            return collection;
        }
        f0(41);
        throw null;
    }

    public boolean isExternal() {
        return this.r;
    }

    @Override // defpackage.f41
    public final e41 j() {
        e41 e41Var = this.n;
        if (e41Var != null) {
            return e41Var;
        }
        f0(39);
        throw null;
    }

    @Override // defpackage.q4a
    public final ArrayList l() {
        ArrayList arrayList = new ArrayList(2);
        s4a s4aVar = this.x;
        if (s4aVar != null) {
            arrayList.add(s4aVar);
        }
        x4a x4aVar = this.y;
        if (x4aVar != null) {
            arrayList.add(x4aVar);
        }
        return arrayList;
    }

    public Object m(v93 v93Var) {
        return null;
    }

    @Override // defpackage.tu7
    public final c28 o() {
        c28 c28Var = this.j;
        if (c28Var != null) {
            return c28Var;
        }
        f0(24);
        throw null;
    }

    public boolean p() {
        return this.p;
    }

    @Override // defpackage.tu7
    public final boolean y() {
        return this.q;
    }

    @Override // defpackage.f41
    /* JADX INFO: renamed from: y0, reason: merged with bridge method [inline-methods] */
    public final r4a A(yv2 yv2Var, c28 c28Var, g93 g93Var, e41 e41Var) throws gxd {
        mtd mtdVar = new mtd(this);
        mtdVar.b = yv2Var;
        mtdVar.e = null;
        mtdVar.c = c28Var;
        if (g93Var == null) {
            mtd.a(8);
            throw null;
        }
        mtdVar.d = g93Var;
        if (e41Var == null) {
            mtd.a(10);
            throw null;
        }
        mtdVar.f = e41Var;
        mtdVar.a = false;
        r4a r4aVarB = mtdVar.b();
        if (r4aVarB != null) {
            return r4aVarB;
        }
        f0(42);
        throw null;
    }

    public final void D0(t67 t67Var, m45 m45Var) {
        if (m45Var == null) {
            throw new IllegalArgumentException(String.format("Argument for @NotNull parameter '%s' of %s.%s must not be null", "compileTimeInitializerFactory", eoLmc.eLEeZrYBruERY, "setCompileTimeInitializer"));
        }
        this.i = m45Var;
        if (t67Var == null) {
            t67Var = (t67) m45Var.invoke();
        }
        this.h = t67Var;
    }
}
