package defpackage;

import java.lang.reflect.Method;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class xmb {
    public static final mn1 a;

    static {
        y05 y05Var = new y05("java.lang.Void");
        a = new mn1(y05Var.b(), y05Var.a.g());
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static df6 a(s55 s55Var) {
        String strY = vp7.y(s55Var);
        if (strY == null) {
            if (s55Var instanceof s4a) {
                String strB = f93.i(s55Var).getName().b();
                strB.getClass();
                strY = ce6.a(strB);
            } else if (s55Var instanceof x4a) {
                String strB2 = f93.i(s55Var).getName().b();
                strB2.getClass();
                strY = "set".concat(ce6.b(strB2) ? strB2.substring(2) : sgg.E(strB2));
            } else {
                strY = ((zv2) s55Var).getName().b();
                strY.getClass();
            }
        }
        return new df6(new jf6(strY, vp7.s(s55Var, 1)));
    }

    public static s42 b(q4a q4aVar) {
        q4aVar.getClass();
        q4a q4aVarX0 = ((q4a) d93.s(q4aVar)).x0();
        q4aVarX0.getClass();
        if (q4aVarX0 instanceof fa3) {
            fa3 fa3Var = (fa3) q4aVarX0;
            i6a i6aVar = fa3Var.B;
            o75 o75Var = gg6.d;
            o75Var.getClass();
            ag6 ag6Var = (ag6) il7.z(i6aVar, o75Var);
            if (ag6Var != null) {
                return new tf6(q4aVarX0, i6aVar, ag6Var, fa3Var.C, fa3Var.D);
            }
        } else if (q4aVarX0 instanceof j96) {
            j96 j96Var = (j96) q4aVarX0;
            jkc jkcVarD = j96Var.d();
            wmb wmbVar = jkcVarD instanceof wmb ? (wmb) jkcVarD : null;
            u0b u0bVar = wmbVar != null ? wmbVar.a : null;
            if (u0bVar instanceof w0b) {
                return new rf6(((w0b) u0bVar).a);
            }
            if (!(u0bVar instanceof z0b)) {
                lg8.x("Incorrect resolution sequence for Java field ", q4aVarX0, " (source = ", u0bVar);
                return null;
            }
            Method method = ((z0b) u0bVar).a;
            x4a x4aVar = j96Var.y;
            jkc jkcVarD2 = x4aVar != null ? x4aVar.d() : null;
            wmb wmbVar2 = jkcVarD2 instanceof wmb ? (wmb) jkcVarD2 : null;
            u0b u0bVar2 = wmbVar2 != null ? wmbVar2.a : null;
            z0b z0bVar = u0bVar2 instanceof z0b ? (z0b) u0bVar2 : null;
            return new sf6(method, z0bVar != null ? z0bVar.a : null);
        }
        s4a s4aVarB = q4aVarX0.b();
        s4aVarB.getClass();
        df6 df6VarA = a(s4aVarB);
        x4a x4aVarC = q4aVarX0.c();
        return new uf6(df6VarA, x4aVarC != null ? a(x4aVarC) : null);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static g01 c(s55 s55Var) {
        s55Var.getClass();
        s55 s55VarX0 = ((s55) d93.s(s55Var)).x0();
        s55VarX0.getClass();
        if (!(s55VarX0 instanceof k93)) {
            if (s55VarX0 instanceof g96) {
                jkc jkcVarD = ((g96) s55VarX0).d();
                wmb wmbVar = jkcVarD instanceof wmb ? (wmb) jkcVarD : null;
                u0b u0bVar = wmbVar != null ? wmbVar.a : null;
                z0b z0bVar = u0bVar instanceof z0b ? (z0b) u0bVar : null;
                if (z0bVar != null) {
                    return new bf6(z0bVar.a);
                }
                rd6.r("Incorrect resolution sequence for Java method ", s55VarX0);
                return null;
            }
            if (s55VarX0 instanceof r86) {
                jkc jkcVarD2 = ((r86) s55VarX0).d();
                wmb wmbVar2 = jkcVarD2 instanceof wmb ? (wmb) jkcVarD2 : null;
                u0b u0bVar2 = wmbVar2 != null ? wmbVar2.a : null;
                if (u0bVar2 instanceof t0b) {
                    return new af6(((t0b) u0bVar2).a);
                }
                if (u0bVar2 instanceof q0b) {
                    Class cls = ((q0b) u0bVar2).a;
                    if (cls.isAnnotation()) {
                        return new ze6(cls);
                    }
                }
                lg8.x("Incorrect resolution sequence for Java constructor ", s55VarX0, " (", u0bVar2);
                return null;
            }
            zv2 zv2Var = (zv2) s55VarX0;
            if ((zv2Var.getName().equals(mnc.c) && kng.G(s55VarX0)) || ((zv2Var.getName().equals(mnc.a) && kng.G(s55VarX0)) || (g76.L(zv2Var.getName(), ep1.e) && s55VarX0.I().isEmpty()))) {
                return a(s55VarX0);
            }
            StringBuilder sb = new StringBuilder("Unknown origin of ");
            sb.append(s55VarX0);
            Object obj = s55VarX0.getClass();
            sb.append(" (");
            sb.append(obj);
            sb.append(')');
            throw new zb2(sb.toString());
        }
        x93 x93Var = (x93) s55VarX0;
        q1 q1VarS = x93Var.s();
        if (q1VarS instanceof a6a) {
            q74 q74Var = hg6.a;
            jf6 jf6VarC = hg6.c((a6a) q1VarS, x93Var.J(), x93Var.D());
            if (jf6VarC != null) {
                return new df6(jf6VarC);
            }
        }
        if (q1VarS instanceof n5a) {
            q74 q74Var2 = hg6.a;
            jf6 jf6VarA = hg6.a((n5a) q1VarS, x93Var.J(), x93Var.D());
            if (jf6VarA != null) {
                String str = jf6VarA.r;
                String str2 = jf6VarA.s;
                yv2 yv2VarH = s55Var.h();
                yv2VarH.getClass();
                if (g26.b(yv2VarH)) {
                    return new df6(jf6VarA);
                }
                yv2 yv2VarH2 = s55Var.h();
                yv2VarH2.getClass();
                if (!g26.c(yv2VarH2)) {
                    return new cf6(jf6VarA);
                }
                p72 p72Var = (p72) s55Var;
                if (p72Var.q()) {
                    if (!g76.L(str, "constructor-impl") || !tuc.F(str2, ")V", false)) {
                        lg8.t("Invalid signature: ", jf6VarA);
                        return null;
                    }
                } else {
                    if (!g76.L(str, "constructor-impl")) {
                        lg8.t("Invalid signature: ", jf6VarA);
                        return null;
                    }
                    y28 y28VarR = p72Var.r();
                    y28VarR.getClass();
                    mn1 mn1VarF = f93.f(y28VarR);
                    mn1VarF.getClass();
                    String strB = sn1.b(mn1VarF.b());
                    if (tuc.F(str2, ")V", false)) {
                        String strConcat = muc.l0(str2, "V").concat(strB);
                        str.getClass();
                        jf6VarA = new jf6(str, strConcat);
                    } else if (!tuc.F(str2, strB, false)) {
                        lg8.t("Invalid signature: ", jf6VarA);
                        return null;
                    }
                }
                return new df6(jf6VarA);
            }
        }
        return a(s55VarX0);
    }
}
