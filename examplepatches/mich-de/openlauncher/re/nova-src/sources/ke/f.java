package ke;

import java.util.Arrays;

/* loaded from: classes3.dex */
public final class f implements s {

    /* renamed from: a, reason: collision with root package name */
    public final int f71389a;

    /* renamed from: b, reason: collision with root package name */
    public final int[] f71390b;

    /* renamed from: c, reason: collision with root package name */
    public final long[] f71391c;

    /* renamed from: d, reason: collision with root package name */
    public final long[] f71392d;

    /* renamed from: e, reason: collision with root package name */
    public final long[] f71393e;

    /* renamed from: f, reason: collision with root package name */
    public final long f71394f;

    public f(int[] iArr, long[] jArr, long[] jArr2, long[] jArr3) {
        this.f71390b = iArr;
        this.f71391c = jArr;
        this.f71392d = jArr2;
        this.f71393e = jArr3;
        int length = iArr.length;
        this.f71389a = length;
        if (length > 0) {
            this.f71394f = jArr2[length - 1] + jArr3[length - 1];
        } else {
            this.f71394f = 0L;
        }
    }

    @Override // ke.s
    public final r d(long j11) {
        long[] jArr = this.f71393e;
        int iE = wf.v.e(jArr, j11, true);
        long j12 = jArr[iE];
        long[] jArr2 = this.f71391c;
        t tVar = new t(j12, jArr2[iE]);
        if (j12 >= j11 || iE == this.f71389a - 1) {
            return new r(tVar, tVar);
        }
        int i5 = iE + 1;
        return new r(tVar, new t(jArr[i5], jArr2[i5]));
    }

    @Override // ke.s
    public final boolean f() {
        return true;
    }

    @Override // ke.s
    public final long i() {
        return this.f71394f;
    }

    public final String toString() {
        return "ChunkIndex(length=" + this.f71389a + ", sizes=" + Arrays.toString(this.f71390b) + ", offsets=" + Arrays.toString(this.f71391c) + ", timeUs=" + Arrays.toString(this.f71393e) + ", durationsUs=" + Arrays.toString(this.f71392d) + ")";
    }
}
