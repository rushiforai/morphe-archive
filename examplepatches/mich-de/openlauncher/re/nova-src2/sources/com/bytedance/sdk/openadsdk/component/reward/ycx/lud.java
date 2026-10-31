package com.bytedance.sdk.openadsdk.component.reward.ycx;

import android.app.Activity;
import android.content.Context;
import android.util.SparseArray;
import android.view.View;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.sya.sya;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class lud {

    /* renamed from: dj, reason: collision with root package name */
    private final Context f25091dj;

    /* renamed from: lt, reason: collision with root package name */
    private boolean f25092lt;
    private final Activity lud;
    private final String sya;
    com.bytedance.sdk.openadsdk.thx.ycx.ycx.sya ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final tn f25093zb;

    public interface ycx {
        void ycx(View view, float f11, float f12, float f13, float f14, SparseArray<sya.ycx> sparseArray, int i5, int i11, int i12);

        void ycx(String str, JSONObject jSONObject);
    }

    public lud(tn tnVar, String str, Context context, Activity activity) {
        this.f25093zb = tnVar;
        this.sya = str;
        this.f25091dj = context;
        this.lud = activity;
    }

    private void dj() {
        if (this.f25093zb.liq() == 4) {
            this.ycx = com.bytedance.sdk.openadsdk.thx.ycx.ycx.dj.ycx(this.f25091dj, this.sya);
        }
        if (this.ycx == null) {
            this.ycx = com.bytedance.sdk.openadsdk.thx.ycx.ycx.dj.ycx(this.lud, this.sya);
        }
    }

    public com.bytedance.sdk.openadsdk.thx.ycx.ycx.sya sya() {
        return this.ycx;
    }

    public void ycx() {
        if (this.f25092lt) {
            return;
        }
        this.f25092lt = true;
        dj();
    }

    public void zb() {
        com.bytedance.sdk.openadsdk.thx.ycx.ycx.sya syaVar = this.ycx;
        if (syaVar != null) {
            syaVar.ycx(this.f25093zb);
        }
    }

    public void ycx(View view, float f11, float f12, float f13, float f14, SparseArray<sya.ycx> sparseArray, int i5, int i11, int i12, ycx ycxVar) {
        if (this.ycx != null) {
            int id2 = view.getId();
            if (id2 == com.bytedance.sdk.openadsdk.utils.wie.f27236ul) {
                ycxVar.ycx("click_play_star_level", null);
                return;
            }
            if (id2 == com.bytedance.sdk.openadsdk.utils.wie.f27208lt) {
                ycxVar.ycx("click_play_star_nums", null);
                return;
            } else if (id2 == com.bytedance.sdk.openadsdk.utils.wie.lud) {
                ycxVar.ycx("click_play_source", null);
                return;
            } else {
                if (id2 == com.bytedance.sdk.openadsdk.utils.wie.f27190dj) {
                    ycxVar.ycx("click_play_logo", null);
                    return;
                }
                return;
            }
        }
        ycxVar.ycx(view, f11, f12, f13, f14, sparseArray, i5, i11, i12);
    }
}
