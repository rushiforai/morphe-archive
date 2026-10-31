package com.vungle.ads.internal.presenter;

import com.vungle.ads.VungleError;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public abstract class c implements b {

    /* renamed from: a, reason: collision with root package name */
    public final b f47358a;

    public c(b adPlayCallback) {
        Intrinsics.g(adPlayCallback, "adPlayCallback");
        this.f47358a = adPlayCallback;
    }

    @Override // com.vungle.ads.internal.presenter.b
    public final void onAdClick(String str) {
        this.f47358a.onAdClick(str);
    }

    @Override // com.vungle.ads.internal.presenter.b
    public final void onAdLeftApplication(String str) {
        this.f47358a.onAdLeftApplication(str);
    }

    @Override // com.vungle.ads.internal.presenter.b
    public final void onAdRewarded(String str) {
        this.f47358a.onAdRewarded(str);
    }

    @Override // com.vungle.ads.internal.presenter.b
    public void onFailure(VungleError error) {
        Intrinsics.g(error, "error");
        this.f47358a.onFailure(error);
    }
}
