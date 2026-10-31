package com.bytedance.sdk.openadsdk.core.ry.zb.zb;

import android.content.Context;
import android.graphics.Canvas;
import android.text.TextUtils;
import com.bytedance.adsdk.ugeno.zb.sya;
import com.bytedance.sdk.openadsdk.utils.dc;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class zb extends sya<ycx> {

    /* renamed from: ci, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.ry.sya f26088ci;

    /* renamed from: nc, reason: collision with root package name */
    private int f26089nc;

    /* renamed from: pg, reason: collision with root package name */
    private float f26090pg;

    /* renamed from: qt, reason: collision with root package name */
    private int f26091qt;

    /* renamed from: te, reason: collision with root package name */
    private int f26092te;
    private int vbt;
    private int ycx;

    public zb(Context context) {
        super(context);
        this.f26091qt = -1;
        this.f26092te = -1;
        ycx(context);
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    /* renamed from: sya, reason: merged with bridge method [inline-methods] */
    public ycx ycx() {
        ycx ycxVar = new ycx(this.f22701zb);
        ycxVar.ycx(this);
        return ycxVar;
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void zb() throws JSONException {
        super.zb();
        com.bytedance.adsdk.ugeno.jc.lt.ycx ycxVarYcx = ((ycx) this.lud).ycx();
        if (ycxVarYcx != null) {
            this.f26088ci.ycx(ycxVarYcx);
            ((ycx) this.lud).ycx(ycxVarYcx);
        }
        ((ycx) this.lud).ycx(this.ycx, this.f26091qt, this.f26092te, this.f26089nc, this.vbt, this.f26090pg);
    }

    private void ycx(Context context) {
        this.f26088ci = new com.bytedance.sdk.openadsdk.core.ry.sya(context, true);
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya
    public void ycx(String str, String str2) {
        super.ycx(str, str2);
        str.getClass();
        switch (str) {
            case "barWidth":
                this.f26089nc = dc.zb(this.f22701zb, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f));
                break;
            case "bottomBackgroundColor":
                if (!TextUtils.isEmpty(str2)) {
                    this.f26092te = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2);
                    break;
                }
                break;
            case "shadowColor":
            case "shadowOffsetX":
            case "shadowOffsetY":
            case "textAlign":
            case "textColor":
            case "textStyle":
            case "shadowBlur":
            case "textSize":
            case "textDecoration":
            case "fontWeight":
            case "lineHeight":
            case "text":
            case "lines":
            case "ellipsis":
            case "maxLines":
            case "letterSpacing":
                this.f26088ci.ycx(str, str2);
                break;
            case "topBackgroundColor":
                if (!TextUtils.isEmpty(str2)) {
                    this.f26091qt = com.bytedance.adsdk.ugeno.fby.ycx.ycx(str2);
                    break;
                }
                break;
            case "barHeight":
                this.vbt = dc.zb(this.f22701zb, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f));
                break;
            case "barRadius":
                this.f26090pg = dc.zb(this.f22701zb, com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0.0f));
                break;
            case "downtime":
                this.ycx = com.bytedance.adsdk.ugeno.fby.sya.ycx(str2, 0);
                break;
        }
    }

    @Override // com.bytedance.adsdk.ugeno.zb.sya, com.bytedance.adsdk.ugeno.lud
    public void ycx(Canvas canvas) {
        super.ycx(canvas);
    }
}
