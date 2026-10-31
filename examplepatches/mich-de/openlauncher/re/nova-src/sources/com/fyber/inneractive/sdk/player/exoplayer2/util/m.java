package com.fyber.inneractive.sdk.player.exoplayer2.util;

/* loaded from: classes3.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final byte[] f30457a;

    /* renamed from: b, reason: collision with root package name */
    public int f30458b;

    /* renamed from: c, reason: collision with root package name */
    public int f30459c;

    /* renamed from: d, reason: collision with root package name */
    public final int f30460d;

    public m(byte[] bArr) {
        int length = bArr.length;
        this.f30457a = bArr;
        this.f30460d = length;
    }

    public final int a(int i5) {
        int i11;
        this.f30459c += i5;
        int i12 = 0;
        while (true) {
            i11 = this.f30459c;
            if (i11 <= 8) {
                break;
            }
            int i13 = i11 - 8;
            this.f30459c = i13;
            byte[] bArr = this.f30457a;
            int i14 = this.f30458b;
            this.f30458b = i14 + 1;
            i12 |= (bArr[i14] & 255) << i13;
        }
        byte[] bArr2 = this.f30457a;
        int i15 = this.f30458b;
        int i16 = ((-1) >>> (32 - i5)) & (i12 | ((bArr2[i15] & 255) >> (8 - i11)));
        if (i11 == 8) {
            this.f30459c = 0;
            this.f30458b = i15 + 1;
        }
        a();
        return i16;
    }

    public final void b(int i5) {
        int i11 = i5 / 8;
        this.f30458b = i11;
        this.f30459c = i5 - (i11 * 8);
        a();
    }

    public final void c(int i5) {
        int i11 = i5 / 8;
        int i12 = this.f30458b + i11;
        this.f30458b = i12;
        int i13 = (i5 - (i11 * 8)) + this.f30459c;
        this.f30459c = i13;
        if (i13 > 7) {
            this.f30458b = i12 + 1;
            this.f30459c = i13 - 8;
        }
        a();
    }

    public final boolean b() {
        byte[] bArr = this.f30457a;
        int i5 = this.f30458b;
        byte b11 = bArr[i5];
        int i11 = this.f30459c;
        boolean z11 = (b11 & (128 >> i11)) != 0;
        int i12 = i11 + 1;
        this.f30459c = i12;
        if (i12 == 8) {
            this.f30459c = 0;
            this.f30458b = i5 + 1;
        }
        a();
        return z11;
    }

    public final void a() {
        int i5 = this.f30458b;
        if (i5 >= 0) {
            int i11 = this.f30460d;
            if (i5 < i11) {
                return;
            }
            if (i5 == i11 && this.f30459c == 0) {
                return;
            }
        }
        throw new IllegalStateException();
    }
}
