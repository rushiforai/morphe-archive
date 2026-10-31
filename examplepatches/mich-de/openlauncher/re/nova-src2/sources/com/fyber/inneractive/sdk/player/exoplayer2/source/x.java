package com.fyber.inneractive.sdk.player.exoplayer2.source;

/* loaded from: classes3.dex */
public final class x extends com.fyber.inneractive.sdk.player.exoplayer2.x {

    /* renamed from: g, reason: collision with root package name */
    public static final Object f30238g = new Object();

    /* renamed from: b, reason: collision with root package name */
    public final long f30239b;

    /* renamed from: c, reason: collision with root package name */
    public final long f30240c;

    /* renamed from: d, reason: collision with root package name */
    public final long f30241d;

    /* renamed from: e, reason: collision with root package name */
    public final long f30242e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f30243f;

    public x(long j11, long j12, long j13, long j14, boolean z11, boolean z12) {
        this.f30239b = j11;
        this.f30240c = j12;
        this.f30241d = j13;
        this.f30242e = j14;
        this.f30243f = z12;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.x
    public final int a() {
        return 1;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.x
    public final int b() {
        return 1;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.x
    public final com.fyber.inneractive.sdk.player.exoplayer2.w a(int i5, com.fyber.inneractive.sdk.player.exoplayer2.w wVar, long j11) {
        if (i5 < 0 || i5 >= 1) {
            throw new IndexOutOfBoundsException();
        }
        long j12 = this.f30242e;
        boolean z11 = this.f30243f;
        if (z11) {
            j12 += j11;
            if (j12 > this.f30240c) {
                j12 = -9223372036854775807L;
            }
        }
        long j13 = this.f30240c;
        long j14 = this.f30241d;
        wVar.f30571a = null;
        wVar.f30572b = z11;
        wVar.f30575e = j12;
        wVar.f30576f = j13;
        wVar.f30573c = 0;
        wVar.f30574d = 0;
        wVar.f30577g = j14;
        return wVar;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.x
    public final com.fyber.inneractive.sdk.player.exoplayer2.v a(int i5, com.fyber.inneractive.sdk.player.exoplayer2.v vVar, boolean z11) {
        if (i5 >= 0 && i5 < 1) {
            Object obj = z11 ? f30238g : null;
            long j11 = this.f30239b;
            long j12 = -this.f30241d;
            vVar.f30497a = obj;
            vVar.f30498b = obj;
            vVar.f30499c = 0;
            vVar.f30500d = j11;
            vVar.f30501e = j12;
            return vVar;
        }
        throw new IndexOutOfBoundsException();
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.x
    public final int a(Object obj) {
        return f30238g.equals(obj) ? 0 : -1;
    }
}
