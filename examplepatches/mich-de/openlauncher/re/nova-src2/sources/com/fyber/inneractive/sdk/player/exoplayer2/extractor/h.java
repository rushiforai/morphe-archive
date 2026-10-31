package com.fyber.inneractive.sdk.player.exoplayer2.extractor;

import androidx.recyclerview.widget.u1;
import java.io.EOFException;

/* loaded from: classes3.dex */
public final class h implements r {
    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.r
    public final void a(long j11, int i5, int i11, int i12, byte[] bArr) {
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.r
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.o oVar) {
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.r
    public final void a(int i5, com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        nVar.e(nVar.f30462b + i5);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.r
    public final int a(b bVar, int i5, boolean z11) throws InterruptedException, EOFException {
        b bVar2;
        int iMin = Math.min(bVar.f29136f, i5);
        bVar.b(iMin);
        if (iMin == 0) {
            bVar2 = bVar;
            iMin = bVar2.a(b.f29130g, 0, Math.min(i5, u1.FLAG_APPEARED_IN_PRE_LAYOUT), 0, true);
        } else {
            bVar2 = bVar;
        }
        if (iMin != -1) {
            bVar2.f29133c += iMin;
        }
        if (iMin != -1) {
            return iMin;
        }
        if (z11) {
            return -1;
        }
        throw new EOFException();
    }
}
