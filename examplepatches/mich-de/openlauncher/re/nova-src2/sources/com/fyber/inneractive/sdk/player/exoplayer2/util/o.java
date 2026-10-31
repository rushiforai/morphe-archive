package com.fyber.inneractive.sdk.player.exoplayer2.util;

/* loaded from: classes3.dex */
public final class o {

    /* renamed from: a, reason: collision with root package name */
    public byte[] f30464a;

    /* renamed from: b, reason: collision with root package name */
    public int f30465b;

    /* renamed from: c, reason: collision with root package name */
    public int f30466c;

    /* renamed from: d, reason: collision with root package name */
    public int f30467d = 0;

    public o(byte[] bArr, int i5, int i11) {
        this.f30464a = bArr;
        this.f30466c = i5;
        this.f30465b = i11;
        a();
    }

    public final boolean a(int i5) {
        int i11 = this.f30466c;
        int i12 = i5 / 8;
        int i13 = i11 + i12;
        int i14 = (this.f30467d + i5) - (i12 * 8);
        if (i14 > 7) {
            i13++;
            i14 -= 8;
        }
        while (true) {
            int i15 = i11 + 1;
            if (i15 > i13 || i13 >= this.f30465b) {
                break;
            }
            if (c(i15)) {
                i13++;
                i11 += 3;
            } else {
                i11 = i15;
            }
        }
        int i16 = this.f30465b;
        if (i13 >= i16) {
            return i13 == i16 && i14 == 0;
        }
        return true;
    }

    public final int b(int i5) {
        int i11;
        this.f30467d += i5;
        int i12 = 0;
        while (true) {
            i11 = this.f30467d;
            if (i11 <= 8) {
                break;
            }
            int i13 = i11 - 8;
            this.f30467d = i13;
            byte[] bArr = this.f30464a;
            int i14 = this.f30466c;
            i12 |= (bArr[i14] & 255) << i13;
            if (!c(i14 + 1)) {
                i = 1;
            }
            this.f30466c = i14 + i;
        }
        byte[] bArr2 = this.f30464a;
        int i15 = this.f30466c;
        int i16 = ((-1) >>> (32 - i5)) & (i12 | ((bArr2[i15] & 255) >> (8 - i11)));
        if (i11 == 8) {
            this.f30467d = 0;
            this.f30466c = i15 + (c(i15 + 1) ? 2 : 1);
        }
        a();
        return i16;
    }

    public final boolean c() {
        boolean z11 = (this.f30464a[this.f30466c] & (128 >> this.f30467d)) != 0;
        f();
        return z11;
    }

    public final void d(int i5) {
        int i11 = this.f30466c;
        int i12 = i5 / 8;
        int i13 = i11 + i12;
        this.f30466c = i13;
        int i14 = (i5 - (i12 * 8)) + this.f30467d;
        this.f30467d = i14;
        if (i14 > 7) {
            this.f30466c = i13 + 1;
            this.f30467d = i14 - 8;
        }
        while (true) {
            int i15 = i11 + 1;
            if (i15 > this.f30466c) {
                a();
                return;
            } else if (c(i15)) {
                this.f30466c++;
                i11 += 3;
            } else {
                i11 = i15;
            }
        }
    }

    public final int e() {
        int iD = d();
        return ((iD + 1) / 2) * (iD % 2 == 0 ? -1 : 1);
    }

    public final void f() {
        int i5 = this.f30467d + 1;
        this.f30467d = i5;
        if (i5 == 8) {
            this.f30467d = 0;
            int i11 = this.f30466c;
            this.f30466c = i11 + (c(i11 + 1) ? 2 : 1);
        }
        a();
    }

    public final boolean c(int i5) {
        if (2 > i5 || i5 >= this.f30465b) {
            return false;
        }
        byte[] bArr = this.f30464a;
        return bArr[i5] == 3 && bArr[i5 + (-2)] == 0 && bArr[i5 - 1] == 0;
    }

    public final void a() {
        int i5 = this.f30466c;
        if (i5 >= 0) {
            int i11 = this.f30465b;
            if (i5 < i11) {
                return;
            }
            if (i5 == i11 && this.f30467d == 0) {
                return;
            }
        }
        throw new IllegalStateException();
    }

    public final boolean b() {
        int i5 = this.f30466c;
        int i11 = this.f30467d;
        int i12 = 0;
        while (this.f30466c < this.f30465b && !c()) {
            i12++;
        }
        boolean z11 = this.f30466c == this.f30465b;
        this.f30466c = i5;
        this.f30467d = i11;
        return !z11 && a((i12 * 2) + 1);
    }

    public final int d() {
        int i5 = 0;
        while (!c()) {
            i5++;
        }
        return ((1 << i5) - 1) + (i5 > 0 ? b(i5) : 0);
    }
}
