package com.fyber.inneractive.sdk.flow;

import android.os.Handler;
import android.os.HandlerThread;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import com.fyber.inneractive.sdk.external.InneractiveInfrastructureError;
import com.fyber.inneractive.sdk.util.IAlog;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import java.util.Arrays;
import java.util.Locale;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes3.dex */
public abstract class k implements com.fyber.inneractive.sdk.interfaces.c, com.fyber.inneractive.sdk.interfaces.b {

    /* renamed from: a, reason: collision with root package name */
    public InneractiveAdRequest f28164a;

    /* renamed from: b, reason: collision with root package name */
    public com.fyber.inneractive.sdk.response.e f28165b;

    /* renamed from: c, reason: collision with root package name */
    public x f28166c;

    /* renamed from: d, reason: collision with root package name */
    public com.fyber.inneractive.sdk.interfaces.a f28167d;

    /* renamed from: e, reason: collision with root package name */
    public com.fyber.inneractive.sdk.interfaces.b f28168e;

    /* renamed from: f, reason: collision with root package name */
    public com.fyber.inneractive.sdk.config.w0 f28169f;

    /* renamed from: g, reason: collision with root package name */
    public com.fyber.inneractive.sdk.config.global.r f28170g;

    /* renamed from: j, reason: collision with root package name */
    public com.fyber.inneractive.sdk.network.timeouts.content.a f28173j;

    /* renamed from: h, reason: collision with root package name */
    public boolean f28171h = false;

    /* renamed from: i, reason: collision with root package name */
    public int f28172i = 0;

    /* renamed from: l, reason: collision with root package name */
    public final j f28175l = new j(this);

    /* renamed from: k, reason: collision with root package name */
    public d f28174k = new d(this);

    public final void a(InneractiveAdRequest inneractiveAdRequest, com.fyber.inneractive.sdk.response.e eVar, com.fyber.inneractive.sdk.config.global.r rVar, com.fyber.inneractive.sdk.interfaces.a aVar, com.fyber.inneractive.sdk.interfaces.b bVar) throws JSONException {
        this.f28164a = inneractiveAdRequest;
        this.f28165b = eVar;
        this.f28167d = aVar;
        this.f28168e = bVar;
        this.f28174k = new d(this);
        this.f28170g = rVar;
        UnitDisplayType unitDisplayType = eVar.n;
        this.f28173j = new com.fyber.inneractive.sdk.network.timeouts.content.a((unitDisplayType == UnitDisplayType.INTERSTITIAL || unitDisplayType == UnitDisplayType.REWARDED || unitDisplayType == UnitDisplayType.NATIVE) ? unitDisplayType.name().toLowerCase(Locale.US) : UnitDisplayType.BANNER.name().toLowerCase(Locale.US), com.fyber.inneractive.sdk.response.a.a(eVar.f31048g) == com.fyber.inneractive.sdk.response.a.RETURNED_ADTYPE_VAST ? "video" : "display", (int) eVar.H, eVar.A, IAConfigManager.Q.f27755m, this.f28170g);
        if (this.f28164a == null) {
            this.f28169f = com.fyber.inneractive.sdk.config.a.a(eVar.f31054m);
        }
        try {
            h();
        } catch (Throwable th2) {
            IAlog.f("Failed to start ContentLoader", IAlog.a(this));
            com.fyber.inneractive.sdk.network.z.a(th2, inneractiveAdRequest, eVar);
            this.f28174k.a();
            b(new InneractiveInfrastructureError(InneractiveErrorCode.SDK_INTERNAL_ERROR, i.CONTENT_LOADER_START_FAILED));
        }
    }

    @Override // com.fyber.inneractive.sdk.interfaces.b
    public final void b() {
        String strA = IAlog.a(this);
        Integer numValueOf = Integer.valueOf(this.f28172i - 1);
        int i5 = this.f28172i - 1;
        com.fyber.inneractive.sdk.network.timeouts.content.a aVar = this.f28173j;
        if (aVar != null) {
            if (aVar.f28797g) {
                i5 = aVar.f28791a - i5;
            }
            i = (i5 == aVar.f28791a ? aVar.f28798h : 0) + (aVar.f28792b * i5) + aVar.f28794d;
        }
        IAlog.a("%s : IAAdContentLoaderImpl : onRetry() attempt: %d timeout: %d", strA, numValueOf, Integer.valueOf(i));
        com.fyber.inneractive.sdk.interfaces.b bVar = this.f28168e;
        if (bVar != null) {
            bVar.b();
        }
        h();
    }

    public void c() {
        f();
    }

    @Override // com.fyber.inneractive.sdk.interfaces.c
    public abstract void cancel();

    public InneractiveInfrastructureError d() {
        i iVar = i.WEBVIEW_LOAD_TIMEOUT;
        com.fyber.inneractive.sdk.response.e eVar = this.f28165b;
        if ("video".equalsIgnoreCase((eVar == null || com.fyber.inneractive.sdk.response.a.a(eVar.f31048g) != com.fyber.inneractive.sdk.response.a.RETURNED_ADTYPE_VAST) ? "display" : "video")) {
            iVar = i.VIDEO_AD_LOAD_TIMEOUT;
        }
        return new InneractiveInfrastructureError(InneractiveErrorCode.LOAD_TIMEOUT, iVar);
    }

    public abstract String e();

    public final void f() {
        String str;
        this.f28174k.a();
        InneractiveAdRequest inneractiveAdRequest = this.f28164a;
        if (inneractiveAdRequest != null) {
            str = inneractiveAdRequest.f28394b;
        } else {
            com.fyber.inneractive.sdk.response.e eVar = this.f28165b;
            if (eVar == null || (str = eVar.f31064y) == null) {
                str = null;
            }
        }
        com.fyber.inneractive.sdk.metrics.d.f28545d.a(str).i();
        x xVar = this.f28166c;
        if (xVar != null) {
            xVar.a(str);
        }
        com.fyber.inneractive.sdk.interfaces.a aVar = this.f28167d;
        if (aVar != null) {
            aVar.a(this.f28164a);
        }
    }

    public abstract void g();

    public final void h() {
        int i5 = this.f28172i;
        this.f28172i = i5 + 1;
        com.fyber.inneractive.sdk.network.timeouts.content.a aVar = this.f28173j;
        if (aVar != null) {
            if (aVar.f28797g) {
                i5 = aVar.f28791a - i5;
            }
            i = (i5 == aVar.f28791a ? aVar.f28798h : 0) + (aVar.f28792b * i5) + aVar.f28794d;
        }
        IAlog.a("%s : IAAdContentLoaderImpl : Start timeout: %d, attempt number: %d", IAlog.a(this), Integer.valueOf(i), Integer.valueOf(this.f28172i - 1));
        d dVar = this.f28174k;
        if (dVar.f28045a == null) {
            HandlerThread handlerThread = new HandlerThread("TimeoutHandlerThread");
            handlerThread.start();
            dVar.f28045a = new Handler(handlerThread.getLooper());
        }
        dVar.f28045a.postDelayed(dVar.f28048d, i);
        g();
    }

    public final void b(InneractiveInfrastructureError inneractiveInfrastructureError) throws JSONException {
        String string;
        IAlog.a("%s : IAAdContentLoaderImpl : Handle Retry for error: %s", IAlog.a(this), inneractiveInfrastructureError.getErrorCode().toString());
        d dVar = this.f28174k;
        dVar.getClass();
        IAlog.a("%s : ContentLoadTimeoutHandler stopping timeout handler", IAlog.a(dVar));
        Handler handler = dVar.f28045a;
        if (handler != null) {
            handler.removeCallbacks(dVar.f28048d);
        }
        com.fyber.inneractive.sdk.network.timeouts.content.a aVar = this.f28173j;
        boolean z11 = this.f28172i <= (aVar != null ? aVar.f28791a : 0);
        IAlog.a("%s : IAAdContentLoaderImpl : should retry: %s", IAlog.a(this), Boolean.valueOf(z11));
        if (z11) {
            x xVar = this.f28166c;
            if (xVar != null) {
                xVar.destroy();
                this.f28166c = null;
            }
            com.fyber.inneractive.sdk.network.timeouts.content.a aVar2 = this.f28173j;
            int i5 = aVar2 != null ? aVar2.f28795e : 0;
            IAlog.a("%s : IAAdContentLoaderImpl : retryLoad : post load ad content retry task with delay: %d", IAlog.a(this), Integer.valueOf(i5));
            com.fyber.inneractive.sdk.util.r.f31216b.postDelayed(this.f28175l, i5);
            return;
        }
        com.fyber.inneractive.sdk.interfaces.a aVar3 = this.f28167d;
        if (aVar3 != null) {
            aVar3.a(inneractiveInfrastructureError);
        }
        InneractiveAdRequest inneractiveAdRequest = this.f28164a;
        com.fyber.inneractive.sdk.response.e eVar = this.f28165b;
        com.fyber.inneractive.sdk.config.global.r rVar = this.f28170g;
        JSONArray jSONArrayB = rVar == null ? null : rVar.b();
        if (inneractiveInfrastructureError.getErrorCode() == InneractiveErrorCode.NATIVE_AD_FAILED_TO_LOAD) {
            com.fyber.inneractive.sdk.network.t tVar = com.fyber.inneractive.sdk.network.t.NATIVE_ERROR_FAILED_TO_LOAD_AD;
            if (!inneractiveInfrastructureError.isErrorAlreadyReported(tVar)) {
                IAlog.a("Firing Event 402 - NativeAdLoadFailed - errorCode - %s", inneractiveInfrastructureError.getErrorCode());
                JSONObject jSONObject = new JSONObject();
                com.fyber.inneractive.sdk.network.w wVar = new com.fyber.inneractive.sdk.network.w(eVar);
                wVar.f28819b = tVar;
                wVar.f28818a = inneractiveAdRequest;
                wVar.f28821d = jSONArrayB;
                if (inneractiveInfrastructureError.getCause() != null) {
                    string = Arrays.toString(inneractiveInfrastructureError.getCause().getStackTrace());
                } else {
                    StringBuilder sb2 = new StringBuilder();
                    StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
                    for (int i11 = 7; i11 >= 0 && i11 < 13 && i11 < stackTrace.length; i11++) {
                        sb2.append(stackTrace[i11].toString());
                        sb2.append(",");
                    }
                    string = sb2.toString();
                }
                String string2 = inneractiveInfrastructureError.getFyberMarketplaceAdLoadFailureReason().toString();
                try {
                    jSONObject.put(PglCryptUtils.KEY_MESSAGE, string2);
                } catch (Exception unused) {
                    IAlog.f("Got exception adding param to json object: %s, %s", PglCryptUtils.KEY_MESSAGE, string2);
                }
                try {
                    jSONObject.put(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, string);
                } catch (Exception unused2) {
                    IAlog.f("Got exception adding param to json object: %s, %s", TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, string);
                }
                String strDescription = inneractiveInfrastructureError.description();
                try {
                    jSONObject.put("extra_description", strDescription);
                } catch (Exception unused3) {
                    IAlog.f("Got exception adding param to json object: %s, %s", "extra_description", strDescription);
                }
                wVar.f28823f.put(jSONObject);
                wVar.a((String) null);
                inneractiveInfrastructureError.addReportedError(tVar);
            }
        } else {
            a.a(inneractiveAdRequest, inneractiveInfrastructureError, this.f28166c, eVar, jSONArrayB);
        }
        cancel();
    }

    @Override // com.fyber.inneractive.sdk.interfaces.b
    public void a() throws JSONException {
        int i5;
        InneractiveInfrastructureError inneractiveInfrastructureError;
        String strA = IAlog.a(this);
        Integer numValueOf = Integer.valueOf(this.f28172i - 1);
        int i11 = this.f28172i - 1;
        com.fyber.inneractive.sdk.network.timeouts.content.a aVar = this.f28173j;
        if (aVar != null) {
            if (aVar.f28797g) {
                i11 = aVar.f28791a - i11;
            }
            i5 = (aVar.f28792b * i11) + aVar.f28794d + (i11 == aVar.f28791a ? aVar.f28798h : 0);
        } else {
            i5 = 0;
        }
        IAlog.a("%s : IAAdContentLoaderImpl : onTimeout() attempt: %d timeout: %d", strA, numValueOf, Integer.valueOf(i5));
        com.fyber.inneractive.sdk.interfaces.b bVar = this.f28168e;
        if (bVar != null) {
            bVar.a();
        }
        com.fyber.inneractive.sdk.network.timeouts.content.a aVar2 = this.f28173j;
        if (this.f28172i <= (aVar2 != null ? aVar2.f28791a : 0)) {
            inneractiveInfrastructureError = d();
        } else {
            inneractiveInfrastructureError = new InneractiveInfrastructureError(InneractiveErrorCode.IN_FLIGHT_TIMEOUT, i.NO_TIME_TO_LOAD_AD_CONTENT);
        }
        com.fyber.inneractive.sdk.util.r.f31215a.execute(new e(new f(this.f28165b, this.f28164a, e(), this.f28170g.b()), inneractiveInfrastructureError));
        b(inneractiveInfrastructureError);
    }
}
