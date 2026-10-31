package ads_mobile_sdk;

import b.k9;
import b.x8;
import java.io.IOException;
import java.io.OutputStream;

/* loaded from: classes2.dex */
public final class xu extends yu {

    /* renamed from: b, reason: collision with root package name */
    public final byte[] f11830b;

    /* renamed from: c, reason: collision with root package name */
    public final int f11831c;

    /* renamed from: d, reason: collision with root package name */
    public int f11832d;

    /* renamed from: e, reason: collision with root package name */
    public final OutputStream f11833e;

    public xu(OutputStream outputStream, int i5) {
        if (outputStream == null) {
            throw new NullPointerException("out");
        }
        this.f11833e = outputStream;
        if (i5 < 0) {
            throw new IllegalArgumentException("bufferSize must be >= 0");
        }
        int iMax = Math.max(i5, 20);
        this.f11830b = new byte[iMax];
        this.f11831c = iMax;
    }

    @Override // ads_mobile_sdk.yu
    public final void a(byte b11) throws IOException {
        int i5 = this.f11832d;
        int i11 = this.f11831c;
        byte[] bArr = this.f11830b;
        if (i5 == i11) {
            this.f11833e.write(bArr, 0, i5);
            this.f11832d = 0;
        }
        int i12 = this.f11832d;
        bArr[i12] = b11;
        this.f11832d = i12 + 1;
    }

    public final void b(byte[] bArr, int i5, int i11) throws IOException {
        int i12 = this.f11832d;
        int i13 = this.f11831c;
        int i14 = i13 - i12;
        byte[] bArr2 = this.f11830b;
        if (i14 >= i11) {
            System.arraycopy(bArr, i5, bArr2, i12, i11);
            this.f11832d += i11;
            return;
        }
        System.arraycopy(bArr, i5, bArr2, i12, i14);
        int i15 = i5 + i14;
        int i16 = i11 - i14;
        this.f11832d = i13;
        OutputStream outputStream = this.f11833e;
        outputStream.write(bArr2, 0, i13);
        this.f11832d = 0;
        if (i16 > i13) {
            outputStream.write(bArr, i15, i16);
        } else {
            System.arraycopy(bArr, i15, bArr2, 0, i16);
            this.f11832d = i16;
        }
    }

    @Override // ads_mobile_sdk.yu
    public final void c(long j11) throws IOException {
        p(8);
        e(j11);
    }

    @Override // ads_mobile_sdk.yu
    public final void d(int i5, long j11) throws IOException {
        p(18);
        i(i5, 1);
        e(j11);
    }

    public final void e(long j11) {
        int i5 = this.f11832d;
        byte[] bArr = this.f11830b;
        bArr[i5] = (byte) j11;
        bArr[i5 + 1] = (byte) (j11 >> 8);
        bArr[i5 + 2] = (byte) (j11 >> 16);
        bArr[i5 + 3] = (byte) (j11 >> 24);
        bArr[i5 + 4] = (byte) (j11 >> 32);
        bArr[i5 + 5] = (byte) (j11 >> 40);
        bArr[i5 + 6] = (byte) (j11 >> 48);
        bArr[i5 + 7] = (byte) (j11 >> 56);
        this.f11832d = i5 + 8;
    }

    public final void f(long j11) {
        int i5 = this.f11832d;
        long j12 = j11 & (-128);
        byte[] bArr = this.f11830b;
        if (j12 == 0) {
            bArr[i5] = (byte) j11;
            this.f11832d = i5 + 1;
            return;
        }
        bArr[i5] = (byte) (((int) j11) | 128);
        long j13 = j11 >>> 7;
        if ((j13 & (-128)) == 0) {
            bArr[i5 + 1] = (byte) j13;
            this.f11832d = i5 + 2;
            return;
        }
        bArr[i5 + 1] = (byte) (((int) j13) | 128);
        long j14 = j11 >>> 14;
        if ((j14 & (-128)) == 0) {
            bArr[i5 + 2] = (byte) j14;
            this.f11832d = i5 + 3;
            return;
        }
        bArr[i5 + 2] = (byte) (((int) j14) | 128);
        long j15 = j11 >>> 21;
        if ((j15 & (-128)) == 0) {
            bArr[i5 + 3] = (byte) j15;
            this.f11832d = i5 + 4;
            return;
        }
        bArr[i5 + 3] = (byte) (((int) j15) | 128);
        long j16 = j11 >>> 28;
        if ((j16 & (-128)) == 0) {
            bArr[i5 + 4] = (byte) j16;
            this.f11832d = i5 + 5;
            return;
        }
        bArr[i5 + 4] = (byte) (((int) j16) | 128);
        long j17 = j11 >>> 35;
        if ((j17 & (-128)) == 0) {
            bArr[i5 + 5] = (byte) j17;
            this.f11832d = i5 + 6;
            return;
        }
        bArr[i5 + 5] = (byte) (((int) j17) | 128);
        long j18 = j11 >>> 42;
        if ((j18 & (-128)) == 0) {
            bArr[i5 + 6] = (byte) j18;
            this.f11832d = i5 + 7;
            return;
        }
        bArr[i5 + 6] = (byte) (((int) j18) | 128);
        long j19 = j11 >>> 49;
        if ((j19 & (-128)) == 0) {
            bArr[i5 + 7] = (byte) j19;
            this.f11832d = i5 + 8;
            return;
        }
        bArr[i5 + 7] = (byte) (((int) j19) | 128);
        long j21 = j11 >>> 56;
        if (((-128) & j21) == 0) {
            bArr[i5 + 8] = (byte) j21;
            this.f11832d = i5 + 9;
        } else {
            bArr[i5 + 8] = (byte) (((int) j21) | 128);
            bArr[i5 + 9] = (byte) (j11 >>> 63);
            this.f11832d = i5 + 10;
        }
    }

    @Override // ads_mobile_sdk.yu
    public final void g(int i5, int i11) throws IOException {
        p(5);
        o((i5 << 3) | i11);
    }

    @Override // ads_mobile_sdk.yu
    public final void h(int i5, int i11) throws IOException {
        p(20);
        i(i5, 0);
        o(i11);
    }

    public final void i(int i5, int i11) {
        o((i5 << 3) | i11);
    }

    @Override // ads_mobile_sdk.yu
    public final void k(int i5) throws IOException {
        p(4);
        n(i5);
    }

    @Override // ads_mobile_sdk.yu
    public final void l(int i5) throws IOException {
        if (i5 >= 0) {
            p(5);
            o(i5);
        } else {
            p(10);
            f(i5);
        }
    }

    @Override // ads_mobile_sdk.yu
    public final void m(int i5) throws IOException {
        p(5);
        o(i5);
    }

    public final void n(int i5) {
        int i11 = this.f11832d;
        byte[] bArr = this.f11830b;
        bArr[i11] = (byte) i5;
        bArr[i11 + 1] = (byte) (i5 >> 8);
        bArr[i11 + 2] = (byte) (i5 >> 16);
        bArr[i11 + 3] = (byte) (i5 >> 24);
        this.f11832d = i11 + 4;
    }

    public final void o(int i5) {
        int i11 = this.f11832d;
        int i12 = i5 & (-128);
        byte[] bArr = this.f11830b;
        if (i12 == 0) {
            bArr[i11] = (byte) i5;
            this.f11832d = i11 + 1;
            return;
        }
        bArr[i11] = (byte) (i5 | 128);
        int i13 = i5 >>> 7;
        if ((i13 & (-128)) == 0) {
            bArr[i11 + 1] = (byte) i13;
            this.f11832d = i11 + 2;
            return;
        }
        bArr[i11 + 1] = (byte) (i13 | 128);
        int i14 = i5 >>> 14;
        if ((i14 & (-128)) == 0) {
            bArr[i11 + 2] = (byte) i14;
            this.f11832d = i11 + 3;
            return;
        }
        bArr[i11 + 2] = (byte) (i14 | 128);
        int i15 = i5 >>> 21;
        if ((i15 & (-128)) == 0) {
            bArr[i11 + 3] = (byte) i15;
            this.f11832d = i11 + 4;
        } else {
            bArr[i11 + 3] = (byte) (i15 | 128);
            bArr[i11 + 4] = (byte) (i5 >>> 28);
            this.f11832d = i11 + 5;
        }
    }

    public final void p(int i5) throws IOException {
        int i11 = this.f11832d;
        if (this.f11831c - i11 < i5) {
            this.f11833e.write(this.f11830b, 0, i11);
            this.f11832d = 0;
        }
    }

    @Override // ads_mobile_sdk.yu
    public final void d(long j11) throws IOException {
        p(10);
        f(j11);
    }

    @Override // ads_mobile_sdk.yu
    public final void a(int i5, boolean z11) throws IOException {
        p(11);
        i(i5, 0);
        byte b11 = z11 ? (byte) 1 : (byte) 0;
        int i11 = this.f11832d;
        this.f11830b[i11] = b11;
        this.f11832d = i11 + 1;
    }

    @Override // ads_mobile_sdk.yu
    public final void b(int i5, sq sqVar) throws IOException {
        g(i5, 2);
        b(sqVar);
    }

    @Override // ads_mobile_sdk.yu
    public final void e(int i5, int i11) throws IOException {
        p(14);
        i(i5, 5);
        n(i11);
    }

    @Override // ads_mobile_sdk.yu
    public final void a(int i5, byte[] bArr) throws IOException {
        p(5);
        o(i5);
        b(bArr, 0, i5);
    }

    @Override // ads_mobile_sdk.yu
    public final void b(sq sqVar) throws IOException {
        int size = sqVar.size();
        p(5);
        o(size);
        sqVar.a(this);
    }

    @Override // ads_mobile_sdk.yu
    public final void e(int i5, long j11) throws IOException {
        p(20);
        i(i5, 0);
        f(j11);
    }

    @Override // b.t2
    public final void a(byte[] bArr, int i5, int i11) throws IOException {
        b(bArr, i5, i11);
    }

    @Override // ads_mobile_sdk.yu
    public final void a(String str) throws IOException {
        int length = str.length() * 3;
        int i5 = yu.i(length);
        int i11 = i5 + length;
        int i12 = this.f11831c;
        if (i11 > i12) {
            byte[] bArr = new byte[length];
            int iA = vn3.f10832a.a(str, bArr, 0, length);
            p(5);
            o(iA);
            b(bArr, 0, iA);
            return;
        }
        int i13 = this.f11832d;
        int i14 = i12 - i13;
        byte[] bArr2 = this.f11830b;
        if (i11 > i14) {
            this.f11833e.write(bArr2, 0, i13);
            this.f11832d = 0;
        }
        int i15 = yu.i(str.length());
        int i16 = this.f11832d;
        try {
            if (i15 == i5) {
                int i17 = i16 + i15;
                this.f11832d = i17;
                int iA2 = vn3.f10832a.a(str, bArr2, i17, i12 - i17);
                this.f11832d = i16;
                o((iA2 - i16) - i15);
                this.f11832d = iA2;
                return;
            }
            k9 k9Var = vn3.f10832a;
            int iA3 = k9Var.a(str);
            o(iA3);
            this.f11832d = k9Var.a(str, bArr2, this.f11832d, iA3);
        } catch (ArrayIndexOutOfBoundsException e3) {
            throw new wu(e3);
        }
    }

    @Override // ads_mobile_sdk.yu
    public final void b(g gVar) throws IOException {
        cu0 cu0Var = (cu0) gVar;
        int iA = cu0Var.a((x8) null);
        p(5);
        o(iA);
        cu0Var.a(this);
    }

    @Override // ads_mobile_sdk.yu
    public final void b(String str, int i5) throws IOException {
        g(i5, 2);
        a(str);
    }

    @Override // ads_mobile_sdk.yu
    public final int b() {
        throw new UnsupportedOperationException("spaceLeft() can only be called on CodedOutputStreams that are writing to a flat array or ByteBuffer.");
    }

    @Override // ads_mobile_sdk.yu
    public final void f(int i5, int i11) throws IOException {
        p(20);
        i(i5, 0);
        if (i11 >= 0) {
            o(i11);
        } else {
            f(i11);
        }
    }
}
