package te;

import java.io.EOFException;
import java.io.IOException;
import ke.k;
import ke.s;
import wf.v;

/* loaded from: classes3.dex */
public final class b implements g {

    /* renamed from: a, reason: collision with root package name */
    public final f f89012a;

    /* renamed from: b, reason: collision with root package name */
    public final long f89013b;

    /* renamed from: c, reason: collision with root package name */
    public final long f89014c;

    /* renamed from: d, reason: collision with root package name */
    public final i f89015d;

    /* renamed from: e, reason: collision with root package name */
    public int f89016e;

    /* renamed from: f, reason: collision with root package name */
    public long f89017f;

    /* renamed from: g, reason: collision with root package name */
    public long f89018g;

    /* renamed from: h, reason: collision with root package name */
    public long f89019h;

    /* renamed from: i, reason: collision with root package name */
    public long f89020i;

    /* renamed from: j, reason: collision with root package name */
    public long f89021j;

    /* renamed from: k, reason: collision with root package name */
    public long f89022k;

    /* renamed from: l, reason: collision with root package name */
    public long f89023l;

    public b(i iVar, long j11, long j12, long j13, long j14, boolean z11) {
        wf.a.e(j11 >= 0 && j12 > j11);
        this.f89015d = iVar;
        this.f89013b = j11;
        this.f89014c = j12;
        if (j13 == j12 - j11 || z11) {
            this.f89017f = j14;
            this.f89016e = 4;
        } else {
            this.f89016e = 0;
        }
        this.f89012a = new f();
    }

    /* JADX WARN: Removed duplicated region for block: B:43:0x00c3 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:44:0x00c4  */
    @Override // te.g
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long c(k kVar) throws IOException {
        long j11;
        long j12;
        long jI;
        int i5 = this.f89016e;
        long j13 = this.f89014c;
        f fVar = this.f89012a;
        if (i5 == 0) {
            j11 = 0;
            long position = kVar.getPosition();
            this.f89018g = position;
            this.f89016e = 1;
            long j14 = j13 - 65307;
            if (j14 > position) {
                return j14;
            }
        } else if (i5 != 1) {
            if (i5 == 2) {
                if (this.f89020i == this.f89021j) {
                    jI = -1;
                } else {
                    long position2 = kVar.getPosition();
                    if (fVar.b(kVar, this.f89021j)) {
                        fVar.a(kVar, false);
                        kVar.e();
                        long j15 = this.f89019h;
                        long j16 = fVar.f89033b;
                        long j17 = j15 - j16;
                        j12 = 2;
                        int i11 = fVar.f89035d + fVar.f89036e;
                        if (0 > j17 || j17 >= 72000) {
                            if (j17 < 0) {
                                this.f89021j = position2;
                                this.f89023l = j16;
                            } else {
                                this.f89020i = kVar.getPosition() + i11;
                                this.f89022k = fVar.f89033b;
                            }
                            long j18 = this.f89021j;
                            long j19 = this.f89020i;
                            if (j18 - j19 < 100000) {
                                this.f89021j = j19;
                                jI = j19;
                            } else {
                                long position3 = kVar.getPosition() - (i11 * (j17 <= 0 ? 2L : 1L));
                                long j21 = this.f89021j;
                                long j22 = this.f89020i;
                                jI = v.i((((j21 - j22) * j17) / (this.f89023l - this.f89022k)) + position3, j22, j21 - 1);
                            }
                        } else {
                            jI = -1;
                        }
                        if (jI == -1) {
                            return jI;
                        }
                        this.f89016e = 3;
                    } else {
                        jI = this.f89020i;
                        if (jI == position2) {
                            throw new IOException("No ogg page can be found.");
                        }
                    }
                }
                j12 = 2;
                if (jI == -1) {
                }
            } else {
                if (i5 != 3) {
                    if (i5 == 4) {
                        return -1L;
                    }
                    throw new IllegalStateException();
                }
                j12 = 2;
            }
            while (true) {
                fVar.b(kVar, -1L);
                fVar.a(kVar, false);
                if (fVar.f89033b > this.f89019h) {
                    kVar.e();
                    this.f89016e = 4;
                    return -(this.f89022k + j12);
                }
                kVar.m(fVar.f89035d + fVar.f89036e);
                this.f89020i = kVar.getPosition();
                this.f89022k = fVar.f89033b;
            }
        } else {
            j11 = 0;
        }
        fVar.f89032a = 0;
        fVar.f89033b = j11;
        fVar.f89034c = 0;
        fVar.f89035d = 0;
        fVar.f89036e = 0;
        if (!fVar.b(kVar, -1L)) {
            throw new EOFException();
        }
        fVar.a(kVar, false);
        kVar.m(fVar.f89035d + fVar.f89036e);
        long j23 = fVar.f89033b;
        while ((fVar.f89032a & 4) != 4 && fVar.b(kVar, -1L) && kVar.getPosition() < j13 && fVar.a(kVar, true)) {
            try {
                kVar.m(fVar.f89035d + fVar.f89036e);
                j23 = fVar.f89033b;
            } catch (EOFException unused) {
            }
        }
        this.f89017f = j23;
        this.f89016e = 4;
        return this.f89018g;
    }

    @Override // te.g
    public final s d() {
        if (this.f89017f != 0) {
            return new a(this);
        }
        return null;
    }

    @Override // te.g
    public final void e(long j11) {
        this.f89019h = v.i(j11, 0L, this.f89017f - 1);
        this.f89016e = 2;
        this.f89020i = this.f89013b;
        this.f89021j = this.f89014c;
        this.f89022k = 0L;
        this.f89023l = this.f89017f;
    }
}
