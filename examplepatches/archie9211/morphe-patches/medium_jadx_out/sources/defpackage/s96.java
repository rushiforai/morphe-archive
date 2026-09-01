package defpackage;

import java.lang.annotation.Annotation;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicIntegerArray;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicLongArray;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.atomic.AtomicReferenceArray;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class s96 {
    public static final String a;
    public static final String b;
    public static final String c;
    public static final String d;
    public static final mn1 e;
    public static final y05 f;
    public static final mn1 g;
    public static final HashMap h;
    public static final HashMap i;
    public static final HashMap j;
    public static final HashMap k;
    public static final HashMap l;
    public static final HashMap m;
    public static final List n;

    static {
        StringBuilder sb = new StringBuilder();
        y55 y55Var = y55.c;
        sb.append(y55Var.a);
        sb.append('.');
        sb.append(y55Var.b);
        a = sb.toString();
        StringBuilder sb2 = new StringBuilder();
        z55 z55Var = z55.c;
        sb2.append(z55Var.a);
        sb2.append('.');
        sb2.append(z55Var.b);
        b = sb2.toString();
        StringBuilder sb3 = new StringBuilder();
        b65 b65Var = b65.c;
        sb3.append(b65Var.a);
        sb3.append('.');
        sb3.append(b65Var.b);
        c = sb3.toString();
        StringBuilder sb4 = new StringBuilder();
        a65 a65Var = a65.c;
        sb4.append(a65Var.a);
        sb4.append('.');
        sb4.append(a65Var.b);
        d = sb4.toString();
        mn1 mn1VarP = kng.P(new y05("kotlin.jvm.functions.FunctionN"));
        e = mn1VarP;
        f = mn1VarP.a();
        g = gnc.u;
        d(Class.class);
        h = new HashMap();
        i = new HashMap();
        j = new HashMap();
        k = new HashMap();
        l = new HashMap();
        m = new HashMap();
        mn1 mn1VarP2 = kng.P(lnc.B);
        y05 y05Var = lnc.J;
        y05 y05Var2 = mn1VarP2.a;
        r96 r96Var = new r96(d(Iterable.class), mn1VarP2, new mn1(y05Var2, hlg.R(y05Var, y05Var2), false));
        mn1 mn1VarP3 = kng.P(lnc.A);
        y05 y05Var3 = lnc.I;
        y05 y05Var4 = mn1VarP3.a;
        r96 r96Var2 = new r96(d(Iterator.class), mn1VarP3, new mn1(y05Var4, hlg.R(y05Var3, y05Var4), false));
        mn1 mn1VarP4 = kng.P(lnc.C);
        y05 y05Var5 = lnc.K;
        y05 y05Var6 = mn1VarP4.a;
        r96 r96Var3 = new r96(d(Collection.class), mn1VarP4, new mn1(y05Var6, hlg.R(y05Var5, y05Var6), false));
        mn1 mn1VarP5 = kng.P(lnc.D);
        y05 y05Var7 = lnc.L;
        y05 y05Var8 = mn1VarP5.a;
        r96 r96Var4 = new r96(d(List.class), mn1VarP5, new mn1(y05Var8, hlg.R(y05Var7, y05Var8), false));
        mn1 mn1VarP6 = kng.P(lnc.F);
        y05 y05Var9 = lnc.N;
        y05 y05Var10 = mn1VarP6.a;
        r96 r96Var5 = new r96(d(Set.class), mn1VarP6, new mn1(y05Var10, hlg.R(y05Var9, y05Var10), false));
        mn1 mn1VarP7 = kng.P(lnc.E);
        y05 y05Var11 = lnc.M;
        y05 y05Var12 = mn1VarP7.a;
        r96 r96Var6 = new r96(d(ListIterator.class), mn1VarP7, new mn1(y05Var12, hlg.R(y05Var11, y05Var12), false));
        y05 y05Var13 = lnc.G;
        mn1 mn1VarP8 = kng.P(y05Var13);
        y05 y05Var14 = lnc.O;
        y05 y05Var15 = mn1VarP8.a;
        r96 r96Var7 = new r96(d(Map.class), mn1VarP8, new mn1(y05Var15, hlg.R(y05Var14, y05Var15), false));
        mn1 mn1VarD = kng.P(y05Var13).d(lnc.H.a.g());
        y05 y05Var16 = lnc.P;
        y05 y05Var17 = mn1VarD.a;
        List<r96> listR = d46.R(r96Var, r96Var2, r96Var3, r96Var4, r96Var5, r96Var6, r96Var7, new r96(d(Map.Entry.class), mn1VarD, new mn1(y05Var17, hlg.R(y05Var16, y05Var17), false)));
        n = listR;
        c(Object.class, lnc.a);
        c(String.class, lnc.f);
        c(CharSequence.class, lnc.e);
        b(Throwable.class, lnc.k);
        c(Cloneable.class, lnc.c);
        c(Number.class, lnc.i);
        b(Comparable.class, lnc.l);
        c(Enum.class, lnc.j);
        b(Annotation.class, lnc.s);
        for (r96 r96Var8 : listR) {
            mn1 mn1Var = r96Var8.a;
            mn1 mn1Var2 = r96Var8.b;
            mn1 mn1Var3 = r96Var8.c;
            a(mn1Var, mn1Var2);
            i.put(mn1Var3.a().a, mn1Var);
            l.put(mn1Var3, mn1Var2);
            m.put(mn1Var2, mn1Var3);
            y05 y05VarA = mn1Var2.a();
            y05 y05VarA2 = mn1Var3.a();
            j.put(mn1Var3.a().a, y05VarA);
            k.put(y05VarA.a, y05VarA2);
        }
        for (pf6 pf6Var : pf6.values()) {
            y05 wrapperFqName = pf6Var.getWrapperFqName();
            wrapperFqName.getClass();
            mn1 mn1Var4 = new mn1(wrapperFqName.b(), wrapperFqName.a.g());
            x0a primitiveType = pf6Var.getPrimitiveType();
            primitiveType.getClass();
            y05 y05VarA3 = mnc.k.a(primitiveType.getTypeName());
            a(mn1Var4, new mn1(y05VarA3.b(), y05VarA3.a.g()));
        }
        for (mn1 mn1Var5 : ix1.a) {
            y05 y05Var18 = new y05("kotlin.jvm.internal." + mn1Var5.f().b() + "CompanionObject");
            a(new mn1(y05Var18.b(), y05Var18.a.g()), mn1Var5.d(olc.b));
        }
        for (int i2 = 0; i2 < 23; i2++) {
            y05 y05Var19 = new y05(b09.w(i2, "kotlin.jvm.functions.Function"));
            a(new mn1(y05Var19.b(), y05Var19.a.g()), new mn1(mnc.k, n98.e("Function" + i2)));
            i.put(new y05(b09.A(new StringBuilder(), i2, b)).a, g);
        }
        for (int i3 = 0; i3 < 22; i3++) {
            a65 a65Var2 = a65.c;
            i.put(new y05(b09.w(i3, a65Var2.a + '.' + a65Var2.b)).a, g);
        }
        y05 y05Var20 = new y05("kotlin.concurrent.atomics.AtomicInt");
        mn1 mn1VarD2 = d(AtomicInteger.class);
        HashMap map = i;
        map.put(y05Var20.a, mn1VarD2);
        map.put(new y05("kotlin.concurrent.atomics.AtomicLong").a, d(AtomicLong.class));
        map.put(new y05("kotlin.concurrent.atomics.AtomicBoolean").a, d(AtomicBoolean.class));
        map.put(new y05("kotlin.concurrent.atomics.AtomicReference").a, d(AtomicReference.class));
        map.put(new y05("kotlin.concurrent.atomics.AtomicIntArray").a, d(AtomicIntegerArray.class));
        map.put(new y05("kotlin.concurrent.atomics.AtomicLongArray").a, d(AtomicLongArray.class));
        map.put(new y05("kotlin.concurrent.atomics.AtomicArray").a, d(AtomicReferenceArray.class));
        map.put(lnc.b.i().a, d(Void.class));
    }

    public static void a(mn1 mn1Var, mn1 mn1Var2) {
        h.put(mn1Var.a().a, mn1Var2);
        i.put(mn1Var2.a().a, mn1Var);
    }

    public static void b(Class cls, y05 y05Var) {
        mn1 mn1VarD = d(cls);
        y05Var.getClass();
        a(mn1VarD, new mn1(y05Var.b(), y05Var.a.g()));
    }

    public static void c(Class cls, z05 z05Var) {
        b(cls, z05Var.i());
    }

    public static mn1 d(Class cls) {
        if (!cls.isPrimitive()) {
            cls.isArray();
        }
        Class<?> declaringClass = cls.getDeclaringClass();
        if (declaringClass != null) {
            return d(declaringClass).d(n98.e(cls.getSimpleName()));
        }
        String canonicalName = cls.getCanonicalName();
        canonicalName.getClass();
        y05 y05Var = new y05(canonicalName);
        return new mn1(y05Var.b(), y05Var.a.g());
    }

    public static boolean e(z05 z05Var, String str) {
        Integer numO;
        String str2 = z05Var.a;
        if (tuc.N(str2, str, false)) {
            String strSubstring = str2.substring(str.length());
            if (!muc.q0(strSubstring, '0') && (numO = tuc.O(strSubstring)) != null && numO.intValue() >= 23) {
                return true;
            }
        }
        return false;
    }

    public static mn1 f(y05 y05Var) {
        y05Var.getClass();
        return (mn1) h.get(y05Var.a);
    }

    public static mn1 g(z05 z05Var) {
        z05Var.getClass();
        return (e(z05Var, a) || e(z05Var, c)) ? e : (e(z05Var, b) || e(z05Var, d)) ? g : (mn1) i.get(z05Var);
    }
}
