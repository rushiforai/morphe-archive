package defpackage;

import java.io.InvalidObjectException;
import java.io.Serializable;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class eaf extends msa implements Serializable {
    public int c;
    public int d;
    public int e;
    public int f;
    public int g;
    public int h;

    public eaf(int i, int i2) {
        int i3 = ~i;
        int i4 = (i << 10) ^ (i2 >>> 4);
        this.c = i;
        this.d = i2;
        this.e = 0;
        this.f = 0;
        this.g = i3;
        this.h = i4;
        f();
        for (int i5 = 0; i5 < 64; i5++) {
            b();
        }
    }

    private final Object readResolve() throws Throwable {
        try {
            f();
            return this;
        } catch (Throwable th) {
            Throwable thInitCause = new InvalidObjectException(th.getMessage()).initCause(th);
            thInitCause.getClass();
            throw thInitCause;
        }
    }

    @Override // defpackage.msa
    public final int a(int i) {
        return (b() >>> (32 - i)) & ((-i) >> 31);
    }

    @Override // defpackage.msa
    public final int b() {
        int i = this.c;
        int i2 = i ^ (i >>> 2);
        this.c = this.d;
        this.d = this.e;
        this.e = this.f;
        int i3 = this.g;
        this.f = i3;
        int i4 = ((i2 ^ (i2 << 1)) ^ i3) ^ (i3 << 4);
        this.g = i4;
        int i5 = this.h + 362437;
        this.h = i5;
        return i4 + i5;
    }

    public final void f() {
        if ((this.g | this.c | this.d | this.e | this.f) != 0) {
            return;
        }
        ay0.e("Initial state must have at least one non-zero element.");
    }
}
