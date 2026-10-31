package com.fyber.inneractive.sdk.network;

import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public final class y0 implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ String f28832a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ long f28833b;

    public y0(String str, long j11) {
        this.f28832a = str;
        this.f28833b = j11;
    }

    @Override // com.fyber.inneractive.sdk.network.f0
    public final void a(Object obj, Exception exc, boolean z11) {
        String str = (String) obj;
        IAlog.a("Hit Request: Hitting URL finished: %s", this.f28832a);
        if (exc == null) {
            IAlog.a("Hit Request: Hitting URL response code: %s", str);
        } else {
            IAlog.a("Hit Request: Hitting URL failed: %s", exc);
        }
        IAlog.a("Hit Request: Url hit took %s millis", Long.valueOf(System.currentTimeMillis() - this.f28833b));
    }
}
