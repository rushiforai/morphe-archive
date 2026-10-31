package ke;

/* loaded from: classes3.dex */
public final class q implements s {

    /* renamed from: a, reason: collision with root package name */
    public final long[] f71426a;

    /* renamed from: b, reason: collision with root package name */
    public final long[] f71427b;

    /* renamed from: c, reason: collision with root package name */
    public final long f71428c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f71429d;

    public q(long[] jArr, long[] jArr2, long j11) {
        wf.a.e(jArr.length == jArr2.length);
        int length = jArr2.length;
        boolean z11 = length > 0;
        this.f71429d = z11;
        if (!z11 || jArr2[0] <= 0) {
            this.f71426a = jArr;
            this.f71427b = jArr2;
        } else {
            int i5 = length + 1;
            long[] jArr3 = new long[i5];
            this.f71426a = jArr3;
            long[] jArr4 = new long[i5];
            this.f71427b = jArr4;
            System.arraycopy(jArr, 0, jArr3, 1, length);
            System.arraycopy(jArr2, 0, jArr4, 1, length);
        }
        this.f71428c = j11;
    }

    @Override // ke.s
    public final r d(long j11) {
        if (!this.f71429d) {
            t tVar = t.f71432c;
            return new r(tVar, tVar);
        }
        long[] jArr = this.f71427b;
        int iE = wf.v.e(jArr, j11, true);
        long j12 = jArr[iE];
        long[] jArr2 = this.f71426a;
        t tVar2 = new t(j12, jArr2[iE]);
        if (j12 == j11 || iE == jArr.length - 1) {
            return new r(tVar2, tVar2);
        }
        int i5 = iE + 1;
        return new r(tVar2, new t(jArr[i5], jArr2[i5]));
    }

    @Override // ke.s
    public final boolean f() {
        return this.f71429d;
    }

    @Override // ke.s
    public final long i() {
        return this.f71428c;
    }
}
