package com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts;

/* loaded from: classes3.dex */
public final class y implements v {

    /* renamed from: a, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.util.v f29965a;

    /* renamed from: b, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.extractor.r f29966b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f29967c;

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.v
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.util.v vVar, com.fyber.inneractive.sdk.player.exoplayer2.extractor.j jVar, e0 e0Var) {
        this.f29965a = vVar;
        e0Var.a();
        e0Var.b();
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.g gVarA = jVar.a(e0Var.f29803d, 4);
        this.f29966b = gVarA;
        e0Var.b();
        gVarA.a(com.fyber.inneractive.sdk.player.exoplayer2.o.a(e0Var.f29804e, "application/x-scte35", (com.fyber.inneractive.sdk.player.exoplayer2.drm.d) null));
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.extractor.ts.v
    public final void a(com.fyber.inneractive.sdk.player.exoplayer2.util.n nVar) {
        long j11;
        long j12;
        long j13 = -9223372036854775807L;
        if (!this.f29967c) {
            com.fyber.inneractive.sdk.player.exoplayer2.util.v vVar = this.f29965a;
            long j14 = 0;
            if ((vVar.f30485a == Long.MAX_VALUE ? 0L : vVar.f30487c == -9223372036854775807L ? -9223372036854775807L : vVar.f30486b) == -9223372036854775807L) {
                return;
            }
            com.fyber.inneractive.sdk.player.exoplayer2.extractor.r rVar = this.f29966b;
            com.fyber.inneractive.sdk.player.exoplayer2.util.v vVar2 = this.f29965a;
            if (vVar2.f30485a == Long.MAX_VALUE) {
                j12 = j14;
                rVar.a(new com.fyber.inneractive.sdk.player.exoplayer2.o(null, null, "application/x-scte35", null, -1, -1, -1, -1, -1.0f, -1, -1.0f, null, -1, null, -1, -1, -1, -1, -1, 0, null, -1, j12, null, null, null));
                this.f29967c = true;
            } else if (vVar2.f30487c == -9223372036854775807L) {
                j12 = -9223372036854775807L;
                rVar.a(new com.fyber.inneractive.sdk.player.exoplayer2.o(null, null, "application/x-scte35", null, -1, -1, -1, -1, -1.0f, -1, -1.0f, null, -1, null, -1, -1, -1, -1, -1, 0, null, -1, j12, null, null, null));
                this.f29967c = true;
            } else {
                j14 = vVar2.f30486b;
                j12 = j14;
                rVar.a(new com.fyber.inneractive.sdk.player.exoplayer2.o(null, null, "application/x-scte35", null, -1, -1, -1, -1, -1.0f, -1, -1.0f, null, -1, null, -1, -1, -1, -1, -1, 0, null, -1, j12, null, null, null));
                this.f29967c = true;
            }
        }
        int i5 = nVar.f30463c - nVar.f30462b;
        this.f29966b.a(i5, nVar);
        com.fyber.inneractive.sdk.player.exoplayer2.extractor.r rVar2 = this.f29966b;
        com.fyber.inneractive.sdk.player.exoplayer2.util.v vVar3 = this.f29965a;
        if (vVar3.f30487c != -9223372036854775807L) {
            j13 = vVar3.f30487c;
        } else {
            long j15 = vVar3.f30485a;
            if (j15 != Long.MAX_VALUE) {
                j11 = j15;
            }
            rVar2.a(j11, 1, i5, 0, null);
        }
        j11 = j13;
        rVar2.a(j11, 1, i5, 0, null);
    }
}
