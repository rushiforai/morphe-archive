package com.fyber.inneractive.sdk.util;

import android.text.TextUtils;
import com.fyber.inneractive.sdk.config.IAConfigManager;
import java.io.IOException;

/* loaded from: classes3.dex */
public final class d implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ Object[] f31178a = null;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ com.fyber.inneractive.sdk.web.e f31179b;

    public d(com.fyber.inneractive.sdk.web.e eVar) {
        this.f31179b = eVar;
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0075  */
    /* JADX WARN: Removed duplicated region for block: B:21:0x0080  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x008e  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00ba  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00d5  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x00e6  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x0103  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x0150  */
    @Override // java.lang.Runnable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void run() throws IOException {
        boolean zA;
        String strB;
        com.fyber.inneractive.sdk.measurement.e eVar;
        com.fyber.inneractive.sdk.web.e eVar2 = this.f31179b;
        Object[] objArr = this.f31178a;
        eVar2.getClass();
        long jCurrentTimeMillis = System.currentTimeMillis();
        String string = eVar2.f31285g;
        if (eVar2.f31286h) {
            com.fyber.inneractive.sdk.web.i iVar = eVar2.f31290l;
            String str = eVar2.f31287i;
            String str2 = eVar2.f31288j;
            com.fyber.inneractive.sdk.web.i1 i1Var = (com.fyber.inneractive.sdk.web.i1) iVar;
            i1Var.getClass();
            StringBuilder sb2 = new StringBuilder("<html><title>DigitalTurbine Ad</title><head><link rel=\"icon\" href=\"data:,\">");
            boolean z11 = false;
            if (TextUtils.isEmpty(string)) {
                IAlog.a("loadHtml called with an empty HTML!", new Object[0]);
            } else if (i1Var.F) {
                String strB2 = o.b("ia_js_load_monitor.txt");
                if (!TextUtils.isEmpty(strB2)) {
                    sb2.append(strB2);
                    sb2.append("<script> window.iaPreCachedAd = true; </script>");
                    IAConfigManager iAConfigManager = IAConfigManager.Q;
                    zA = iAConfigManager.f27761u.f27936b.a(false, "use_js_inline");
                    if (zA || iAConfigManager.G.f27669b == null) {
                        sb2.append("<script src=\"https://cdn2.inner-active.mobi/client/ia-js-tags/dt-mraid-video-controller.js\"></script>");
                    } else {
                        sb2.append("<script type=\"text/javascript\">");
                        sb2.append(iAConfigManager.G.f27669b);
                        sb2.append("</script>");
                    }
                    if (!TextUtils.isEmpty(str)) {
                        sb2.append(str);
                    }
                    sb2.append("<script>var prevWindowOnError = window.onerror; window.onerror = function(err) {if (typeof prevWindowOnError === 'function') {prevWindowOnError.apply();} console.log('WINDOW.ONERROR Javascript Error: ' + err);};</script></head><style>body{text-align:center !important;margin:0;padding:0;}");
                    if (!TextUtils.isEmpty(str2)) {
                        sb2.append(str2);
                    }
                    sb2.append("</style><body id=\"iaBody\">");
                    if (i1Var.B && i1Var.m()) {
                        if (zA || iAConfigManager.G.f27670c == null) {
                            sb2.append("<link rel=\"stylesheet\" href=\"https://cdn2.inner-active.mobi/IA-JSTag/Production/centering_v1.css\">");
                        } else {
                            sb2.append("<style type=\"text/css\">");
                            sb2.append(iAConfigManager.G.f27670c);
                            sb2.append("</style>");
                        }
                        if (zA || iAConfigManager.G.f27671d == null) {
                            sb2.append("<script src=\"https://cdn2.inner-active.mobi/IA-JSTag/Production/centering_v1.js\"></script>");
                        } else {
                            sb2.append("<script type=\"text/javascript\">");
                            sb2.append(iAConfigManager.G.f27671d);
                            sb2.append("</script>");
                        }
                    }
                    strB = o.b("ia_mraid_bridge.txt");
                    if (!TextUtils.isEmpty(strB)) {
                        b.c0.C(sb2, "<div id='iaScriptBr' style='display:none;'>", strB, "</div>");
                        if (IAlog.f31163a >= 2) {
                            sb2.append("<script type=\"text/javascript\">window.mraidbridge.loggingEnabled = true;</script>");
                        }
                    }
                    sb2.append(string);
                    sb2.append("</body></html>");
                    eVar = i1Var.H;
                    if (eVar == null) {
                        com.fyber.inneractive.sdk.flow.x xVar = i1Var.f31319s;
                        if (xVar != null) {
                            com.fyber.inneractive.sdk.response.e eVar3 = xVar.f28438b;
                            if (eVar3 != null && eVar3.G) {
                                z11 = true;
                            }
                            String string2 = sb2.toString();
                            if (z11) {
                                StringBuilder sb3 = new StringBuilder();
                                if (!TextUtils.isEmpty(eVar.f28504c)) {
                                    sb3.append(eVar.f28504c);
                                }
                                if (!TextUtils.isEmpty(eVar.f28505d)) {
                                    sb3.append(eVar.f28505d);
                                }
                                string2 = p6.j.p(sb3.toString(), string2);
                            }
                            string = !TextUtils.isEmpty(eVar.f28503b) ? p6.j.p(eVar.f28503b, string2) : string2;
                        }
                    } else {
                        string = sb2.toString();
                    }
                }
            } else {
                sb2.append("<script> window.iaPreCachedAd = true; </script>");
                IAConfigManager iAConfigManager2 = IAConfigManager.Q;
                zA = iAConfigManager2.f27761u.f27936b.a(false, "use_js_inline");
                if (zA) {
                    sb2.append("<script src=\"https://cdn2.inner-active.mobi/client/ia-js-tags/dt-mraid-video-controller.js\"></script>");
                    if (!TextUtils.isEmpty(str)) {
                    }
                    sb2.append("<script>var prevWindowOnError = window.onerror; window.onerror = function(err) {if (typeof prevWindowOnError === 'function') {prevWindowOnError.apply();} console.log('WINDOW.ONERROR Javascript Error: ' + err);};</script></head><style>body{text-align:center !important;margin:0;padding:0;}");
                    if (!TextUtils.isEmpty(str2)) {
                    }
                    sb2.append("</style><body id=\"iaBody\">");
                    if (i1Var.B) {
                        if (zA) {
                            sb2.append("<link rel=\"stylesheet\" href=\"https://cdn2.inner-active.mobi/IA-JSTag/Production/centering_v1.css\">");
                            if (zA) {
                                sb2.append("<script src=\"https://cdn2.inner-active.mobi/IA-JSTag/Production/centering_v1.js\"></script>");
                            }
                        }
                    }
                    strB = o.b("ia_mraid_bridge.txt");
                    if (!TextUtils.isEmpty(strB)) {
                    }
                    sb2.append(string);
                    sb2.append("</body></html>");
                    eVar = i1Var.H;
                    if (eVar == null) {
                    }
                }
            }
            string = null;
        }
        com.fyber.inneractive.sdk.web.i iVar2 = eVar2.f31290l;
        iVar2.getClass();
        IAlog.a("%sbuild html string took %d msec", IAlog.a(iVar2), Long.valueOf(System.currentTimeMillis() - jCurrentTimeMillis));
        com.fyber.inneractive.sdk.web.e eVar4 = this.f31179b;
        if (eVar4.f31284f) {
            return;
        }
        eVar4.f31281c = new e(eVar4, string);
        eVar4.a().post(this.f31179b.f31281c);
    }
}
