package defpackage;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class de6 {
    public static final y05 a;
    public static final n98 b;
    public static final y05 c;
    public static final y05 d;
    public static final y05 e;
    public static final y05 f;
    public static final y05 g;
    public static final y05 h;
    public static final y05 i;
    public static final y05 j;
    public static final y05 k;
    public static final y05 l;
    public static final y05 m;
    public static final y05 n;
    public static final y05 o;
    public static final y05 p;
    public static final y05 q;

    static {
        y05 y05Var = new y05("kotlin.Metadata");
        a = y05Var;
        te6.b(y05Var).d();
        b = n98.e("value");
        c = new y05(Target.class.getName());
        new y05(ElementType.class.getName());
        d = new y05(Retention.class.getName());
        new y05(RetentionPolicy.class.getName());
        e = new y05(Deprecated.class.getName());
        f = new y05(Documented.class.getName());
        g = new y05("java.lang.annotation.Repeatable");
        new y05(Override.class.getName());
        h = new y05("org.jetbrains.annotations.NotNull");
        i = new y05("org.jetbrains.annotations.Nullable");
        j = new y05("org.jetbrains.annotations.Mutable");
        k = new y05("org.jetbrains.annotations.ReadOnly");
        l = new y05("kotlin.annotations.jvm.ReadOnly");
        m = new y05("kotlin.annotations.jvm.Mutable");
        n = new y05("kotlin.jvm.PurelyImplements");
        new y05("kotlin.jvm.internal");
        y05 y05Var2 = new y05("kotlin.jvm.internal.SerializedIr");
        o = y05Var2;
        te6.b(y05Var2).d();
        p = new y05("kotlin.jvm.internal.EnhancedNullability");
        q = new y05("kotlin.jvm.internal.EnhancedMutability");
    }
}
