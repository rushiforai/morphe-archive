package com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp3;

import com.fyber.inneractive.sdk.player.exoplayer2.util.z;

/* loaded from: classes3.dex */
public final class e implements b {

    /* renamed from: a, reason: collision with root package name */
    public final long f29456a;

    /* renamed from: b, reason: collision with root package name */
    public final long f29457b;

    /* renamed from: c, reason: collision with root package name */
    public final long f29458c;

    /* renamed from: d, reason: collision with root package name */
    public final long[] f29459d;

    /* renamed from: e, reason: collision with root package name */
    public final long f29460e;

    /* renamed from: f, reason: collision with root package name */
    public final int f29461f;

    public e(long j11, long j12, long j13, long[] jArr, long j14, int i5) {
        this.f29456a = j11;
        this.f29457b = j12;
        this.f29458c = j13;
        this.f29459d = jArr;
        this.f29460e = j14;
        this.f29461f = i5;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final boolean a() {
        return this.f29459d != null;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.mp3.b
    public final long b(long j11) {
        if (!a()) {
            return 0L;
        }
        if (j11 < this.f29456a) {
            return 0L;
        }
        double d5 = ((j11 - r4) * 256.0d) / this.f29460e;
        int iA = z.a(this.f29459d, (long) d5, false);
        int i5 = iA + 1;
        long j12 = (i5 * this.f29457b) / 100;
        long j13 = i5 == 0 ? 0L : this.f29459d[iA];
        return j12 + ((i5 == 99 ? 256L : this.f29459d[i5]) == j13 ? 0L : (long) (((d5 - j13) * (((r7 * (iA + 2)) / 100) - j12)) / (r16 - j13)));
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final long c() {
        return this.f29457b;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.q
    public final long a(long j11) {
        if (!a()) {
            return this.f29456a;
        }
        float f11 = (j11 * 100.0f) / this.f29457b;
        if (f11 > 0.0f) {
            if (f11 >= 100.0f) {
                fA = 256.0f;
            } else {
                int i5 = (int) f11;
                fA = i5 != 0 ? this.f29459d[i5 - 1] : 0.0f;
                fA = a2.c.a(f11, i5, (i5 < 99 ? this.f29459d[i5] : 256.0f) - fA, fA);
            }
        }
        long jRound = Math.round(fA * 0.00390625d * this.f29460e);
        long j12 = this.f29456a;
        long j13 = jRound + j12;
        long j14 = this.f29458c;
        return Math.min(j13, j14 != -1 ? j14 - 1 : ((j12 - this.f29461f) + this.f29460e) - 1);
    }
}
