package com.fyber.inneractive.sdk.flow;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import com.fyber.inneractive.sdk.config.enums.UnitDisplayType;
import com.fyber.inneractive.sdk.external.InneractiveAdRequest;
import com.fyber.inneractive.sdk.external.InneractiveErrorCode;
import com.fyber.inneractive.sdk.external.InneractiveInfrastructureError;
import com.fyber.inneractive.sdk.ui.IAmraidWebViewController;
import com.fyber.inneractive.sdk.util.IAlog;
import org.json.JSONException;

/* loaded from: classes3.dex */
public final class s extends k {

    /* renamed from: m, reason: collision with root package name */
    public IAmraidWebViewController f28279m;
    public final q n = new q(this);

    @Override // com.fyber.inneractive.sdk.flow.k, com.fyber.inneractive.sdk.interfaces.b
    public final void a() throws JSONException {
        IAmraidWebViewController iAmraidWebViewController;
        un.b bVar;
        IAlog.a("%s : IAMraidContentLoader : destroyController", IAlog.a(this));
        if (this.f28166c != null && (iAmraidWebViewController = this.f28279m) != null) {
            com.fyber.inneractive.sdk.measurement.tracker.e eVar = iAmraidWebViewController.I;
            if (eVar != null && (bVar = eVar.f28527a) != null) {
                try {
                    bVar.c();
                } catch (Throwable unused) {
                }
                com.fyber.inneractive.sdk.util.r.f31216b.postDelayed(new com.fyber.inneractive.sdk.measurement.tracker.c(eVar), 1000);
                eVar.f28527a = null;
                eVar.f28528b = null;
            }
            this.f28279m.e();
            this.f28279m = null;
        }
        super.a();
    }

    @Override // com.fyber.inneractive.sdk.flow.k, com.fyber.inneractive.sdk.interfaces.c
    public final void cancel() {
        IAmraidWebViewController iAmraidWebViewController;
        un.b bVar;
        IAlog.a("%s : IAMraidContentLoader : destroyController", IAlog.a(this));
        if (this.f28166c != null && (iAmraidWebViewController = this.f28279m) != null) {
            com.fyber.inneractive.sdk.measurement.tracker.e eVar = iAmraidWebViewController.I;
            if (eVar != null && (bVar = eVar.f28527a) != null) {
                try {
                    bVar.c();
                } catch (Throwable unused) {
                }
                com.fyber.inneractive.sdk.util.r.f31216b.postDelayed(new com.fyber.inneractive.sdk.measurement.tracker.c(eVar), 1000);
                eVar.f28527a = null;
                eVar.f28528b = null;
            }
            this.f28279m.e();
            this.f28279m = null;
        }
        this.f28174k.a();
        IAlog.a("%s: IAAdContentLoaderImpl : cancel load ad content retry task", IAlog.a(this));
        com.fyber.inneractive.sdk.util.r.f31216b.removeCallbacks(this.f28175l);
        this.f28164a = null;
        this.f28166c = null;
        this.f28167d = null;
        this.f28168e = null;
        this.f28169f = null;
    }

    @Override // com.fyber.inneractive.sdk.flow.k
    public final InneractiveInfrastructureError d() {
        com.fyber.inneractive.sdk.network.timeouts.content.a aVar = this.f28173j;
        if (aVar != null) {
            int i5 = this.f28172i;
            if (aVar.f28797g) {
                i5 = aVar.f28791a - i5;
            }
            i = (i5 == aVar.f28791a ? aVar.f28798h : 0) + (aVar.f28792b * i5) + aVar.f28794d;
        }
        return new InneractiveInfrastructureError(InneractiveErrorCode.LOAD_TIMEOUT, i.WEBVIEW_LOAD_TIMEOUT, new Exception(b.c0.i(i, "LoadTimeout after ", " ms")));
    }

    @Override // com.fyber.inneractive.sdk.flow.k
    public final String e() {
        return "send_failed_display_creatives";
    }

    @Override // com.fyber.inneractive.sdk.flow.k
    public final void g() throws JSONException {
        com.fyber.inneractive.sdk.web.z zVar;
        String str;
        InneractiveAdRequest inneractiveAdRequest = this.f28164a;
        q0 q0Var = new q0(inneractiveAdRequest == null ? this.f28169f : inneractiveAdRequest.getSelectedUnitConfig(), this.f28170g);
        this.f28166c = q0Var;
        com.fyber.inneractive.sdk.response.e eVar = this.f28165b;
        q0Var.f28438b = (com.fyber.inneractive.sdk.response.f) eVar;
        q0Var.f28442f = this.f28171h;
        UnitDisplayType unitDisplayType = eVar != null ? ((com.fyber.inneractive.sdk.response.f) eVar).n : null;
        com.fyber.inneractive.sdk.web.c0 c0Var = com.fyber.inneractive.sdk.web.c0.INLINE;
        if (unitDisplayType == null) {
            this.n.a(null, new InneractiveInfrastructureError(InneractiveErrorCode.SDK_INTERNAL_ERROR, i.EMPTY_UNIT_DISPLAY_TYPE, new Exception("Unit display type was not found")));
            return;
        }
        int i5 = r.f28278a[unitDisplayType.ordinal()];
        if (i5 == 1 || i5 == 2) {
            zVar = com.fyber.inneractive.sdk.web.z.ENABLED;
            InneractiveAdRequest inneractiveAdRequest2 = this.f28164a;
            if (inneractiveAdRequest2 == null || inneractiveAdRequest2.getAllowFullscreen()) {
                c0Var = com.fyber.inneractive.sdk.web.c0.INTERSTITIAL;
            }
        } else {
            zVar = com.fyber.inneractive.sdk.web.z.ENABLED;
        }
        com.fyber.inneractive.sdk.web.c0 c0Var2 = c0Var;
        com.fyber.inneractive.sdk.web.z zVar2 = zVar;
        com.fyber.inneractive.sdk.response.e eVar2 = this.f28165b;
        boolean z11 = (eVar2 == null || (str = ((com.fyber.inneractive.sdk.response.f) eVar2).M) == null || str.contains("iaNotifyLoadFinished")) ? false : true;
        IAConfigManager iAConfigManager = IAConfigManager.Q;
        boolean z12 = !unitDisplayType.isFullscreenUnit() || iAConfigManager.f27761u.f27936b.a(true, "use_fraud_detection_fullscreen");
        try {
            com.fyber.inneractive.sdk.web.d0 d0Var = com.fyber.inneractive.sdk.web.d0.AD_CONTROLLED;
            Boolean boolC = ((com.fyber.inneractive.sdk.config.global.features.m) iAConfigManager.N.a(com.fyber.inneractive.sdk.config.global.features.m.class)).c("enable");
            boolean zBooleanValue = boolC != null ? boolC.booleanValue() : false;
            IAlog.a("OMSDK AB %s", String.valueOf(zBooleanValue));
            IAmraidWebViewController iAmraidWebViewController = new IAmraidWebViewController(z12, c0Var2, zVar2, d0Var, z11, zBooleanValue ? iAConfigManager.L : null, this.f28170g);
            this.f28279m = iAmraidWebViewController;
            iAmraidWebViewController.setAdContent(this.f28166c);
            this.f28279m.setAdRequest(this.f28164a);
            IAmraidWebViewController iAmraidWebViewController2 = this.f28279m;
            q0 q0Var2 = (q0) this.f28166c;
            q0Var2.getClass();
            iAmraidWebViewController2.setMuteMraidVideo(iAConfigManager.f27754l || q0Var2.f28442f);
            ((q0) this.f28166c).f28277i = this.f28279m;
            com.fyber.inneractive.sdk.response.e eVar3 = this.f28165b;
            if (eVar3 != null) {
                UnitDisplayType unitDisplayType2 = ((com.fyber.inneractive.sdk.response.f) eVar3).n;
                InneractiveAdRequest inneractiveAdRequest3 = this.f28164a;
                boolean z13 = inneractiveAdRequest3 == null || inneractiveAdRequest3.getAllowFullscreen();
                StringBuilder sb2 = new StringBuilder();
                if (unitDisplayType2 != null && unitDisplayType2.isFullscreenUnit() && !z13) {
                    sb2.append("<script type=\"text/javascript\">  var IaCloseBtnHelper = (function initIaCloseBtnHelper(){    var styleContent = '.celtra-close-button {display:none !important;} .close-button {display:none !important;}';    function getStyle(doc){      var style = doc.createElement('style');      style.type = 'text/css';      if (style.styleSheet){        style.styleSheet.cssText = styleContent;      } else {        style.appendChild(doc.createTextNode(styleContent));      }      return style;    }    function onDomReady(){      var iframes = window.document.getElementsByTagName('iframe'),          i = 0,          len = iframes && iframes.length || 0;      for(; i < len; ++i){        if(!iframes[i].src){          try {            iframes[i].contentDocument.body.appendChild(getStyle(iframes[i].contentDocument));          }catch(e){          }}}}    function registerWindowEvents(){      window.addEventListener('load', function onWindowLoad(){        window.removeEventListener('load', onWindowLoad);        onDomReady();      });    }    return {      init: function init(){        if(window.document.readyState != 'complete'){          registerWindowEvents();        }else{          onDomReady();        }}}})();  IaCloseBtnHelper.init();</script>");
                }
                String string = sb2.toString();
                StringBuilder sb3 = new StringBuilder();
                if (unitDisplayType2 != null && !unitDisplayType2.isFullscreenUnit()) {
                    if (unitDisplayType2 == UnitDisplayType.BANNER) {
                        sb3.append(" body {display: flex;} #iawrapper { position:unset !important; display: unset !important; } ");
                    } else {
                        sb3.append(" #iawrapper { position:unset !important; display: unset !important; }");
                    }
                }
                String string2 = sb3.toString();
                this.f28279m.setAutoplayMRAIDVideos(unitDisplayType.isFullscreenUnit() || UnitDisplayType.MRECT.equals(unitDisplayType));
                IAmraidWebViewController iAmraidWebViewController3 = this.f28279m;
                int i11 = com.fyber.inneractive.sdk.config.n.f27870a;
                String property = System.getProperty("ia.testEnvironmentConfiguration.name");
                String strE = TextUtils.isEmpty(property) ? "wv.inner-active.mobi/simpleM2M/" : b.c0.E(property, ".inner-active.mobi/simpleM2M/");
                String str2 = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b + ((com.fyber.inneractive.sdk.response.f) this.f28165b).M;
                iAmraidWebViewController3.f31308f = this.n;
                try {
                    iAmraidWebViewController3.h();
                    com.fyber.inneractive.sdk.web.e eVar4 = new com.fyber.inneractive.sdk.web.e(iAmraidWebViewController3, str2, true, string, string2, strE);
                    iAmraidWebViewController3.o = eVar4;
                    eVar4.a().post(new com.fyber.inneractive.sdk.util.c(eVar4));
                } catch (Throwable th2) {
                    InneractiveInfrastructureError inneractiveInfrastructureError = new InneractiveInfrastructureError(InneractiveErrorCode.SDK_INTERNAL_ERROR, i.COULD_NOT_CONFIGURE_WEBVIEW, th2);
                    com.fyber.inneractive.sdk.web.g gVar = iAmraidWebViewController3.f31308f;
                    if (gVar != null) {
                        gVar.a(iAmraidWebViewController3, inneractiveInfrastructureError);
                    }
                    iAmraidWebViewController3.b(true);
                }
            }
        } catch (Throwable th3) {
            b(new InneractiveInfrastructureError(InneractiveErrorCode.SDK_INTERNAL_ERROR, i.COULD_NOT_CREATE_WEBVIEW_CONTROLLER, th3));
        }
    }
}
