package z;

/* loaded from: classes.dex */
public final class g0 extends t {

    /* renamed from: e, reason: collision with root package name */
    public int f97772e;

    public g0(int i5) {
        this.f97834a = z0.f97875a;
        this.f97835b = u.f97839a;
        if (i5 >= 0) {
            c(z0.d(i5));
        } else {
            android.support.v4.media.session.b.k0("Capacity must be a positive value.");
            throw null;
        }
    }

    public final int b(int i5) {
        int i11 = this.f97836c;
        int i12 = i5 & i11;
        int i13 = 0;
        while (true) {
            long[] jArr = this.f97834a;
            int i14 = i12 >> 3;
            int i15 = (i12 & 7) << 3;
            long j11 = ((jArr[i14 + 1] << (64 - i15)) & ((-i15) >> 63)) | (jArr[i14] >>> i15);
            long j12 = j11 & ((~j11) << 7) & (-9187201950435737472L);
            if (j12 != 0) {
                return (i12 + (Long.numberOfTrailingZeros(j12) >> 3)) & i11;
            }
            i13 += 8;
            i12 = (i12 + i13) & i11;
        }
    }

    public final void c(int i5) {
        long[] jArr;
        int iMax = i5 > 0 ? Math.max(7, z0.c(i5)) : 0;
        this.f97836c = iMax;
        if (iMax == 0) {
            jArr = z0.f97875a;
        } else {
            jArr = new long[((iMax + 15) & (-8)) >> 3];
            u90.b.D(jArr, -9187201950435737472L);
        }
        this.f97834a = jArr;
        int i11 = iMax >> 3;
        long j11 = 255 << ((iMax & 7) << 3);
        jArr[i11] = (jArr[i11] & (~j11)) | j11;
        this.f97772e = z0.a(this.f97836c) - this.f97837d;
        this.f97835b = new long[iMax];
    }
}
