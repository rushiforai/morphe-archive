package com.fyber.inneractive.sdk.measurement;

import android.content.Context;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.network.f0;
import com.fyber.inneractive.sdk.network.v0;
import com.fyber.inneractive.sdk.util.IAlog;

/* loaded from: classes.dex */
public final class e {

    /* renamed from: b, reason: collision with root package name */
    public String f28503b;

    /* renamed from: c, reason: collision with root package name */
    public String f28504c;

    /* renamed from: d, reason: collision with root package name */
    public String f28505d;

    /* renamed from: e, reason: collision with root package name */
    public un.i f28506e;

    /* renamed from: a, reason: collision with root package name */
    public boolean f28502a = false;

    /* renamed from: f, reason: collision with root package name */
    public final com.fyber.inneractive.sdk.measurement.tracker.f f28507f = new com.fyber.inneractive.sdk.measurement.tracker.f();

    /* renamed from: g, reason: collision with root package name */
    public final a f28508g = new a(this);

    /* renamed from: h, reason: collision with root package name */
    public final b f28509h = new b(this);

    /* renamed from: i, reason: collision with root package name */
    public final c f28510i = new c(this);

    public static void a(e eVar, Context context) {
        eVar.getClass();
        a(context, "https://cdn2.inner-active.mobi/client/ia-js-tags/omsdk/1.5.4-Fyber.js", "omid-latest.js", eVar.f28508g);
        a(context, "https://cdn2.inner-active.mobi/client/ia-js-tags/omsdk/omid-session-client-1.5.4-Fyber.js", "omid-session-client-latest.js", eVar.f28509h);
        a(context, "https://cdn2.inner-active.mobi/client/ia-js-tags/omsdk/dt-omsdk-mraid-video-tracker.js", "dt-omsdk-mraid-video-tracker.js", eVar.f28510i);
    }

    public static void a(Context context, String str, String str2, f0 f0Var) {
        IAlog.d("%s- Loading URL: %s", IAlog.a(e.class), str);
        IAConfigManager.Q.f27759s.a(new v0(f0Var, context, new com.fyber.inneractive.sdk.cache.g(str, str2)));
    }
}
