package com.fyber.inneractive.sdk.mraid;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import com.fyber.inneractive.sdk.util.g1;
import com.fyber.inneractive.sdk.web.i0;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.LinkedHashMap;

/* loaded from: classes3.dex */
public final class i extends e {
    public i(LinkedHashMap linkedHashMap, i0 i0Var, g1 g1Var) {
        super(linkedHashMap, i0Var, g1Var);
    }

    @Override // com.fyber.inneractive.sdk.mraid.f
    public final void a() {
        int iA = a("w");
        int iA2 = a("h");
        this.f28669c.a((String) this.f28668b.get(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL), iA <= 0 ? -1 : iA, iA2 <= 0 ? -1 : iA2, InneractiveMediationDefs.SHOW_HOUSE_AD_YES.equals(this.f28668b.get("shouldUseCustomClose")), InneractiveMediationDefs.SHOW_HOUSE_AD_YES.equals(this.f28668b.get("lockOrientation")));
    }

    @Override // com.fyber.inneractive.sdk.mraid.e
    public final String c() {
        return (String) this.f28668b.get(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
    }
}
