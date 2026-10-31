package com.fyber.inneractive.sdk.protobuf;

import com.vungle.ads.internal.protos.Sdk;
import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes3.dex */
public final class a0 extends b0 {

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f30757d;

    /* renamed from: e, reason: collision with root package name */
    public final int f30758e;

    /* renamed from: f, reason: collision with root package name */
    public int f30759f;

    /* renamed from: g, reason: collision with root package name */
    public final OutputStream f30760g;

    public a0(OutputStream outputStream, int i5) {
        if (i5 < 0) {
            throw new IllegalArgumentException("bufferSize must be >= 0");
        }
        int iMax = Math.max(i5, 20);
        this.f30757d = new byte[iMax];
        this.f30758e = iMax;
        if (outputStream == null) {
            throw new NullPointerException("out");
        }
        this.f30760g = outputStream;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void a(int i5, int i11) {
        j(14);
        e(i5, 5);
        h(i11);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void b(int i5, int i11) {
        j(20);
        e(i5, 0);
        if (i11 >= 0) {
            i(i11);
        } else {
            f(i11);
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void c(int i5, int i11) {
        j(5);
        i((i5 << 3) | i11);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void d(int i5, int i11) {
        j(20);
        e(i5, 0);
        i(i11);
    }

    public final void e(int i5, int i11) {
        i((i5 << 3) | i11);
    }

    public final void f(long j11) {
        if (!b0.f30769c) {
            while ((j11 & (-128)) != 0) {
                byte[] bArr = this.f30757d;
                int i5 = this.f30759f;
                this.f30759f = i5 + 1;
                bArr[i5] = (byte) ((((int) j11) & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) | 128);
                j11 >>>= 7;
            }
            byte[] bArr2 = this.f30757d;
            int i11 = this.f30759f;
            this.f30759f = i11 + 1;
            bArr2[i11] = (byte) j11;
            return;
        }
        while ((j11 & (-128)) != 0) {
            byte[] bArr3 = this.f30757d;
            int i12 = this.f30759f;
            this.f30759f = i12 + 1;
            x3.f30955c.a((Object) bArr3, x3.f30958f + i12, (byte) ((((int) j11) & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) | 128));
            j11 >>>= 7;
        }
        byte[] bArr4 = this.f30757d;
        int i13 = this.f30759f;
        this.f30759f = i13 + 1;
        x3.f30955c.a((Object) bArr4, x3.f30958f + i13, (byte) j11);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void g(int i5) {
        j(5);
        i(i5);
    }

    public final void h(int i5) {
        byte[] bArr = this.f30757d;
        int i11 = this.f30759f;
        int i12 = i11 + 1;
        this.f30759f = i12;
        bArr[i11] = (byte) (i5 & 255);
        int i13 = i11 + 2;
        this.f30759f = i13;
        bArr[i12] = (byte) ((i5 >> 8) & 255);
        int i14 = i11 + 3;
        this.f30759f = i14;
        bArr[i13] = (byte) ((i5 >> 16) & 255);
        this.f30759f = i11 + 4;
        bArr[i14] = (byte) ((i5 >> 24) & 255);
    }

    public final void i(int i5) {
        if (!b0.f30769c) {
            while ((i5 & (-128)) != 0) {
                byte[] bArr = this.f30757d;
                int i11 = this.f30759f;
                this.f30759f = i11 + 1;
                bArr[i11] = (byte) ((i5 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) | 128);
                i5 >>>= 7;
            }
            byte[] bArr2 = this.f30757d;
            int i12 = this.f30759f;
            this.f30759f = i12 + 1;
            bArr2[i12] = (byte) i5;
            return;
        }
        while ((i5 & (-128)) != 0) {
            byte[] bArr3 = this.f30757d;
            int i13 = this.f30759f;
            this.f30759f = i13 + 1;
            x3.f30955c.a((Object) bArr3, x3.f30958f + i13, (byte) ((i5 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) | 128));
            i5 >>>= 7;
        }
        byte[] bArr4 = this.f30757d;
        int i14 = this.f30759f;
        this.f30759f = i14 + 1;
        x3.f30955c.a((Object) bArr4, x3.f30958f + i14, (byte) i5);
    }

    public final void j(int i5) {
        if (this.f30758e - this.f30759f < i5) {
            a();
        }
    }

    public final void e(long j11) {
        byte[] bArr = this.f30757d;
        int i5 = this.f30759f;
        int i11 = i5 + 1;
        this.f30759f = i11;
        bArr[i5] = (byte) (j11 & 255);
        int i12 = i5 + 2;
        this.f30759f = i12;
        bArr[i11] = (byte) ((j11 >> 8) & 255);
        int i13 = i5 + 3;
        this.f30759f = i13;
        bArr[i12] = (byte) ((j11 >> 16) & 255);
        int i14 = i5 + 4;
        this.f30759f = i14;
        bArr[i13] = (byte) (255 & (j11 >> 24));
        int i15 = i5 + 5;
        this.f30759f = i15;
        bArr[i14] = (byte) (((int) (j11 >> 32)) & 255);
        int i16 = i5 + 6;
        this.f30759f = i16;
        bArr[i15] = (byte) (((int) (j11 >> 40)) & 255);
        int i17 = i5 + 7;
        this.f30759f = i17;
        bArr[i16] = (byte) (((int) (j11 >> 48)) & 255);
        this.f30759f = i5 + 8;
        bArr[i17] = (byte) (((int) (j11 >> 56)) & 255);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void c(long j11) {
        j(8);
        e(j11);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void a(int i5, long j11) {
        j(18);
        e(i5, 1);
        e(j11);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void d(long j11) {
        j(10);
        f(j11);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void b(int i5, long j11) {
        j(20);
        e(i5, 0);
        f(j11);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void a(int i5, boolean z11) {
        j(11);
        e(i5, 0);
        byte b11 = z11 ? (byte) 1 : (byte) 0;
        byte[] bArr = this.f30757d;
        int i11 = this.f30759f;
        this.f30759f = i11 + 1;
        bArr[i11] = b11;
    }

    public final void b(s sVar) {
        int size = sVar.size();
        j(5);
        i(size);
        sVar.a(this);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void f(int i5) {
        if (i5 >= 0) {
            j(5);
            i(i5);
        } else {
            j(10);
            f(i5);
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void a(String str, int i5) throws IOException {
        c(i5, 2);
        b(str);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void e(int i5) {
        j(4);
        h(i5);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void a(int i5, s sVar) {
        c(i5, 2);
        b(sVar);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void b(int i5, s sVar) {
        c(1, 3);
        d(2, i5);
        c(3, 2);
        b(sVar);
        c(1, 4);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void a(int i5, d2 d2Var, t2 t2Var) {
        c(i5, 2);
        int serializedSize = ((b) d2Var).getSerializedSize(t2Var);
        j(5);
        i(serializedSize);
        t2Var.a((Object) d2Var, this.f30770a);
    }

    public final void b(String str) throws IOException {
        try {
            int length = str.length() * 3;
            int iC = b0.c(length);
            int i5 = iC + length;
            int i11 = this.f30758e;
            if (i5 > i11) {
                byte[] bArr = new byte[length];
                int iA = d4.f30786a.a(str, bArr, 0, length);
                j(5);
                i(iA);
                b(bArr, 0, iA);
                return;
            }
            if (i5 > i11 - this.f30759f) {
                a();
            }
            int iC2 = b0.c(str.length());
            int i12 = this.f30759f;
            try {
                if (iC2 == iC) {
                    int i13 = i12 + iC2;
                    this.f30759f = i13;
                    int iA2 = d4.f30786a.a(str, this.f30757d, i13, this.f30758e - i13);
                    this.f30759f = i12;
                    i((iA2 - i12) - iC2);
                    this.f30759f = iA2;
                    return;
                }
                int iA3 = d4.a(str);
                i(iA3);
                this.f30759f = d4.f30786a.a(str, this.f30757d, this.f30759f, iA3);
            } catch (b4 e3) {
                this.f30759f = i12;
                throw e3;
            } catch (ArrayIndexOutOfBoundsException e11) {
                throw new z(e11);
            }
        } catch (b4 e12) {
            a(str, e12);
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void a(int i5, d2 d2Var) {
        c(1, 3);
        d(2, i5);
        c(3, 2);
        a(d2Var);
        c(1, 4);
    }

    public final void a(d2 d2Var) {
        int serializedSize = d2Var.getSerializedSize();
        j(5);
        i(serializedSize);
        d2Var.writeTo(this);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void a(byte b11) {
        if (this.f30759f == this.f30758e) {
            a();
        }
        byte[] bArr = this.f30757d;
        int i5 = this.f30759f;
        this.f30759f = i5 + 1;
        bArr[i5] = b11;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.k
    public final void a(byte[] bArr, int i5, int i11) throws IOException {
        b(bArr, i5, i11);
    }

    public final void a() {
        this.f30760g.write(this.f30757d, 0, this.f30759f);
        this.f30759f = 0;
    }

    public final void b(byte[] bArr, int i5, int i11) throws IOException {
        int i12 = this.f30758e;
        int i13 = this.f30759f;
        int i14 = i12 - i13;
        if (i14 >= i11) {
            System.arraycopy(bArr, i5, this.f30757d, i13, i11);
            this.f30759f += i11;
            return;
        }
        System.arraycopy(bArr, i5, this.f30757d, i13, i14);
        int i15 = i5 + i14;
        int i16 = i11 - i14;
        this.f30759f = this.f30758e;
        a();
        if (i16 <= this.f30758e) {
            System.arraycopy(bArr, i15, this.f30757d, 0, i16);
            this.f30759f = i16;
        } else {
            this.f30760g.write(bArr, i15, i16);
        }
    }
}
