package com.fyber.inneractive.sdk.response.nativead;

import com.fyber.inneractive.sdk.config.global.r;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveErrorCode;

/* loaded from: classes3.dex */
public final class j extends com.fyber.inneractive.sdk.response.g {
    public final k S = new k();

    @Override // com.fyber.inneractive.sdk.response.g, com.fyber.inneractive.sdk.response.e
    public final InneractiveErrorCode a(InneractiveAdRequest inneractiveAdRequest, r rVar) {
        InneractiveErrorCode inneractiveErrorCodeA = this.S.d() ? com.fyber.inneractive.sdk.flow.vast.j.a(inneractiveAdRequest, this, rVar) : null;
        if (inneractiveErrorCodeA != null) {
            return inneractiveErrorCodeA;
        }
        this.S.getClass();
        return null;
    }

    @Override // com.fyber.inneractive.sdk.response.g, com.fyber.inneractive.sdk.response.e
    public final InneractiveErrorCode b() {
        return a(null, null);
    }
}
