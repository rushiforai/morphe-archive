package com.fyber.inneractive.sdk.activities;

import android.window.OnBackInvokedCallback;

/* loaded from: classes3.dex */
public final class b implements OnBackInvokedCallback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ InneractiveBaseActivity f27588a;

    public b(InneractiveBaseActivity inneractiveBaseActivity) {
        this.f27588a = inneractiveBaseActivity;
    }

    public final void onBackInvoked() {
        this.f27588a.onBackPressed();
    }
}
