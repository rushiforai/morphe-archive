package com.fyber.inneractive.sdk.player.exoplayer2.util;

import b.u4;
import java.nio.charset.Charset;

/* loaded from: classes3.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public byte[] f30461a;

    /* renamed from: b, reason: collision with root package name */
    public int f30462b;

    /* renamed from: c, reason: collision with root package name */
    public int f30463c;

    public n() {
    }

    public final int a() {
        byte[] bArr = this.f30461a;
        if (bArr == null) {
            return 0;
        }
        return bArr.length;
    }

    public final int b() {
        byte[] bArr = this.f30461a;
        int i5 = this.f30462b;
        int i11 = i5 + 1;
        this.f30462b = i11;
        int i12 = (bArr[i5] & 255) << 24;
        int i13 = i5 + 2;
        this.f30462b = i13;
        int i14 = ((bArr[i11] & 255) << 16) | i12;
        int i15 = i5 + 3;
        this.f30462b = i15;
        int i16 = i14 | ((bArr[i13] & 255) << 8);
        this.f30462b = i5 + 4;
        return (bArr[i15] & 255) | i16;
    }

    public final void c(int i5) {
        this.f30461a = a() < i5 ? new byte[i5] : this.f30461a;
        this.f30463c = i5;
        this.f30462b = 0;
    }

    public final void d(int i5) {
        if (i5 < 0 || i5 > this.f30461a.length) {
            throw new IllegalArgumentException();
        }
        this.f30463c = i5;
    }

    public final void e(int i5) {
        if (i5 < 0 || i5 > this.f30463c) {
            throw new IllegalArgumentException();
        }
        this.f30462b = i5;
    }

    public final int f() {
        byte[] bArr = this.f30461a;
        int i5 = this.f30462b;
        int i11 = i5 + 1;
        this.f30462b = i11;
        int i12 = bArr[i5] & 255;
        this.f30462b = i5 + 2;
        return ((bArr[i11] & 255) << 8) | i12;
    }

    public final long g() {
        byte[] bArr = this.f30461a;
        int i5 = this.f30462b;
        this.f30462b = i5 + 1;
        this.f30462b = i5 + 2;
        this.f30462b = i5 + 3;
        long j11 = ((bArr[i5] & 255) << 56) | ((bArr[r2] & 255) << 48) | ((bArr[r7] & 255) << 40);
        this.f30462b = i5 + 4;
        long j12 = j11 | ((bArr[r4] & 255) << 32);
        this.f30462b = i5 + 5;
        long j13 = j12 | ((bArr[r7] & 255) << 24);
        this.f30462b = i5 + 6;
        long j14 = j13 | ((bArr[r4] & 255) << 16);
        this.f30462b = i5 + 7;
        long j15 = j14 | ((bArr[r7] & 255) << 8);
        this.f30462b = i5 + 8;
        return (bArr[r4] & 255) | j15;
    }

    public final void h() {
        int i5 = this.f30463c;
        int i11 = this.f30462b;
        if (i5 - i11 == 0) {
            return;
        }
        while (i11 < this.f30463c && this.f30461a[i11] != 0) {
            i11++;
        }
        byte[] bArr = this.f30461a;
        int i12 = this.f30462b;
        new String(bArr, i12, i11 - i12);
        this.f30462b = i11;
        if (i11 < this.f30463c) {
            this.f30462b = i11 + 1;
        }
    }

    public final int i() {
        return (j() << 21) | (j() << 14) | (j() << 7) | j();
    }

    public final int j() {
        byte[] bArr = this.f30461a;
        int i5 = this.f30462b;
        this.f30462b = i5 + 1;
        return bArr[i5] & 255;
    }

    public final long k() {
        byte[] bArr = this.f30461a;
        int i5 = this.f30462b;
        this.f30462b = i5 + 1;
        this.f30462b = i5 + 2;
        this.f30462b = i5 + 3;
        long j11 = ((bArr[i5] & 255) << 24) | ((bArr[r2] & 255) << 16) | ((bArr[r7] & 255) << 8);
        this.f30462b = i5 + 4;
        return (bArr[r4] & 255) | j11;
    }

    public final int l() {
        byte[] bArr = this.f30461a;
        int i5 = this.f30462b;
        int i11 = i5 + 1;
        this.f30462b = i11;
        int i12 = (bArr[i5] & 255) << 16;
        int i13 = i5 + 2;
        this.f30462b = i13;
        int i14 = ((bArr[i11] & 255) << 8) | i12;
        this.f30462b = i5 + 3;
        return (bArr[i13] & 255) | i14;
    }

    public final int m() {
        int iB = b();
        if (iB >= 0) {
            return iB;
        }
        throw new IllegalStateException(com.fyber.inneractive.sdk.player.exoplayer2.m.a("Top bit not zero: ", iB));
    }

    public final long n() {
        long jG = g();
        if (jG >= 0) {
            return jG;
        }
        throw new IllegalStateException(u4.g(jG, "Top bit not zero: "));
    }

    public final int o() {
        byte[] bArr = this.f30461a;
        int i5 = this.f30462b;
        int i11 = i5 + 1;
        this.f30462b = i11;
        int i12 = (bArr[i5] & 255) << 8;
        this.f30462b = i5 + 2;
        return (bArr[i11] & 255) | i12;
    }

    public n(int i5) {
        this.f30461a = new byte[i5];
        this.f30463c = i5;
    }

    public final void a(byte[] bArr, int i5, int i11) {
        System.arraycopy(this.f30461a, this.f30462b, bArr, i5, i11);
        this.f30462b += i11;
    }

    public final String b(int i5) {
        String str = new String(this.f30461a, this.f30462b, i5, Charset.defaultCharset());
        this.f30462b += i5;
        return str;
    }

    public final String a(int i5) {
        if (i5 == 0) {
            return com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        }
        int i11 = this.f30462b;
        int i12 = (i11 + i5) - 1;
        String str = new String(this.f30461a, i11, (i12 >= this.f30463c || this.f30461a[i12] != 0) ? i5 : i5 - 1);
        this.f30462b += i5;
        return str;
    }

    public final int d() {
        byte[] bArr = this.f30461a;
        int i5 = this.f30462b;
        int i11 = i5 + 1;
        this.f30462b = i11;
        int i12 = bArr[i5] & 255;
        int i13 = i5 + 2;
        this.f30462b = i13;
        int i14 = ((bArr[i11] & 255) << 8) | i12;
        int i15 = i5 + 3;
        this.f30462b = i15;
        int i16 = i14 | ((bArr[i13] & 255) << 16);
        this.f30462b = i5 + 4;
        return ((bArr[i15] & 255) << 24) | i16;
    }

    public final long e() {
        byte[] bArr = this.f30461a;
        int i5 = this.f30462b;
        this.f30462b = i5 + 1;
        this.f30462b = i5 + 2;
        this.f30462b = i5 + 3;
        long j11 = (bArr[i5] & 255) | ((bArr[r2] & 255) << 8) | ((bArr[r7] & 255) << 16);
        this.f30462b = i5 + 4;
        return ((bArr[r4] & 255) << 24) | j11;
    }

    public n(byte[] bArr) {
        this.f30461a = bArr;
        this.f30463c = bArr.length;
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0060  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final String c() {
        int i5 = this.f30463c;
        int i11 = this.f30462b;
        if (i5 - i11 == 0) {
            return null;
        }
        while (i11 < this.f30463c) {
            byte b11 = this.f30461a[i11];
            int i12 = z.f30489a;
            if (b11 == 10 || b11 == 13) {
                break;
            }
            i11++;
        }
        int i13 = this.f30462b;
        if (i11 - i13 >= 3) {
            byte[] bArr = this.f30461a;
            if (bArr[i13] == -17 && bArr[i13 + 1] == -69 && bArr[i13 + 2] == -65) {
                this.f30462b = i13 + 3;
            }
        }
        byte[] bArr2 = this.f30461a;
        int i14 = this.f30462b;
        String str = new String(bArr2, i14, i11 - i14);
        this.f30462b = i11;
        int i15 = this.f30463c;
        if (i11 != i15) {
            byte[] bArr3 = this.f30461a;
            if (bArr3[i11] == 13) {
                int i16 = i11 + 1;
                this.f30462b = i16;
                if (i16 != i15) {
                    int i17 = this.f30462b;
                    if (bArr3[i17] == 10) {
                        this.f30462b = i17 + 1;
                    }
                }
            }
        }
        return str;
    }

    public n(int i5, byte[] bArr) {
        this.f30461a = bArr;
        this.f30463c = i5;
    }
}
