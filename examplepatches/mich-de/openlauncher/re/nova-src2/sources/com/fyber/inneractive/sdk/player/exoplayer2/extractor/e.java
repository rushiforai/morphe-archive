package com.fyber.inneractive.sdk.player.exoplayer2.extractor;

/* loaded from: classes3.dex */
public final class e {

    /* renamed from: i, reason: collision with root package name */
    public int f29150i;

    /* renamed from: j, reason: collision with root package name */
    public int f29151j;

    /* renamed from: k, reason: collision with root package name */
    public int f29152k;

    /* renamed from: l, reason: collision with root package name */
    public int f29153l;

    /* renamed from: q, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.o f29156q;

    /* renamed from: r, reason: collision with root package name */
    public int f29157r;

    /* renamed from: a, reason: collision with root package name */
    public int f29142a = 1000;

    /* renamed from: b, reason: collision with root package name */
    public int[] f29143b = new int[1000];

    /* renamed from: c, reason: collision with root package name */
    public long[] f29144c = new long[1000];

    /* renamed from: f, reason: collision with root package name */
    public long[] f29147f = new long[1000];

    /* renamed from: e, reason: collision with root package name */
    public int[] f29146e = new int[1000];

    /* renamed from: d, reason: collision with root package name */
    public int[] f29145d = new int[1000];

    /* renamed from: g, reason: collision with root package name */
    public byte[][] f29148g = new byte[1000][];

    /* renamed from: h, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.o[] f29149h = new com.fyber.inneractive.sdk.player.exoplayer2.o[1000];

    /* renamed from: m, reason: collision with root package name */
    public long f29154m = Long.MIN_VALUE;
    public long n = Long.MIN_VALUE;

    /* renamed from: p, reason: collision with root package name */
    public boolean f29155p = true;
    public boolean o = true;

    public final synchronized void a(long j11, int i5, long j12, int i11, byte[] bArr) {
        try {
            if (this.o) {
                if ((i5 & 1) == 0) {
                    return;
                } else {
                    this.o = false;
                }
            }
            if (this.f29155p) {
                throw new IllegalStateException();
            }
            b(j11);
            long[] jArr = this.f29147f;
            int i12 = this.f29153l;
            jArr[i12] = j11;
            long[] jArr2 = this.f29144c;
            jArr2[i12] = j12;
            this.f29145d[i12] = i11;
            this.f29146e[i12] = i5;
            this.f29148g[i12] = bArr;
            this.f29149h[i12] = this.f29156q;
            this.f29143b[i12] = this.f29157r;
            int i13 = this.f29150i + 1;
            this.f29150i = i13;
            int i14 = this.f29142a;
            if (i13 == i14) {
                int i15 = i14 + 1000;
                int[] iArr = new int[i15];
                long[] jArr3 = new long[i15];
                long[] jArr4 = new long[i15];
                int[] iArr2 = new int[i15];
                int[] iArr3 = new int[i15];
                byte[][] bArr2 = new byte[i15][];
                com.fyber.inneractive.sdk.player.exoplayer2.o[] oVarArr = new com.fyber.inneractive.sdk.player.exoplayer2.o[i15];
                int i16 = this.f29152k;
                int i17 = i14 - i16;
                System.arraycopy(jArr2, i16, jArr3, 0, i17);
                System.arraycopy(this.f29147f, this.f29152k, jArr4, 0, i17);
                System.arraycopy(this.f29146e, this.f29152k, iArr2, 0, i17);
                System.arraycopy(this.f29145d, this.f29152k, iArr3, 0, i17);
                System.arraycopy(this.f29148g, this.f29152k, bArr2, 0, i17);
                System.arraycopy(this.f29149h, this.f29152k, oVarArr, 0, i17);
                System.arraycopy(this.f29143b, this.f29152k, iArr, 0, i17);
                int i18 = this.f29152k;
                System.arraycopy(this.f29144c, 0, jArr3, i17, i18);
                System.arraycopy(this.f29147f, 0, jArr4, i17, i18);
                System.arraycopy(this.f29146e, 0, iArr2, i17, i18);
                System.arraycopy(this.f29145d, 0, iArr3, i17, i18);
                System.arraycopy(this.f29148g, 0, bArr2, i17, i18);
                System.arraycopy(this.f29149h, 0, oVarArr, i17, i18);
                System.arraycopy(this.f29143b, 0, iArr, i17, i18);
                this.f29144c = jArr3;
                this.f29147f = jArr4;
                this.f29146e = iArr2;
                this.f29145d = iArr3;
                this.f29148g = bArr2;
                this.f29149h = oVarArr;
                this.f29143b = iArr;
                this.f29152k = 0;
                int i19 = this.f29142a;
                this.f29153l = i19;
                this.f29150i = i19;
                this.f29142a = i15;
            } else {
                int i21 = i12 + 1;
                this.f29153l = i21;
                if (i21 == i14) {
                    this.f29153l = 0;
                }
            }
        } catch (Throwable th2) {
            throw th2;
        }
    }

    public final synchronized void b(long j11) {
        this.n = Math.max(this.n, j11);
    }

    public final synchronized boolean a(long j11) {
        try {
            if (this.f29154m >= j11) {
                return false;
            }
            int i5 = this.f29150i;
            while (i5 > 0 && this.f29147f[((this.f29152k + i5) - 1) % this.f29142a] >= j11) {
                i5--;
            }
            int i11 = this.f29151j;
            int i12 = this.f29150i;
            int i13 = (i11 + i12) - (i5 + i11);
            if (i13 < 0 || i13 > i12) {
                throw new IllegalArgumentException();
            }
            if (i13 != 0) {
                int i14 = i12 - i13;
                this.f29150i = i14;
                int i15 = this.f29153l;
                int i16 = this.f29142a;
                this.f29153l = ((i15 + i16) - i13) % i16;
                this.n = Long.MIN_VALUE;
                for (int i17 = i14 - 1; i17 >= 0; i17--) {
                    int i18 = (this.f29152k + i17) % this.f29142a;
                    this.n = Math.max(this.n, this.f29147f[i18]);
                    if ((this.f29146e[i18] & 1) != 0) {
                        break;
                    }
                }
                long j12 = this.f29144c[this.f29153l];
            } else if (i11 != 0) {
                int i19 = this.f29153l;
                if (i19 == 0) {
                    i19 = this.f29142a;
                }
                int i21 = i19 - 1;
                long j13 = this.f29144c[i21];
                int i22 = this.f29145d[i21];
            }
            return true;
        } finally {
        }
    }
}
