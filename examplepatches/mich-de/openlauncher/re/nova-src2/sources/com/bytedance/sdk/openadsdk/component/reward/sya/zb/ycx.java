package com.bytedance.sdk.openadsdk.component.reward.sya.zb;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.bytedance.sdk.openadsdk.component.reward.sya.fby;
import com.bytedance.sdk.openadsdk.component.reward.sya.zb.zb;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.utils.dc;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class ycx {

    /* renamed from: dj, reason: collision with root package name */
    private zb f24969dj;
    private com.bytedance.sdk.openadsdk.core.lt.dj sya;
    private ViewGroup ycx;

    /* renamed from: zb, reason: collision with root package name */
    private Context f24970zb;

    public ycx(ViewGroup viewGroup, Context context) {
        this.ycx = viewGroup;
        this.f24970zb = context;
        lud();
    }

    private void lud() {
        int iZb = dc.zb(this.f24970zb, 24.0f);
        this.sya = com.bytedance.sdk.openadsdk.core.widget.ul.zb(this.f24970zb);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2);
        layoutParams.gravity = 8388661;
        layoutParams.topMargin = iZb;
        layoutParams.rightMargin = iZb;
        this.sya.setLayoutParams(layoutParams);
        this.sya.setVisibility(8);
        this.f24969dj = new zb();
        int iFby = fby.fby();
        this.f24969dj.ycx(iFby);
        this.f24969dj.zb(iFby);
    }

    public void dj() {
        zb zbVar = this.f24969dj;
        if (zbVar != null) {
            zbVar.zb();
        }
    }

    public void sya() {
        zb zbVar = this.f24969dj;
        if (zbVar != null) {
            zbVar.ycx();
        }
    }

    public void ycx() {
        ViewGroup viewGroup;
        com.bytedance.sdk.openadsdk.core.lt.dj djVar = this.sya;
        if (djVar == null || (viewGroup = this.ycx) == null) {
            return;
        }
        viewGroup.addView(djVar);
    }

    public void zb() {
        com.bytedance.sdk.openadsdk.core.lt.dj djVar = this.sya;
        if (djVar != null) {
            djVar.setVisibility(0);
        }
    }

    public void ycx(View.OnClickListener onClickListener) {
        com.bytedance.sdk.openadsdk.core.lt.dj djVar = this.sya;
        if (djVar != null) {
            djVar.setOnClickListener(onClickListener);
        }
    }

    public void ycx(zb.ycx ycxVar) {
        zb zbVar = this.f24969dj;
        if (zbVar != null) {
            zbVar.ycx(ycxVar);
        }
    }

    public void ycx(final tn tnVar) {
        if (tnVar == null) {
            return;
        }
        com.bytedance.sdk.openadsdk.dy.dj.ycx("unify_web_close_backup", false, new com.bytedance.sdk.openadsdk.dy.zb() { // from class: com.bytedance.sdk.openadsdk.component.reward.sya.zb.ycx.1
            @Override // com.bytedance.sdk.openadsdk.dy.zb
            public com.bytedance.sdk.openadsdk.dy.ycx.sya ycx() throws Exception {
                JSONObject jSONObject = new JSONObject();
                if (tnVar.nc() != null) {
                    jSONObject.put("tpl_id", tnVar.nc().ycx());
                }
                jSONObject.put("aid", tnVar.m147if());
                jSONObject.put("cid", tnVar.zr());
                jSONObject.put("req_id", tnVar.ac());
                return com.bytedance.sdk.openadsdk.dy.ycx.dj.zb().ycx("unify_web_close_backup").zb(jSONObject.toString());
            }
        });
    }
}
