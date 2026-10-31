package com.fyber.inneractive.sdk.mraid;

import com.fyber.inneractive.sdk.external.InneractiveAdSpot;

/* loaded from: classes.dex */
public final class d implements com.fyber.inneractive.sdk.factories.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ IAMraidKit f28660a;

    public d(IAMraidKit iAMraidKit) {
        this.f28660a = iAMraidKit;
    }

    @Override // com.fyber.inneractive.sdk.factories.a
    public final boolean a(InneractiveAdSpot inneractiveAdSpot) {
        return this.f28660a.isMRaidSpotContent(inneractiveAdSpot);
    }

    @Override // com.fyber.inneractive.sdk.factories.a
    public final com.fyber.inneractive.sdk.interfaces.d a() {
        return new com.fyber.inneractive.sdk.renderers.n();
    }
}
