package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts;

import java.io.EOFException;

/* loaded from: classes3.dex */
public final class c implements com.fyber.inneractive.sdk.player.exoplayer2.extractor.i {

    /* renamed from: e, reason: collision with root package name */
    public static final int f29772e = com.fyber.inneractive.sdk.player.exoplayer2.util.z.a("ID3");

    /* renamed from: a, reason: collision with root package name */
    public final long f29773a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29774b = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(200);

    /* renamed from: c, reason: collision with root package name */
    public d f29775c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f29776d;

    public c(long j11) {
        this.f29773a = j11;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final boolean a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar) throws InterruptedException, EOFException {
        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(10);
        com.fyber.inneractive.sdk.player.exoplayer2.util.m mVar = new com.fyber.inneractive.sdk.player.exoplayer2.util.m(nVar.f30461a);
        int i5 = 0;
        while (true) {
            bVar.a(nVar.f30461a, 0, 10, false);
            nVar.e(0);
            if (nVar.l() != f29772e) {
                break;
            }
            nVar.e(nVar.f30462b + 3);
            int i11 = nVar.i();
            i5 += i11 + 10;
            bVar.a(i11, false);
        }
        bVar.f29135e = 0;
        bVar.a(i5, false);
        int i12 = 0;
        int i13 = 0;
        int i14 = i5;
        while (true) {
            bVar.a(nVar.f30461a, 0, 2, false);
            nVar.e(0);
            if ((nVar.o() & 65526) != 65520) {
                bVar.f29135e = 0;
                i14++;
                if (i14 - i5 >= 8192) {
                    return false;
                }
                bVar.a(i14, false);
                i12 = 0;
                i13 = 0;
            } else {
                i12++;
                if (i12 >= 4 && i13 > 188) {
                    return true;
                }
                bVar.a(nVar.f30461a, 0, 4, false);
                mVar.b(14);
                int iA = mVar.a(13);
                if (iA <= 6) {
                    return false;
                }
                bVar.a(iA - 6, false);
                i13 += iA;
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar) {
        d dVar = new d(true, null);
        this.f29775c = dVar;
        dVar.a(jVar, new e0(Integer.MIN_VALUE, 0, 1));
        jVar.b();
        jVar.a(new com.fyber.inneractive.sdk.player.exoplayer2.extractor.p(-9223372036854775807L));
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(long j11, long j12) {
        this.f29776d = false;
        d dVar = this.f29775c;
        dVar.f29787h = 0;
        dVar.f29788i = 0;
        dVar.f29789j = 256;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final int a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar, com.fyber.inneractive.sdk.player.exoplayer2.extractor.o oVar) throws InterruptedException, EOFException {
        int iMin;
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar2;
        byte[] bArr = this.f29774b.f30461a;
        int i5 = bVar.f29136f;
        if (i5 == 0) {
            iMin = 0;
        } else {
            iMin = Math.min(i5, 200);
            System.arraycopy(bVar.f29134d, 0, bArr, 0, iMin);
            bVar.b(iMin);
        }
        if (iMin == 0) {
            bVar2 = bVar;
            iMin = bVar2.a(bArr, 0, 200, 0, true);
        } else {
            bVar2 = bVar;
        }
        if (iMin != -1) {
            bVar2.f29133c += iMin;
        }
        if (iMin == -1) {
            return -1;
        }
        this.f29774b.e(0);
        this.f29774b.d(iMin);
        if (!this.f29776d) {
            this.f29775c.o = this.f29773a;
            this.f29776d = true;
        }
        this.f29775c.a(this.f29774b);
        return 0;
    }
}
