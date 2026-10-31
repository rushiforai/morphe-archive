package com.bytedance.sdk.component.utils;

import android.content.Context;
import android.content.MutableContextWrapper;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.webkit.WebSettings;
import android.webkit.WebView;
import com.bytedance.sdk.component.jw.fby;
import com.bytedance.sdk.component.utils.tn;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.concurrent.ConcurrentHashMap;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class bhi {
    private static boolean sya;
    private static final ConcurrentHashMap<String, ycx> ycx = new ConcurrentHashMap<>();

    /* renamed from: zb, reason: collision with root package name */
    private static boolean f24099zb;

    public static void dj(com.bytedance.sdk.component.jw.fby fbyVar) {
        if (fbyVar == null) {
            return;
        }
        try {
            fbyVar.removeAllViews();
            fbyVar.fby();
            fbyVar.setWebChromeClient(null);
            fbyVar.setWebViewClient(null);
            fbyVar.setDownloadListener(null);
            fbyVar.setJavaScriptEnabled(true);
            fbyVar.setCacheMode(-1);
            fbyVar.setSupportZoom(false);
            fbyVar.setUseWideViewPort(true);
            fbyVar.setJavaScriptCanOpenWindowsAutomatically(true);
            fbyVar.setDomStorageEnabled(true);
            fbyVar.setBuiltInZoomControls(false);
            fbyVar.setLayoutAlgorithm(WebSettings.LayoutAlgorithm.NORMAL);
            fbyVar.setLoadWithOverviewMode(false);
            fbyVar.setDefaultTextEncodingName("UTF-8");
            fbyVar.setDefaultFontSize(16);
            WebView webView = fbyVar.getWebView();
            if (webView instanceof com.bytedance.sdk.component.jw.lt) {
                ((com.bytedance.sdk.component.jw.lt) webView).sya();
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "bOsvowq5fuiCQNJemDCsJFTtLIEMrno=", "Ses+kBeLbMW2Q9JKuxi0IHXhH5AOs3/Cqnn1", 325);
        }
    }

    public static void sya(com.bytedance.sdk.component.jw.fby fbyVar) {
        if (fbyVar == null) {
            return;
        }
        try {
            fbyVar.removeAllViews();
            fbyVar.fby();
            fbyVar.setWebChromeClient(null);
            fbyVar.setWebViewClient(null);
            fbyVar.setDownloadListener(null);
            fbyVar.setJavaScriptEnabled(true);
            fbyVar.setCacheMode(-1);
            fbyVar.setSupportZoom(false);
            fbyVar.setUseWideViewPort(true);
            fbyVar.setJavaScriptCanOpenWindowsAutomatically(true);
            fbyVar.setDomStorageEnabled(true);
            fbyVar.setBuiltInZoomControls(false);
            fbyVar.setLayoutAlgorithm(WebSettings.LayoutAlgorithm.NORMAL);
            fbyVar.setLoadWithOverviewMode(false);
            fbyVar.setDefaultTextEncodingName("UTF-8");
            fbyVar.setDefaultFontSize(16);
            fbyVar.xkz();
            WebView webView = fbyVar.getWebView();
            if (webView instanceof com.bytedance.sdk.component.jw.lt) {
                ((com.bytedance.sdk.component.jw.lt) webView).zb();
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "bOsvowq5fuiCQNJemDCsJFTtLIEMrno=", "Ses+kBeLbMW2Q9JK", 288);
        }
    }

    public static com.bytedance.sdk.component.jw.fby ycx(Context context, AttributeSet attributeSet, int i5, fby.sya syaVar) {
        WebView webViewYcx = ycx(context, attributeSet, i5, syaVar, false);
        if (webViewYcx == null) {
            return null;
        }
        com.bytedance.sdk.component.jw.fby fbyVar = new com.bytedance.sdk.component.jw.fby(context, true, syaVar);
        fbyVar.setWebView(webViewYcx);
        fbyVar.lt();
        return fbyVar;
    }

    public static WebView zb(Context context, AttributeSet attributeSet, int i5, fby.sya syaVar) {
        return ycx(context, attributeSet, i5, syaVar, true);
    }

    public static void zb(com.bytedance.sdk.component.jw.fby fbyVar) {
        WebView webView;
        if (fbyVar == null || (webView = fbyVar.getWebView()) == null) {
            return;
        }
        ycx ycxVar = ycx.get(fbyVar.getScene().f23797dy);
        if (ycxVar == null || !ycxVar.ycx(webView)) {
            ycx(webView);
        } else {
            dj(fbyVar);
        }
    }

    private static WebView ycx(Context context, AttributeSet attributeSet, int i5, fby.sya syaVar, boolean z11) {
        WebView webViewZb;
        ycx ycxVar;
        if (syaVar == null || attributeSet != null || i5 != 0 || (ycxVar = ycx.get(syaVar.f23797dy)) == null) {
            webViewZb = null;
        } else {
            webViewZb = ycxVar.zb();
            if (webViewZb != null) {
                if (webViewZb instanceof com.bytedance.sdk.component.jw.lt) {
                    ((com.bytedance.sdk.component.jw.lt) webViewZb).setRecycled(false);
                    if (ycx()) {
                        Context context2 = webViewZb.getContext();
                        if (context2 instanceof MutableContextWrapper) {
                            ((MutableContextWrapper) context2).setBaseContext(context);
                        }
                    }
                }
                htf.ycx("WebViewObjectAllocators", "obtain: reuse old webview, scene=" + syaVar.f23797dy + ", " + webViewZb);
                ycx(syaVar, false);
            }
        }
        if (webViewZb != null || !z11) {
            return webViewZb;
        }
        if (!(context instanceof MutableContextWrapper)) {
            context = new MutableContextWrapper(context);
        }
        ycx(syaVar, true);
        return i5 != 0 ? new com.bytedance.sdk.component.jw.lt(context, attributeSet, i5) : new com.bytedance.sdk.component.jw.lt(context, attributeSet);
    }

    public static boolean zb(fby.sya syaVar) {
        return (syaVar == null || ycx.get(syaVar.f23797dy) == null) ? false : true;
    }

    public static boolean zb() {
        return f24099zb;
    }

    public static class ycx {

        /* renamed from: dj, reason: collision with root package name */
        private final String f24101dj;
        private int lud;

        /* renamed from: zb, reason: collision with root package name */
        public final int f24102zb;
        public final HashSet<String> ycx = new HashSet<>();
        private final ArrayList<WebView> sya = new ArrayList<>();

        public ycx(String str, JSONObject jSONObject) {
            this.f24101dj = str;
            this.f24102zb = jSONObject.optInt("max_count");
            JSONArray jSONArrayOptJSONArray = jSONObject.optJSONArray("scene");
            if (jSONArrayOptJSONArray != null) {
                for (int i5 = 0; i5 < jSONArrayOptJSONArray.length(); i5++) {
                    String strOptString = jSONArrayOptJSONArray.optString(i5);
                    if (!TextUtils.isEmpty(strOptString)) {
                        this.ycx.add(strOptString);
                    }
                }
            }
            this.lud = jSONObject.optInt("reuse_max_count", this.lud);
        }

        public int sya() {
            return this.sya.size();
        }

        public String toString() {
            return super.toString();
        }

        public boolean ycx(WebView webView) {
            if (webView != null && this.sya.size() < this.f24102zb && !this.sya.contains(webView)) {
                Context context = webView.getContext();
                if (context instanceof MutableContextWrapper) {
                    ((MutableContextWrapper) context).setBaseContext(context.getApplicationContext());
                    if (webView instanceof com.bytedance.sdk.component.jw.lt) {
                        if (bhi.ycx()) {
                            com.bytedance.sdk.component.jw.lt ltVar = (com.bytedance.sdk.component.jw.lt) webView;
                            if (ltVar.ycx() || ltVar.dj() || (this.lud > 0 && ltVar.getReuseCount() >= this.lud)) {
                                return false;
                            }
                        }
                        ((com.bytedance.sdk.component.jw.lt) webView).setRecycled(true);
                    }
                    ViewParent parent = webView.getParent();
                    if (parent instanceof ViewGroup) {
                        ((ViewGroup) parent).removeView(webView);
                    }
                    this.sya.add(webView);
                    htf.ycx("WebViewObjectAllocators", "put: poolType=" + this.f24101dj + ", added " + webView + ", pool size is " + this.sya.size());
                    return true;
                }
            }
            return false;
        }

        public WebView zb() {
            if (this.sya.isEmpty()) {
                return null;
            }
            return this.sya.remove(0);
        }

        public HashSet<String> ycx() {
            return this.ycx;
        }
    }

    private static void ycx(final fby.sya syaVar, final boolean z11) {
        tn.ycx("webview_allocate", new tn.ycx() { // from class: com.bytedance.sdk.component.utils.bhi.1
            @Override // com.bytedance.sdk.component.utils.tn.ycx
            public JSONObject ycx() throws JSONException {
                JSONObject jSONObject = new JSONObject();
                try {
                    jSONObject.put("is_new", z11 ? 1 : 0);
                    jSONObject.put("scene", syaVar.f23797dy);
                    return jSONObject;
                } catch (JSONException e3) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "bOsvowq5fuiCQNJemDCsJFTtLIEMrnqD0Q==", "XOsjkBG9fcKqefhzoxOqLVj6HZQRvWTU", 140);
                    return jSONObject;
                }
            }
        });
    }

    public static void ycx(com.bytedance.sdk.component.jw.fby fbyVar) {
        WebView webView;
        if (fbyVar == null || (webView = fbyVar.getWebView()) == null) {
            return;
        }
        ycx ycxVar = ycx.get(fbyVar.getScene().f23797dy);
        if (ycxVar != null && ycxVar.ycx(webView)) {
            sya(fbyVar);
        } else {
            ycx(webView);
        }
    }

    private static void ycx(WebView webView) {
        if (webView == null) {
            return;
        }
        try {
            Context context = webView.getContext();
            if (context instanceof MutableContextWrapper) {
                ((MutableContextWrapper) context).setBaseContext(context.getApplicationContext());
            }
            webView.setWebChromeClient(null);
            webView.setWebViewClient(null);
            ViewParent parent = webView.getParent();
            if (parent instanceof ViewGroup) {
                ((ViewGroup) parent).removeView(webView);
            }
            webView.removeAllViews();
            webView.destroy();
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "bOsvowq5fuiCQNJemDCsJFTtLIEMrno=", "SeshkAKvbPCFSOFUiQY=", 211);
        }
    }

    public static void ycx(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        try {
            JSONObject jSONObject = new JSONObject(str);
            f24099zb = jSONObject.optBoolean("settings_unify", f24099zb);
            sya = jSONObject.optBoolean("reuse_opti", sya);
            JSONObject jSONObjectOptJSONObject = jSONObject.optJSONObject("pool_config");
            if (jSONObjectOptJSONObject != null) {
                Iterator<String> itKeys = jSONObjectOptJSONObject.keys();
                while (itKeys.hasNext()) {
                    String next = itKeys.next();
                    if (!TextUtils.isEmpty(next)) {
                        ycx ycxVar = new ycx(next, jSONObjectOptJSONObject.getJSONObject(next));
                        Iterator<String> it = ycxVar.ycx().iterator();
                        while (it.hasNext()) {
                            ycx.put(it.next(), ycxVar);
                        }
                    }
                }
            }
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE5kFqSRI", "bOsvowq5fuiCQNJemDCsJFTtLIEMrno=", "Tv4plBe5SsiOTN5a", 244);
        }
    }

    public static int ycx(fby.sya syaVar) {
        ycx ycxVar;
        if (syaVar == null || (ycxVar = ycx.get(syaVar.f23797dy)) == null) {
            return 0;
        }
        return ycxVar.sya();
    }

    public static boolean ycx() {
        return sya;
    }
}
