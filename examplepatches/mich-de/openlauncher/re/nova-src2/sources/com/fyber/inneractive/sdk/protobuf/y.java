package com.fyber.inneractive.sdk.protobuf;

import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes.dex */
public final class y extends b0 {

    /* renamed from: d, reason: collision with root package name */
    public final byte[] f30961d;

    /* renamed from: e, reason: collision with root package name */
    public final int f30962e;

    /* renamed from: f, reason: collision with root package name */
    public int f30963f;

    public y(int i5, byte[] bArr) {
        if (((bArr.length - i5) | i5) < 0) {
            throw new IllegalArgumentException(String.format("Array range is invalid. Buffer.length=%d, offset=%d, length=%d", Integer.valueOf(bArr.length), 0, Integer.valueOf(i5)));
        }
        this.f30961d = bArr;
        this.f30963f = 0;
        this.f30962e = i5;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void a(int i5, int i11) throws z {
        c(i5, 5);
        e(i11);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void b(int i5, int i11) throws z {
        c(i5, 0);
        f(i11);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void c(int i5, int i11) throws z {
        g((i5 << 3) | i11);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void d(long j11) throws z {
        if (!b0.f30769c || this.f30962e - this.f30963f < 10) {
            while ((j11 & (-128)) != 0) {
                try {
                    byte[] bArr = this.f30961d;
                    int i5 = this.f30963f;
                    this.f30963f = i5 + 1;
                    bArr[i5] = (byte) ((((int) j11) & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) | 128);
                    j11 >>>= 7;
                } catch (IndexOutOfBoundsException e3) {
                    throw new z(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.f30963f), Integer.valueOf(this.f30962e), 1), e3);
                }
            }
            byte[] bArr2 = this.f30961d;
            int i11 = this.f30963f;
            this.f30963f = i11 + 1;
            bArr2[i11] = (byte) j11;
            return;
        }
        while ((j11 & (-128)) != 0) {
            byte[] bArr3 = this.f30961d;
            int i12 = this.f30963f;
            this.f30963f = i12 + 1;
            x3.f30955c.a((Object) bArr3, x3.f30958f + i12, (byte) ((((int) j11) & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) | 128));
            j11 >>>= 7;
        }
        byte[] bArr4 = this.f30961d;
        int i13 = this.f30963f;
        this.f30963f = i13 + 1;
        x3.f30955c.a((Object) bArr4, x3.f30958f + i13, (byte) j11);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void e(int i5) throws z {
        try {
            byte[] bArr = this.f30961d;
            int i11 = this.f30963f;
            int i12 = i11 + 1;
            this.f30963f = i12;
            bArr[i11] = (byte) (i5 & 255);
            int i13 = i11 + 2;
            this.f30963f = i13;
            bArr[i12] = (byte) ((i5 >> 8) & 255);
            int i14 = i11 + 3;
            this.f30963f = i14;
            bArr[i13] = (byte) ((i5 >> 16) & 255);
            this.f30963f = i11 + 4;
            bArr[i14] = (byte) ((i5 >> 24) & 255);
        } catch (IndexOutOfBoundsException e3) {
            throw new z(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.f30963f), Integer.valueOf(this.f30962e), 1), e3);
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void f(int i5) throws z {
        if (i5 >= 0) {
            g(i5);
        } else {
            d(i5);
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void g(int i5) throws z {
        if (b0.f30769c && !d.a()) {
            int i11 = this.f30962e;
            int i12 = this.f30963f;
            if (i11 - i12 >= 5) {
                if ((i5 & (-128)) == 0) {
                    byte[] bArr = this.f30961d;
                    this.f30963f = i12 + 1;
                    x3.f30955c.a((Object) bArr, x3.f30958f + i12, (byte) i5);
                    return;
                }
                byte[] bArr2 = this.f30961d;
                this.f30963f = i12 + 1;
                w3 w3Var = x3.f30955c;
                long j11 = x3.f30958f;
                w3Var.a((Object) bArr2, i12 + j11, (byte) (i5 | 128));
                int i13 = i5 >>> 7;
                if ((i13 & (-128)) == 0) {
                    byte[] bArr3 = this.f30961d;
                    int i14 = this.f30963f;
                    this.f30963f = i14 + 1;
                    w3Var.a((Object) bArr3, j11 + i14, (byte) i13);
                    return;
                }
                byte[] bArr4 = this.f30961d;
                int i15 = this.f30963f;
                this.f30963f = i15 + 1;
                w3Var.a((Object) bArr4, i15 + j11, (byte) (i13 | 128));
                int i16 = i5 >>> 14;
                if ((i16 & (-128)) == 0) {
                    byte[] bArr5 = this.f30961d;
                    int i17 = this.f30963f;
                    this.f30963f = i17 + 1;
                    w3Var.a((Object) bArr5, j11 + i17, (byte) i16);
                    return;
                }
                byte[] bArr6 = this.f30961d;
                int i18 = this.f30963f;
                this.f30963f = i18 + 1;
                w3Var.a((Object) bArr6, i18 + j11, (byte) (i16 | 128));
                int i19 = i5 >>> 21;
                if ((i19 & (-128)) == 0) {
                    byte[] bArr7 = this.f30961d;
                    int i21 = this.f30963f;
                    this.f30963f = i21 + 1;
                    w3Var.a((Object) bArr7, j11 + i21, (byte) i19);
                    return;
                }
                byte[] bArr8 = this.f30961d;
                int i22 = this.f30963f;
                this.f30963f = i22 + 1;
                w3Var.a((Object) bArr8, i22 + j11, (byte) (i19 | 128));
                byte[] bArr9 = this.f30961d;
                int i23 = this.f30963f;
                this.f30963f = i23 + 1;
                w3Var.a((Object) bArr9, j11 + i23, (byte) (i5 >>> 28));
                return;
            }
        }
        while ((i5 & (-128)) != 0) {
            try {
                byte[] bArr10 = this.f30961d;
                int i24 = this.f30963f;
                this.f30963f = i24 + 1;
                bArr10[i24] = (byte) ((i5 & Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE) | 128);
                i5 >>>= 7;
            } catch (IndexOutOfBoundsException e3) {
                throw new z(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.f30963f), Integer.valueOf(this.f30962e), 1), e3);
            }
        }
        byte[] bArr11 = this.f30961d;
        int i25 = this.f30963f;
        this.f30963f = i25 + 1;
        bArr11[i25] = (byte) i5;
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void c(long j11) throws z {
        try {
            byte[] bArr = this.f30961d;
            int i5 = this.f30963f;
            int i11 = i5 + 1;
            this.f30963f = i11;
            bArr[i5] = (byte) (((int) j11) & 255);
            int i12 = i5 + 2;
            this.f30963f = i12;
            bArr[i11] = (byte) (((int) (j11 >> 8)) & 255);
            int i13 = i5 + 3;
            this.f30963f = i13;
            bArr[i12] = (byte) (((int) (j11 >> 16)) & 255);
            int i14 = i5 + 4;
            this.f30963f = i14;
            bArr[i13] = (byte) (((int) (j11 >> 24)) & 255);
            int i15 = i5 + 5;
            this.f30963f = i15;
            bArr[i14] = (byte) (((int) (j11 >> 32)) & 255);
            int i16 = i5 + 6;
            this.f30963f = i16;
            bArr[i15] = (byte) (((int) (j11 >> 40)) & 255);
            int i17 = i5 + 7;
            this.f30963f = i17;
            bArr[i16] = (byte) (((int) (j11 >> 48)) & 255);
            this.f30963f = i5 + 8;
            bArr[i17] = (byte) (((int) (j11 >> 56)) & 255);
        } catch (IndexOutOfBoundsException e3) {
            throw new z(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.f30963f), Integer.valueOf(this.f30962e), 1), e3);
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void a(int i5, long j11) throws z {
        c(i5, 1);
        c(j11);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void b(int i5, long j11) throws z {
        c(i5, 0);
        d(j11);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void a(int i5, boolean z11) throws z {
        c(i5, 0);
        a(z11 ? (byte) 1 : (byte) 0);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void b(int i5, s sVar) throws z {
        c(1, 3);
        c(2, 0);
        g(i5);
        a(3, sVar);
        c(1, 4);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void a(String str, int i5) throws z {
        c(i5, 2);
        b(str);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void a(int i5, s sVar) throws z {
        c(i5, 2);
        g(sVar.size());
        sVar.a(this);
    }

    public final void b(byte[] bArr, int i5, int i11) throws z {
        try {
            System.arraycopy(bArr, i5, this.f30961d, this.f30963f, i11);
            this.f30963f += i11;
        } catch (IndexOutOfBoundsException e3) {
            throw new z(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.f30963f), Integer.valueOf(this.f30962e), Integer.valueOf(i11)), e3);
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void d(int i5, int i11) throws z {
        c(i5, 0);
        g(i11);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void a(int i5, d2 d2Var, t2 t2Var) throws z {
        c(i5, 2);
        g(((b) d2Var).getSerializedSize(t2Var));
        t2Var.a((Object) d2Var, this.f30770a);
    }

    public final void b(String str) throws z {
        int i5 = this.f30963f;
        try {
            int iC = b0.c(str.length() * 3);
            int iC2 = b0.c(str.length());
            if (iC2 == iC) {
                int i11 = i5 + iC2;
                this.f30963f = i11;
                int iA = d4.f30786a.a(str, this.f30961d, i11, this.f30962e - i11);
                this.f30963f = i5;
                g((iA - i5) - iC2);
                this.f30963f = iA;
                return;
            }
            g(d4.a(str));
            byte[] bArr = this.f30961d;
            int i12 = this.f30963f;
            this.f30963f = d4.f30786a.a(str, bArr, i12, this.f30962e - i12);
        } catch (b4 e3) {
            this.f30963f = i5;
            a(str, e3);
        } catch (IndexOutOfBoundsException e11) {
            throw new z(e11);
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void a(int i5, d2 d2Var) throws z {
        c(1, 3);
        c(2, 0);
        g(i5);
        c(3, 2);
        g(d2Var.getSerializedSize());
        d2Var.writeTo(this);
        c(1, 4);
    }

    @Override // com.fyber.inneractive.sdk.protobuf.b0
    public final void a(byte b11) throws z {
        try {
            byte[] bArr = this.f30961d;
            int i5 = this.f30963f;
            this.f30963f = i5 + 1;
            bArr[i5] = b11;
        } catch (IndexOutOfBoundsException e3) {
            throw new z(String.format("Pos: %d, limit: %d, len: %d", Integer.valueOf(this.f30963f), Integer.valueOf(this.f30962e), 1), e3);
        }
    }

    @Override // com.fyber.inneractive.sdk.protobuf.k
    public final void a(byte[] bArr, int i5, int i11) throws z {
        b(bArr, i5, i11);
    }

    public final int a() {
        return this.f30962e - this.f30963f;
    }
}
