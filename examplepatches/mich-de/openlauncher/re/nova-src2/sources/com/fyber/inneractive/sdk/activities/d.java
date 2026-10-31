package com.fyber.inneractive.sdk.activities;

import android.view.View;

/* loaded from: classes3.dex */
public final class d implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ InneractiveFullscreenAdActivity f27590a;

    public d(InneractiveFullscreenAdActivity inneractiveFullscreenAdActivity) {
        this.f27590a = inneractiveFullscreenAdActivity;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        this.f27590a.dismissAd(true);
    }
}
