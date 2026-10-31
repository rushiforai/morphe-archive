package com.fyber.inneractive.sdk.flow;

import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes3.dex */
public abstract class x {

    /* renamed from: a, reason: collision with root package name */
    public InneractiveAdRequest f28437a;

    /* renamed from: b, reason: collision with root package name */
    public com.fyber.inneractive.sdk.response.e f28438b;

    /* renamed from: c, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.config.global.r f28439c;

    /* renamed from: d, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.config.x0 f28440d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f28441e = false;

    /* renamed from: f, reason: collision with root package name */
    public boolean f28442f = false;

    public x(com.fyber.inneractive.sdk.config.x0 x0Var, com.fyber.inneractive.sdk.config.global.r rVar) {
        this.f28440d = x0Var;
        this.f28439c = rVar;
    }

    public com.fyber.inneractive.sdk.web.v0 a() {
        return null;
    }

    public boolean b() {
        com.fyber.inneractive.sdk.config.x0 x0Var = this.f28440d;
        if (x0Var == null) {
            IAlog.f("%s : isFullscreenAd() called with unit config null", IAlog.a(this));
            return false;
        }
        return false;
    }

    public boolean c() {
        return false;
    }

    public abstract boolean d();

    public abstract void destroy();

    public void e() {
    }

    public abstract boolean isVideoAd();

    public void a(String str) {
    }

    public boolean a(boolean z11, com.fyber.inneractive.sdk.util.g gVar) {
        return false;
    }
}
