package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts;

import android.util.Log;

/* loaded from: classes3.dex */
public final class p implements h {

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.n f29908a = new com.fyber.inneractive.sdk.player.exoplayer2.util.n(10);

    /* renamed from: b, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.extractor.r f29909b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f29910c;

    /* renamed from: d, reason: collision with root package name */
    public long f29911d;

    /* renamed from: e, reason: collision with root package name */
    public int f29912e;

    /* renamed from: f, reason: collision with root package name */
    public int f29913f;

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a() {
        this.f29910c = false;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void b() {
        int i5;
        if (this.f29910c && (i5 = this.f29912e) != 0 && this.f29913f == i5) {
            this.f29909b.a(this.f29911d, 1, i5, 0, null);
            this.f29910c = false;
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar, e0 e0Var) {
        e0Var.a();
        e0Var.b();
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA = jVar.a(e0Var.f29803d, 4);
        this.f29909b = gVarA;
        e0Var.b();
        gVarA.a(com.fyber.inneractive.sdk.player.exoplayer2.o.a(e0Var.f29804e, "application/id3", (com.fyber.inneractive.sdk.player.exoplayer2.drm.d) null));
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a(boolean z11, long j11) {
        if (z11) {
            this.f29910c = true;
            this.f29911d = j11;
            this.f29912e = 0;
            this.f29913f = 0;
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.h
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        if (this.f29910c) {
            int i5 = nVar.f30463c - nVar.f30462b;
            int i11 = this.f29913f;
            if (i11 < 10) {
                int iMin = Math.min(i5, 10 - i11);
                System.arraycopy(nVar.f30461a, nVar.f30462b, this.f29908a.f30461a, this.f29913f, iMin);
                if (this.f29913f + iMin == 10) {
                    this.f29908a.e(0);
                    if (73 == this.f29908a.j() && 68 == this.f29908a.j() && 51 == this.f29908a.j()) {
                        com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar2 = this.f29908a;
                        nVar2.e(nVar2.f30462b + 3);
                        this.f29912e = this.f29908a.i() + 10;
                    } else {
                        Log.w("Id3Reader", "Discarding invalid ID3 tag");
                        this.f29910c = false;
                        return;
                    }
                }
            }
            int iMin2 = Math.min(i5, this.f29912e - this.f29913f);
            this.f29909b.a(iMin2, nVar);
            this.f29913f += iMin2;
        }
    }
}
