package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class r01 {
    public static final r01 m = new r01();
    public final q74 a;
    public final o75 b;
    public final o75 c;
    public final o75 d;
    public final o75 e;
    public final o75 f;
    public final o75 g;
    public final o75 h;
    public final o75 i;
    public final o75 j;
    public final o75 k;
    public final o75 l;

    public r01() {
        q74 q74Var = new q74();
        x01.a(q74Var);
        x01.a.getClass();
        o75 o75Var = x01.c;
        o75Var.getClass();
        o75 o75Var2 = x01.b;
        o75Var2.getClass();
        o75 o75Var3 = x01.d;
        o75Var3.getClass();
        o75 o75Var4 = x01.e;
        o75Var4.getClass();
        o75 o75Var5 = x01.f;
        o75Var5.getClass();
        o75 o75Var6 = x01.g;
        o75Var6.getClass();
        o75 o75Var7 = x01.i;
        o75Var7.getClass();
        o75 o75Var8 = x01.h;
        o75Var8.getClass();
        o75 o75Var9 = x01.j;
        o75Var9.getClass();
        o75 o75Var10 = x01.k;
        o75Var10.getClass();
        o75 o75Var11 = x01.l;
        o75Var11.getClass();
        this.a = q74Var;
        this.b = o75Var;
        this.c = o75Var2;
        this.d = o75Var3;
        this.e = o75Var4;
        this.f = o75Var5;
        this.g = o75Var6;
        this.h = o75Var7;
        this.i = o75Var8;
        this.j = o75Var9;
        this.k = o75Var10;
        this.l = o75Var11;
    }

    public static String a(y05 y05Var) {
        String strB;
        y05Var.getClass();
        z05 z05Var = y05Var.a;
        StringBuilder sb = new StringBuilder(tuc.K(z05Var.a, '.', '/'));
        sb.append('/');
        if (z05Var.c()) {
            strB = "default-package";
        } else {
            strB = z05Var.g().b();
            strB.getClass();
        }
        sb.append(strB.concat(".kotlin_builtins"));
        return sb.toString();
    }
}
