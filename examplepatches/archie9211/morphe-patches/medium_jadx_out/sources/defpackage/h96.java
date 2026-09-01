package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class h96 {
    public static final y05 a;
    public static final y05[] b;
    public static final gg5 c;
    public static final i96 d;

    static {
        y05 y05Var = new y05("org.jspecify.nullness");
        y05 y05Var2 = new y05("org.jspecify.annotations");
        a = y05Var2;
        y05 y05Var3 = new y05("io.reactivex.rxjava3.annotations");
        y05 y05Var4 = new y05("org.checkerframework.checker.nullness.compatqual");
        String str = y05Var3.a.a;
        b = new y05[]{new y05(km4.y(str, ".Nullable")), new y05(km4.y(str, ".NonNull"))};
        y05 y05Var5 = new y05("org.jetbrains.annotations");
        i96 i96Var = i96.d;
        f09 f09Var = new f09(y05Var5, i96Var);
        f09 f09Var2 = new f09(new y05("androidx.annotation"), i96Var);
        f09 f09Var3 = new f09(new y05("android.support.annotation"), i96Var);
        f09 f09Var4 = new f09(new y05("android.annotation"), i96Var);
        f09 f09Var5 = new f09(new y05("com.android.annotations"), i96Var);
        f09 f09Var6 = new f09(new y05("org.eclipse.jdt.annotation"), i96Var);
        f09 f09Var7 = new f09(new y05("org.checkerframework.checker.nullness.qual"), i96Var);
        f09 f09Var8 = new f09(y05Var4, i96Var);
        f09 f09Var9 = new f09(new y05("javax.annotation"), i96Var);
        f09 f09Var10 = new f09(new y05("edu.umd.cs.findbugs.annotations"), i96Var);
        f09 f09Var11 = new f09(new y05("io.reactivex.annotations"), i96Var);
        y05 y05Var6 = new y05("androidx.annotation.RecentlyNullable");
        h5b h5bVar = h5b.WARN;
        f09 f09Var12 = new f09(y05Var6, new i96(h5bVar, 4));
        f09 f09Var13 = new f09(new y05("androidx.annotation.RecentlyNonNull"), new i96(h5bVar, 4));
        f09 f09Var14 = new f09(new y05("lombok"), i96Var);
        tn6 tn6Var = new tn6(2, 1, 0);
        h5b h5bVar2 = h5b.STRICT;
        c = new gg5(ei7.Q(f09Var, f09Var2, f09Var3, f09Var4, f09Var5, f09Var6, f09Var7, f09Var8, f09Var9, f09Var10, f09Var11, f09Var12, f09Var13, f09Var14, new f09(y05Var, new i96(h5bVar, tn6Var, h5bVar2)), new f09(y05Var2, new i96(h5bVar, new tn6(2, 1, 0), h5bVar2)), new f09(y05Var3, new i96(h5bVar, new tn6(1, 8, 0), h5bVar2)), new f09(new y05("jakarta.annotation"), new i96(h5bVar, new tn6(2, 4, 0), h5bVar2))));
        d = new i96(h5bVar, 4);
    }
}
