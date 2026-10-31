package com.fyber.inneractive.sdk.protobuf;

import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes.dex */
public abstract class b0 extends k {

    /* renamed from: b, reason: collision with root package name */
    public static final Logger f30768b = Logger.getLogger(b0.class.getName());

    /* renamed from: c, reason: collision with root package name */
    public static final boolean f30769c = x3.f30957e;

    /* renamed from: a, reason: collision with root package name */
    public c0 f30770a;

    public static int a(long j11) {
        int i5;
        if (((-128) & j11) == 0) {
            return 1;
        }
        if (j11 < 0) {
            return 10;
        }
        if (((-34359738368L) & j11) != 0) {
            j11 >>>= 28;
            i5 = 6;
        } else {
            i5 = 2;
        }
        if (((-2097152) & j11) != 0) {
            i5 += 2;
            j11 >>>= 14;
        }
        return (j11 & (-16384)) != 0 ? i5 + 1 : i5;
    }

    public static long b(long j11) {
        return (j11 >> 63) ^ (j11 << 1);
    }

    public static int c(int i5) {
        if ((i5 & (-128)) == 0) {
            return 1;
        }
        if ((i5 & (-16384)) == 0) {
            return 2;
        }
        if (((-2097152) & i5) == 0) {
            return 3;
        }
        return (i5 & (-268435456)) == 0 ? 4 : 5;
    }

    public static int d(int i5) {
        return (i5 >> 31) ^ (i5 << 1);
    }

    public abstract void a(byte b11);

    public abstract void a(int i5, int i11);

    public abstract void a(int i5, long j11);

    public abstract void a(int i5, d2 d2Var);

    public abstract void a(int i5, d2 d2Var, t2 t2Var);

    public abstract void a(int i5, s sVar);

    public abstract void a(int i5, boolean z11);

    public abstract void a(String str, int i5);

    public abstract void b(int i5, int i11);

    public abstract void b(int i5, long j11);

    public abstract void b(int i5, s sVar);

    public abstract void c(int i5, int i11);

    public abstract void c(long j11);

    public abstract void d(int i5, int i11);

    public abstract void d(long j11);

    public abstract void e(int i5);

    public abstract void f(int i5);

    public abstract void g(int i5);

    public static int a(int i5) {
        if (i5 >= 0) {
            return c(i5);
        }
        return 10;
    }

    public static int b(int i5) {
        return c(i5 << 3);
    }

    public static int a(String str) {
        int length;
        try {
            length = d4.a(str);
        } catch (b4 unused) {
            length = str.getBytes(l1.f30847a).length;
        }
        return c(length) + length;
    }

    public static int a(s sVar) {
        int size = sVar.size();
        return c(size) + size;
    }

    public final void a(String str, b4 b4Var) throws z {
        f30768b.log(Level.WARNING, "Converting ill-formed UTF-16. Your Protocol Buffer will not round trip correctly!", (Throwable) b4Var);
        byte[] bytes = str.getBytes(l1.f30847a);
        try {
            g(bytes.length);
            a(bytes, 0, bytes.length);
        } catch (z e3) {
            throw e3;
        } catch (IndexOutOfBoundsException e11) {
            throw new z(e11);
        }
    }
}
