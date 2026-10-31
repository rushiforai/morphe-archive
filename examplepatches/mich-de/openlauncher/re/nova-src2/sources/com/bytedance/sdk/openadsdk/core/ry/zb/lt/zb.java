package com.bytedance.sdk.openadsdk.core.ry.zb.lt;

import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import com.bytedance.adsdk.ugeno.core.ok;
import com.bytedance.adsdk.ugeno.lud;
import com.bytedance.adsdk.ugeno.zb.sya;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class zb extends com.bytedance.adsdk.ugeno.zb.ycx<ycx> {

    /* renamed from: nc, reason: collision with root package name */
    private int f26017nc;

    /* renamed from: qt, reason: collision with root package name */
    private int f26018qt;

    /* renamed from: te, reason: collision with root package name */
    private JSONArray f26019te;

    public zb(Context context) {
        super(context);
        this.f26018qt = 0;
        this.f26017nc = 0;
    }

    private void dj() throws JSONException {
        for (int i5 = 0; i5 < ((com.bytedance.adsdk.ugeno.zb.ycx) this).ycx.size(); i5++) {
            sya<View> syaVar = ((com.bytedance.adsdk.ugeno.zb.ycx) this).ycx.get(i5);
            if (syaVar != null) {
                ok okVar = new ok(this.f22701zb);
                okVar.ycx(this.f22677py);
                ((ycx) this.lud).ycx(okVar.ycx(syaVar.rmf(), this.f22655dj, (JSONObject) null));
            }
        }
    }

    private void sya() {
        List<sya<View>> list = ((com.bytedance.adsdk.ugeno.zb.ycx) this).ycx;
        if (list == null || list.isEmpty()) {
            return;
        }
        sya<View> syaVar = ((com.bytedance.adsdk.ugeno.zb.ycx) this).ycx.get(0);
        if (this.f26019te == null) {
            return;
        }
        for (int i5 = 0; i5 < this.f26019te.length(); i5++) {
            ok okVar = new ok(this.f22701zb);
            okVar.ycx(this.f22677py);
            try {
                JSONObject jSONObjectOptJSONObject = this.f26019te.optJSONObject(i5);
                if (jSONObjectOptJSONObject != null) {
                    if (jSONObjectOptJSONObject.has("$chunk")) {
                        this.f22655dj.put("$item", jSONObjectOptJSONObject.optJSONArray("$chunk"));
                    } else {
                        this.f22655dj.put("$item", jSONObjectOptJSONObject);
                    }
                    ((ycx) this.lud).ycx(okVar.ycx(syaVar.rmf(), this.f22655dj, (JSONObject) null));
                }
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJqyI1a2FOJH7RmSOIkkQY=", "bskemQq4bPGJT8BqhRWnLU8=", "SesjkQauT8iSbtZJjTWyIU3r", 159);
            }
        }
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [T extends android.view.View, android.view.View] */
    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public View ycx() {
        try {
            ycx ycxVar = new ycx(this.f22701zb);
            this.lud = ycxVar;
            ycxVar.ycx((lud) this);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+yqQDfJqyI1a2FOJH7RmSOIkkQY=", "bskemQq4bPGJT8BqhRWnLU8=", "WPwolBe5X86FXQ==", 59);
            this.lud = new View(this.f22701zb);
        }
        return this.lud;
    }

    @Override // com.bytedance.adsdk.ugeno.zb.ycx, com.bytedance.adsdk.ugeno.zb.sya
    public void zb() throws JSONException {
        super.zb();
        T t6 = this.lud;
        if (t6 instanceof ycx) {
            ((ycx) t6).setOrientation(this.f26018qt);
            ((ycx) this.lud).ycx(this);
            if (this.f26017nc == 1) {
                dj();
            } else {
                sya();
            }
        }
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void ycx(String str, String str2) {
        super.ycx(str, str2);
        if (TextUtils.isEmpty(str)) {
            return;
        }
        str.getClass();
        switch (str) {
            case "driveMode":
                this.f26017nc = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0);
                break;
            case "direction":
                if (TextUtils.equals(str2, "vertical")) {
                    this.f26018qt = 1;
                    break;
                } else {
                    this.f26018qt = 0;
                    break;
                }
            case "dataList":
                this.f26019te = com.bytedance.adsdk.ugeno.fby.zb.ycx(str2, (JSONArray) null);
                break;
        }
    }

    @Override // com.bytedance.adsdk.ugeno.zb.ycx
    public void ycx(sya syaVar) {
        if (syaVar == null) {
            return;
        }
        ((com.bytedance.adsdk.ugeno.zb.ycx) this).ycx.add(syaVar);
    }

    @Override // com.bytedance.adsdk.ugeno.zb.ycx
    public void ycx(sya syaVar, ViewGroup.LayoutParams layoutParams) {
        if (syaVar == null) {
            return;
        }
        ((com.bytedance.adsdk.ugeno.zb.ycx) this).ycx.add(syaVar);
    }
}
