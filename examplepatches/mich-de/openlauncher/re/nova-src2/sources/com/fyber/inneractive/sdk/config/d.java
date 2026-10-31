package com.fyber.inneractive.sdk.config;

import com.fyber.inneractive.sdk.util.IAlog;
import com.fyber.inneractive.sdk.util.v1;

/* loaded from: classes.dex */
public final class d implements v1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ e f27789a;

    public d(e eVar) {
        this.f27789a = eVar;
    }

    @Override // com.fyber.inneractive.sdk.util.v1
    public final void a() {
        IAlog.a("onVisibleTimeReached: %s", Long.valueOf(System.currentTimeMillis()));
        this.f27789a.f27793c = true;
    }
}
