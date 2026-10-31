package com.fyber.inneractive.sdk.player.exoplayer2.source;

import com.fyber.inneractive.sdk.player.controller.b0;
import com.fyber.inneractive.sdk.util.IAlog;
import java.io.IOException;

/* loaded from: classes3.dex */
public final class d implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Object f30173a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f30174b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f30175c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ IOException f30176d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ f f30177e;

    public d(f fVar, com.fyber.inneractive.sdk.player.exoplayer2.upstream.k kVar, int i5, int i11, com.fyber.inneractive.sdk.player.exoplayer2.o oVar, int i12, Object obj, long j11, long j12, long j13, long j14, long j15, IOException iOException, boolean z11) {
        this.f30177e = fVar;
        this.f30173a = obj;
        this.f30174b = j11;
        this.f30175c = j12;
        this.f30176d = iOException;
    }

    @Override // java.lang.Runnable
    public final void run() {
        b0 b0Var = this.f30177e.f30182b;
        com.fyber.inneractive.sdk.player.exoplayer2.b.a(this.f30174b);
        f.a(this.f30177e, this.f30175c);
        IAlog.a("%s AdaptiveMediaSourceEventListener onLoadError called. with exception %s", b0Var.a(), this.f30176d);
    }
}
