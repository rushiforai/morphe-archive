package com.fyber.inneractive.sdk.mraid;

import java.util.Locale;

/* loaded from: classes3.dex */
public final class b0 extends y {

    /* renamed from: a, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.web.c0 f28656a;

    public b0(com.fyber.inneractive.sdk.web.c0 c0Var) {
        this.f28656a = c0Var;
    }

    @Override // com.fyber.inneractive.sdk.mraid.y
    public final String a() {
        return "placementType: '" + this.f28656a.toString().toLowerCase(Locale.US) + "'";
    }
}
