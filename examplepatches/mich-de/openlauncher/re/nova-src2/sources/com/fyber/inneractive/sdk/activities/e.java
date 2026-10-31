package com.fyber.inneractive.sdk.activities;

import android.view.View;
import com.fyber.inneractive.sdk.util.r;

/* loaded from: classes3.dex */
public final class e implements View.OnSystemUiVisibilityChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ InneractiveFullscreenAdActivity f27591a;

    public e(InneractiveFullscreenAdActivity inneractiveFullscreenAdActivity) {
        this.f27591a = inneractiveFullscreenAdActivity;
    }

    @Override // android.view.View.OnSystemUiVisibilityChangeListener
    public final void onSystemUiVisibilityChange(int i5) {
        if ((i5 & 2) == 0) {
            r.f31216b.postDelayed(this.f27591a.mHideNavigationBarTask, 3000L);
        }
    }
}
