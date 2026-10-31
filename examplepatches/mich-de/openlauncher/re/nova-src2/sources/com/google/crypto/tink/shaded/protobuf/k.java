package com.google.crypto.tink.shaded.protobuf;

import ads_mobile_sdk.qq;
import ads_mobile_sdk.rb1;
import ads_mobile_sdk.ru;
import ads_mobile_sdk.su;
import ads_mobile_sdk.yi1;
import java.io.InputStream;

/* loaded from: classes.dex */
public abstract class k {

    /* renamed from: a, reason: collision with root package name */
    public int f34621a;

    /* renamed from: b, reason: collision with root package name */
    public int f34622b;

    /* renamed from: c, reason: collision with root package name */
    public Object f34623c;

    public static long a(long j11) {
        return (-(j11 & 1)) ^ (j11 >>> 1);
    }

    public static int b(int i5) {
        return (-(i5 & 1)) ^ (i5 >>> 1);
    }

    public static int k(int i5) {
        return (-(i5 & 1)) ^ (i5 >>> 1);
    }

    public static long l(long j11) {
        return (-(j11 & 1)) ^ (j11 >>> 1);
    }

    public abstract int B();

    public abstract boolean C();

    public abstract int D(int i5);

    public abstract boolean E();

    public abstract int F();

    public abstract int a();

    public abstract void a(int i5);

    public abstract int b();

    public abstract void c(int i5);

    public abstract boolean c();

    public abstract int d(int i5);

    public abstract boolean d();

    public abstract qq e();

    public abstract boolean e(int i5);

    public abstract double f();

    public abstract int g();

    public abstract int h();

    public abstract long i();

    public abstract float j();

    public abstract int k();

    public abstract long l();

    public abstract int m();

    public abstract int n();

    public abstract long o();

    public abstract int p();

    public abstract long q();

    public abstract String r();

    public abstract String s();

    public abstract int t();

    public abstract int u();

    public abstract long v();

    public void w() {
        int iT;
        do {
            iT = t();
            if (iT == 0) {
                return;
            }
            int i5 = this.f34621a;
            int i11 = this.f34622b;
            if (i5 + i11 >= 100) {
                throw new yi1("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
            }
            this.f34622b = i11 + 1;
            this.f34622b--;
        } while (e(iT));
    }

    public static k a(InputStream inputStream) {
        if (inputStream != null) {
            return new su(inputStream);
        }
        ru ruVar = new ru(rb1.f9048a, 0);
        try {
            ruVar.d(0);
            return ruVar;
        } catch (yi1 e3) {
            throw new IllegalArgumentException(e3);
        }
    }
}
