package com.fyber.inneractive.sdk.flow.nativead.mainasset;

import com.fyber.inneractive.sdk.config.global.r;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import com.fyber.inneractive.sdk.external.InneractiveInfrastructureError;
import com.fyber.inneractive.sdk.flow.i;
import com.fyber.inneractive.sdk.flow.t0;
import com.fyber.inneractive.sdk.flow.u;
import com.fyber.inneractive.sdk.flow.x;
import com.fyber.inneractive.sdk.player.s;
import com.fyber.inneractive.sdk.response.g;
import com.fyber.inneractive.sdk.util.IAlog;
import org.json.JSONException;

/* loaded from: classes3.dex */
public final class f implements d, s {

    /* renamed from: a, reason: collision with root package name */
    public final r f28227a;

    /* renamed from: b, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.response.nativead.f f28228b;

    /* renamed from: c, reason: collision with root package name */
    public g f28229c;

    /* renamed from: d, reason: collision with root package name */
    public InneractiveAdRequest f28230d;

    /* renamed from: e, reason: collision with root package name */
    public c f28231e;

    /* renamed from: g, reason: collision with root package name */
    public com.fyber.inneractive.sdk.flow.nativead.b f28233g = com.fyber.inneractive.sdk.flow.nativead.b.UNINITIALIZED;

    /* renamed from: f, reason: collision with root package name */
    public u f28232f = new u();

    public f(com.fyber.inneractive.sdk.response.nativead.f fVar, r rVar, g gVar, InneractiveAdRequest inneractiveAdRequest, String str, com.fyber.inneractive.sdk.flow.nativead.f fVar2) {
        this.f28228b = fVar;
        this.f28227a = rVar;
        this.f28229c = gVar;
        this.f28230d = inneractiveAdRequest;
        this.f28231e = fVar2;
    }

    @Override // com.fyber.inneractive.sdk.player.s
    public final void a(InneractiveInfrastructureError inneractiveInfrastructureError) throws JSONException {
        InneractiveInfrastructureError inneractiveInfrastructureError2 = new InneractiveInfrastructureError(inneractiveInfrastructureError.getErrorCode(), i.NATIVE_AD_VIDEO_LOAD_FAILED);
        this.f28233g = com.fyber.inneractive.sdk.flow.nativead.b.FAILED;
        c cVar = this.f28231e;
        if (cVar != null) {
            ((com.fyber.inneractive.sdk.flow.nativead.f) cVar).a(inneractiveInfrastructureError2, "onAdFailedToLoad");
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.nativead.c
    public final void b() throws JSONException {
        com.fyber.inneractive.sdk.response.nativead.f fVar;
        com.fyber.inneractive.sdk.response.nativead.e eVar;
        String str;
        g gVar;
        if (this.f28232f != null && (fVar = this.f28228b) != null && (eVar = fVar.f31076c) != null && (str = eVar.f31073a) != null && !str.trim().isEmpty() && (gVar = this.f28229c) != null) {
            this.f28233g = com.fyber.inneractive.sdk.flow.nativead.b.LOADING;
            this.f28232f.a(this.f28227a, gVar, this.f28230d, this);
            return;
        }
        InneractiveInfrastructureError inneractiveInfrastructureError = new InneractiveInfrastructureError(InneractiveErrorCode.SDK_INTERNAL_ERROR, i.VIDEO_ERROR_NULL);
        this.f28233g = com.fyber.inneractive.sdk.flow.nativead.b.FAILED;
        c cVar = this.f28231e;
        if (cVar != null) {
            ((com.fyber.inneractive.sdk.flow.nativead.f) cVar).a(inneractiveInfrastructureError, "mVideoContentLoader is null, can't start loading");
        }
        IAlog.b("%smVideoContentLoader is null, can't start loading", IAlog.a(this));
    }

    @Override // com.fyber.inneractive.sdk.player.s
    public final void c() throws Throwable {
        u uVar;
        this.f28233g = com.fyber.inneractive.sdk.flow.nativead.b.LOADED;
        c cVar = this.f28231e;
        if (cVar == null || (uVar = this.f28232f) == null) {
            IAlog.b("%sCan't notify success, required member is null in onAdLoaded. Is null: mLoadListener: %s, mVideoContentLoader: %s", IAlog.a(this), Boolean.valueOf(this.f28231e == null), Boolean.valueOf(this.f28232f == null));
            return;
        }
        t0 t0Var = (t0) uVar.f28166c;
        com.fyber.inneractive.sdk.flow.nativead.f fVar = (com.fyber.inneractive.sdk.flow.nativead.f) cVar;
        if (t0Var == null) {
            fVar.a(new InneractiveInfrastructureError(InneractiveErrorCode.NATIVE_AD_FAILED_TO_LOAD, i.NATIVE_AD_EMPTY_CONTENT), "Undetectable main media");
        } else {
            fVar.f28191e = t0Var;
            fVar.a();
        }
    }

    @Override // com.fyber.inneractive.sdk.flow.nativead.c
    public final void destroy() {
        u uVar = this.f28232f;
        if (uVar != null) {
            x xVar = uVar.f28166c;
            if (xVar != null) {
                ((t0) xVar).destroy();
            }
            u uVar2 = this.f28232f;
            uVar2.getClass();
            IAlog.a("%s: IAAdContentLoaderImpl : cancel load ad content retry task", IAlog.a(uVar2));
            com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(uVar2.f28175l);
            uVar2.f28174k.a();
            this.f28232f = null;
        }
        this.f28231e = null;
        this.f28230d = null;
        this.f28229c = null;
        this.f28233g = com.fyber.inneractive.sdk.flow.nativead.b.DESTROYED;
    }

    @Override // com.fyber.inneractive.sdk.flow.nativead.c
    public final boolean a() {
        return this.f28233g == com.fyber.inneractive.sdk.flow.nativead.b.LOADING;
    }
}
