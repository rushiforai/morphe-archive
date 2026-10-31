package com.fyber.inneractive.sdk.player.exoplayer2.source;

/* loaded from: classes3.dex */
public final class h implements w {

    /* renamed from: a, reason: collision with root package name */
    public final w[] f30183a;

    public h(w[] wVarArr) {
        this.f30183a = wVarArr;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.w
    public final boolean b(long j11) {
        boolean zB;
        boolean z11 = false;
        do {
            long jF = f();
            if (jF == Long.MIN_VALUE) {
                return z11;
            }
            zB = false;
            for (w wVar : this.f30183a) {
                if (wVar.f() == jF) {
                    zB |= wVar.b(j11);
                }
            }
            z11 |= zB;
        } while (zB);
        return z11;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.source.w
    public final long f() {
        long jMin = Long.MAX_VALUE;
        for (w wVar : this.f30183a) {
            long jF = wVar.f();
            if (jF != Long.MIN_VALUE) {
                jMin = Math.min(jMin, jF);
            }
        }
        if (jMin == Long.MAX_VALUE) {
            return Long.MIN_VALUE;
        }
        return jMin;
    }
}
