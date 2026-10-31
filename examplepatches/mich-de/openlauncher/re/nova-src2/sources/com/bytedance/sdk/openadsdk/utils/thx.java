package com.bytedance.sdk.openadsdk.utils;

import android.content.Context;
import android.content.MutableContextWrapper;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.ViewGroup;
import android.webkit.WebView;
import java.lang.ref.SoftReference;
import java.util.LinkedHashMap;
import java.util.Map;

/* loaded from: classes2.dex */
public class thx {
    private static int ycx;

    /* renamed from: zb, reason: collision with root package name */
    private static final LinkedHashMap<String, SoftReference<ycx>> f27175zb = new LinkedHashMap<String, SoftReference<ycx>>(ycx, 0.75f, true) { // from class: com.bytedance.sdk.openadsdk.utils.thx.1
        @Override // java.util.LinkedHashMap
        public boolean removeEldestEntry(Map.Entry<String, SoftReference<ycx>> entry) {
            ycx ycxVar;
            com.bytedance.sdk.component.jw.fby fbyVar;
            if (size() <= thx.ycx) {
                return false;
            }
            SoftReference<ycx> value = entry.getValue();
            if (value == null || (ycxVar = value.get()) == null || (fbyVar = ycxVar.ycx) == null) {
                return true;
            }
            try {
                com.bytedance.sdk.component.utils.bhi.ycx(fbyVar);
                return true;
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "d+8jkQqybveBTdJqiROWIV75DpQAtGzylEPbTshA", "SesgmhW5TMuET8RJqR+0OkI=", 81);
                entry.getKey();
                return true;
            }
        }
    };

    public static class ycx {
        com.bytedance.sdk.component.jw.fby ycx;

        /* renamed from: zb, reason: collision with root package name */
        Bundle f27176zb;

        public ycx(com.bytedance.sdk.component.jw.fby fbyVar, Bundle bundle) {
            this.ycx = fbyVar;
            this.f27176zb = bundle;
        }
    }

    private static void zb() {
        ycx ycxVar;
        com.bytedance.sdk.component.jw.fby fbyVar;
        synchronized (f27175zb) {
            while (true) {
                try {
                    LinkedHashMap<String, SoftReference<ycx>> linkedHashMap = f27175zb;
                    if (linkedHashMap.size() > ycx) {
                        SoftReference<ycx> softReferenceRemove = linkedHashMap.remove(linkedHashMap.keySet().iterator().next());
                        if (softReferenceRemove != null && (ycxVar = softReferenceRemove.get()) != null && (fbyVar = ycxVar.ycx) != null) {
                            try {
                                com.bytedance.sdk.component.utils.bhi.ycx(fbyVar);
                            } catch (Throwable th2) {
                                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "d+8jkQqybveBTdJqiROWIV75DpQAtGzylEPbTg==", "Tv4plBe5SsaDQtJuhQul", 62);
                            }
                        }
                    }
                } catch (Throwable th3) {
                    throw th3;
                }
                throw th3;
            }
        }
    }

    public static void ycx(com.bytedance.sdk.openadsdk.core.model.tn tnVar) {
        if (tnVar == null) {
            ycx = 0;
        } else {
            ycx = Math.max(0, tnVar.ul());
        }
        zb();
    }

    public static void ycx(String str, com.bytedance.sdk.component.jw.fby fbyVar, Bundle bundle) {
        if (ycx <= 0 || TextUtils.isEmpty(str) || fbyVar == null) {
            return;
        }
        LinkedHashMap<String, SoftReference<ycx>> linkedHashMap = f27175zb;
        synchronized (linkedHashMap) {
            try {
                ycx(fbyVar.getWebView());
                ycx(fbyVar, fbyVar.getContext());
                synchronized (linkedHashMap) {
                    linkedHashMap.put(str, new SoftReference<>(new ycx(fbyVar, bundle)));
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
        linkedHashMap.size();
    }

    public static com.bytedance.sdk.component.jw.fby ycx(Context context, String str) {
        com.bytedance.sdk.component.jw.fby fbyVar;
        if (ycx <= 0 || TextUtils.isEmpty(str)) {
            return null;
        }
        LinkedHashMap<String, SoftReference<ycx>> linkedHashMap = f27175zb;
        synchronized (linkedHashMap) {
            try {
                SoftReference<ycx> softReferenceRemove = linkedHashMap.remove(str);
                if (softReferenceRemove == null) {
                    return null;
                }
                ycx ycxVar = softReferenceRemove.get();
                if (ycxVar != null && (fbyVar = ycxVar.ycx) != null) {
                    ycx(fbyVar, context);
                    return ycxVar.ycx;
                }
                return null;
            } finally {
            }
        }
    }

    public static Bundle ycx(String str) {
        if (ycx <= 0 || TextUtils.isEmpty(str)) {
            return null;
        }
        LinkedHashMap<String, SoftReference<ycx>> linkedHashMap = f27175zb;
        synchronized (linkedHashMap) {
            try {
                SoftReference<ycx> softReference = linkedHashMap.get(str);
                if (softReference == null) {
                    return null;
                }
                ycx ycxVar = softReference.get();
                return ycxVar != null ? ycxVar.f27176zb : null;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    private static void ycx(com.bytedance.sdk.component.jw.fby fbyVar, Context context) {
        if (fbyVar == null || context == null) {
            return;
        }
        try {
            if (fbyVar.getContext() instanceof MutableContextWrapper) {
                ((MutableContextWrapper) fbyVar.getContext()).setBaseContext(context.getApplicationContext());
            }
        } catch (ClassCastException e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "d+8jkQqybveBTdJqiROWIV75DpQAtGzylEPbTg==", "WuongBCoXsKCfN5YmzKvJk/rNYE=", 168);
        }
        ViewGroup viewGroup = (ViewGroup) fbyVar.getParent();
        if (viewGroup != null) {
            try {
                viewGroup.removeView(fbyVar);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "d+8jkQqybveBTdJqiROWIV75DpQAtGzylEPbTg==", "WuongBCoXsKCfN5YmzKvJk/rNYE=", 176);
            }
        }
    }

    private static void ycx(WebView webView) {
        if (webView != null && ycx > 0) {
            try {
                webView.evaluateJavascript("[].forEach.call(document.querySelectorAll('audio,video'), function(audio) { try { audio.pause(); } catch(e) {} })", null);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE5kFqSRI", "d+8jkQqybveBTdJqiROWIV75DpQAtGzylEPbTg==", "S+84hgaRbMOJSw==", 194);
            }
        }
    }
}
