package com.google.protobuf;

import java.util.logging.Level;
import java.util.logging.Logger;

/* loaded from: classes.dex */
public abstract class t extends g {

    /* renamed from: b, reason: collision with root package name */
    public static final Logger f34970b = Logger.getLogger(t.class.getName());

    /* renamed from: c, reason: collision with root package name */
    public static final boolean f34971c = m2.f34913e;

    /* renamed from: a, reason: collision with root package name */
    public h1 f34972a;

    public static int D(int i5) {
        return H((i5 >> 31) ^ (i5 << 1));
    }

    public static int E(long j11) {
        return I((j11 >> 63) ^ (j11 << 1));
    }

    public static int F(String str) {
        int length;
        try {
            length = o2.c(str);
        } catch (n2 unused) {
            length = str.getBytes(a1.f34808a).length;
        }
        return H(length) + length;
    }

    public static int G(int i5) {
        return H(i5 << 3);
    }

    public static int H(int i5) {
        return (352 - (Integer.numberOfLeadingZeros(i5) * 9)) >>> 6;
    }

    public static int I(long j11) {
        return (640 - (Long.numberOfLeadingZeros(j11) * 9)) >>> 6;
    }

    public final void J(String str, n2 n2Var) throws CodedOutputStream$OutOfSpaceException {
        f34970b.log(Level.WARNING, "Converting ill-formed UTF-16. Your Protocol Buffer will not round trip correctly!", (Throwable) n2Var);
        byte[] bytes = str.getBytes(a1.f34808a);
        try {
            d0(bytes.length);
            C(0, bytes.length, bytes);
        } catch (IndexOutOfBoundsException e3) {
            throw new CodedOutputStream$OutOfSpaceException(e3);
        }
    }

    public abstract void K(byte b11);

    public abstract void L(int i5, boolean z11);

    public abstract void M(int i5, byte[] bArr);

    public abstract void N(int i5, l lVar);

    public abstract void O(l lVar);

    public abstract void P(int i5, int i11);

    public abstract void Q(int i5);

    public abstract void R(int i5, long j11);

    public abstract void S(long j11);

    public abstract void T(int i5, int i11);

    public abstract void U(int i5);

    public abstract void V(int i5, o1 o1Var, b2 b2Var);

    public abstract void W(o1 o1Var);

    public abstract void X(int i5, o1 o1Var);

    public abstract void Y(int i5, l lVar);

    public abstract void Z(int i5, String str);

    public abstract void a0(String str);

    public abstract void b0(int i5, int i11);

    public abstract void c0(int i5, int i11);

    public abstract void d0(int i5);

    public abstract void e0(int i5, long j11);

    public abstract void f0(long j11);
}
