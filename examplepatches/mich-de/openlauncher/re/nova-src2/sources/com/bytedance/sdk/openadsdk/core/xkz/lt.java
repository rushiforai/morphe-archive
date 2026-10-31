package com.bytedance.sdk.openadsdk.core.xkz;

import android.os.Handler;
import android.util.Pair;
import android.view.View;
import android.webkit.WebView;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.google.android.gms.internal.consent_sdk.k0;
import com.iab.omid.library.bytedance2.adsession.FriendlyObstructionPurpose;
import com.vungle.ads.internal.protos.Sdk;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Set;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lt {
    final Set<Pair<View, FriendlyObstructionPurpose>> ycx = new HashSet();

    /* renamed from: zb, reason: collision with root package name */
    private ul f26425zb;

    private lt() {
        lud.ycx(pmi.ycx());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void fby() {
        ul ulVar = this.f26425zb;
        if (ulVar != null) {
            try {
                ulVar.sya();
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGFw==", "becoggK+YMuJXs5uiQKzIVTgAJQNvW7Ckg==", "XuAppgaves6PRP5TghSy", 241);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void lt() {
        if (this.f26425zb != null) {
            try {
                ycx((View) null, (FriendlyObstructionPurpose) null);
                this.f26425zb.zb();
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGFw==", "becoggK+YMuJXs5uiQKzIVTgAJQNvW7Ckg==", "SPoshxePbNSTQ9hTpR+uLUk=", 159);
            }
        }
    }

    private Handler lud() {
        return com.bytedance.sdk.component.utils.jw.zb();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ul() {
        ul ulVar = this.f26425zb;
        if (ulVar != null) {
            try {
                ulVar.dj();
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGFw==", "becoggK+YMuJXs5uiQKzIVTgAJQNvW7Ckg==", "T/wslgiVZNeST8ROhR6uAVXgKIc=", Sdk.SDKError.Reason.PLACEMENT_SLEEP_VALUE);
            }
        }
    }

    public void dj() {
        if (k0.G()) {
            fby();
        } else {
            lud().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.xkz.lt.7
                @Override // java.lang.Runnable
                public void run() {
                    lt.this.fby();
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb(WebView webView) {
        try {
            if (this.f26425zb == null) {
                this.f26425zb = fby.ycx(webView);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGFw==", "becoggK+YMuJXs5uiQKzIVTgAJQNvW7Ckg==", "WPwolBe5XsKCfN5YmyKlO0jnIpsqsmfCkg==", 80);
            htf.sya("createWebViewSession failed : ".concat(String.valueOf(th2)), new Object[0]);
            HashMap map = new HashMap();
            map.put("scene", "createWebViewSession");
            map.put(PglCryptUtils.KEY_MESSAGE, th2.getMessage());
            lud.ycx(map);
        }
    }

    public void sya() {
        if (k0.G()) {
            ul();
        } else {
            lud().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.xkz.lt.6
                @Override // java.lang.Runnable
                public void run() {
                    lt.this.ul();
                }
            });
        }
    }

    public static lt ycx() {
        return new lt();
    }

    public void ycx(final WebView webView) {
        if (webView == null || this.f26425zb != null) {
            return;
        }
        if (k0.G()) {
            zb(webView);
        } else {
            lud().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.xkz.lt.1
                @Override // java.lang.Runnable
                public void run() {
                    lt.this.zb(webView);
                }
            });
        }
    }

    public void zb() {
        if (k0.G()) {
            lt();
        } else {
            lud().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.xkz.lt.4
                @Override // java.lang.Runnable
                public void run() {
                    lt.this.lt();
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb(boolean z11, float f11) {
        if (this.f26425zb != null) {
            try {
                ycx((View) null, (FriendlyObstructionPurpose) null);
                this.f26425zb.ycx(z11, f11);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGFw==", "becoggK+YMuJXs5uiQKzIVTgAJQNvW7Ckg==", "SPoshxeKYMOFReRYnwKpJ1XHI5sGrg==", 186);
            }
        }
    }

    public void ycx(final View view, final tn tnVar) {
        if (this.f26425zb != null) {
            return;
        }
        com.bytedance.sdk.openadsdk.core.model.dj djVarQye = tnVar.qye();
        final Set<jc> setZb = djVarQye != null ? djVarQye.zb() : null;
        if (view == null || setZb == null) {
            return;
        }
        if (k0.G()) {
            ycx(view, setZb, tnVar);
        } else {
            lud().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.xkz.lt.3
                @Override // java.lang.Runnable
                public void run() {
                    lt.this.ycx(view, (Set<jc>) setZb, tnVar);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb(View view, FriendlyObstructionPurpose friendlyObstructionPurpose) {
        ul ulVar = this.f26425zb;
        try {
            if (ulVar == null) {
                if (view == null || friendlyObstructionPurpose == null) {
                    return;
                }
                this.ycx.add(new Pair<>(view, friendlyObstructionPurpose));
                return;
            }
            if (view != null && friendlyObstructionPurpose != null) {
                ulVar.ycx(view, friendlyObstructionPurpose);
            }
            if (this.ycx.size() > 0) {
                ulVar.ycx(this.ycx);
                this.ycx.clear();
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGFw==", "becoggK+YMuJXs5uiQKzIVTgAJQNvW7Ckg==", "SesqnBCobNWmWN5YghWsMXTsPoERqWrTiUXZdIIfpTo=", 284);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(View view, Set<jc> set, tn tnVar) {
        try {
            if (this.f26425zb == null) {
                this.f26425zb = fby.ycx(view, set);
                if (tnVar.wnd()) {
                    return;
                }
                com.bytedance.sdk.openadsdk.dj.sya.zb(tnVar, tnVar.lud(), "track_create", (JSONObject) null);
            }
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGFw==", "becoggK+YMuJXs5uiQKzIVTgAJQNvW7Ckg==", "WPwolBe5X86ET9huiQKzIVTgBJsNuXs=", 128);
            htf.sya("createVideoSession failed : ".concat(String.valueOf(th2)), new Object[0]);
            HashMap map = new HashMap();
            map.put("scene", "createVideoSession");
            map.put(PglCryptUtils.KEY_MESSAGE, th2.getMessage());
            lud.ycx(map);
        }
    }

    public void zb(long j11, boolean z11) {
        ul ulVar = this.f26425zb;
        if (ulVar != null) {
            try {
                ulVar.ycx(j11 / 1000.0f, z11);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGFw==", "becoggK+YMuJXs5uiQKzIVTgAJQNvW7Ckg==", "VOAbnAe5ZveST8dcnhSkAVXgKIc=", Sdk.SDKError.Reason.ASSET_FAILED_TO_DELETE_VALUE);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb(boolean z11) {
        ul ulVar = this.f26425zb;
        if (ulVar != null) {
            try {
                ulVar.ycx(z11);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGFw==", "becoggK+YMuJXs5uiQKzIVTgAJQNvW7Ckg==", "SOs5uBaobO6ORNJP", 336);
            }
        }
    }

    public void ycx(final boolean z11, final float f11) {
        if (k0.G()) {
            zb(z11, f11);
        } else {
            lud().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.xkz.lt.5
                @Override // java.lang.Runnable
                public void run() {
                    lt.this.zb(z11, f11);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void zb(int i5) {
        ul ulVar = this.f26425zb;
        if (ulVar != null) {
            try {
                ulVar.zb(i5);
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+CyGFw==", "becoggK+YMuJXs5uiQKzIVTgAJQNvW7Ckg==", "U+8jkQ+5X86ET9h4mhSuPHLgI5AR", 362);
            }
        }
    }

    public void ycx(final View view, final FriendlyObstructionPurpose friendlyObstructionPurpose) {
        if (k0.G()) {
            zb(view, friendlyObstructionPurpose);
        } else {
            lud().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.xkz.lt.8
                @Override // java.lang.Runnable
                public void run() {
                    lt.this.zb(view, friendlyObstructionPurpose);
                }
            });
        }
    }

    public void ycx(final long j11, final boolean z11) {
        if (k0.G()) {
            zb(j11, z11);
        } else {
            lud().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.xkz.lt.9
                @Override // java.lang.Runnable
                public void run() {
                    lt.this.zb(j11, z11);
                }
            });
        }
    }

    public void ycx(final boolean z11) {
        if (k0.G()) {
            zb(z11);
        } else {
            lud().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.xkz.lt.10
                @Override // java.lang.Runnable
                public void run() {
                    lt.this.zb(z11);
                }
            });
        }
    }

    public void ycx(final int i5) {
        if (k0.G()) {
            zb(i5);
        } else {
            lud().post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.core.xkz.lt.2
                @Override // java.lang.Runnable
                public void run() {
                    lt.this.zb(i5);
                }
            });
        }
    }
}
