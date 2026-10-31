package com.fyber.inneractive.sdk.external;

import com.fyber.inneractive.sdk.flow.u0;
import com.fyber.inneractive.sdk.flow.x;

/* loaded from: classes3.dex */
public class NativeAdVideoContentController extends u0 {
    @Override // com.fyber.inneractive.sdk.flow.j0
    public boolean canControl(InneractiveAdSpot inneractiveAdSpot) {
        x adContent = inneractiveAdSpot.getAdContent();
        return (adContent instanceof NativeAdContent) && adContent.isVideoAd();
    }
}
