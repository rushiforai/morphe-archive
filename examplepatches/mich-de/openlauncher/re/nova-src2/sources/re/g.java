package re;

import ke.r;
import ke.t;
import wf.v;

/* loaded from: classes3.dex */
public final class g implements f {

    /* renamed from: a, reason: collision with root package name */
    public final long[] f85833a;

    /* renamed from: b, reason: collision with root package name */
    public final long[] f85834b;

    /* renamed from: c, reason: collision with root package name */
    public final long f85835c;

    /* renamed from: d, reason: collision with root package name */
    public final long f85836d;

    public g(long[] jArr, long[] jArr2, long j11, long j12) {
        this.f85833a = jArr;
        this.f85834b = jArr2;
        this.f85835c = j11;
        this.f85836d = j12;
    }

    @Override // ke.s
    public final r d(long j11) {
        long[] jArr = this.f85833a;
        int iE = v.e(jArr, j11, true);
        long j12 = jArr[iE];
        long[] jArr2 = this.f85834b;
        t tVar = new t(j12, jArr2[iE]);
        if (j12 >= j11 || iE == jArr.length - 1) {
            return new r(tVar, tVar);
        }
        int i5 = iE + 1;
        return new r(tVar, new t(jArr[i5], jArr2[i5]));
    }

    @Override // re.f
    public final long e() {
        return this.f85836d;
    }

    @Override // ke.s
    public final boolean f() {
        return true;
    }

    @Override // re.f
    public final long h(long j11) {
        return this.f85833a[v.e(this.f85834b, j11, true)];
    }

    @Override // ke.s
    public final long i() {
        return this.f85835c;
    }
}
