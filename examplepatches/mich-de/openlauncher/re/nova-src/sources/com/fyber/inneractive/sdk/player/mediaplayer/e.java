package com.fyber.inneractive.sdk.player.mediaplayer;

import android.view.SurfaceHolder;

/* loaded from: classes3.dex */
public final class e implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ SurfaceHolder f30607a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ p f30608b;

    public e(p pVar, SurfaceHolder surfaceHolder) {
        this.f30608b = pVar;
        this.f30607a = surfaceHolder;
    }

    @Override // java.lang.Runnable
    public final void run() {
        p.a(this.f30608b, this.f30607a);
    }
}
