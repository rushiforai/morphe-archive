package defpackage;

import java.util.LinkedHashSet;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class ee6 {
    public static final y05 a;
    public static final y05 b;
    public static final y05 c;
    public static final y05 d;
    public static final y05 e;
    public static final y05 f;
    public static final y05 g;
    public static final y05 h;
    public static final y05 i;
    public static final Set j;
    public static final Set k;
    public static final Set l;
    public static final Set m;
    public static final Set n;
    public static final Set o;
    public static final y05 p;

    static {
        y05 y05Var = new y05("org.jspecify.nullness.Nullable");
        y05 y05Var2 = new y05("org.jspecify.nullness.NullMarked");
        a = y05Var2;
        y05 y05Var3 = new y05("org.jspecify.nullness.NullnessUnspecified");
        y05 y05Var4 = new y05("org.jspecify.annotations.NonNull");
        y05 y05Var5 = new y05("org.jspecify.annotations.Nullable");
        y05 y05Var6 = new y05("org.jspecify.annotations.NullMarked");
        b = y05Var6;
        y05 y05Var7 = new y05("org.jspecify.annotations.NullnessUnspecified");
        y05 y05Var8 = new y05("org.jspecify.annotations.NullUnmarked");
        c = y05Var8;
        d = new y05("javax.annotation.meta.TypeQualifier");
        e = new y05("javax.annotation.meta.TypeQualifierNickname");
        f = new y05("javax.annotation.meta.TypeQualifierDefault");
        y05 y05Var9 = new y05("javax.annotation.Nonnull");
        g = y05Var9;
        y05 y05Var10 = new y05("javax.annotation.Nullable");
        y05 y05Var11 = new y05("javax.annotation.CheckForNull");
        h = new y05("javax.annotation.ParametersAreNonnullByDefault");
        i = new y05("javax.annotation.ParametersAreNullableByDefault");
        j = k80.S0(new y05[]{y05Var9, y05Var11});
        y05 y05Var12 = de6.h;
        y05Var12.getClass();
        Set setS0 = k80.S0(new y05[]{y05Var12, y05Var4, new y05("android.annotation.NonNull"), new y05("androidx.annotation.NonNull"), new y05("androidx.annotation.RecentlyNonNull"), new y05("android.support.annotation.NonNull"), new y05("com.android.annotations.NonNull"), new y05("org.checkerframework.checker.nullness.compatqual.NonNullDecl"), new y05("org.checkerframework.checker.nullness.qual.NonNull"), new y05("edu.umd.cs.findbugs.annotations.NonNull"), new y05("io.reactivex.annotations.NonNull"), new y05("io.reactivex.rxjava3.annotations.NonNull"), new y05("org.eclipse.jdt.annotation.NonNull"), new y05("lombok.NonNull"), new y05("jakarta.annotation.Nonnull")});
        k = setS0;
        y05 y05Var13 = de6.i;
        y05Var13.getClass();
        Set setS02 = k80.S0(new y05[]{y05Var13, y05Var, y05Var5, y05Var10, y05Var11, new y05("android.annotation.Nullable"), new y05("androidx.annotation.Nullable"), new y05("androidx.annotation.RecentlyNullable"), new y05("android.support.annotation.Nullable"), new y05("com.android.annotations.Nullable"), new y05("org.checkerframework.checker.nullness.compatqual.NullableDecl"), new y05("org.checkerframework.checker.nullness.qual.Nullable"), new y05("edu.umd.cs.findbugs.annotations.Nullable"), new y05("edu.umd.cs.findbugs.annotations.PossiblyNull"), new y05("edu.umd.cs.findbugs.annotations.CheckForNull"), new y05("io.reactivex.annotations.Nullable"), new y05("io.reactivex.rxjava3.annotations.Nullable"), new y05("org.eclipse.jdt.annotation.Nullable"), new y05("jakarta.annotation.Nullable")});
        l = setS02;
        m = k80.S0(new y05[]{y05Var3, y05Var7});
        qo7.w(qo7.w(qo7.w(qo7.w(qo7.v(qo7.v(new LinkedHashSet(), setS0), setS02), y05Var9), y05Var2), y05Var6), y05Var8);
        n = k80.S0(new y05[]{de6.k, de6.l});
        o = k80.S0(new y05[]{de6.j, de6.m});
        ei7.Q(new f09(de6.c, lnc.t), new f09(de6.d, lnc.w), new f09(de6.e, lnc.m), new f09(de6.f, lnc.x));
        p = new y05("kotlin.annotations.jvm.UnderMigration");
    }
}
