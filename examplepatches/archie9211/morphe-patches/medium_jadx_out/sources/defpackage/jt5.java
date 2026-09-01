package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jt5 {
    public final et5 a;
    public final String b;
    public final ArrayList c;
    public zs5 d;
    public s44 e;

    public jt5(et5 et5Var, String str) {
        et5Var.getClass();
        this.a = et5Var;
        this.b = str;
        this.c = new ArrayList();
        this.e = by3.a;
    }

    public static jt5 a(jt5 jt5Var) {
        et5 et5Var = jt5Var.a;
        String str = jt5Var.b;
        jt5Var.getClass();
        et5Var.getClass();
        jt5 jt5Var2 = new jt5(et5Var, str);
        zs5 zs5Var = jt5Var.d;
        if (zs5Var != null) {
            jt5Var2.d = zs5Var;
        }
        jt5Var2.c.addAll(jt5Var.c);
        s44 s44Var = jt5Var.e;
        s44Var.getClass();
        jt5Var2.e = jt5Var2.e.c(s44Var);
        return jt5Var2;
    }

    public jt5(et5 et5Var, String str, ArrayList arrayList, zs5 zs5Var, s44 s44Var) {
        this.a = et5Var;
        this.b = str;
        this.c = arrayList;
        this.d = zs5Var;
        this.e = s44Var;
    }
}
