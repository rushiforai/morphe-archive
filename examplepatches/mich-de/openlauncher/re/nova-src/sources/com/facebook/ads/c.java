package com.facebook.ads;

import android.window.OnBackInvokedCallback;

/* loaded from: classes2.dex */
public final class c implements OnBackInvokedCallback {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AudienceNetworkActivity f27500a;

    public c(AudienceNetworkActivity audienceNetworkActivity) {
        this.f27500a = audienceNetworkActivity;
    }

    public final void onBackInvoked() {
        this.f27500a.onBackPressed();
    }
}
