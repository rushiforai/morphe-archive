package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ogg;

import java.io.EOFException;
import java.util.Arrays;

/* loaded from: classes3.dex */
public final class e implements com.fyber.inneractive.sdk.player.exoplayer2.extractor.i {

    /* renamed from: a, reason: collision with root package name */
    public l f29688a;

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final boolean a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar) {
        boolean zA;
        boolean zEquals;
        try {
            g gVar = new g();
            if (gVar.a(bVar, true) && (gVar.f29695a & 2) == 2) {
                int iMin = Math.min(gVar.f29699e, 8);
                com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(iMin);
                bVar.a(nVar.f30461a, 0, iMin, false);
                nVar.e(0);
                if (nVar.f30463c - nVar.f30462b >= 5 && nVar.j() == 127 && nVar.k() == 1179402563) {
                    this.f29688a = new d();
                } else {
                    nVar.e(0);
                    try {
                        zA = s.a(1, nVar, true);
                    } catch (com.fyber.inneractive.sdk.player.exoplayer2.r unused) {
                        zA = false;
                    }
                    if (zA) {
                        this.f29688a = new o();
                    } else {
                        nVar.e(0);
                        int i5 = i.o;
                        int i11 = nVar.f30463c - nVar.f30462b;
                        byte[] bArr = i.f29702p;
                        if (i11 < bArr.length) {
                            zEquals = false;
                        } else {
                            byte[] bArr2 = new byte[bArr.length];
                            nVar.a(bArr2, 0, bArr.length);
                            zEquals = Arrays.equals(bArr2, bArr);
                        }
                        if (zEquals) {
                            this.f29688a = new i();
                        }
                    }
                }
                return true;
            }
        } catch (com.fyber.inneractive.sdk.player.exoplayer2.r unused2) {
        }
        return false;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar) {
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA = jVar.a(0, 1);
        jVar.b();
        l lVar = this.f29688a;
        lVar.f29707c = jVar;
        lVar.f29706b = gVarA;
        lVar.f29705a = new f();
        lVar.a(true);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(long j11, long j12) {
        l lVar = this.f29688a;
        f fVar = lVar.f29705a;
        g gVar = fVar.f29689a;
        gVar.f29695a = 0;
        gVar.f29696b = 0L;
        gVar.f29697c = 0;
        gVar.f29698d = 0;
        gVar.f29699e = 0;
        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar = fVar.f29690b;
        nVar.f30462b = 0;
        nVar.f30463c = 0;
        fVar.f29691c = -1;
        fVar.f29693e = false;
        if (j11 == 0) {
            lVar.a(!lVar.f29716l);
        } else if (lVar.f29712h != 0) {
            lVar.f29709e = lVar.f29708d.c(j12);
            lVar.f29712h = 2;
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final int a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar, com.fyber.inneractive.sdk.player.exoplayer2.extractor.o oVar) throws InterruptedException, EOFException {
        l lVar = this.f29688a;
        int i5 = lVar.f29712h;
        if (i5 == 0) {
            boolean zA = true;
            while (zA) {
                if (!lVar.f29705a.a(bVar)) {
                    lVar.f29712h = 3;
                    return -1;
                }
                long j11 = bVar.f29133c;
                long j12 = lVar.f29710f;
                lVar.f29715k = j11 - j12;
                zA = lVar.a(lVar.f29705a.f29690b, j12, lVar.f29714j);
                if (zA) {
                    lVar.f29710f = bVar.f29133c;
                }
            }
            com.fyber.inneractive.sdk.player.exoplayer2.o oVar2 = lVar.f29714j.f29703a;
            lVar.f29713i = oVar2.f30139s;
            if (!lVar.f29717m) {
                lVar.f29706b.a(oVar2);
                lVar.f29717m = true;
            }
            c cVar = lVar.f29714j.f29704b;
            if (cVar != null) {
                lVar.f29708d = cVar;
            } else {
                long j13 = bVar.f29132b;
                if (j13 == -1) {
                    lVar.f29708d = new k();
                } else {
                    g gVar = lVar.f29705a.f29689a;
                    lVar.f29708d = new b(lVar.f29710f, j13, lVar, gVar.f29698d + gVar.f29699e, gVar.f29696b);
                }
            }
            lVar.f29714j = null;
            lVar.f29712h = 2;
            lVar.f29705a.a();
            return 0;
        }
        if (i5 == 1) {
            bVar.a((int) lVar.f29710f);
            lVar.f29712h = 2;
            return 0;
        }
        if (i5 == 2) {
            long jA = lVar.f29708d.a(bVar);
            if (jA >= 0) {
                oVar.f29669a = jA;
                return 1;
            }
            if (jA < -1) {
                lVar.a(-(jA + 2));
            }
            if (!lVar.f29716l) {
                lVar.f29707c.a(lVar.f29708d.b());
                lVar.f29716l = true;
            }
            if (lVar.f29715k <= 0 && !lVar.f29705a.a(bVar)) {
                lVar.f29712h = 3;
                return -1;
            }
            lVar.f29715k = 0L;
            com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar = lVar.f29705a.f29690b;
            long jA2 = lVar.a(nVar);
            if (jA2 >= 0) {
                long j14 = lVar.f29711g;
                if (j14 + jA2 >= lVar.f29709e) {
                    lVar.f29706b.a(nVar.f30463c, nVar);
                    lVar.f29706b.a((j14 * 1000000) / lVar.f29713i, 1, nVar.f30463c, 0, null);
                    lVar.f29709e = -1L;
                }
            }
            lVar.f29711g += jA2;
            return 0;
        }
        throw new IllegalStateException();
    }
}
