package com.fyber.inneractive.sdk.network;

/* loaded from: classes.dex */
public final class c implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f28693a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f28694b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ f f28695c;

    public c(f fVar, int i5, long j11) {
        this.f28695c = fVar;
        this.f28693a = i5;
        this.f28694b = j11;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.f28695c.f28712d.sendEmptyMessageDelayed(this.f28693a, this.f28694b);
    }
}
