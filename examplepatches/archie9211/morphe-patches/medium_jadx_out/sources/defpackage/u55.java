package defpackage;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class u55 extends bw2 implements s55 {
    public final s55 A;
    public final e41 B;
    public s55 C;
    public Map D;
    public List f;
    public List g;
    public mn6 h;
    public List i;
    public yq6 j;
    public yq6 k;
    public c28 l;
    public g93 m;
    public boolean n;
    public boolean o;
    public boolean p;
    public boolean q;
    public boolean r;
    public boolean s;
    public boolean t;
    public boolean u;
    public boolean v;
    public boolean w;
    public boolean x;
    public Collection y;
    public volatile a3 z;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public u55(ly lyVar, e41 e41Var, yv2 yv2Var, s55 s55Var, n98 n98Var, jkc jkcVar) {
        super(yv2Var, lyVar, n98Var, jkcVar);
        if (yv2Var == null) {
            f0(0);
            throw null;
        }
        if (lyVar == null) {
            f0(1);
            throw null;
        }
        if (n98Var == null) {
            f0(2);
            throw null;
        }
        if (e41Var == null) {
            f0(3);
            throw null;
        }
        if (jkcVar == null) {
            f0(4);
            throw null;
        }
        this.m = h93.i;
        this.n = false;
        this.o = false;
        this.p = false;
        this.q = false;
        this.r = false;
        this.s = false;
        this.t = false;
        this.u = false;
        this.v = false;
        this.w = true;
        this.x = false;
        this.y = null;
        this.z = null;
        this.C = null;
        this.D = null;
        this.A = s55Var == null ? this : s55Var;
        this.B = e41Var;
    }

    public static ArrayList C0(s55 s55Var, List list, ixd ixdVar, boolean z, boolean z2, boolean[] zArr) {
        if (list == null) {
            f0(30);
            throw null;
        }
        ArrayList arrayList = new ArrayList(list.size());
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            lqe lqeVar = (lqe) it2.next();
            mn6 type = lqeVar.getType();
            pqe pqeVar = pqe.IN_VARIANCE;
            mn6 mn6VarH = ixdVar.h(type, pqeVar);
            mn6 mn6Var = lqeVar.k;
            mn6 mn6VarH2 = mn6Var == null ? null : ixdVar.h(mn6Var, pqeVar);
            if (mn6VarH == null) {
                return null;
            }
            if ((mn6VarH != lqeVar.getType() || mn6Var != mn6VarH2) && zArr != null) {
                zArr[0] = true;
            }
            t2 t2Var = lqeVar instanceof kqe ? new t2((List) ((kqe) lqeVar).m.getValue()) : null;
            lqe lqeVar2 = z ? null : lqeVar;
            int i = lqeVar.g;
            ly annotations = lqeVar.getAnnotations();
            n98 name = lqeVar.getName();
            boolean zZ0 = lqeVar.z0();
            boolean z3 = lqeVar.i;
            boolean z4 = lqeVar.j;
            jkc jkcVarD = z2 ? lqeVar.d() : jkc.g0;
            annotations.getClass();
            name.getClass();
            jkcVarD.getClass();
            arrayList.add(t2Var == null ? new lqe(s55Var, lqeVar2, i, annotations, name, mn6VarH, zZ0, z3, z4, mn6VarH2, jkcVarD) : new kqe(s55Var, lqeVar2, i, annotations, name, mn6VarH, zZ0, z3, z4, mn6VarH2, jkcVarD, t2Var));
        }
        return arrayList;
    }

    public static /* synthetic */ void f0(int i) {
        String str;
        int i2;
        switch (i) {
            case 9:
            case 13:
            case 14:
            case 15:
            case 16:
            case 18:
            case 19:
            case 20:
            case 21:
            case 23:
            case 26:
            case 27:
                str = "@NotNull method %s.%s must not return null";
                break;
            case 10:
            case 11:
            case 12:
            case 17:
            case 22:
            case 24:
            case 25:
            default:
                str = "Argument for @NotNull parameter '%s' of %s.%s must not be null";
                break;
        }
        switch (i) {
            case 9:
            case 13:
            case 14:
            case 15:
            case 16:
            case 18:
            case 19:
            case 20:
            case 21:
            case 23:
            case 26:
            case 27:
                i2 = 2;
                break;
            case 10:
            case 11:
            case 12:
            case 17:
            case 22:
            case 24:
            case 25:
            default:
                i2 = 3;
                break;
        }
        Object[] objArr = new Object[i2];
        switch (i) {
            case 1:
                objArr[0] = "annotations";
                break;
            case 2:
                objArr[0] = "name";
                break;
            case 3:
                objArr[0] = "kind";
                break;
            case 4:
                objArr[0] = "source";
                break;
            case 5:
                objArr[0] = "contextReceiverParameters";
                break;
            case 6:
                objArr[0] = "typeParameters";
                break;
            case 7:
            case 28:
            case 30:
                objArr[0] = "unsubstitutedValueParameters";
                break;
            case 8:
            case 10:
                objArr[0] = "visibility";
                break;
            case 9:
            case 13:
            case 14:
            case 15:
            case 16:
            case 18:
            case 19:
            case 20:
            case 21:
            case 23:
            case 26:
            case 27:
                objArr[0] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/FunctionDescriptorImpl";
                break;
            case 11:
                objArr[0] = "unsubstitutedReturnType";
                break;
            case 12:
                objArr[0] = "extensionReceiverParameter";
                break;
            case 17:
                objArr[0] = "overriddenDescriptors";
                break;
            case 22:
                objArr[0] = "originalSubstitutor";
                break;
            case 24:
            case 29:
            case 31:
                objArr[0] = "substitutor";
                break;
            case 25:
                objArr[0] = "configuration";
                break;
            default:
                objArr[0] = "containingDeclaration";
                break;
        }
        switch (i) {
            case 9:
                objArr[1] = "initialize";
                break;
            case 10:
            case 11:
            case 12:
            case 17:
            case 22:
            case 24:
            case 25:
            default:
                objArr[1] = "kotlin/reflect/jvm/internal/impl/descriptors/impl/FunctionDescriptorImpl";
                break;
            case 13:
                objArr[1] = "getContextReceiverParameters";
                break;
            case 14:
                objArr[1] = "getOverriddenDescriptors";
                break;
            case 15:
                objArr[1] = "getModality";
                break;
            case 16:
                objArr[1] = "getVisibility";
                break;
            case 18:
                objArr[1] = "getTypeParameters";
                break;
            case 19:
                objArr[1] = "getValueParameters";
                break;
            case 20:
                objArr[1] = "getOriginal";
                break;
            case 21:
                objArr[1] = "getKind";
                break;
            case 23:
                objArr[1] = "newCopyBuilder";
                break;
            case 26:
                objArr[1] = "copy";
                break;
            case 27:
                objArr[1] = "getSourceToUseForCopy";
                break;
        }
        switch (i) {
            case 5:
            case 6:
            case 7:
            case 8:
                objArr[2] = "initialize";
                break;
            case 9:
            case 13:
            case 14:
            case 15:
            case 16:
            case 18:
            case 19:
            case 20:
            case 21:
            case 23:
            case 26:
            case 27:
                break;
            case 10:
                objArr[2] = "setVisibility";
                break;
            case 11:
                objArr[2] = "setReturnType";
                break;
            case 12:
                objArr[2] = "setExtensionReceiverParameter";
                break;
            case 17:
                objArr[2] = "setOverriddenDescriptors";
                break;
            case 22:
                objArr[2] = "substitute";
                break;
            case 24:
                objArr[2] = "newCopyBuilder";
                break;
            case 25:
                objArr[2] = "doSubstitute";
                break;
            case 28:
            case 29:
            case 30:
            case 31:
                objArr[2] = "getSubstitutedValueParameters";
                break;
            default:
                objArr[2] = "<init>";
                break;
        }
        String str2 = String.format(str, objArr);
        switch (i) {
            case 9:
            case 13:
            case 14:
            case 15:
            case 16:
            case 18:
            case 19:
            case 20:
            case 21:
            case 23:
            case 26:
            case 27:
                throw new IllegalStateException(str2);
            case 10:
            case 11:
            case 12:
            case 17:
            case 22:
            case 24:
            case 25:
            default:
                throw new IllegalArgumentException(str2);
        }
    }

    public abstract u55 A0(ly lyVar, e41 e41Var, yv2 yv2Var, s55 s55Var, n98 n98Var, jkc jkcVar);

    /* JADX WARN: Removed duplicated region for block: B:103:0x0212  */
    /* JADX WARN: Removed duplicated region for block: B:106:0x0217  */
    /* JADX WARN: Removed duplicated region for block: B:114:0x0238  */
    /* JADX WARN: Removed duplicated region for block: B:120:0x0247  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00e1  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x0118  */
    /* JADX WARN: Removed duplicated region for block: B:55:0x011f  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0134  */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0155  */
    /* JADX WARN: Removed duplicated region for block: B:73:0x0157  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x019d  */
    /* JADX WARN: Removed duplicated region for block: B:82:0x01a2  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x01b3  */
    /* JADX WARN: Removed duplicated region for block: B:89:0x01b9  */
    /* JADX WARN: Removed duplicated region for block: B:97:0x01e9  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x0208  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public defpackage.u55 B0(defpackage.t55 r22) throws defpackage.gxd {
        /*
            Method dump skipped, instruction units count: 599
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.u55.B0(t55):u55");
    }

    public boolean C() {
        return this.r;
    }

    public void D0(yq6 yq6Var, yq6 yq6Var2, List list, List list2, List list3, mn6 mn6Var, c28 c28Var, g93 g93Var) {
        if (list == null) {
            f0(5);
            throw null;
        }
        if (list2 == null) {
            f0(6);
            throw null;
        }
        if (list3 == null) {
            f0(7);
            throw null;
        }
        if (g93Var == null) {
            f0(8);
            throw null;
        }
        this.f = bu1.m1(list2);
        this.g = bu1.m1(list3);
        this.h = mn6Var;
        this.l = c28Var;
        this.m = g93Var;
        this.j = yq6Var;
        this.k = yq6Var2;
        this.i = list;
        for (int i = 0; i < list2.size(); i++) {
            swd swdVar = (swd) list2.get(i);
            if (swdVar.getIndex() != i) {
                StringBuilder sb = new StringBuilder();
                sb.append(swdVar);
                int index = swdVar.getIndex();
                sb.append(" index is ");
                sb.append(index);
                sb.append(" but position is ");
                sb.append(i);
                throw new IllegalStateException(sb.toString());
            }
        }
        for (int i2 = 0; i2 < list3.size(); i2++) {
            lqe lqeVar = (lqe) list3.get(i2);
            if (lqeVar.g != i2) {
                StringBuilder sb2 = new StringBuilder();
                sb2.append(lqeVar);
                int i3 = lqeVar.g;
                sb2.append("index is ");
                sb2.append(i3);
                sb2.append(" but position is ");
                sb2.append(i2);
                throw new IllegalStateException(sb2.toString());
            }
        }
    }

    public final t55 E0(ixd ixdVar) {
        if (ixdVar != null) {
            return new t55(this, ixdVar.a, h(), o(), getVisibility(), j(), I(), U(), this.j, getReturnType());
        }
        f0(24);
        throw null;
    }

    @Override // defpackage.yv2
    public Object F(cw2 cw2Var, Object obj) {
        return cw2Var.J(this, obj);
    }

    public void F0(boolean z) {
        this.w = z;
    }

    public void G0(boolean z) {
        this.x = z;
    }

    public final void H0(hec hecVar) {
        if (hecVar != null) {
            this.h = hecVar;
        } else {
            f0(11);
            throw null;
        }
    }

    @Override // defpackage.c41
    public final List I() {
        List list = this.g;
        if (list != null) {
            return list;
        }
        f0(19);
        throw null;
    }

    @Override // defpackage.s55
    public final s55 L() {
        return this.C;
    }

    @Override // defpackage.c41
    public final yq6 M() {
        return this.k;
    }

    @Override // defpackage.c41
    public final yq6 P() {
        return this.j;
    }

    @Override // defpackage.c41
    public final List U() {
        List list = this.i;
        if (list != null) {
            return list;
        }
        f0(13);
        throw null;
    }

    @Override // defpackage.s55
    public final boolean Y() {
        return this.t;
    }

    public void Z(Collection collection) {
        if (collection == null) {
            f0(17);
            throw null;
        }
        this.y = collection;
        Iterator it2 = collection.iterator();
        while (it2.hasNext()) {
            if (((s55) it2.next()).c0()) {
                this.u = true;
                return;
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r1v1, types: [s55] */
    /* JADX WARN: Type inference failed for: r1v5 */
    /* JADX WARN: Type inference failed for: r1v6 */
    @Override // defpackage.bw2, defpackage.zv2, defpackage.yv2, defpackage.c41
    /* JADX INFO: renamed from: a */
    public s55 x0() {
        s55 s55Var = this.A;
        ?? X0 = this;
        if (s55Var != this) {
            X0 = s55Var.x0();
        }
        if (X0 != 0) {
            return X0;
        }
        f0(20);
        throw null;
    }

    @Override // defpackage.s55
    public final boolean c0() {
        return this.u;
    }

    public r55 d0() {
        return E0(ixd.b);
    }

    @Override // defpackage.tu7
    public final boolean e0() {
        return false;
    }

    @Override // defpackage.s0d
    public s55 f(ixd ixdVar) {
        if (ixdVar == null) {
            f0(22);
            throw null;
        }
        if (ixdVar.a.e()) {
            return this;
        }
        t55 t55VarE0 = E0(ixdVar);
        t55VarE0.e = x0();
        t55VarE0.o = true;
        t55VarE0.w = true;
        return t55VarE0.x.B0(t55VarE0);
    }

    public mn6 getReturnType() {
        return this.h;
    }

    @Override // defpackage.c41
    public final List getTypeParameters() {
        List list = this.f;
        if (list != null) {
            return list;
        }
        ik4.o("typeParameters == null for ", this);
        return null;
    }

    @Override // defpackage.dw2
    public final g93 getVisibility() {
        g93 g93Var = this.m;
        if (g93Var != null) {
            return g93Var;
        }
        f0(16);
        throw null;
    }

    @Override // defpackage.f41, defpackage.c41
    public Collection i() {
        a3 a3Var = this.z;
        if (a3Var != null) {
            this.y = (Collection) a3Var.invoke();
            this.z = null;
        }
        Collection collection = this.y;
        if (collection == null) {
            collection = Collections.EMPTY_LIST;
        }
        if (collection != null) {
            return collection;
        }
        f0(14);
        throw null;
    }

    public boolean isExternal() {
        return this.p;
    }

    @Override // defpackage.s55
    public final boolean isInfix() {
        if (this.o) {
            return true;
        }
        Iterator it2 = x0().i().iterator();
        while (it2.hasNext()) {
            if (((s55) it2.next()).isInfix()) {
                return true;
            }
        }
        return false;
    }

    public boolean isInline() {
        return this.q;
    }

    @Override // defpackage.s55
    public final boolean isOperator() {
        if (this.n) {
            return true;
        }
        Iterator it2 = x0().i().iterator();
        while (it2.hasNext()) {
            if (((s55) it2.next()).isOperator()) {
                return true;
            }
        }
        return false;
    }

    public boolean isSuspend() {
        return this.v;
    }

    @Override // defpackage.f41
    public final e41 j() {
        e41 e41Var = this.B;
        if (e41Var != null) {
            return e41Var;
        }
        f0(21);
        throw null;
    }

    public Object m(v93 v93Var) {
        Map map = this.D;
        if (map == null) {
            return null;
        }
        return map.get(v93Var);
    }

    @Override // defpackage.tu7
    public final c28 o() {
        c28 c28Var = this.l;
        if (c28Var != null) {
            return c28Var;
        }
        f0(15);
        throw null;
    }

    public boolean u() {
        return this.x;
    }

    @Override // defpackage.tu7
    public final boolean y() {
        return this.s;
    }

    public final s55 y0(yv2 yv2Var, c28 c28Var, g93 g93Var, e41 e41Var) {
        s55 s55VarBuild = d0().C(yv2Var).x(c28Var).t(g93Var).b(e41Var).u().build();
        if (s55VarBuild != null) {
            return s55VarBuild;
        }
        f0(26);
        throw null;
    }

    @Override // defpackage.f41
    /* JADX INFO: renamed from: z0, reason: merged with bridge method [inline-methods] */
    public bec A(yv2 yv2Var, c28 c28Var, g93 g93Var, e41 e41Var) {
        return (bec) y0(yv2Var, c28Var, g93Var, e41Var);
    }
}
