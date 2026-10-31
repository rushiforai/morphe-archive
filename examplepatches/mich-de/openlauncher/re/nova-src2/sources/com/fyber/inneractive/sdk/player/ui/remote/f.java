package com.fyber.inneractive.sdk.player.ui.remote;

import com.fyber.inneractive.sdk.ignite.m;
import com.fyber.inneractive.sdk.player.ui.o;
import com.fyber.inneractive.sdk.player.ui.s;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.HashMap;

/* loaded from: classes3.dex */
public final class f implements com.fyber.inneractive.sdk.web.remoteui.a {

    /* renamed from: a, reason: collision with root package name */
    public s f30718a;

    /* renamed from: h, reason: collision with root package name */
    public boolean f30725h;

    /* renamed from: b, reason: collision with root package name */
    public boolean f30719b = false;

    /* renamed from: c, reason: collision with root package name */
    public boolean f30720c = false;

    /* renamed from: d, reason: collision with root package name */
    public boolean f30721d = false;

    /* renamed from: e, reason: collision with root package name */
    public boolean f30722e = false;

    /* renamed from: f, reason: collision with root package name */
    public boolean f30723f = false;

    /* renamed from: g, reason: collision with root package name */
    public boolean f30724g = false;

    /* renamed from: i, reason: collision with root package name */
    public boolean f30726i = false;

    /* renamed from: j, reason: collision with root package name */
    public boolean f30727j = false;

    /* renamed from: k, reason: collision with root package name */
    public m f30728k = m.NONE;

    /* renamed from: l, reason: collision with root package name */
    public String f30729l = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;

    public f(o oVar) {
        this.f30718a = null;
        this.f30725h = false;
        this.f30718a = oVar;
        this.f30725h = oVar.I;
    }

    @Override // com.fyber.inneractive.sdk.web.remoteui.a
    public final void a(com.fyber.inneractive.sdk.network.events.b bVar, String str, boolean z11, HashMap map) {
        s sVar = this.f30718a;
        if (sVar == null) {
            IAlog.a("%s: showFallback: fallback won't be displayed because it is null", "RemoteUiFallbackHandler");
            return;
        }
        sVar.g(this.f30719b);
        this.f30718a.d(this.f30726i);
        this.f30718a.f(this.f30723f);
        this.f30718a.a(this.f30722e, this.f30728k);
        this.f30718a.c(this.f30725h);
        this.f30718a.a(this.f30727j, this.f30729l);
        this.f30718a.b(this.f30724g);
        this.f30718a.e(this.f30720c);
        this.f30718a.a(this.f30721d);
    }
}
