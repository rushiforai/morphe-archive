package re;

import ke.r;
import ke.s;
import ke.t;

/* loaded from: classes3.dex */
public final class a implements f, s {

    /* renamed from: a, reason: collision with root package name */
    public final long f85807a;

    /* renamed from: b, reason: collision with root package name */
    public final long f85808b;

    /* renamed from: c, reason: collision with root package name */
    public final int f85809c;

    /* renamed from: d, reason: collision with root package name */
    public final long f85810d;

    /* renamed from: e, reason: collision with root package name */
    public final int f85811e;

    /* renamed from: f, reason: collision with root package name */
    public final long f85812f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f85813g;

    public a(long j11, long j12, int i5, int i11, boolean z11) {
        this.f85807a = j11;
        this.f85808b = j12;
        this.f85809c = i11 == -1 ? 1 : i11;
        this.f85811e = i5;
        this.f85813g = z11;
        if (j11 == -1) {
            this.f85810d = -1L;
            this.f85812f = -9223372036854775807L;
        } else {
            long j13 = j11 - j12;
            this.f85810d = j13;
            this.f85812f = (Math.max(0L, j13) * 8000000) / i5;
        }
    }

    @Override // ke.s
    public final r d(long j11) {
        long j12 = this.f85810d;
        long j13 = this.f85808b;
        if (j12 == -1 && !this.f85813g) {
            t tVar = new t(0L, j13);
            return new r(tVar, tVar);
        }
        int i5 = this.f85811e;
        long j14 = this.f85809c;
        long jMin = (((i5 * j11) / 8000000) / j14) * j14;
        if (j12 != -1) {
            jMin = Math.min(jMin, j12 - j14);
        }
        long jMax = Math.max(jMin, 0L) + j13;
        long jMax2 = (Math.max(0L, jMax - j13) * 8000000) / i5;
        t tVar2 = new t(jMax2, jMax);
        if (j12 != -1 && jMax2 < j11) {
            long j15 = jMax + j14;
            if (j15 < this.f85807a) {
                return new r(tVar2, new t((Math.max(0L, j15 - j13) * 8000000) / i5, j15));
            }
        }
        return new r(tVar2, tVar2);
    }

    @Override // re.f
    public final long e() {
        return -1L;
    }

    @Override // ke.s
    public final boolean f() {
        return this.f85810d != -1 || this.f85813g;
    }

    @Override // re.f
    public final long h(long j11) {
        return (Math.max(0L, j11 - this.f85808b) * 8000000) / this.f85811e;
    }

    @Override // ke.s
    public final long i() {
        return this.f85812f;
    }
}
