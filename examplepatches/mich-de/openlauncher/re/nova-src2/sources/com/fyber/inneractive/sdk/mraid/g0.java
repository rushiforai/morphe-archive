package com.fyber.inneractive.sdk.mraid;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;

/* loaded from: classes3.dex */
public final class g0 extends y {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f28671a;

    public g0(boolean z11) {
        this.f28671a = z11;
    }

    @Override // com.fyber.inneractive.sdk.mraid.y
    public final String a() {
        return "viewable: ".concat(this.f28671a ? InneractiveMediationDefs.SHOW_HOUSE_AD_YES : "false");
    }
}
