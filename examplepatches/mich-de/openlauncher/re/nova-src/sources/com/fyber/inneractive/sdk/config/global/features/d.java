package com.fyber.inneractive.sdk.config.global.features;

import android.text.TextUtils;

/* loaded from: classes.dex */
public final class d extends i {

    /* renamed from: e, reason: collision with root package name */
    public com.fyber.inneractive.sdk.model.vast.a f27817e;

    public d() {
        super("cta_locale");
    }

    @Override // com.fyber.inneractive.sdk.config.global.features.i
    public final i b() {
        d dVar = new d();
        a(dVar);
        return dVar;
    }

    public final void d(String str) {
        if (TextUtils.isEmpty(str) || this.f27817e != null) {
            return;
        }
        this.f27817e = new com.fyber.inneractive.sdk.model.vast.a(a("install_" + str, null), a("skip_ad_" + str, null), a("skip_in_" + str, null));
    }
}
