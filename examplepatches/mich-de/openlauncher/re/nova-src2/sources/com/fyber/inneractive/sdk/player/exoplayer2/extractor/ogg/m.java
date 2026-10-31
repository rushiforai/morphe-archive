package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg;

/* loaded from: classes3.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final byte[] f29718a;

    /* renamed from: b, reason: collision with root package name */
    public final int f29719b;

    /* renamed from: c, reason: collision with root package name */
    public int f29720c;

    /* renamed from: d, reason: collision with root package name */
    public int f29721d;

    public m(byte[] bArr) {
        this.f29718a = bArr;
        this.f29719b = bArr.length;
    }

    public final boolean a() {
        boolean z11 = (((this.f29718a[this.f29720c] & 255) >> this.f29721d) & 1) == 1;
        b(1);
        return z11;
    }

    public final void b(int i5) {
        int i11 = i5 / 8;
        int i12 = this.f29720c + i11;
        this.f29720c = i12;
        int i13 = (i5 - (i11 * 8)) + this.f29721d;
        this.f29721d = i13;
        if (i13 > 7) {
            this.f29720c = i12 + 1;
            this.f29721d = i13 - 8;
        }
        int i14 = this.f29720c;
        if (i14 >= 0) {
            int i15 = this.f29719b;
            if (i14 < i15) {
                return;
            }
            if (i14 == i15 && this.f29721d == 0) {
                return;
            }
        }
        throw new IllegalStateException();
    }

    public final int a(int i5) {
        int i11 = this.f29720c;
        int iMin = Math.min(i5, 8 - this.f29721d);
        int i12 = i11 + 1;
        int i13 = ((this.f29718a[i11] & 255) >> this.f29721d) & (255 >> (8 - iMin));
        while (iMin < i5) {
            i13 |= (this.f29718a[i12] & 255) << iMin;
            iMin += 8;
            i12++;
        }
        int i14 = i13 & ((-1) >>> (32 - i5));
        b(i5);
        return i14;
    }
}
