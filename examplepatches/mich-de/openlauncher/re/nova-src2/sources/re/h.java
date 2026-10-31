package re;

import ke.r;
import ke.t;
import wf.v;

/* loaded from: classes3.dex */
public final class h implements f {

    /* renamed from: a, reason: collision with root package name */
    public final long f85837a;

    /* renamed from: b, reason: collision with root package name */
    public final int f85838b;

    /* renamed from: c, reason: collision with root package name */
    public final long f85839c;

    /* renamed from: d, reason: collision with root package name */
    public final long f85840d;

    /* renamed from: e, reason: collision with root package name */
    public final long f85841e;

    /* renamed from: f, reason: collision with root package name */
    public final long[] f85842f;

    public h(long j11, int i5, long j12, long j13, long[] jArr) {
        this.f85837a = j11;
        this.f85838b = i5;
        this.f85839c = j12;
        this.f85842f = jArr;
        this.f85840d = j13;
        this.f85841e = j13 != -1 ? j11 + j13 : -1L;
    }

    @Override // ke.s
    public final r d(long j11) {
        double d5;
        double d11;
        boolean zF = f();
        int i5 = this.f85838b;
        long j12 = this.f85837a;
        if (!zF) {
            t tVar = new t(0L, j12 + i5);
            return new r(tVar, tVar);
        }
        long jI = v.i(j11, 0L, this.f85839c);
        double d12 = (jI * 100.0d) / this.f85839c;
        double d13 = 0.0d;
        if (d12 <= 0.0d) {
            d5 = 256.0d;
        } else if (d12 >= 100.0d) {
            d5 = 256.0d;
            d13 = 256.0d;
        } else {
            int i11 = (int) d12;
            long[] jArr = this.f85842f;
            wf.a.j(jArr);
            double d14 = jArr[i11];
            if (i11 == 99) {
                d5 = 256.0d;
                d11 = 256.0d;
            } else {
                d5 = 256.0d;
                d11 = jArr[i11 + 1];
            }
            d13 = ((d11 - d14) * (d12 - i11)) + d14;
        }
        long j13 = this.f85840d;
        t tVar2 = new t(jI, j12 + v.i(Math.round((d13 / d5) * j13), i5, j13 - 1));
        return new r(tVar2, tVar2);
    }

    @Override // re.f
    public final long e() {
        return this.f85841e;
    }

    @Override // ke.s
    public final boolean f() {
        return this.f85842f != null;
    }

    @Override // re.f
    public final long h(long j11) {
        long j12 = j11 - this.f85837a;
        if (!f() || j12 <= this.f85838b) {
            return 0L;
        }
        long[] jArr = this.f85842f;
        wf.a.j(jArr);
        double d5 = (j12 * 256.0d) / this.f85840d;
        int iE = v.e(jArr, (long) d5, true);
        long j13 = this.f85839c;
        long j14 = (iE * j13) / 100;
        long j15 = jArr[iE];
        int i5 = iE + 1;
        long j16 = (j13 * i5) / 100;
        return Math.round((j15 == (iE == 99 ? 256L : jArr[i5]) ? 0.0d : (d5 - j15) / (r0 - j15)) * (j16 - j14)) + j14;
    }

    @Override // ke.s
    public final long i() {
        return this.f85839c;
    }
}
