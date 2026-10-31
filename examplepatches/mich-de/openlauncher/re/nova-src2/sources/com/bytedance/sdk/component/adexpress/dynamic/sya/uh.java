package com.bytedance.sdk.component.adexpress.dynamic.sya;

import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import android.widget.FrameLayout;
import com.bytedance.sdk.component.adexpress.lt.oty;
import com.bytedance.sdk.component.utils.wwx;
import org.json.JSONObject;

/* loaded from: classes2.dex */
public class uh implements ul<oty> {

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.dynamic.dj.ul f23471dj;

    /* renamed from: lt, reason: collision with root package name */
    private com.bytedance.sdk.component.adexpress.dynamic.dj.jc f23472lt;
    private String lud;
    private com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud sya;
    private oty ycx;

    /* renamed from: zb, reason: collision with root package name */
    private Context f23473zb;

    public uh(Context context, com.bytedance.sdk.component.adexpress.dynamic.dynamicview.lud ludVar, com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar, String str, com.bytedance.sdk.component.adexpress.dynamic.dj.jc jcVar) {
        this.f23473zb = context;
        this.sya = ludVar;
        this.f23471dj = ulVar;
        this.lud = str;
        this.f23472lt = jcVar;
        lud();
    }

    private void lud() {
        int iRl = this.f23471dj.rl();
        final com.bytedance.sdk.component.adexpress.dynamic.lt.ycx dynamicClickListener = this.sya.getDynamicClickListener();
        try {
            new JSONObject().put("convertActionType", 2);
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgLpoOrGbJhUTDE40VpTBL/CiGEPJt3o5L2lSPX6kmT+s/lACo", "bPwkkgSwbOCVQ9NYpR+0LUnvLoE=", "UuAkgTW1bNA=", 48);
        }
        if ("18".equals(this.lud)) {
            Context context = this.f23473zb;
            oty otyVar = new oty(context, com.bytedance.sdk.component.adexpress.sya.ycx.jw(context), this.f23472lt);
            this.ycx = otyVar;
            if (otyVar.getWriggleLayout() != null) {
                this.ycx.getWriggleLayout().setOnClickListener((View.OnClickListener) dynamicClickListener);
            }
            if (this.ycx.getTopTextView() != null) {
                if (TextUtils.isEmpty(this.f23471dj.sg())) {
                    this.ycx.getTopTextView().setText(wwx.zb(this.f23473zb, "tt_splash_wriggle_top_text_style_17"));
                } else {
                    this.ycx.getTopTextView().setText(this.f23471dj.sg());
                }
            }
        } else {
            Context context2 = this.f23473zb;
            this.ycx = new oty(context2, com.bytedance.sdk.component.adexpress.sya.ycx.jw(context2), this.f23472lt);
        }
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2);
        layoutParams.gravity = 81;
        this.ycx.setTranslationY(-((int) com.bytedance.sdk.component.adexpress.dj.ul.ycx(this.f23473zb, iRl)));
        this.ycx.setLayoutParams(layoutParams);
        this.ycx.setShakeText(this.f23471dj.uf());
        this.ycx.setClipChildren(false);
        final View wriggleProgressIv = this.ycx.getWriggleProgressIv();
        this.ycx.setOnShakeViewListener(new oty.ycx() { // from class: com.bytedance.sdk.component.adexpress.dynamic.sya.uh.1
        });
    }

    @Override // com.bytedance.sdk.component.adexpress.dynamic.sya.ul
    /* renamed from: dj, reason: merged with bridge method [inline-methods] */
    public oty sya() {
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
