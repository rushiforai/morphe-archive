package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg;

import java.io.EOFException;
import java.io.IOException;

/* loaded from: classes3.dex */
public final class b implements h {

    /* renamed from: a, reason: collision with root package name */
    public final g f29671a = new g();

    /* renamed from: b, reason: collision with root package name */
    public final long f29672b;

    /* renamed from: c, reason: collision with root package name */
    public final long f29673c;

    /* renamed from: d, reason: collision with root package name */
    public final l f29674d;

    /* renamed from: e, reason: collision with root package name */
    public int f29675e;

    /* renamed from: f, reason: collision with root package name */
    public long f29676f;

    /* renamed from: g, reason: collision with root package name */
    public long f29677g;

    /* renamed from: h, reason: collision with root package name */
    public long f29678h;

    /* renamed from: i, reason: collision with root package name */
    public long f29679i;

    /* renamed from: j, reason: collision with root package name */
    public long f29680j;

    /* renamed from: k, reason: collision with root package name */
    public long f29681k;

    /* renamed from: l, reason: collision with root package name */
    public long f29682l;

    public b(long j11, long j12, l lVar, int i5, long j13) {
        if (j11 < 0 || j12 <= j11) {
            throw new IllegalArgumentException();
        }
        this.f29674d = lVar;
        this.f29672b = j11;
        this.f29673c = j12;
        if (i5 != j12 - j11) {
            this.f29675e = 0;
        } else {
            this.f29676f = j13;
            this.f29675e = 3;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:47:0x00d4 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:48:0x00d5  */
    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg.h
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final long a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar) throws InterruptedException, IOException {
        long j11;
        g gVar;
        long j12;
        long jMin;
        long j13;
        long j14;
        int i5;
        int i11 = this.f29675e;
        long j15 = 0;
        if (i11 == 0) {
            j11 = 0;
            long j16 = bVar.f29133c;
            this.f29677g = j16;
            this.f29675e = 1;
            long j17 = this.f29673c - 65307;
            if (j17 > j16) {
                return j17;
            }
        } else {
            if (i11 != 1) {
                if (i11 != 2) {
                    if (i11 == 3) {
                        return -1L;
                    }
                    throw new IllegalStateException();
                }
                long j18 = this.f29678h;
                if (j18 == 0) {
                    i5 = 3;
                    j12 = 2;
                } else {
                    long j19 = this.f29679i;
                    long j21 = this.f29680j;
                    if (j19 == j21) {
                        j14 = this.f29681k;
                    } else {
                        long j22 = bVar.f29133c;
                        if (a(bVar, j21)) {
                            this.f29671a.a(bVar, false);
                            bVar.f29135e = 0;
                            g gVar2 = this.f29671a;
                            long j23 = gVar2.f29696b;
                            long j24 = j18 - j23;
                            int i12 = gVar2.f29698d + gVar2.f29699e;
                            if (j24 < 0 || j24 > 72000) {
                                if (j24 < 0) {
                                    this.f29680j = j22;
                                    this.f29682l = j23;
                                    j12 = 2;
                                } else {
                                    j12 = 2;
                                    long j25 = i12;
                                    long j26 = bVar.f29133c + j25;
                                    this.f29679i = j26;
                                    this.f29681k = j23;
                                    if ((this.f29680j - j26) + j25 < 100000) {
                                        bVar.a(i12);
                                        jMin = -(this.f29681k + 2);
                                        j13 = 0;
                                    }
                                    if (jMin < j13) {
                                    }
                                }
                                long j27 = this.f29680j;
                                long j28 = this.f29679i;
                                long j29 = j27 - j28;
                                if (j29 < 100000) {
                                    this.f29680j = j28;
                                    j13 = 0;
                                    jMin = j28;
                                } else {
                                    j13 = 0;
                                    jMin = Math.min(Math.max(((j29 * j24) / (this.f29682l - this.f29681k)) + (bVar.f29133c - (i12 * (j24 <= 0 ? 2 : 1))), j28), this.f29680j - 1);
                                }
                                if (jMin < j13) {
                                }
                            } else {
                                bVar.a(i12);
                                j14 = this.f29671a.f29696b;
                            }
                        } else {
                            jMin = this.f29679i;
                            if (jMin == j22) {
                                throw new IOException("No ogg page can be found.");
                            }
                            j13 = 0;
                            j12 = 2;
                            if (jMin < j13) {
                                return jMin;
                            }
                            long j31 = this.f29678h;
                            j15 = -(jMin + j12);
                            this.f29671a.a(bVar, false);
                            while (true) {
                                g gVar3 = this.f29671a;
                                if (gVar3.f29696b >= j31) {
                                    break;
                                }
                                bVar.a(gVar3.f29698d + gVar3.f29699e);
                                g gVar4 = this.f29671a;
                                long j32 = gVar4.f29696b;
                                gVar4.a(bVar, false);
                                j15 = j32;
                            }
                            bVar.f29135e = 0;
                            i5 = 3;
                        }
                    }
                    jMin = -(j14 + 2);
                    j13 = 0;
                    j12 = 2;
                    if (jMin < j13) {
                    }
                }
                this.f29675e = i5;
                return -(j15 + j12);
            }
            j11 = 0;
        }
        if (!a(bVar, this.f29673c)) {
            throw new EOFException();
        }
        g gVar5 = this.f29671a;
        gVar5.f29695a = 0;
        gVar5.f29696b = j11;
        gVar5.f29697c = 0;
        gVar5.f29698d = 0;
        gVar5.f29699e = 0;
        while (true) {
            gVar = this.f29671a;
            if ((gVar.f29695a & 4) == 4 || bVar.f29133c >= this.f29673c) {
                break;
            }
            gVar.a(bVar, false);
            g gVar6 = this.f29671a;
            bVar.a(gVar6.f29698d + gVar6.f29699e);
        }
        this.f29676f = gVar.f29696b;
        this.f29675e = 3;
        return this.f29677g;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg.h
    public final com.fyber.inneractive.sdk.player.exoplayer2.extractor.q b() {
        if (this.f29676f != 0) {
            return new a(this);
        }
        return null;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg.h
    public final long c(long j11) {
        int i5 = this.f29675e;
        if (i5 != 3 && i5 != 2) {
            throw new IllegalArgumentException();
        }
        long j12 = j11 == 0 ? 0L : (this.f29674d.f29713i * j11) / 1000000;
        this.f29678h = j12;
        this.f29675e = 2;
        this.f29679i = this.f29672b;
        this.f29680j = this.f29673c;
        this.f29681k = 0L;
        this.f29682l = this.f29676f;
        return j12;
    }

    public final boolean a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar, long j11) throws InterruptedException, EOFException {
        int i5;
        long jMin = Math.min(j11 + 3, this.f29673c);
        int i11 = 2048;
        byte[] bArr = new byte[2048];
        while (true) {
            long j12 = bVar.f29133c;
            int i12 = 0;
            if (i11 + j12 > jMin && (i11 = (int) (jMin - j12)) < 4) {
                return false;
            }
            bVar.a(bArr, 0, i11, false);
            while (true) {
                i5 = i11 - 3;
                if (i12 < i5) {
                    if (bArr[i12] == 79 && bArr[i12 + 1] == 103 && bArr[i12 + 2] == 103 && bArr[i12 + 3] == 83) {
                        bVar.a(i12);
                        return true;
                    }
                    i12++;
                }
            }
            bVar.a(i5);
        }
    }
}
