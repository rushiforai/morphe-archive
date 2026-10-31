package com.fyber.inneractive.sdk.activities;

/* loaded from: classes3.dex */
public final class c implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ InneractiveFullscreenAdActivity f27589a;

    public c(InneractiveFullscreenAdActivity inneractiveFullscreenAdActivity) {
        this.f27589a = inneractiveFullscreenAdActivity;
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.f27589a.isFinishing()) {
            return;
        }
        this.f27589a.hideNavigationBar();
    }
}
