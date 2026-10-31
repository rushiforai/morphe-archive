package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts;

/* loaded from: classes3.dex */
public final class z implements v {

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.util.m f29968a = new com.fyber.inneractive.sdk.player.exoplayer2.util.m(new byte[4]);

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ b0 f29969b;

    public z(b0 b0Var) {
        this.f29969b = b0Var;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.v
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.util.v vVar, com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar, e0 e0Var) {
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.v
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        if (nVar.j() != 0) {
            return;
        }
        nVar.e(nVar.f30462b + 7);
        int i5 = (nVar.f30463c - nVar.f30462b) / 4;
        for (int i11 = 0; i11 < i5; i11++) {
            com.fyber.inneractive.sdk.player.exoplayer2.util.m mVar = this.f29968a;
            nVar.a(mVar.f30457a, 0, 4);
            mVar.b(0);
            int iA = this.f29968a.a(16);
            this.f29968a.c(3);
            if (iA == 0) {
                this.f29968a.c(13);
            } else {
                int iA2 = this.f29968a.a(13);
                b0 b0Var = this.f29969b;
                b0Var.f29766f.put(iA2, new w(new a0(b0Var, iA2)));
                this.f29969b.f29769i++;
            }
        }
        b0 b0Var2 = this.f29969b;
        if (b0Var2.f29761a != 2) {
            b0Var2.f29766f.remove(0);
        }
    }
}
