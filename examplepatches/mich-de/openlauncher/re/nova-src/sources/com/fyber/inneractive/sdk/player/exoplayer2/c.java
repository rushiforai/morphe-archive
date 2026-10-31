package com.fyber.inneractive.sdk.player.exoplayer2;

import com.amplitude.core.Configuration;
import com.amplitude.core.utilities.http.HttpClient;

/* loaded from: classes3.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.player.exoplayer2.upstream.l f29097a = new com.fyber.inneractive.sdk.player.exoplayer2.upstream.l();

    /* renamed from: b, reason: collision with root package name */
    public final long f29098b = HttpClient.Request.DEFAULT_CONNECT_TIMEOUT_MS * 1000;

    /* renamed from: c, reason: collision with root package name */
    public final long f29099c = Configuration.FLUSH_INTERVAL_MILLIS * 1000;

    /* renamed from: d, reason: collision with root package name */
    public final long f29100d = 2500000;

    /* renamed from: e, reason: collision with root package name */
    public final long f29101e = 5000000;

    /* renamed from: f, reason: collision with root package name */
    public int f29102f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f29103g;

    public final void a(boolean z11) {
        this.f29102f = 0;
        this.f29103g = false;
        if (z11) {
            com.fyber.inneractive.sdk.player.exoplayer2.upstream.l lVar = this.f29097a;
            synchronized (lVar) {
                lVar.a(0);
            }
        }
    }
}
