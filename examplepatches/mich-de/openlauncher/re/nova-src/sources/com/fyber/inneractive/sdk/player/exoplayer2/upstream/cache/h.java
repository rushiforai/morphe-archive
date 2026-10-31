package com.fyber.inneractive.sdk.player.exoplayer2.upstream.cache;

import java.util.TreeSet;

/* loaded from: classes3.dex */
public final class h {

    /* renamed from: a, reason: collision with root package name */
    public final int f30313a;

    /* renamed from: b, reason: collision with root package name */
    public final String f30314b;

    /* renamed from: c, reason: collision with root package name */
    public final TreeSet f30315c = new TreeSet();

    /* renamed from: d, reason: collision with root package name */
    public long f30316d;

    public h(int i5, String str, long j11) {
        this.f30313a = i5;
        this.f30314b = str;
        this.f30316d = j11;
    }

    public final m a(long j11) {
        m mVar = new m(this.f30314b, j11, -1L, -9223372036854775807L, null);
        m mVar2 = (m) this.f30315c.floor(mVar);
        if (mVar2 != null && mVar2.f30308b + mVar2.f30309c > j11) {
            return mVar2;
        }
        m mVar3 = (m) this.f30315c.ceiling(mVar);
        return mVar3 == null ? new m(this.f30314b, j11, -1L, -9223372036854775807L, null) : new m(this.f30314b, j11, mVar3.f30308b - j11, -9223372036854775807L, null);
    }
}
