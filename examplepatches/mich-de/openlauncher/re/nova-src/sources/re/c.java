package re;

import android.util.Pair;
import ke.r;
import ke.t;
import wf.v;

/* loaded from: classes3.dex */
public final class c implements f {

    /* renamed from: a, reason: collision with root package name */
    public final long[] f85814a;

    /* renamed from: b, reason: collision with root package name */
    public final long[] f85815b;

    /* renamed from: c, reason: collision with root package name */
    public final long f85816c;

    public c(long[] jArr, long[] jArr2, long j11) {
        this.f85814a = jArr;
        this.f85815b = jArr2;
        this.f85816c = j11 == -9223372036854775807L ? v.y(jArr2[jArr2.length - 1]) : j11;
    }

    public static Pair a(long[] jArr, long[] jArr2, long j11) {
        int iE = v.e(jArr, j11, true);
        long j12 = jArr[iE];
        long j13 = jArr2[iE];
        int i5 = iE + 1;
        if (i5 == jArr.length) {
            return Pair.create(Long.valueOf(j12), Long.valueOf(j13));
        }
        return Pair.create(Long.valueOf(j11), Long.valueOf(((long) ((jArr[i5] == j12 ? 0.0d : (j11 - j12) / (r6 - j12)) * (jArr2[i5] - j13))) + j13));
    }

    @Override // ke.s
    public final r d(long j11) {
        Pair pairA = a(this.f85815b, this.f85814a, v.F(v.i(j11, 0L, this.f85816c)));
        t tVar = new t(v.y(((Long) pairA.first).longValue()), ((Long) pairA.second).longValue());
        return new r(tVar, tVar);
    }

    @Override // re.f
    public final long e() {
        return -1L;
    }

    @Override // ke.s
    public final boolean f() {
        return true;
    }

    @Override // re.f
    public final long h(long j11) {
        return v.y(((Long) a(this.f85814a, this.f85815b, j11).second).longValue());
    }

    @Override // ke.s
    public final long i() {
        return this.f85816c;
    }
}
