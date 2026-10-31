package com.fyber.inneractive.sdk.player.exoplayer2.util;

import android.os.SystemClock;

/* loaded from: classes3.dex */
public final class u implements h {

    /* renamed from: a, reason: collision with root package name */
    public boolean f30481a;

    /* renamed from: b, reason: collision with root package name */
    public long f30482b;

    /* renamed from: c, reason: collision with root package name */
    public long f30483c;

    /* renamed from: d, reason: collision with root package name */
    public com.fyber.inneractive.sdk.player.exoplayer2.s f30484d = com.fyber.inneractive.sdk.player.exoplayer2.s.f30148d;

    public final void a(long j11) {
        this.f30482b = j11;
        if (this.f30481a) {
            this.f30483c = SystemClock.elapsedRealtime();
        }
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.util.h
    public final long b() {
        long j11 = this.f30482b;
        if (!this.f30481a) {
            return j11;
        }
        long jElapsedRealtime = SystemClock.elapsedRealtime() - this.f30483c;
        if (this.f30484d.f30149a != 1.0f) {
            return (jElapsedRealtime * r4.f30151c) + j11;
        }
        int i5 = com.fyber.inneractive.sdk.player.exoplayer2.b.f29095a;
        return (jElapsedRealtime != -9223372036854775807L ? 1000 * jElapsedRealtime : -9223372036854775807L) + j11;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.util.h
    public final com.fyber.inneractive.sdk.player.exoplayer2.s a(com.fyber.inneractive.sdk.player.exoplayer2.s sVar) {
        if (this.f30481a) {
            a(b());
        }
        this.f30484d = sVar;
        return sVar;
    }

    @Override // com.fyber.inneractive.sdk.player.exoplayer2.util.h
    public final com.fyber.inneractive.sdk.player.exoplayer2.s a() {
        return this.f30484d;
    }
}
