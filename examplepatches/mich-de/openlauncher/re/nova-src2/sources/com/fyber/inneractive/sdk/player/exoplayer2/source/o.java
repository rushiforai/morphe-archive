package com.fyber.inneractive.sdk.player.exoplayer2.source;

import java.io.IOException;

/* loaded from: classes3.dex */
public final class o implements v {

    /* renamed from: a, reason: collision with root package name */
    public final int f30203a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p f30204b;

    public o(p pVar, int i5) {
        this.f30204b = pVar;
        this.f30203a = i5;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.v
    public final void a() throws IOException {
        this.f30204b.f30213i.b();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.v
    public final boolean isReady() {
        boolean z11;
        p pVar = this.f30204b;
        int i5 = this.f30203a;
        if (!pVar.F) {
            if (pVar.D == -9223372036854775807L) {
                com.fyber.inneractive.sdk.player.exoplayer2.extractor.e eVar = ((com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) pVar.o.valueAt(i5)).f29184c;
                synchronized (eVar) {
                    z11 = eVar.f29150i == 0;
                }
                if (!z11) {
                }
            }
            return false;
        }
        return true;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.v
    public final int a(com.fyber.inneractive.sdk.player.exoplayer2.p pVar, com.fyber.inneractive.sdk.player.exoplayer2.decoder.c cVar, boolean z11) {
        p pVar2 = this.f30204b;
        int i5 = this.f30203a;
        if (pVar2.f30223u || pVar2.D != -9223372036854775807L) {
            return -3;
        }
        return ((com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) pVar2.o.valueAt(i5)).a(pVar, cVar, z11, pVar2.F, pVar2.C);
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.v
    public final void a(long j11) {
        p pVar = this.f30204b;
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVar = (com.fyber.inneractive.sdk.player.exoplayer2.extractor.g) pVar.o.valueAt(this.f30203a);
        if (pVar.F && j11 > gVar.d()) {
            gVar.f();
        } else {
            gVar.a(true, j11);
        }
    }
}
