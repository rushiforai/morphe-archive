package com.bytedance.sdk.component.adexpress.lud;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.MutableContextWrapper;
import android.text.TextUtils;
import android.webkit.WebView;
import androidx.recyclerview.widget.n0;
import com.bytedance.sdk.component.jw.fby;
import com.bytedance.sdk.component.utils.bhi;
import com.bytedance.sdk.component.utils.htf;
import com.vungle.ads.internal.protos.Sdk;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: classes2.dex */
public class lud {
    private static int fby = 10;

    /* renamed from: jw, reason: collision with root package name */
    private static volatile lud f23638jw = null;

    /* renamed from: lt, reason: collision with root package name */
    private static int f23639lt = 10;
    private static final byte[] lud = new byte[0];

    /* renamed from: ul, reason: collision with root package name */
    private final AtomicBoolean f23641ul = new AtomicBoolean(false);
    private List<fby> ycx = new ArrayList();

    /* renamed from: zb, reason: collision with root package name */
    private List<fby> f23642zb = new ArrayList();
    private Map<Integer, sya> sya = new HashMap();

    /* renamed from: dj, reason: collision with root package name */
    private Map<Integer, dj> f23640dj = new HashMap();

    private lud() {
        com.bytedance.sdk.component.adexpress.ycx.ycx.sya syaVarSya = com.bytedance.sdk.component.adexpress.ycx.ycx.ycx.ycx().sya();
        if (syaVarSya != null) {
            f23639lt = syaVarSya.jc();
            fby = syaVarSya.ea();
        }
    }

    private void jw(fby fbyVar) {
        if (fbyVar == null) {
            return;
        }
        if (bhi.zb(fbyVar.getScene())) {
            bhi.ycx(fbyVar);
            return;
        }
        if (this.ycx.size() >= f23639lt) {
            try {
                Context context = fbyVar.getContext();
                if (context instanceof MutableContextWrapper) {
                    ((MutableContextWrapper) context).setBaseContext(context.getApplicationContext());
                }
                fbyVar.dy();
                return;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ+woJc3lib", "bOsvowq5fvePRds=", "S/s5", 285);
                th2.getMessage();
                return;
            }
        }
        if (this.ycx.contains(fbyVar)) {
            return;
        }
        try {
            Context context2 = fbyVar.getContext();
            if (context2 instanceof MutableContextWrapper) {
                ((MutableContextWrapper) context2).setBaseContext(context2.getApplicationContext());
                fbyVar.setRecycler(true);
                this.ycx.add(fbyVar);
                sya();
            }
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ+woJc3lib", "bOsvowq5fvePRds=", "S/s5", 298);
            sya();
            th3.getMessage();
        }
    }

    public static lud ycx() {
        if (f23638jw == null) {
            synchronized (lud.class) {
                try {
                    if (f23638jw == null) {
                        f23638jw = new lud();
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
        }
        return f23638jw;
    }

    public void dj(fby fbyVar) {
        if (fbyVar == null) {
            return;
        }
        bhi.sya(fbyVar);
        fbyVar.b_("SDK_INJECT_GLOBAL");
        ul(fbyVar);
        sya(fbyVar);
    }

    public void fby(fby fbyVar) {
        WebView webView;
        sya syaVar;
        htf.ycx("WebViewPool", "updateTTAndroidObject: express jsb recycle webview will not remove javascript interfaceSDK_INJECT_GLOBAL");
        if (fbyVar == null || (webView = fbyVar.getWebView()) == null || (syaVar = this.sya.get(Integer.valueOf(webView.hashCode()))) == null) {
            return;
        }
        syaVar.ycx(null);
    }

    public boolean lt(fby fbyVar) {
        if (fbyVar == null) {
            return false;
        }
        try {
            ul(fbyVar);
            Context context = fbyVar.getContext();
            if (context instanceof MutableContextWrapper) {
                ((MutableContextWrapper) context).setBaseContext(context.getApplicationContext());
            }
            fbyVar.dy();
            return true;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ+woJc3lib", "bOsvowq5fvePRds=", "WuwsmwezZw==", Sdk.SDKError.Reason.AD_CLOSED_TEMPLATE_ERROR_VALUE);
            th2.getMessage();
            return true;
        }
    }

    public void lud(fby fbyVar) {
        if (fbyVar == null) {
            return;
        }
        bhi.sya(fbyVar);
        fbyVar.b_("SDK_INJECT_GLOBAL");
        ul(fbyVar);
        jw(fbyVar);
    }

    public void sya(fby fbyVar) {
        if (fbyVar == null) {
            return;
        }
        if (bhi.zb(fbyVar.getScene())) {
            bhi.ycx(fbyVar);
            return;
        }
        if (this.f23642zb.size() >= fby) {
            try {
                Context context = fbyVar.getContext();
                if (context instanceof MutableContextWrapper) {
                    ((MutableContextWrapper) context).setBaseContext(context.getApplicationContext());
                }
                fbyVar.dy();
                return;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ+woJc3lib", "bOsvowq5fvePRds=", "S/s5swyuR8KXb9lahR+l", 191);
                th2.getMessage();
                return;
            }
        }
        if (this.f23642zb.contains(fbyVar)) {
            return;
        }
        try {
            Context context2 = fbyVar.getContext();
            if (context2 instanceof MutableContextWrapper) {
                ((MutableContextWrapper) context2).setBaseContext(context2.getApplicationContext());
                fbyVar.setRecycler(true);
                this.f23642zb.add(fbyVar);
                dj();
            }
        } catch (Throwable th3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ+woJc3lib", "bOsvowq5fvePRds=", "S/s5swyuR8KXb9lahR+l", Sdk.SDKError.Reason.AD_ALREADY_LOADED_VALUE);
            dj();
            th3.getMessage();
        }
    }

    public void ul(fby fbyVar) {
        WebView webView;
        if (fbyVar == null || (webView = fbyVar.getWebView()) == null) {
            return;
        }
        sya syaVar = this.sya.get(Integer.valueOf(webView.hashCode()));
        if (syaVar != null) {
            syaVar.ycx(null);
        }
        htf.ycx("WebViewPool", "unRegisterJavascriptInterface: express jsb recycle webview will remove javascript interfaceSDK_INJECT_GLOBAL");
        fbyVar.b_("SDK_INJECT_GLOBAL");
    }

    public void zb(fby fbyVar) {
        if (fbyVar == null) {
            return;
        }
        bhi.dj(fbyVar);
        fby(fbyVar);
        if (bhi.zb(fbyVar.getScene())) {
            bhi.zb(fbyVar);
            return;
        }
        try {
            Context context = fbyVar.getContext();
            if (context instanceof MutableContextWrapper) {
                ((MutableContextWrapper) context).setBaseContext(context.getApplicationContext());
            }
            fbyVar.dy();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ+woJc3lib", "bOsvowq5fvePRds=", "SesujACwbOGPWOJThRe5H1L6JbsMjmzKj1zSd78z", Sdk.SDKError.Reason.INVALID_CONFIG_RESPONSE_VALUE);
            th2.getMessage();
        }
    }

    public int dj() {
        return this.f23642zb.size();
    }

    public fby ycx(Context context, String str) {
        fby.sya syaVar = fby.sya.ADS_V4;
        if (!bhi.zb(syaVar)) {
            return null;
        }
        if (!com.bytedance.sdk.component.adexpress.dj.lud.ycx(str) || bhi.ycx(syaVar) > 1) {
            return bhi.ycx(context, null, 0, syaVar);
        }
        return null;
    }

    public void ycx(fby fbyVar) {
        if (fbyVar == null) {
            return;
        }
        bhi.sya(fbyVar);
        fbyVar.b_("SDK_INJECT_GLOBAL");
        ul(fbyVar);
        if (bhi.zb(fbyVar.getScene())) {
            bhi.ycx(fbyVar);
            return;
        }
        try {
            Context context = fbyVar.getContext();
            if (context instanceof MutableContextWrapper) {
                ((MutableContextWrapper) context).setBaseContext(context.getApplicationContext());
            }
            fbyVar.dy();
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ+woJc3lib", "bOsvowq5fvePRds=", "SesujACwbOGPWOJThRe5", 111);
            th2.getMessage();
        }
    }

    public fby zb(Context context, String str) {
        fby.sya syaVar = fby.sya.ADS_V3;
        if (bhi.zb(syaVar)) {
            if (!com.bytedance.sdk.component.adexpress.dj.lud.ycx(str) || bhi.ycx(syaVar) > 1) {
                return bhi.ycx(context, null, 0, syaVar);
            }
            return null;
        }
        if (dj() <= 0) {
            return null;
        }
        if (com.bytedance.sdk.component.adexpress.dj.lud.ycx(str) && dj() <= 1) {
            dj();
            return null;
        }
        fby fbyVarRemove = this.f23642zb.remove(0);
        if (fbyVarRemove == null) {
            return null;
        }
        try {
            Context context2 = fbyVarRemove.getContext();
            if (!(context2 instanceof MutableContextWrapper)) {
                return fbyVarRemove;
            }
            ((MutableContextWrapper) context2).setBaseContext(context.getApplicationContext());
            fbyVarRemove.setRecycler(false);
            dj();
            return fbyVarRemove;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ+woJc3lib", "bOsvowq5fvePRds=", "Wu08gAqubOGPWPlYmzSuL1LgKA==", 168);
            dj();
            return null;
        }
    }

    public fby sya(Context context, String str) {
        fby.sya syaVar = fby.sya.ADS;
        if (bhi.zb(syaVar)) {
            if (!com.bytedance.sdk.component.adexpress.dj.lud.ycx(str) || bhi.ycx(syaVar) > 1) {
                return bhi.ycx(context, null, 0, syaVar);
            }
            return null;
        }
        if (sya() <= 0) {
            return null;
        }
        if (com.bytedance.sdk.component.adexpress.dj.lud.ycx(str) && sya() <= 1) {
            sya();
            return null;
        }
        fby fbyVarRemove = this.ycx.remove(0);
        if (fbyVarRemove == null) {
            return null;
        }
        try {
            Context context2 = fbyVarRemove.getContext();
            if (!(context2 instanceof MutableContextWrapper)) {
                return fbyVarRemove;
            }
            ((MutableContextWrapper) context2).setBaseContext(context.getApplicationContext());
            fbyVarRemove.setRecycler(false);
            sya();
            return fbyVarRemove;
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ+woJc3lib", "bOsvowq5fvePRds=", "Wu08gAqubA==", n0.DEFAULT_SWIPE_ANIMATION_DURATION);
            sya();
            return null;
        }
    }

    @SuppressLint({"JavascriptInterface"})
    public void ycx(fby fbyVar, zb zbVar) {
        WebView webView;
        if (fbyVar == null || zbVar == null || (webView = fbyVar.getWebView()) == null) {
            return;
        }
        sya syaVar = this.sya.get(Integer.valueOf(webView.hashCode()));
        if (syaVar != null) {
            syaVar.ycx(zbVar);
        } else {
            syaVar = new sya(zbVar);
            this.sya.put(Integer.valueOf(webView.hashCode()), syaVar);
        }
        htf.ycx("WebViewPool", "registerJavascriptInterface: express jsb recycle webview will register javascript interface every timeSDK_INJECT_GLOBAL");
        fbyVar.ycx(syaVar, "SDK_INJECT_GLOBAL");
    }

    public void zb() {
        for (fby fbyVar : this.ycx) {
            if (fbyVar != null) {
                try {
                    Context context = fbyVar.getContext();
                    if (context instanceof MutableContextWrapper) {
                        ((MutableContextWrapper) context).setBaseContext(context.getApplicationContext());
                    }
                    fbyVar.dy();
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ+woJc3lib", "bOsvowq5fvePRds=", "WOIolBE=", 332);
                    th2.getMessage();
                }
            }
        }
        this.ycx.clear();
        for (fby fbyVar2 : this.f23642zb) {
            if (fbyVar2 != null) {
                try {
                    Context context2 = fbyVar2.getContext();
                    if (context2 instanceof MutableContextWrapper) {
                        ((MutableContextWrapper) context2).setBaseContext(context2.getApplicationContext());
                    }
                    fbyVar2.dy();
                } catch (Throwable th3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJ+woJc3lib", "bOsvowq5fvePRds=", "WOIolBE=", 347);
                    th3.getMessage();
                }
            }
        }
        this.f23642zb.clear();
    }

    @SuppressLint({"JavascriptInterface"})
    public void ycx(WebView webView, com.bytedance.sdk.component.ycx.htf htfVar, String str) {
        if (webView == null || htfVar == null || TextUtils.isEmpty(str)) {
            return;
        }
        dj djVar = this.f23640dj.get(Integer.valueOf(webView.hashCode()));
        if (djVar != null) {
            djVar.ycx(htfVar);
        } else {
            djVar = new dj(htfVar);
            this.f23640dj.put(Integer.valueOf(webView.hashCode()), djVar);
        }
        htf.ycx("WebViewPool", "registerJavascriptInterfaceForJsB2: jsb 3.0 register javascript interface every time".concat(String.valueOf(str)));
        webView.addJavascriptInterface(djVar, str);
    }

    public int sya() {
        return this.ycx.size();
    }

    public void ycx(WebView webView, String str) {
        htf.ycx("WebViewPool", "unRegisterJavascriptInterfaceForJsB2: jsb 3.0 recycle webview will remove javascript interface".concat(String.valueOf(str)));
        if (webView == null || TextUtils.isEmpty(str)) {
            return;
        }
        dj djVar = this.f23640dj.get(Integer.valueOf(webView.hashCode()));
        if (djVar != null) {
            djVar.ycx(null);
        }
        webView.removeJavascriptInterface(str);
    }

    public void ycx(int i5) {
        synchronized (lud) {
            f23639lt = i5;
        }
    }

    @SuppressLint({"JavascriptInterface"})
    public void zb(fby fbyVar, zb zbVar) {
        WebView webView;
        if (fbyVar == null || zbVar == null || (webView = fbyVar.getWebView()) == null) {
            return;
        }
        sya syaVar = this.sya.get(Integer.valueOf(webView.hashCode()));
        if (syaVar != null) {
            htf.ycx("WebViewPool", "registerOnceJavascriptInterface: express jsb recycle webview will not register javascript interface in reuse webviewSDK_INJECT_GLOBAL");
            syaVar.ycx(zbVar);
        } else {
            sya syaVar2 = new sya(zbVar);
            this.sya.put(Integer.valueOf(webView.hashCode()), syaVar2);
            htf.ycx("WebViewPool", "registerOnceJavascriptInterface: express jsb recycle webview will register once javascript interfaceSDK_INJECT_GLOBAL");
            fbyVar.ycx(syaVar2, "SDK_INJECT_GLOBAL");
        }
    }

    public void zb(WebView webView, com.bytedance.sdk.component.ycx.htf htfVar, String str) {
        if (webView == null || htfVar == null || TextUtils.isEmpty(str)) {
            return;
        }
        dj djVar = this.f23640dj.get(Integer.valueOf(webView.hashCode()));
        if (djVar != null) {
            htf.ycx("WebViewPool", "registerOnceJavascriptInterfaceForJsB2: jsb 3.0 will not register javascript interface in reuse webview".concat(String.valueOf(str)));
            djVar.ycx(htfVar);
        } else {
            htf.ycx("WebViewPool", "registerOnceJavascriptInterfaceForJsB2: jsb 3.0 register once javascript interface in created webview".concat(String.valueOf(str)));
            dj djVar2 = new dj(htfVar);
            this.f23640dj.put(Integer.valueOf(webView.hashCode()), djVar2);
            webView.addJavascriptInterface(djVar2, str);
        }
    }

    public void zb(WebView webView, String str) {
        dj djVar;
        htf.ycx("WebViewPool", "updateWebViewBridge: jsb 3.0 recycle webview will not remove javascript interface".concat(String.valueOf(str)));
        if (webView == null || TextUtils.isEmpty(str) || (djVar = this.f23640dj.get(Integer.valueOf(webView.hashCode()))) == null) {
            return;
        }
        djVar.ycx(null);
    }

    public void zb(int i5) {
        synchronized (lud) {
            fby = i5;
        }
    }
}
