package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts;

import java.io.EOFException;

/* loaded from: classes3.dex */
public final class a implements com.fyber.inneractive.sdk.player.exoplayer2.extractor.i {

    /* renamed from: e, reason: collision with root package name */
    public static final int f29737e = com.fyber.inneractive.sdk.player.exoplayer2.util.z.a("ID3");

    /* renamed from: a, reason: collision with root package name */
    public final long f29738a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29739b = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(2786);

    /* renamed from: c, reason: collision with root package name */
    public b f29740c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f29741d;

    public a(long j11) {
        this.f29738a = j11;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final boolean a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar) throws InterruptedException, EOFException {
        int iA;
        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(10);
        int i5 = 0;
        while (true) {
            bVar.a(nVar.f30461a, 0, 10, false);
            nVar.e(0);
            if (nVar.l() != f29737e) {
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
        int i13 = i5;
        while (true) {
            bVar.a(nVar.f30461a, 0, 5, false);
            nVar.e(0);
            if (nVar.o() != 2935) {
                bVar.f29135e = 0;
                i13++;
                if (i13 - i5 >= 8192) {
                    return false;
                }
                bVar.a(i13, false);
                i12 = 0;
            } else {
                i12++;
                if (i12 >= 4) {
                    return true;
                }
                byte[] bArr = nVar.f30461a;
                if (bArr.length < 5) {
                    iA = -1;
                } else {
                    byte b11 = bArr[4];
                    iA = com.fyber.inneractive.sdk.player.exoplayer2.audio.a.a((b11 & 192) >> 6, b11 & 63);
                }
                if (iA == -1) {
                    return false;
                }
                bVar.a(iA - 5, false);
            }
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar) {
        b bVar = new b(null);
        this.f29740c = bVar;
        bVar.f29750d = "0";
        bVar.f29751e = jVar.a(0, 1);
        jVar.b();
        jVar.a(new com.fyber.inneractive.sdk.player.exoplayer2.extractor.p(-9223372036854775807L));
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(long j11, long j12) {
        this.f29741d = false;
        this.f29740c.a();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final int a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar, com.fyber.inneractive.sdk.player.exoplayer2.extractor.o oVar) throws InterruptedException, EOFException {
        int iMin;
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar2;
        byte[] bArr = this.f29739b.f30461a;
        int i5 = bVar.f29136f;
        if (i5 == 0) {
            iMin = 0;
        } else {
            iMin = Math.min(i5, 2786);
            System.arraycopy(bVar.f29134d, 0, bArr, 0, iMin);
            bVar.b(iMin);
        }
        if (iMin == 0) {
            bVar2 = bVar;
            iMin = bVar2.a(bArr, 0, 2786, 0, true);
        } else {
            bVar2 = bVar;
        }
        if (iMin != -1) {
            bVar2.f29133c += iMin;
        }
        if (iMin == -1) {
            return -1;
        }
        this.f29739b.e(0);
        this.f29739b.d(iMin);
        if (!this.f29741d) {
            this.f29740c.f29758l = this.f29738a;
            this.f29741d = true;
        }
        this.f29740c.a(this.f29739b);
        return 0;
    }
}
