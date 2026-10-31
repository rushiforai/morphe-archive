package com.bytedance.sdk.openadsdk.tn;

/* loaded from: classes2.dex */
public final class jw {
    public static final jw ycx = new jw(285, 256, 0);

    /* renamed from: dj, reason: collision with root package name */
    private final jc f27047dj;

    /* renamed from: lt, reason: collision with root package name */
    private final int f27048lt;
    private final int lud;
    private final int[] sya;

    /* renamed from: zb, reason: collision with root package name */
    private final int[] f27049zb;

    public jw(int i5, int i11, int i12) {
        this.lud = i11;
        this.f27048lt = i12;
        this.f27049zb = new int[i11];
        this.sya = new int[i11];
        int i13 = 1;
        for (int i14 = 0; i14 < i11; i14++) {
            this.f27049zb[i14] = i13;
            i13 *= 2;
            if (i13 >= i11) {
                i13 = (i13 ^ i5) & (i11 - 1);
            }
        }
        for (int i15 = 0; i15 < i11 - 1; i15++) {
            this.sya[this.f27049zb[i15]] = i15;
        }
        this.f27047dj = new jc(this, new int[]{0});
    }

    public static int zb(int i5, int i11) {
        return i5 ^ i11;
    }

    public int sya(int i5, int i11) {
        if (i5 == 0 || i11 == 0) {
            return 0;
        }
        int[] iArr = this.f27049zb;
        int[] iArr2 = this.sya;
        return iArr[(iArr2[i5] + iArr2[i11]) % (this.lud - 1)];
    }

    public jc ycx() {
        return this.f27047dj;
    }

    public jc ycx(int i5, int i11) {
        if (i5 < 0) {
            throw new IllegalArgumentException();
        }
        if (i11 == 0) {
            return this.f27047dj;
        }
        int[] iArr = new int[i5 + 1];
        iArr[0] = i11;
        return new jc(this, iArr);
    }

    public int zb(int i5) {
        if (i5 != 0) {
            return this.f27049zb[(this.lud - this.sya[i5]) - 1];
        }
        throw new ArithmeticException();
    }

    public int zb() {
        return this.f27048lt;
    }

    public int ycx(int i5) {
        return this.f27049zb[i5];
    }
}
