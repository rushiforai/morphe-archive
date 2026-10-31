package com.bytedance.sdk.openadsdk.core.widget;

import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import com.bytedance.sdk.openadsdk.activity.single.TTWebsiteActivity;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.utils.av;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class fby extends com.bytedance.sdk.openadsdk.core.lt.ul {

    /* renamed from: dj, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.lt.fby f26294dj;

    /* renamed from: lt, reason: collision with root package name */
    private boolean f26295lt;
    private boolean lud;
    private jw sya;
    private pmi ycx;

    /* renamed from: zb, reason: collision with root package name */
    private com.bytedance.sdk.openadsdk.core.lt.fby f26296zb;

    public fby(Context context) {
        super(context);
        setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        if (ycx()) {
            zb();
        }
    }

    public com.bytedance.sdk.openadsdk.core.lt.fby getDownloadButton() {
        return this.f26294dj;
    }

    public jw getLoadingProgressBar() {
        return this.sya;
    }

    public void setProgress(int i5) {
        jw jwVar = this.sya;
        if (jwVar != null) {
            jwVar.setProgress(i5);
        }
    }

    public boolean ycx() {
        return true;
    }

    public void zb() {
        if (this.lud) {
            return;
        }
        this.lud = true;
        Context context = getContext();
        setBackgroundColor(Color.parseColor("#2E2E2E"));
        LinearLayout linearLayout = new LinearLayout(context);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams.addRule(13);
        linearLayout.setLayoutParams(layoutParams);
        linearLayout.setGravity(17);
        linearLayout.setOrientation(1);
        pmi pmiVar = new pmi(context);
        this.ycx = pmiVar;
        pmiVar.setId(520093745);
        int iZb = dc.zb(context, 64.0f);
        this.ycx.setLayoutParams(new RelativeLayout.LayoutParams(iZb, iZb));
        com.bytedance.sdk.openadsdk.core.lt.fby fbyVar = new com.bytedance.sdk.openadsdk.core.lt.fby(context);
        this.f26296zb = fbyVar;
        fbyVar.setId(520093746);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(dc.zb(context, 219.0f), -2);
        layoutParams2.topMargin = dc.zb(context, 16.0f);
        this.f26296zb.setLayoutParams(layoutParams2);
        this.f26296zb.setEllipsize(TextUtils.TruncateAt.END);
        this.f26296zb.setGravity(17);
        this.f26296zb.setMaxWidth(dc.zb(context, 150.0f));
        this.f26296zb.setMaxLines(2);
        this.f26296zb.setTextColor(-1);
        this.f26296zb.setTextSize(1, 16.0f);
        jw jwVar = new jw(context);
        this.sya = jwVar;
        jwVar.setId(520093748);
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(dc.zb(context, 219.0f), dc.zb(context, 6.0f));
        layoutParams3.topMargin = dc.zb(context, 24.0f);
        this.sya.setLayoutParams(layoutParams3);
        this.f26294dj = new com.bytedance.sdk.openadsdk.core.lt.fby(context);
        LinearLayout.LayoutParams layoutParams4 = new LinearLayout.LayoutParams(dc.zb(context, 138.0f), dc.zb(context, 42.0f));
        layoutParams4.topMargin = dc.zb(context, 48.0f);
        this.f26294dj.setLayoutParams(layoutParams4);
        this.f26294dj.setTextColor(-1);
        this.f26294dj.setTextSize(16.0f);
        this.f26294dj.setGravity(17);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(0);
        gradientDrawable.setStroke(2, -1);
        gradientDrawable.setCornerRadius(layoutParams4.height / 2);
        this.f26294dj.setBackground(gradientDrawable);
        linearLayout.addView(this.ycx);
        linearLayout.addView(this.f26296zb);
        linearLayout.addView(this.sya);
        linearLayout.addView(this.f26294dj);
        addView(linearLayout);
    }

    public void ycx(tn tnVar, int i5) {
        if (!this.lud || tnVar == null || this.f26295lt) {
            return;
        }
        this.f26295lt = true;
        boolean z11 = !tnVar.yw() || com.bytedance.sdk.openadsdk.component.reward.sya.fby.ycx(tnVar);
        if (!z11 || tnVar.yyc() == null || TextUtils.isEmpty(tnVar.yyc().ycx())) {
            this.ycx.setVisibility(8);
        } else {
            try {
                com.bytedance.sdk.openadsdk.jc.dj.ycx(tnVar.yyc()).sya(1).ycx(new com.bytedance.sdk.openadsdk.jc.zb(tnVar, tnVar.yyc().ycx(), new av(this.ycx)));
            } catch (Throwable th2) {
                com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+SSRBLl9", "a88KsxawZfSDWNJYgj2vKV/nI5IvvXDIlV4=", "UuAkgSe9fcY=", 69);
            }
        }
        if (!z11) {
            this.f26296zb.setText("Loading");
        } else if (TextUtils.isEmpty(tnVar.spv())) {
            this.f26296zb.setVisibility(8);
        } else {
            this.f26296zb.setText(tnVar.spv());
        }
        com.bytedance.sdk.openadsdk.core.lt.fby fbyVar = this.f26294dj;
        if (fbyVar != null) {
            fbyVar.setText(tnVar.bah());
        }
    }

    public void ycx(final tn tnVar, final Activity activity, final String str) {
        if (tnVar == null || activity == null) {
            return;
        }
        View viewCreatePAGLogoViewByMaterial = PAGLogoView.createPAGLogoViewByMaterial(getContext(), tnVar);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.addRule(20);
        layoutParams.addRule(12);
        layoutParams.leftMargin = dc.zb(activity, 16.0f);
        layoutParams.bottomMargin = dc.zb(activity, 21.0f);
        viewCreatePAGLogoViewByMaterial.setLayoutParams(layoutParams);
        addView(viewCreatePAGLogoViewByMaterial, layoutParams);
        viewCreatePAGLogoViewByMaterial.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.core.widget.fby.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                try {
                    TTWebsiteActivity.ycx(activity, tnVar, str);
                } catch (Throwable th2) {
                    com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V+SSRBLl9", "a88KsxawZfSDWNJYgj2vKV/nI5IvvXDIlV6TDA==", "VOAOmQq/Yg==", 196);
                    com.bytedance.sdk.component.utils.htf.sya("PAGFullScreenLoadingLayout", th2.getMessage());
                }
            }
        });
    }
}
