package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts;

import android.util.SparseArray;
import androidx.recyclerview.widget.u1;
import com.vungle.ads.internal.protos.Sdk;
import java.io.EOFException;

/* loaded from: classes3.dex */
public final class u implements com.fyber.inneractive.sdk.player.exoplayer2.extractor.i {

    /* renamed from: d, reason: collision with root package name */
    public boolean f29953d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f29954e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f29955f;

    /* renamed from: g, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.extractor.j f29956g;

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.v f29950a = new com.fyber.inneractive.sdk.player.exoplayer2.util.v(0);

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29952c = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(u1.FLAG_APPEARED_IN_PRE_LAYOUT);

    /* renamed from: b, reason: collision with root package name */
    public final SparseArray f29951b = new SparseArray();

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final boolean a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar) throws InterruptedException, EOFException {
        byte[] bArr = new byte[14];
        bVar.a(bArr, 0, 14, false);
        if (442 != (((bArr[0] & 255) << 24) | ((bArr[1] & 255) << 16) | ((bArr[2] & 255) << 8) | (bArr[3] & 255)) || (bArr[4] & 196) != 68 || (bArr[6] & 4) != 4 || (bArr[8] & 4) != 4 || (bArr[9] & 1) != 1 || (bArr[12] & 3) != 3) {
            return false;
        }
        bVar.a(bArr[13] & 7, false);
        bVar.a(bArr, 0, 3, false);
        return 1 == ((((bArr[0] & 255) << 16) | ((bArr[1] & 255) << 8)) | (bArr[2] & 255));
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar) {
        this.f29956g = jVar;
        jVar.a(new com.fyber.inneractive.sdk.player.exoplayer2.extractor.p(-9223372036854775807L));
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    public final void a(long j11, long j12) {
        this.f29950a.f30487c = -9223372036854775807L;
        for (int i5 = 0; i5 < this.f29951b.size(); i5++) {
            t tVar = (t) this.f29951b.valueAt(i5);
            tVar.f29948f = false;
            tVar.f29943a.a();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x00ae  */
    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.i
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.b bVar, com.fyber.inneractive.sdk.player.exoplayer2.extractor.o oVar) throws InterruptedException, EOFException {
        h qVar;
        if (!bVar.a(this.f29952c.f30461a, 0, 4, true)) {
            return -1;
        }
        this.f29952c.e(0);
        int iB = this.f29952c.b();
        if (iB == 441) {
            return -1;
        }
        if (iB == 442) {
            bVar.a(this.f29952c.f30461a, 0, 10, false);
            this.f29952c.e(9);
            bVar.a((this.f29952c.j() & 7) + 14);
            return 0;
        }
        if (iB == 443) {
            bVar.a(this.f29952c.f30461a, 0, 2, false);
            this.f29952c.e(0);
            bVar.a(this.f29952c.o() + 6);
            return 0;
        }
        if (((iB & (-256)) >> 8) != 1) {
            bVar.a(1);
            return 0;
        }
        int i5 = iB & 255;
        t tVar = (t) this.f29951b.get(i5);
        if (!this.f29953d) {
            if (tVar == null) {
                boolean z11 = this.f29954e;
                h jVar = null;
                if (!z11 && i5 == 189) {
                    qVar = new b(null);
                    this.f29954e = true;
                } else if (!z11 && (iB & Sdk.SDKError.Reason.AD_LOAD_FAIL_EMPTY_BID_PAYLOAD_VALUE) == 192) {
                    qVar = new q(null);
                    this.f29954e = true;
                } else {
                    if (!this.f29955f && (iB & 240) == 224) {
                        jVar = new j();
                        this.f29955f = true;
                    }
                    if (jVar != null) {
                        jVar.a(this.f29956g, new e0(Integer.MIN_VALUE, i5, 256));
                        tVar = new t(jVar, this.f29950a);
                        this.f29951b.put(i5, tVar);
                    }
                }
                jVar = qVar;
                if (jVar != null) {
                }
            }
            if ((this.f29954e && this.f29955f) || bVar.f29133c > 1048576) {
                this.f29953d = true;
                this.f29956g.b();
            }
        }
        bVar.a(this.f29952c.f30461a, 0, 2, false);
        this.f29952c.e(0);
        int iO = this.f29952c.o() + 6;
        if (tVar == null) {
            bVar.a(iO);
        } else {
            this.f29952c.c(iO);
            bVar.b(this.f29952c.f30461a, 0, iO, false);
            this.f29952c.e(6);
            com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar = this.f29952c;
            nVar.a(tVar.f29945c.f30457a, 0, 3);
            tVar.f29945c.b(0);
            tVar.f29945c.c(8);
            tVar.f29946d = tVar.f29945c.b();
            tVar.f29947e = tVar.f29945c.b();
            tVar.f29945c.c(6);
            nVar.a(tVar.f29945c.f30457a, 0, tVar.f29945c.a(8));
            tVar.f29945c.b(0);
            tVar.f29949g = 0L;
            if (tVar.f29946d) {
                tVar.f29945c.c(4);
                tVar.f29945c.c(1);
                tVar.f29945c.c(1);
                long jA = (tVar.f29945c.a(3) << 30) | (tVar.f29945c.a(15) << 15) | tVar.f29945c.a(15);
                tVar.f29945c.c(1);
                if (!tVar.f29948f && tVar.f29947e) {
                    tVar.f29945c.c(4);
                    tVar.f29945c.c(1);
                    tVar.f29945c.c(1);
                    tVar.f29945c.c(1);
                    tVar.f29944b.b((tVar.f29945c.a(3) << 30) | (tVar.f29945c.a(15) << 15) | tVar.f29945c.a(15));
                    tVar.f29948f = true;
                }
                tVar.f29949g = tVar.f29944b.b(jA);
            }
            tVar.f29943a.a(true, tVar.f29949g);
            tVar.f29943a.a(nVar);
            tVar.f29943a.b();
            com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar2 = this.f29952c;
            nVar2.d(nVar2.a());
        }
        return 0;
    }
}
