package com.bytedance.sdk.component.adexpress.dynamic.sya;

import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;
import com.bytedance.sdk.component.adexpress.lt.pmi;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class syc implements ul<com.bytedance.sdk.component.adexpress.lt.pmi> {

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.dynamic.dj.ul f23465dj;
    private int fby;

    /* renamed from: jw, reason: collision with root package name */
    private JSONObject f23466jw;

    /* renamed from: lt, reason: collision with root package name */
    private int f23467lt;
    private String lud;
    private com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud sya;

    /* renamed from: ul, reason: collision with root package name */
    private int f23468ul;
    private com.bytedance.sdk.component.adexpress.lt.pmi ycx;

    /* renamed from: zb, reason: collision with root package name */
    private Context f23469zb;

    public syc(Context context, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud ludVar, com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar, String str, int i5, int i11, int i12, JSONObject jSONObject) {
        this.f23469zb = context;
        this.sya = ludVar;
        this.f23465dj = ulVar;
        this.lud = str;
        this.f23467lt = i5;
        this.f23468ul = i11;
        this.fby = i12;
        this.f23466jw = jSONObject;
        lud();
    }

    private void lud() {
        final com.bytedance.sdk.component.adexpress.dynamic.lt.ycx dynamicClickListener = this.sya.getDynamicClickListener();
        try {
            new JSONObject().put("convertActionType", 1);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6kmT+s/lACo", "aOYsngaVZ9OFWNZemA==", "UuAkgTW1bNA=", 49);
        }
        if ("16".equals(this.lud)) {
            Context context = this.f23469zb;
            com.bytedance.sdk.component.adexpress.lt.pmi pmiVar = new com.bytedance.sdk.component.adexpress.lt.pmi(context, com.bytedance.sdk.component.adexpress.sya.ycx.fby(context), this.f23467lt, this.f23468ul, this.fby, this.f23466jw);
            this.ycx = pmiVar;
            if (pmiVar.getShakeLayout() != null) {
                this.ycx.getShakeLayout().setOnClickListener((View.OnClickListener) dynamicClickListener);
            }
        } else {
            Context context2 = this.f23469zb;
            this.ycx = new com.bytedance.sdk.component.adexpress.lt.pmi(context2, com.bytedance.sdk.component.adexpress.sya.ycx.ul(context2), this.f23467lt, this.f23468ul, this.fby, this.f23466jw);
        }
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -1);
        this.ycx.setGravity(17);
        layoutParams.gravity = 17;
        this.ycx.setLayoutParams(layoutParams);
        this.ycx.setTranslationY(com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23469zb, this.f23465dj.giw()));
        this.ycx.setShakeText(this.f23465dj.uf());
        this.ycx.setClipChildren(false);
        this.ycx.setOnShakeViewListener(new pmi.ycx() { // from class: com.bytedance.sdk.component.adexpress.dynamic.sya.syc.1
        });
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.ul
    /* renamed from: dj, reason: merged with bridge method [inline-methods] */
    public com.bytedance.sdk.component.adexpress.lt.pmi sya() {
        return this.ycx;
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.ul
    public void ycx() {
        this.ycx.ycx();
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.ul
    public void zb() {
        this.ycx.clearAnimation();
    }
}
