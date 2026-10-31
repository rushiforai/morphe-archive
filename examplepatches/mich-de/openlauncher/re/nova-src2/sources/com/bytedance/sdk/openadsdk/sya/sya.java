package com.bytedance.sdk.openadsdk.sya;

import android.app.Activity;
import android.content.Context;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.FilterWord;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.rmf;
import com.bytedance.sdk.openadsdk.sya.dj;
import com.bytedance.sdk.openadsdk.sya.ok;
import com.vungle.ads.internal.protos.Sdk;
import java.util.List;

/* loaded from: classes2.dex */
public class sya implements rmf {

    /* renamed from: dj, reason: collision with root package name */
    private boolean f27021dj;
    private rmf.ycx lud;
    private dj sya;
    public ok ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final Context f27022zb;

    public sya(Context context, String str, List<FilterWord> list, tn tnVar) {
        this.f27022zb = context;
        ycx(str, list, tnVar);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dj() {
        Context context = this.f27022zb;
        if (!(context instanceof Activity) || ((Activity) context).isFinishing() || this.ycx.isShowing()) {
            return;
        }
        this.ycx.show();
    }

    private void ycx(String str, List<FilterWord> list, tn tnVar) {
        this.sya = new dj(this.f27022zb, str, list);
        ok okVar = new ok(this.f27022zb, this.sya.getDislikeManager());
        this.ycx = okVar;
        okVar.ycx(tnVar);
        this.ycx.ycx(new ok.ycx() { // from class: com.bytedance.sdk.openadsdk.sya.sya.1
            @Override // com.bytedance.sdk.openadsdk.sya.ok.ycx
            public void sya() {
                sya.this.ycx();
            }

            @Override // com.bytedance.sdk.openadsdk.sya.ok.ycx
            public void ycx() {
            }

            @Override // com.bytedance.sdk.openadsdk.sya.ok.ycx
            public void zb() {
                sya.this.ycx();
            }

            @Override // com.bytedance.sdk.openadsdk.sya.ok.ycx
            public void ycx(int i5, FilterWord filterWord, String str2) {
                sya.this.sya.onSuggestionSubmit(str2);
                sya.this.ycx();
            }
        });
        this.sya.ycx(new dj.ycx() { // from class: com.bytedance.sdk.openadsdk.sya.sya.2
            @Override // com.bytedance.sdk.openadsdk.sya.dj.ycx
            public void ycx() {
                sya.this.ycx(true);
                if (sya.this.sya != null && sya.this.sya.isShowing()) {
                    sya.this.sya.hide();
                }
                sya.this.dj();
            }

            @Override // com.bytedance.sdk.openadsdk.sya.dj.ycx
            public void zb() {
                try {
                    if (sya.this.lud != null) {
                        sya.this.lud.ycx();
                    }
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4gYsyRS5Sg=", "b9oMkSe1esuJQdJ0gQGsbAk=", "VOAJnBCwYMyFbt5OgRizOw==", Sdk.SDKError.Reason.OMSDK_DOWNLOAD_JS_ERROR_VALUE);
                    htf.ycx("TTAdDislikeImpl", "dislike callback cancel error: ", th2);
                }
            }

            @Override // com.bytedance.sdk.openadsdk.sya.dj.ycx
            public void ycx(int i5, FilterWord filterWord) {
                try {
                    if (!filterWord.hasSecondOptions() && sya.this.lud != null) {
                        sya.this.lud.ycx(i5, filterWord.getName());
                    }
                    filterWord.getName();
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE4gYsyRS5Sg=", "b9oMkSe1esuJQdJ0gQGsbAk=", "VOAJnBCwYMyFedJRiRK0LV8=", 108);
                }
            }
        });
    }

    public boolean sya() {
        return this.f27021dj;
    }

    @Override // com.bytedance.sdk.openadsdk.core.rmf
    public void zb() {
        dj djVar = this.sya;
        if (djVar != null) {
            djVar.destroy();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.core.rmf
    public void ycx() {
        Context context = this.f27022zb;
        if (!(context instanceof Activity) || ((Activity) context).isFinishing() || this.sya.isShowing()) {
            return;
        }
        this.sya.show();
    }

    @Override // com.bytedance.sdk.openadsdk.core.rmf
    public void ycx(rmf.ycx ycxVar) {
        this.lud = ycxVar;
    }

    public void ycx(boolean z11) {
        this.f27021dj = z11;
    }
}
