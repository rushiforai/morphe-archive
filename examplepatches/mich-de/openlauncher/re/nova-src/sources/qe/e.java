package qe;

import ke.k;

/* loaded from: classes3.dex */
public final class e {

    /* renamed from: d, reason: collision with root package name */
    public static final long[] f83987d = {128, 64, 32, 16, 8, 4, 2, 1};

    /* renamed from: a, reason: collision with root package name */
    public final byte[] f83988a = new byte[8];

    /* renamed from: b, reason: collision with root package name */
    public int f83989b;

    /* renamed from: c, reason: collision with root package name */
    public int f83990c;

    public static long a(byte[] bArr, int i5, boolean z11) {
        long j11 = bArr[0] & 255;
        if (z11) {
            j11 &= ~f83987d[i5 - 1];
        }
        for (int i11 = 1; i11 < i5; i11++) {
            j11 = (j11 << 8) | (bArr[i11] & 255);
        }
        return j11;
    }

    public final long b(k kVar, boolean z11, boolean z12, int i5) {
        int i11;
        int i12 = this.f83989b;
        byte[] bArr = this.f83988a;
        if (i12 == 0) {
            if (!kVar.f(bArr, 0, 1, z11)) {
                return -1L;
            }
            int i13 = bArr[0] & 255;
            int i14 = 0;
            while (true) {
                if (i14 >= 8) {
                    i11 = -1;
                    break;
                }
                if ((f83987d[i14] & i13) != 0) {
                    i11 = i14 + 1;
                    break;
                }
                i14++;
            }
            this.f83990c = i11;
            if (i11 == -1) {
                throw new IllegalStateException("No valid varint length mask found");
            }
            this.f83989b = 1;
        }
        int i15 = this.f83990c;
        if (i15 > i5) {
            this.f83989b = 0;
            return -2L;
        }
        if (i15 != 1) {
            kVar.readFully(bArr, 1, i15 - 1);
        }
        this.f83989b = 0;
        return a(bArr, this.f83990c, z12);
    }
}
