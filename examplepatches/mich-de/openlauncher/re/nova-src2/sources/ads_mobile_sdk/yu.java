package ads_mobile_sdk;

import b.t2;

/* loaded from: classes2.dex */
public abstract class yu extends t2 {

    /* renamed from: a, reason: collision with root package name */
    public c7 f12284a;

    public static long b(long j11) {
        return (j11 >> 63) ^ (j11 << 1);
    }

    public static int c(int i5) {
        return h(i5) + 4;
    }

    public static int d(int i5) {
        return h(i5) + 8;
    }

    public static int e(int i5) {
        return h(i5) + 4;
    }

    public static int f(int i5) {
        return h(i5) + 4;
    }

    public static int g(int i5) {
        return h(i5) + 8;
    }

    public static int h(int i5) {
        return i(i5 << 3);
    }

    public static int i(int i5) {
        return (352 - (Integer.numberOfLeadingZeros(i5) * 9)) >>> 6;
    }

    public static int j(int i5) {
        return (i5 >> 31) ^ (i5 << 1);
    }

    public final void a() {
        if (b() > 0) {
            throw new IllegalStateException("Did not write as much data as expected.");
        }
        if (b() < 0) {
            throw new IllegalStateException("Wrote more data than expected.");
        }
    }

    public abstract void a(byte b11);

    public abstract void a(int i5, boolean z11);

    public abstract void a(int i5, byte[] bArr);

    public abstract void a(String str);

    public abstract int b();

    public abstract void b(int i5, sq sqVar);

    public abstract void b(g gVar);

    public abstract void b(sq sqVar);

    public abstract void b(String str, int i5);

    public abstract void c(long j11);

    public abstract void d(int i5, long j11);

    public abstract void d(long j11);

    public abstract void e(int i5, int i11);

    public abstract void e(int i5, long j11);

    public abstract void f(int i5, int i11);

    public abstract void g(int i5, int i11);

    public abstract void h(int i5, int i11);

    public abstract void k(int i5);

    public abstract void l(int i5);

    public abstract void m(int i5);

    public static int b(int i5) {
        return h(i5) + 8;
    }

    public static int c(int i5, int i11) {
        return i(j(i11)) + h(i5);
    }

    public static int d(int i5, int i11) {
        return i(i11) + h(i5);
    }

    public static int b(int i5, int i11) {
        return a(i11) + h(i5);
    }

    public static int c(int i5, long j11) {
        return a(j11) + h(i5);
    }

    public static int a(int i5) {
        return h(i5) + 1;
    }

    public static int b(int i5, long j11) {
        return a(b(j11)) + h(i5);
    }

    public static int a(int i5, sq sqVar) {
        return a(sqVar) + h(i5);
    }

    public static int a(sq sqVar) {
        int size = sqVar.size();
        return i(size) + size;
    }

    public static int a(int i5, int i11) {
        return a(i11) + h(i5);
    }

    public static int a(int i5, long j11) {
        return a(j11) + h(i5);
    }

    public static int a(String str, int i5) {
        int iH = h(i5);
        int iA = vn3.f10832a.a(str);
        return i(iA) + iA + iH;
    }

    public static int a(long j11) {
        return (640 - (Long.numberOfLeadingZeros(j11) * 9)) >>> 6;
    }
}
