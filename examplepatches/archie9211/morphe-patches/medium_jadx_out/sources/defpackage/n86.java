package defpackage;

import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class n86 {
    public static final n98 a = n98.e("message");
    public static final n98 b = n98.e("allowedTargets");
    public static final n98 c = n98.e("value");
    public static final Map d = ei7.Q(new f09(lnc.t, de6.c), new f09(lnc.w, de6.d), new f09(lnc.x, de6.f));

    public static id9 a(y05 y05Var, o86 o86Var, n0c n0cVar) {
        f0b f0bVarA;
        y05Var.getClass();
        o86Var.getClass();
        n0cVar.getClass();
        if (y05Var.equals(lnc.m)) {
            y05 y05Var2 = de6.e;
            y05Var2.getClass();
            f0b f0bVarA2 = o86Var.a(y05Var2);
            if (f0bVarA2 != null) {
                return new a96(f0bVarA2, n0cVar);
            }
        }
        y05 y05Var3 = (y05) d.get(y05Var);
        if (y05Var3 == null || (f0bVarA = o86Var.a(y05Var3)) == null) {
            return null;
        }
        return b(f0bVarA, n0cVar, false);
    }

    public static id9 b(f0b f0bVar, n0c n0cVar, boolean z) {
        n0cVar.getClass();
        mn1 mn1VarA = e0b.a(vx0.T(vx0.P(f0bVar.a)));
        y05 y05Var = de6.c;
        y05Var.getClass();
        if (mn1VarA.equals(new mn1(y05Var.b(), y05Var.a.g()))) {
            return new m96(f0bVar, n0cVar);
        }
        y05 y05Var2 = de6.d;
        y05Var2.getClass();
        if (mn1VarA.equals(new mn1(y05Var2.b(), y05Var2.a.g()))) {
            return new l96(f0bVar, n0cVar);
        }
        y05 y05Var3 = de6.f;
        y05Var3.getClass();
        if (mn1VarA.equals(new mn1(y05Var3.b(), y05Var3.a.g()))) {
            return new m86(n0cVar, f0bVar, lnc.x);
        }
        y05 y05Var4 = de6.e;
        y05Var4.getClass();
        if (mn1VarA.equals(new mn1(y05Var4.b(), y05Var4.a.g()))) {
            return null;
        }
        return new zr6(f0bVar, n0cVar, z);
    }
}
