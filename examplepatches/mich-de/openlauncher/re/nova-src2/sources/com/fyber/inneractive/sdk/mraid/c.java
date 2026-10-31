package com.fyber.inneractive.sdk.mraid;

import com.fyber.inneractive.sdk.external.InneractiveAdSpot;

/* loaded from: classes.dex */
public final class c implements com.fyber.inneractive.sdk.factories.g {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ IAMraidKit f28657a;

    public c(IAMraidKit iAMraidKit) {
        this.f28657a = iAMraidKit;
    }

    @Override // com.fyber.inneractive.sdk.factories.g
    public final boolean a(InneractiveAdSpot inneractiveAdSpot) {
        return this.f28657a.isMRaidSpotContent(inneractiveAdSpot);
    }

    @Override // com.fyber.inneractive.sdk.factories.g
    public final com.fyber.inneractive.sdk.interfaces.f b(InneractiveAdSpot inneractiveAdSpot) {
        return new com.fyber.inneractive.sdk.renderers.v();
    }
}
