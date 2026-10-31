package com.google.android.gms.internal.measurement;

import java.io.InputStream;
import kotlin.text.Regex;

/* loaded from: classes3.dex */
public abstract class y0 {

    /* renamed from: a, reason: collision with root package name */
    public int f33238a;

    /* renamed from: b, reason: collision with root package name */
    public int f33239b;

    /* renamed from: c, reason: collision with root package name */
    public Object f33240c;

    public y0(int i5, int i11, Regex regex) {
        this.f33238a = i5;
        this.f33239b = i11;
        this.f33240c = regex;
    }

    public static y0 h(int i5, InputStream inputStream) {
        if (i5 <= 0) {
            throw new IllegalArgumentException("bufferSize must be > 0");
        }
        if (inputStream != null) {
            return new x0(inputStream, i5);
        }
        w0 w0Var = new w0(w1.f33176a);
        try {
            w0Var.a(0);
            return w0Var;
        } catch (zzaeh e3) {
            throw new IllegalArgumentException(e3);
        }
    }

    public static int j(int i5) {
        return (i5 >>> 1) ^ (-(i5 & 1));
    }

    public static long k(long j11) {
        return (j11 >>> 1) ^ (-(1 & j11));
    }

    public abstract int A();

    public abstract int B();

    public abstract int C();

    public abstract long D();

    public abstract int E();

    public abstract long F();

    public abstract int G();

    public abstract long H();

    public abstract int a(int i5);

    public abstract void b(int i5);

    public abstract int c();

    public abstract boolean d();

    public abstract int e();

    public abstract int f(int i5, int i11, byte[] bArr);

    public abstract void g(int i5);

    public void i() throws zzaeh {
        int iL;
        do {
            iL = l();
            if (iL == 0) {
                return;
            }
            int i5 = this.f33238a;
            int i11 = this.f33239b;
            if (i5 + i11 >= 100) {
                throw new zzaeh("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
            }
            this.f33239b = i11 + 1;
            this.f33239b--;
        } while (n(iL));
    }

    public abstract int l();

    public abstract void m(int i5);

    public abstract boolean n(int i5);

    public abstract double o();

    public abstract float p();

    public abstract long q();

    public abstract long r();

    public abstract int s();

    public abstract long t();

    public abstract int u();

    public abstract boolean v();

    public abstract String w();

    public abstract String x();

    public abstract u0 y();

    public abstract byte[] z();
}
