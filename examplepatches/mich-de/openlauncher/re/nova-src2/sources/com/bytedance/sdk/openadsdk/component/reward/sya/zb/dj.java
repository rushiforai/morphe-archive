package com.bytedance.sdk.openadsdk.component.reward.sya.zb;

import android.app.Activity;
import android.os.SystemClock;
import android.view.View;
import com.bytedance.sdk.component.utils.htf;
import com.bytedance.sdk.openadsdk.core.model.tn;
import java.util.concurrent.atomic.AtomicBoolean;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class dj {

    /* renamed from: dj, reason: collision with root package name */
    private tn f24946dj;
    private String lud;
    private Activity sya;
    private final com.bytedance.sdk.openadsdk.component.reward.sya.zb ycx;

    /* renamed from: zb, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.component.reward.sya.ycx f24949zb;

    /* renamed from: lt, reason: collision with root package name */
    private final AtomicBoolean f24947lt = new AtomicBoolean(false);

    /* renamed from: ul, reason: collision with root package name */
    private long f24948ul = 0;

    public dj(com.bytedance.sdk.openadsdk.component.reward.sya.zb zbVar, Activity activity, tn tnVar, String str) {
        this.ycx = zbVar;
        this.sya = activity;
        this.f24946dj = tnVar;
        this.lud = str;
    }

    public long zb() {
        return this.f24948ul;
    }

    public void ycx(com.bytedance.sdk.openadsdk.component.reward.sya.ycx ycxVar) {
        this.f24949zb = ycxVar;
    }

    public boolean ycx() {
        return this.f24947lt.get();
    }

    public void ycx(final JSONObject jSONObject) {
        if (!this.f24947lt.get() && this.f24947lt.compareAndSet(false, true)) {
            final View viewFindViewById = this.sya.findViewById(16908290);
            if (viewFindViewById == null) {
                viewFindViewById = this.sya.getWindow().getDecorView();
            }
            viewFindViewById.post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.component.reward.sya.zb.dj.1
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        JSONObject jSONObject2 = jSONObject;
                        if (jSONObject2 == null) {
                            jSONObject2 = new JSONObject();
                        }
                        JSONObject jSONObject3 = new JSONObject();
                        jSONObject3.put("width", viewFindViewById.getWidth());
                        jSONObject3.put("height", viewFindViewById.getHeight());
                        jSONObject3.put("alpha", viewFindViewById.getAlpha());
                        jSONObject2.put("root_view", jSONObject3.toString());
                        jSONObject2.put("dynamic_show_type", dj.this.f24946dj.tx());
                    } catch (Throwable th2) {
                        com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCBK4hXfdjmAKyaMCFWA==", "buAkkxqObNePWMNwjR+hL178acQ=", "Sfsj", 86);
                        htf.ycx("UnifyReportManager", "run: ", th2);
                    }
                    dj.this.ycx(jSONObject, (JSONObject) null);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ycx(JSONObject jSONObject, JSONObject jSONObject2) {
        com.bytedance.sdk.openadsdk.dj.sya.ycx(this.f24946dj, this.lud, jSONObject, jSONObject2);
        com.bytedance.sdk.openadsdk.component.reward.sya.ycx ycxVar = this.f24949zb;
        if (ycxVar != null) {
            ycxVar.zb();
        }
    }

    public void ycx(boolean z11, com.bytedance.sdk.openadsdk.dj.ul ulVar) {
        if (this.ycx == null) {
            return;
        }
        if (!z11 && this.f24947lt.get() && this.f24948ul > 0) {
            com.bytedance.sdk.openadsdk.dj.sya.ycx(String.valueOf(SystemClock.elapsedRealtime() - this.f24948ul), this.f24946dj, this.lud, ulVar);
            this.f24948ul = 0L;
        } else {
            this.f24948ul = SystemClock.elapsedRealtime();
        }
    }

    public void ycx(boolean z11, tn tnVar, String str) {
        if (tnVar != null && z11 && tnVar.mqm() && !tnVar.bhi()) {
            tnVar.ul(true);
            com.bytedance.sdk.openadsdk.dj.sya.ycx(tnVar, str, tnVar.wqq());
        }
    }
}
