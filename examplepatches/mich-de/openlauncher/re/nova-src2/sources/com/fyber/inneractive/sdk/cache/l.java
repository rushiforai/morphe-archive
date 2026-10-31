package com.fyber.inneractive.sdk.cache;

import android.app.Application;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.v;
import com.fyber.inneractive.sdk.network.v0;
import com.fyber.inneractive.sdk.util.IAlog;
import java.util.concurrent.TimeUnit;

/* loaded from: classes3.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public long f27668a;

    /* renamed from: b, reason: collision with root package name */
    public String f27669b;

    /* renamed from: c, reason: collision with root package name */
    public String f27670c;

    /* renamed from: d, reason: collision with root package name */
    public String f27671d;

    /* renamed from: e, reason: collision with root package name */
    public String f27672e;

    public final void a() {
        if (TimeUnit.MILLISECONDS.toMinutes(System.currentTimeMillis() - this.f27668a) >= 60) {
            IAConfigManager iAConfigManager = IAConfigManager.Q;
            if (iAConfigManager.f27761u.f27936b.a(false, "use_js_inline")) {
                Application application = com.fyber.inneractive.sdk.util.o.f31210a;
                if (application == null) {
                    IAlog.f("fetchJS() failed context null", new Object[0]);
                    return;
                }
                this.f27668a = System.currentTimeMillis();
                v0 v0Var = new v0(new h(this), application, new g("https://cdn2.inner-active.mobi/client/ia-js-tags/dt-mraid-video-controller.js", "dt-mraid-video-controller.js"));
                IAlog.d("%s- Loading URL: %s", IAlog.a(this), "https://cdn2.inner-active.mobi/client/ia-js-tags/dt-mraid-video-controller.js");
                iAConfigManager.f27759s.a(v0Var);
                iAConfigManager.f27759s.a(new v0(new i(this), application, new g("https://cdn2.inner-active.mobi/IA-JSTag/Production/centering_v1.css", "centering_v1.css")));
                iAConfigManager.f27759s.a(new v0(new j(this), application, new g("https://cdn2.inner-active.mobi/IA-JSTag/Production/centering_v1.js", "centering_v1.js")));
                v vVar = iAConfigManager.f27761u;
                if (vVar == null || !vVar.f27936b.a(false, "dt_plbl")) {
                    return;
                }
                iAConfigManager.f27759s.a(new v0(new k(this), application, new g("https://cdn2.inner-active.mobi/client/ia-js-tags/playable_detect.js", "playable_detect.js")));
            }
        }
    }
}
