package com.google.protobuf;

import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.io.InputStream;

/* loaded from: classes.dex */
public abstract class p {

    /* renamed from: a, reason: collision with root package name */
    public int f34937a;

    /* renamed from: b, reason: collision with root package name */
    public q f34938b;

    public static int c(int i5) {
        return (-(i5 & 1)) ^ (i5 >>> 1);
    }

    public static long d(long j11) {
        return (-(j11 & 1)) ^ (j11 >>> 1);
    }

    public static m h(byte[] bArr, int i5, int i11, boolean z11) {
        m mVar = new m(bArr, i5, i11, z11);
        try {
            mVar.k(i11);
            return mVar;
        } catch (InvalidProtocolBufferException e3) {
            throw new IllegalArgumentException(e3);
        }
    }

    public static p i(InputStream inputStream) {
        if (inputStream != null) {
            return new n(inputStream);
        }
        byte[] bArr = a1.f34809b;
        return h(bArr, 0, bArr.length, false);
    }

    public static int x(int i5, InputStream inputStream) throws IOException {
        if ((i5 & 128) == 0) {
            return i5;
        }
        int i11 = i5 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE;
        int i12 = 7;
        while (i12 < 32) {
            int i13 = inputStream.read();
            if (i13 == -1) {
                throw InvalidProtocolBufferException.g();
            }
            i11 |= (i13 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) << i12;
            if ((i13 & 128) == 0) {
                return i11;
            }
            i12 += 7;
        }
        while (i12 < 64) {
            int i14 = inputStream.read();
            if (i14 == -1) {
                throw InvalidProtocolBufferException.g();
            }
            if ((i14 & 128) == 0) {
                return i11;
            }
            i12 += 7;
        }
        throw InvalidProtocolBufferException.d();
    }

    public abstract int A();

    public abstract long B();

    public abstract String C();

    public abstract String D();

    public abstract int E();

    public abstract int F();

    public abstract long G();

    public abstract boolean H(int i5);

    public final void I() throws InvalidProtocolBufferException {
        int iE;
        do {
            iE = E();
            if (iE == 0) {
                return;
            }
            b();
            this.f34937a++;
            this.f34937a--;
        } while (H(iE));
    }

    public abstract void a(int i5);

    public final void b() throws InvalidProtocolBufferException {
        if (this.f34937a >= 100) {
            throw new InvalidProtocolBufferException("Protocol message had too many levels of nesting.  May be malicious.  Use setRecursionLimit() to increase the recursion depth limit.");
        }
    }

    public abstract int e();

    public abstract int f();

    public abstract boolean g();

    public abstract void j(int i5);

    public abstract int k(int i5);

    public abstract boolean l();

    public abstract j m();

    public abstract double n();

    public abstract int o();

    public abstract int p();

    public abstract long q();

    public abstract float r();

    public abstract void s(int i5, n1 n1Var, y yVar);

    public abstract int t();

    public abstract long u();

    public abstract void v(n1 n1Var, y yVar);

    public abstract int w();

    public abstract int y();

    public abstract long z();
}
