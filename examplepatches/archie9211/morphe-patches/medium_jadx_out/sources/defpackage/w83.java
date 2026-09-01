package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class w83 implements z83 {
    public static final w83 c;
    public static final w83 d;
    public static final w83 e;
    public final a93 a;
    public final w5d b = new w5d(new v2(7, this));

    static {
        a93 a93Var = new a93();
        ny3 ny3Var = ny3.a;
        a93Var.d(ny3Var);
        a93Var.a = true;
        new w83(a93Var);
        a93 a93Var2 = new a93();
        a93Var2.k();
        a93Var2.a = true;
        new w83(a93Var2);
        a93 a93Var3 = new a93();
        a93Var3.k();
        a93Var3.d(ny3Var);
        a93Var3.a = true;
        new w83(a93Var3);
        a93 a93Var4 = new a93();
        a93Var4.k();
        a93Var4.d(ny3Var);
        a93Var4.m();
        a93Var4.a = true;
        new w83(a93Var4);
        a93 a93Var5 = new a93();
        a93Var5.d(ny3Var);
        eo1 eo1Var = eo1.c;
        a93Var5.i(eo1Var);
        a93Var5.h(c49.ONLY_NON_SYNTHESIZED);
        a93Var5.a = true;
        new w83(a93Var5);
        a93 a93Var6 = new a93();
        a93Var6.k();
        a93Var6.d(ny3Var);
        a93Var6.i(eo1Var);
        a93Var6.g();
        a93Var6.h(c49.NONE);
        a93Var6.a();
        a93Var6.c();
        a93Var6.m();
        a93Var6.j();
        a93Var6.a = true;
        new w83(a93Var6);
        a93 a93Var7 = new a93();
        a93Var7.d(y83.ALL_EXCEPT_ANNOTATIONS);
        a93Var7.a = true;
        c = new w83(a93Var7);
        a93 a93Var8 = new a93();
        a93Var8.d(y83.ALL);
        a93Var8.a = true;
        new w83(a93Var8);
        a93 a93Var9 = new a93();
        a93Var9.i(eo1Var);
        a93Var9.h(c49.ONLY_NON_SYNTHESIZED);
        a93Var9.a = true;
        d = new w83(a93Var9);
        a93 a93Var10 = new a93();
        a93Var10.b();
        a93Var10.i(eo1.b);
        a93Var10.d(y83.ALL);
        a93Var10.a = true;
        e = new w83(a93Var10);
        a93 a93Var11 = new a93();
        a93Var11.e(t4b.HTML);
        a93Var11.d(y83.ALL);
        a93Var11.a = true;
        new w83(a93Var11);
    }

    public w83(a93 a93Var) {
        this.a = a93Var;
    }

    public static void V(StringBuilder sb) {
        int length = sb.length();
        if (length == 0 || sb.charAt(length - 1) != ' ') {
            sb.append(' ');
        }
    }

    public static boolean h0(mn6 mn6Var) {
        if (!vx0.a0(mn6Var)) {
            return false;
        }
        List listH0 = mn6Var.h0();
        if (listH0 != null && listH0.isEmpty()) {
            return true;
        }
        Iterator it2 = listH0.iterator();
        while (it2.hasNext()) {
            if (((xwd) it2.next()).c()) {
                return false;
            }
        }
        return true;
    }

    public static c28 u(tu7 tu7Var) {
        if (tu7Var instanceof y28) {
            return ((y28) tu7Var).b0() == qn1.INTERFACE ? c28.ABSTRACT : c28.FINAL;
        }
        yv2 yv2VarH = tu7Var.h();
        y28 y28Var = yv2VarH instanceof y28 ? (y28) yv2VarH : null;
        if (y28Var == null) {
            return c28.FINAL;
        }
        if (!(tu7Var instanceof f41)) {
            return c28.FINAL;
        }
        f41 f41Var = (f41) tu7Var;
        Collection collectionI = f41Var.i();
        collectionI.getClass();
        if (!collectionI.isEmpty() && y28Var.o() != c28.FINAL) {
            return c28.OPEN;
        }
        if (y28Var.b0() != qn1.INTERFACE || g76.L(f41Var.getVisibility(), h93.a)) {
            return c28.FINAL;
        }
        c28 c28VarO = f41Var.o();
        c28 c28Var = c28.ABSTRACT;
        return c28VarO == c28Var ? c28Var : c28.OPEN;
    }

    public final String A(f52 f52Var) {
        g52 g52Var = this.a.v;
        fj6 fj6Var = a93.Y[20];
        g52Var.getClass();
        fj6Var.getClass();
        x45 x45Var = (x45) g52Var.a;
        if (x45Var != null) {
            return (String) x45Var.invoke(f52Var);
        }
        if (f52Var instanceof g80) {
            Iterable iterable = (Iterable) ((g80) f52Var).a;
            ArrayList arrayList = new ArrayList();
            Iterator it2 = iterable.iterator();
            while (it2.hasNext()) {
                String strA = A((f52) it2.next());
                if (strA != null) {
                    arrayList.add(strA);
                }
            }
            return bu1.F0(arrayList, ", ", "{", "}", null, 56);
        }
        if (f52Var instanceof jy) {
            return muc.j0("@", w((yx) ((jy) f52Var).a, null));
        }
        if (!(f52Var instanceof hh6)) {
            return f52Var.toString();
        }
        gh6 gh6Var = (gh6) ((hh6) f52Var).a;
        if (gh6Var instanceof eh6) {
            return ((eh6) gh6Var).a + "::class";
        }
        if (!(gh6Var instanceof fh6)) {
            ygf.a();
            return null;
        }
        rn1 rn1Var = ((fh6) gh6Var).a;
        String strT = rn1Var.a.a().a.a;
        int i = rn1Var.b;
        for (int i2 = 0; i2 < i; i2++) {
            strT = wgd.t('>', "kotlin.Array<", strT);
        }
        return km4.y(strT, "::class");
    }

    public final void B(StringBuilder sb, List list) {
        if (list.isEmpty()) {
            return;
        }
        sb.append("context(");
        Iterator it2 = list.iterator();
        int i = 0;
        while (it2.hasNext()) {
            int i2 = i + 1;
            yq6 yq6Var = (yq6) it2.next();
            x(sb, yq6Var, gy.RECEIVER);
            sb.append(F(yq6Var.getType()));
            if (i == list.size() - 1) {
                sb.append(") ");
            } else {
                sb.append(", ");
            }
            i = i2;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:14:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0078  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void C(java.lang.StringBuilder r7, defpackage.hec r8) {
        /*
            Method dump skipped, instruction units count: 212
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w83.C(java.lang.StringBuilder, hec):void");
    }

    public final String D(String str) {
        int i = v83.a[r().ordinal()];
        if (i == 1) {
            return str;
        }
        if (i == 2) {
            return ev6.x("<font color=red><b>", str, "</b></font>");
        }
        ygf.a();
        return null;
    }

    public final String E(String str, String str2, vm6 vm6Var) {
        str.getClass();
        str2.getClass();
        int i = 0;
        if (aq7.F(str, str2)) {
            return tuc.N(str2, "(", false) ? ev6.x("(", str, ")!") : str.concat("!");
        }
        String strA = aq7.A(str, str2, new s83(this, vm6Var, i), new s83(this, vm6Var, 1), new k0(1, this, w83.class, "escape", "escape(Ljava/lang/String;)Ljava/lang/String;", 0, 8));
        if (strA != null) {
            return strA;
        }
        return "(" + str + ".." + str2 + ')';
    }

    public final String F(mn6 mn6Var) {
        String strW = W(mn6Var);
        return ((!h0(mn6Var) || nxd.e(mn6Var)) && !(mn6Var instanceof v33)) ? strW : wgd.t(')', "(", strW);
    }

    public final void G(nqe nqeVar, StringBuilder sb) {
        f52 f52VarE;
        String strA;
        g52 g52Var = this.a.u;
        fj6 fj6Var = a93.Y[19];
        g52Var.getClass();
        fj6Var.getClass();
        if (!((Boolean) g52Var.a).booleanValue() || (f52VarE = nqeVar.E()) == null || (strA = A(f52VarE)) == null) {
            return;
        }
        sb.append(" = ");
        sb.append(n(strA));
    }

    public final String H(String str) {
        int i = v83.a[r().ordinal()];
        if (i != 1) {
            if (i != 2) {
                ygf.a();
                return null;
            }
            g52 g52Var = this.a.W;
            fj6 fj6Var = a93.Y[48];
            g52Var.getClass();
            fj6Var.getClass();
            if (!((Boolean) g52Var.a).booleanValue()) {
                return ev6.x("<b>", str, "</b>");
            }
        }
        return str;
    }

    public final void I(f41 f41Var, StringBuilder sb) {
        if (p().contains(y83.MEMBER_KIND) && t() && f41Var.j() != e41.DECLARATION) {
            sb.append("/*");
            sb.append(sgg.a0(f41Var.j().name()));
            sb.append("*/ ");
        }
    }

    public final void J(tu7 tu7Var, StringBuilder sb) {
        M(sb, tu7Var.isExternal(), "external");
        boolean z = false;
        M(sb, p().contains(y83.EXPECT) && tu7Var.y(), "expect");
        if (p().contains(y83.ACTUAL) && tu7Var.e0()) {
            z = true;
        }
        M(sb, z, "actual");
    }

    public final void K(c28 c28Var, StringBuilder sb, c28 c28Var2) {
        g52 g52Var = this.a.p;
        fj6 fj6Var = a93.Y[14];
        g52Var.getClass();
        fj6Var.getClass();
        if (((Boolean) g52Var.a).booleanValue() || c28Var != c28Var2) {
            M(sb, p().contains(y83.MODALITY), sgg.a0(c28Var.name()));
        }
    }

    public final void L(f41 f41Var, StringBuilder sb) {
        if (d93.r(f41Var) && f41Var.o() == c28.FINAL) {
            return;
        }
        g52 g52Var = this.a.B;
        fj6 fj6Var = a93.Y[26];
        g52Var.getClass();
        fj6Var.getClass();
        if (((yw8) g52Var.a) == yw8.RENDER_OVERRIDE && f41Var.o() == c28.OPEN && !f41Var.i().isEmpty()) {
            return;
        }
        c28 c28VarO = f41Var.o();
        c28VarO.getClass();
        K(c28VarO, sb, u(f41Var));
    }

    public final void M(StringBuilder sb, boolean z, String str) {
        if (z) {
            sb.append(H(str));
            sb.append(" ");
        }
    }

    public final String N(n98 n98Var, boolean z) {
        String strN = n(aq7.z(n98Var));
        g52 g52Var = this.a.W;
        fj6 fj6Var = a93.Y[48];
        g52Var.getClass();
        fj6Var.getClass();
        return (((Boolean) g52Var.a).booleanValue() && r() == t4b.HTML && z) ? ev6.x("<b>", strN, "</b>") : strN;
    }

    public final void O(yv2 yv2Var, StringBuilder sb, boolean z) {
        n98 name = yv2Var.getName();
        name.getClass();
        sb.append(N(name, z));
    }

    public final void P(StringBuilder sb, mn6 mn6Var) throws IOException {
        o3e o3eVarM0 = mn6Var.m0();
        j jVar = o3eVarM0 instanceof j ? (j) o3eVarM0 : null;
        if (jVar == null) {
            Q(sb, mn6Var);
            return;
        }
        hec hecVar = jVar.c;
        hec hecVar2 = jVar.b;
        a93 a93Var = this.a;
        g52 g52Var = a93Var.R;
        fj6[] fj6VarArr = a93.Y;
        fj6 fj6Var = fj6VarArr[42];
        g52Var.getClass();
        fj6Var.getClass();
        if (((Boolean) g52Var.a).booleanValue()) {
            Q(sb, hecVar2);
            g52 g52Var2 = a93Var.S;
            fj6 fj6Var2 = fj6VarArr[43];
            g52Var2.getClass();
            fj6Var2.getClass();
            if (((Boolean) g52Var2.a).booleanValue()) {
                t4b t4bVarR = r();
                t4b t4bVar = t4b.HTML;
                if (t4bVarR == t4bVar) {
                    sb.append("<font color=\"808080\"><i>");
                }
                sb.append(" /* ");
                sb.append("from: ");
                Q(sb, hecVar);
                sb.append(" */");
                if (r() == t4bVar) {
                    sb.append("</i></font>");
                    return;
                }
                return;
            }
            return;
        }
        Q(sb, hecVar);
        g52 g52Var3 = a93Var.Q;
        fj6 fj6Var3 = fj6VarArr[41];
        g52Var3.getClass();
        fj6Var3.getClass();
        if (((Boolean) g52Var3.a).booleanValue()) {
            t4b t4bVarR2 = r();
            t4b t4bVar2 = t4b.HTML;
            if (t4bVarR2 == t4bVar2) {
                sb.append("<font color=\"808080\"><i>");
            }
            sb.append(" /* ");
            sb.append("= ");
            Q(sb, hecVar2);
            sb.append(" */");
            if (r() == t4bVar2) {
                sb.append("</i></font>");
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:100:0x01c4  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void Q(java.lang.StringBuilder r25, defpackage.mn6 r26) throws java.io.IOException {
        /*
            Method dump skipped, instruction units count: 714
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w83.Q(java.lang.StringBuilder, mn6):void");
    }

    public final void R(f41 f41Var, StringBuilder sb) {
        if (p().contains(y83.OVERRIDE) && !f41Var.i().isEmpty()) {
            g52 g52Var = this.a.B;
            fj6 fj6Var = a93.Y[26];
            g52Var.getClass();
            fj6Var.getClass();
            if (((yw8) g52Var.a) != yw8.RENDER_OPEN) {
                M(sb, true, "override");
                if (t()) {
                    sb.append("/*");
                    sb.append(f41Var.i().size());
                    sb.append("*/ ");
                }
            }
        }
    }

    public final void S(StringBuilder sb, ku3 ku3Var) {
        ku3 ku3Var2 = (ku3) ku3Var.d;
        do1 do1Var = (do1) ku3Var.b;
        if (ku3Var2 != null) {
            S(sb, ku3Var2);
            sb.append('.');
            n98 name = do1Var.getName();
            name.getClass();
            sb.append(N(name, false));
        } else {
            zvd zvdVarN = do1Var.n();
            zvdVarN.getClass();
            sb.append(Y(zvdVarN));
        }
        sb.append(X((List) ku3Var.c));
    }

    public final void T(q4a q4aVar, StringBuilder sb) {
        if (!q()) {
            a93 a93Var = this.a;
            g52 g52Var = a93Var.g;
            fj6[] fj6VarArr = a93.Y;
            fj6 fj6Var = fj6VarArr[5];
            g52Var.getClass();
            fj6Var.getClass();
            if (!((Boolean) g52Var.a).booleanValue()) {
                List listU = q4aVar.U();
                listU.getClass();
                B(sb, listU);
                if (p().contains(y83.ANNOTATIONS)) {
                    x(sb, q4aVar, null);
                    hf4 hf4VarS = q4aVar.S();
                    if (hf4VarS != null) {
                        x(sb, hf4VarS, gy.FIELD);
                    }
                    hf4 hf4VarQ = q4aVar.Q();
                    if (hf4VarQ != null) {
                        x(sb, hf4VarQ, gy.PROPERTY_DELEGATE_FIELD);
                    }
                    g52 g52Var2 = a93Var.H;
                    fj6 fj6Var2 = fj6VarArr[32];
                    g52Var2.getClass();
                    fj6Var2.getClass();
                    if (((p4a) g52Var2.a) == p4a.NONE) {
                        s4a s4aVarB = q4aVar.b();
                        if (s4aVarB != null) {
                            x(sb, s4aVarB, gy.PROPERTY_GETTER);
                        }
                        x4a x4aVarC = q4aVar.c();
                        if (x4aVarC != null) {
                            x(sb, x4aVarC, gy.PROPERTY_SETTER);
                            List listI = x4aVarC.I();
                            listI.getClass();
                            lqe lqeVar = (lqe) bu1.a1(listI);
                            lqeVar.getClass();
                            x(sb, lqeVar, gy.SETTER_PARAMETER);
                        }
                    }
                }
                g93 visibility = q4aVar.getVisibility();
                visibility.getClass();
                f0(visibility, sb);
                M(sb, p().contains(y83.CONST) && q4aVar.p(), "const");
                J(q4aVar, sb);
                L(q4aVar, sb);
                R(q4aVar, sb);
                M(sb, p().contains(y83.LATEINIT) && q4aVar.V(), "lateinit");
                I(q4aVar, sb);
            }
            c0(q4aVar, sb, false);
            List typeParameters = q4aVar.getTypeParameters();
            typeParameters.getClass();
            b0(sb, typeParameters, true);
            yq6 yq6VarP = q4aVar.P();
            if (yq6VarP != null) {
                x(sb, yq6VarP, gy.RECEIVER);
                sb.append(F(yq6VarP.getType()));
                sb.append(".");
            }
        }
        O(q4aVar, sb, true);
        sb.append(": ");
        mn6 type = q4aVar.getType();
        type.getClass();
        sb.append(W(type));
        U(q4aVar, sb);
        G(q4aVar, sb);
        List typeParameters2 = q4aVar.getTypeParameters();
        typeParameters2.getClass();
        g0(sb, typeParameters2);
    }

    public final void U(c41 c41Var, StringBuilder sb) {
        yq6 yq6VarP;
        g52 g52Var = this.a.F;
        fj6 fj6Var = a93.Y[30];
        g52Var.getClass();
        fj6Var.getClass();
        if (((Boolean) g52Var.a).booleanValue() && (yq6VarP = c41Var.P()) != null) {
            sb.append(" on ");
            sb.append(W(yq6VarP.getType()));
        }
    }

    public final String W(mn6 mn6Var) {
        mn6Var.getClass();
        StringBuilder sb = new StringBuilder();
        g52 g52Var = this.a.y;
        fj6 fj6Var = a93.Y[23];
        g52Var.getClass();
        fj6Var.getClass();
        P(sb, (mn6) ((x45) g52Var.a).invoke(mn6Var));
        return sb.toString();
    }

    public final String X(List list) throws IOException {
        list.getClass();
        if (list.isEmpty()) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        sb.append(n("<"));
        bu1.E0(list, sb, ", ", null, null, new t83(this, 0), 60);
        sb.append(n(">"));
        return sb.toString();
    }

    public final String Y(zvd zvdVar) {
        zvdVar.getClass();
        co1 co1VarA = zvdVar.a();
        if ((co1VarA instanceof swd) || (co1VarA instanceof y28) || (co1VarA instanceof ha3)) {
            co1VarA.getClass();
            return l24.f(co1VarA) ? co1VarA.n().toString() : o().b(co1VarA, this);
        }
        if (co1VarA == null) {
            return zvdVar instanceof u66 ? ((u66) zvdVar).g(xx.v) : zvdVar.toString();
        }
        lg8.w("Unexpected classifier: ", co1VarA.getClass());
        return null;
    }

    public final void Z(swd swdVar, StringBuilder sb, boolean z) {
        if (z) {
            sb.append(n("<"));
        }
        if (t()) {
            sb.append("/*");
            sb.append(swdVar.getIndex());
            sb.append("*/ ");
        }
        M(sb, swdVar.t(), "reified");
        String label = swdVar.z().getLabel();
        boolean z2 = true;
        M(sb, label.length() > 0, label);
        x(sb, swdVar, null);
        O(swdVar, sb, z);
        int size = swdVar.getUpperBounds().size();
        if ((size > 1 && !z) || size == 1) {
            mn6 mn6Var = (mn6) swdVar.getUpperBounds().iterator().next();
            if (mn6Var == null) {
                vm6.a(141);
                throw null;
            }
            if (!vm6.x(mn6Var) || !mn6Var.k0()) {
                sb.append(" : ");
                sb.append(W(mn6Var));
            }
        } else if (z) {
            for (mn6 mn6Var2 : swdVar.getUpperBounds()) {
                if (mn6Var2 == null) {
                    vm6.a(141);
                    throw null;
                }
                if (!vm6.x(mn6Var2) || !mn6Var2.k0()) {
                    if (z2) {
                        sb.append(" : ");
                    } else {
                        sb.append(" & ");
                    }
                    sb.append(W(mn6Var2));
                    z2 = false;
                }
            }
        }
        if (z) {
            sb.append(n(">"));
        }
    }

    @Override // defpackage.z83
    public final void a() {
        this.a.a();
    }

    public final void a0(StringBuilder sb, List list) {
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            Z((swd) it2.next(), sb, false);
            if (it2.hasNext()) {
                sb.append(", ");
            }
        }
    }

    @Override // defpackage.z83
    public final void b() {
        this.a.b();
    }

    public final void b0(StringBuilder sb, List list, boolean z) {
        g52 g52Var = this.a.w;
        fj6 fj6Var = a93.Y[21];
        g52Var.getClass();
        fj6Var.getClass();
        if (((Boolean) g52Var.a).booleanValue() || list.isEmpty()) {
            return;
        }
        sb.append(n("<"));
        a0(sb, list);
        sb.append(n(">"));
        if (z) {
            sb.append(" ");
        }
    }

    @Override // defpackage.z83
    public final void c() {
        this.a.c();
    }

    public final void c0(nqe nqeVar, StringBuilder sb, boolean z) {
        if (z || !(nqeVar instanceof lqe)) {
            sb.append(H(nqeVar.O() ? "var" : "val"));
            sb.append(" ");
        }
    }

    @Override // defpackage.z83
    public final void d(Set set) {
        set.getClass();
        this.a.d(set);
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0066  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void d0(defpackage.lqe r9, boolean r10, java.lang.StringBuilder r11, boolean r12) {
        /*
            Method dump skipped, instruction units count: 286
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w83.d0(lqe, boolean, java.lang.StringBuilder, boolean):void");
    }

    @Override // defpackage.z83
    public final void e(t4b t4bVar) {
        t4bVar.getClass();
        this.a.e(t4bVar);
    }

    /* JADX WARN: Removed duplicated region for block: B:12:0x002e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void e0(java.lang.StringBuilder r8, java.util.List r9, boolean r10) {
        /*
            r7 = this;
            a93 r0 = r7.a
            g52 r0 = r0.E
            fj6[] r1 = defpackage.a93.Y
            r2 = 29
            r1 = r1[r2]
            r0.getClass()
            r1.getClass()
            java.lang.Object r0 = r0.a
            c49 r0 = (defpackage.c49) r0
            int[] r1 = defpackage.v83.b
            int r0 = r0.ordinal()
            r0 = r1[r0]
            r1 = 0
            r2 = 1
            if (r0 == r2) goto L2e
            r3 = 2
            if (r0 == r3) goto L2c
            r10 = 3
            if (r0 != r10) goto L28
        L26:
            r10 = r1
            goto L2f
        L28:
            defpackage.ygf.a()
            return
        L2c:
            if (r10 != 0) goto L26
        L2e:
            r10 = r2
        L2f:
            int r0 = r9.size()
            r83 r3 = r7.s()
            r3.getClass()
            java.lang.String r3 = "("
            r8.append(r3)
            java.util.Iterator r9 = r9.iterator()
            r3 = r1
        L44:
            boolean r4 = r9.hasNext()
            if (r4 == 0) goto L71
            int r4 = r3 + 1
            java.lang.Object r5 = r9.next()
            lqe r5 = (defpackage.lqe) r5
            r83 r6 = r7.s()
            r6.getClass()
            r5.getClass()
            r7.d0(r5, r10, r8, r1)
            r83 r5 = r7.s()
            r5.getClass()
            int r5 = r0 + (-1)
            if (r3 == r5) goto L6f
            java.lang.String r3 = ", "
            r8.append(r3)
        L6f:
            r3 = r4
            goto L44
        L71:
            r83 r7 = r7.s()
            r7.getClass()
            java.lang.String r7 = ")"
            r8.append(r7)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.w83.e0(java.lang.StringBuilder, java.util.List, boolean):void");
    }

    @Override // defpackage.z83
    public final void f(LinkedHashSet linkedHashSet) {
        this.a.f(linkedHashSet);
    }

    public final boolean f0(g93 g93Var, StringBuilder sb) {
        if (!p().contains(y83.VISIBILITY)) {
            return false;
        }
        a93 a93Var = this.a;
        g52 g52Var = a93Var.n;
        fj6[] fj6VarArr = a93.Y;
        fj6 fj6Var = fj6VarArr[12];
        g52Var.getClass();
        fj6Var.getClass();
        if (((Boolean) g52Var.a).booleanValue()) {
            g93Var = h93.f(g93Var.a.l());
        }
        g52 g52Var2 = a93Var.o;
        fj6 fj6Var2 = fj6VarArr[13];
        g52Var2.getClass();
        fj6Var2.getClass();
        if (!((Boolean) g52Var2.a).booleanValue() && g76.L(g93Var, h93.j)) {
            return false;
        }
        sb.append(H(g93Var.a.e()));
        sb.append(" ");
        return true;
    }

    @Override // defpackage.z83
    public final void g() {
        this.a.g();
    }

    public final void g0(StringBuilder sb, List list) {
        g52 g52Var = this.a.w;
        fj6 fj6Var = a93.Y[21];
        g52Var.getClass();
        fj6Var.getClass();
        if (((Boolean) g52Var.a).booleanValue()) {
            return;
        }
        ArrayList arrayList = new ArrayList(0);
        Iterator it2 = list.iterator();
        while (it2.hasNext()) {
            swd swdVar = (swd) it2.next();
            List upperBounds = swdVar.getUpperBounds();
            upperBounds.getClass();
            for (mn6 mn6Var : bu1.s0(upperBounds, 1)) {
                StringBuilder sb2 = new StringBuilder();
                n98 name = swdVar.getName();
                name.getClass();
                sb2.append(N(name, false));
                sb2.append(" : ");
                mn6Var.getClass();
                sb2.append(W(mn6Var));
                arrayList.add(sb2.toString());
            }
        }
        if (arrayList.isEmpty()) {
            return;
        }
        sb.append(" ");
        sb.append(H("where"));
        sb.append(" ");
        bu1.E0(arrayList, sb, ", ", null, null, null, PanasonicMakernoteDirectory.TAG_CLEAR_RETOUCH);
    }

    @Override // defpackage.z83
    public final void h(c49 c49Var) {
        c49Var.getClass();
        this.a.h(c49Var);
    }

    @Override // defpackage.z83
    public final void i(eo1 eo1Var) {
        this.a.i(eo1Var);
    }

    @Override // defpackage.z83
    public final void j() {
        this.a.j();
    }

    @Override // defpackage.z83
    public final void k() {
        this.a.k();
    }

    @Override // defpackage.z83
    public final Set l() {
        return this.a.l();
    }

    @Override // defpackage.z83
    public final void m() {
        this.a.m();
    }

    public final String n(String str) {
        return r().escape(str);
    }

    public final eo1 o() {
        g52 g52Var = this.a.b;
        a93.Y[0].getClass();
        return (eo1) g52Var.a;
    }

    public final Set p() {
        g52 g52Var = this.a.e;
        fj6 fj6Var = a93.Y[3];
        g52Var.getClass();
        fj6Var.getClass();
        return (Set) g52Var.a;
    }

    public final boolean q() {
        g52 g52Var = this.a.f;
        fj6 fj6Var = a93.Y[4];
        g52Var.getClass();
        fj6Var.getClass();
        return ((Boolean) g52Var.a).booleanValue();
    }

    public final t4b r() {
        g52 g52Var = this.a.D;
        fj6 fj6Var = a93.Y[28];
        g52Var.getClass();
        fj6Var.getClass();
        return (t4b) g52Var.a;
    }

    public final r83 s() {
        g52 g52Var = this.a.C;
        fj6 fj6Var = a93.Y[27];
        g52Var.getClass();
        fj6Var.getClass();
        return (r83) g52Var.a;
    }

    public final boolean t() {
        g52 g52Var = this.a.j;
        fj6 fj6Var = a93.Y[8];
        g52Var.getClass();
        fj6Var.getClass();
        return ((Boolean) g52Var.a).booleanValue();
    }

    public final String v(yv2 yv2Var) {
        yv2 yv2VarH;
        String str;
        StringBuilder sb = new StringBuilder();
        yv2Var.F(new md5(13, this), sb);
        a93 a93Var = this.a;
        g52 g52Var = a93Var.c;
        fj6[] fj6VarArr = a93.Y;
        fj6VarArr[1].getClass();
        if (((Boolean) g52Var.a).booleanValue() && !(yv2Var instanceof wx8) && !(yv2Var instanceof rv6) && (yv2VarH = yv2Var.h()) != null && !(yv2VarH instanceof b38)) {
            sb.append(" ");
            int i = v83.a[r().ordinal()];
            if (i == 1) {
                str = "defined in";
            } else {
                if (i != 2) {
                    ygf.a();
                    return null;
                }
                str = "<i>defined in</i>";
            }
            sb.append(str);
            sb.append(" ");
            z05 z05VarG = d93.g(yv2VarH);
            z05VarG.getClass();
            sb.append(z05VarG.c() ? "root package" : n(aq7.B(z05.f(z05VarG))));
            g52 g52Var2 = a93Var.d;
            fj6VarArr[2].getClass();
            if (((Boolean) g52Var2.a).booleanValue() && (yv2VarH instanceof wx8) && (yv2Var instanceof aw2)) {
                ((aw2) yv2Var).d().getClass();
            }
        }
        return sb.toString();
    }

    public final String w(yx yxVar, gy gyVar) throws IOException {
        zm1 zm1VarO0;
        List listI;
        yxVar.getClass();
        StringBuilder sb = new StringBuilder();
        sb.append('@');
        if (gyVar != null) {
            sb.append(gyVar.getRenderName() + ':');
        }
        mn6 type = yxVar.getType();
        sb.append(W(type));
        a93 a93Var = this.a;
        if (a93Var.n().getIncludeAnnotationArguments()) {
            Map mapF = yxVar.f();
            g52 g52Var = a93Var.I;
            fj6 fj6Var = a93.Y[33];
            g52Var.getClass();
            fj6Var.getClass();
            List list = null;
            y28 y28VarD = ((Boolean) g52Var.a).booleanValue() ? f93.d(yxVar) : null;
            if (y28VarD != null && (zm1VarO0 = y28VarD.o0()) != null && (listI = zm1VarO0.I()) != null) {
                ArrayList arrayList = new ArrayList();
                for (Object obj : listI) {
                    if (((lqe) obj).z0()) {
                        arrayList.add(obj);
                    }
                }
                ArrayList arrayList2 = new ArrayList(cu1.k0(arrayList, 10));
                Iterator it2 = arrayList.iterator();
                while (it2.hasNext()) {
                    arrayList2.add(((lqe) it2.next()).getName());
                }
                list = arrayList2;
            }
            if (list == null) {
                list = ey3.a;
            }
            ArrayList arrayList3 = new ArrayList();
            for (Object obj2 : list) {
                if (!mapF.containsKey((n98) obj2)) {
                    arrayList3.add(obj2);
                }
            }
            ArrayList arrayList4 = new ArrayList(cu1.k0(arrayList3, 10));
            Iterator it3 = arrayList3.iterator();
            while (it3.hasNext()) {
                arrayList4.add(((n98) it3.next()).b() + " = ...");
            }
            Set<Map.Entry> setEntrySet = mapF.entrySet();
            ArrayList arrayList5 = new ArrayList(cu1.k0(setEntrySet, 10));
            for (Map.Entry entry : setEntrySet) {
                n98 n98Var = (n98) entry.getKey();
                f52 f52Var = (f52) entry.getValue();
                StringBuilder sb2 = new StringBuilder();
                sb2.append(n98Var.b());
                sb2.append(" = ");
                sb2.append(!list.contains(n98Var) ? A(f52Var) : "...");
                arrayList5.add(sb2.toString());
            }
            List listE1 = bu1.e1(bu1.Q0(arrayList5, arrayList4));
            if (a93Var.n().getIncludeEmptyAnnotationArguments() || !listE1.isEmpty()) {
                bu1.E0(listE1, sb, ", ", "(", ")", null, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
            }
        }
        if (t() && (kyd.a0(type) || (type.j0().a() instanceof di8))) {
            sb.append(" /* annotation class not found */");
        }
        return sb.toString();
    }

    public final void x(StringBuilder sb, gx gxVar, gy gyVar) {
        Set setL;
        if (p().contains(y83.ANNOTATIONS)) {
            boolean z = gxVar instanceof mn6;
            a93 a93Var = this.a;
            if (z) {
                setL = a93Var.l();
            } else {
                g52 g52Var = a93Var.K;
                fj6 fj6Var = a93.Y[35];
                g52Var.getClass();
                fj6Var.getClass();
                setL = (Set) g52Var.a;
            }
            g52 g52Var2 = a93Var.M;
            fj6 fj6Var2 = a93.Y[37];
            g52Var2.getClass();
            fj6Var2.getClass();
            x45 x45Var = (x45) g52Var2.a;
            for (yx yxVar : gxVar.getAnnotations()) {
                if (!bu1.p0(setL, yxVar.e()) && !g76.L(yxVar.e(), lnc.r) && (x45Var == null || ((Boolean) x45Var.invoke(yxVar)).booleanValue())) {
                    sb.append(w(yxVar, gyVar));
                    g52 g52Var3 = a93Var.J;
                    fj6 fj6Var3 = a93.Y[34];
                    g52Var3.getClass();
                    fj6Var3.getClass();
                    if (((Boolean) g52Var3.a).booleanValue()) {
                        sb.append('\n');
                    } else {
                        sb.append(" ");
                    }
                }
            }
        }
    }

    public final void z(do1 do1Var, StringBuilder sb) {
        List listG0 = do1Var.g0();
        listG0.getClass();
        List parameters = do1Var.n().getParameters();
        parameters.getClass();
        if (t() && do1Var.g() && parameters.size() > listG0.size()) {
            sb.append(" /*captured type parameters: ");
            a0(sb, parameters.subList(listG0.size(), parameters.size()));
            sb.append("*/");
        }
    }
}
