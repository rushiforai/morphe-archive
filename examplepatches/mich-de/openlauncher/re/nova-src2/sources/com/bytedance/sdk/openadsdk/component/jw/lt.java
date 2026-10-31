package com.bytedance.sdk.openadsdk.component.jw;

import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.widget.PAGLogoView;
import com.bytedance.sdk.openadsdk.core.widget.pmi;
import com.bytedance.sdk.openadsdk.core.widget.wie;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.ea;

/* loaded from: classes2.dex */
public class lt extends sya {

    /* renamed from: ry, reason: collision with root package name */
    private final com.bytedance.sdk.openadsdk.core.lt.lud f24787ry;
    private final wie xkz;

    public lt(Context context, tn tnVar) {
        super(context);
        setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        setBackground(new GradientDrawable(GradientDrawable.Orientation.LEFT_RIGHT, new int[]{Color.parseColor("#EDFCFF"), Color.parseColor("#FFF6FD")}));
        com.bytedance.sdk.openadsdk.core.lt.lud ludVar = new com.bytedance.sdk.openadsdk.core.lt.lud(context);
        this.f24787ry = ludVar;
        ludVar.setId(520093758);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams.leftMargin = dc.zb(context, 24.0f);
        layoutParams.topMargin = dc.zb(context, 56.0f);
        ludVar.setLayoutParams(layoutParams);
        ludVar.setClickable(false);
        ludVar.setGravity(16);
        ludVar.setOrientation(0);
        pmi pmiVar = new pmi(context);
        this.f24793lt = pmiVar;
        pmiVar.setId(520093759);
        this.f24793lt.setLayoutParams(new LinearLayout.LayoutParams(dc.zb(context, 24.0f), dc.zb(context, 24.0f)));
        com.bytedance.sdk.openadsdk.core.lt.fby fbyVar = new com.bytedance.sdk.openadsdk.core.lt.fby(context);
        this.f24795ul = fbyVar;
        fbyVar.setId(520093761);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams2.leftMargin = dc.zb(context, 8.0f);
        this.f24795ul.setLayoutParams(layoutParams2);
        com.bytedance.sdk.openadsdk.core.lt.fby fbyVar2 = this.f24795ul;
        TextUtils.TruncateAt truncateAt = TextUtils.TruncateAt.END;
        fbyVar2.setEllipsize(truncateAt);
        this.f24795ul.setMaxLines(2);
        this.f24795ul.setTextColor(Color.parseColor("#161823"));
        this.f24795ul.setTextSize(12.0f);
        com.bytedance.sdk.openadsdk.core.lt.ul ulVar = new com.bytedance.sdk.openadsdk.core.lt.ul(context);
        RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(dc.zb(context, 327.0f), -2);
        layoutParams3.addRule(13);
        layoutParams3.leftMargin = dc.zb(context, 24.0f);
        layoutParams3.rightMargin = dc.zb(context, 24.0f);
        ulVar.setLayoutParams(layoutParams3);
        pmi pmiVar2 = new pmi(context);
        this.f24792jw = pmiVar2;
        int i5 = com.bytedance.sdk.openadsdk.utils.wie.bxj;
        pmiVar2.setId(i5);
        RelativeLayout.LayoutParams layoutParams4 = new RelativeLayout.LayoutParams(dc.zb(context, 80.0f), dc.zb(context, 80.0f));
        layoutParams4.addRule(14);
        this.f24792jw.setLayoutParams(layoutParams4);
        com.bytedance.sdk.openadsdk.core.lt.fby fbyVar3 = new com.bytedance.sdk.openadsdk.core.lt.fby(context);
        this.f24791jc = fbyVar3;
        int i11 = com.bytedance.sdk.openadsdk.utils.wie.kyd;
        fbyVar3.setId(i11);
        this.f24791jc.setTextSize(24.0f);
        this.f24791jc.setTextColor(Color.parseColor("#161823"));
        this.f24791jc.setGravity(17);
        this.f24791jc.setMaxLines(1);
        this.f24791jc.setEllipsize(truncateAt);
        RelativeLayout.LayoutParams layoutParams5 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams5.addRule(3, i5);
        layoutParams5.topMargin = dc.zb(context, 12.0f);
        layoutParams5.addRule(14);
        this.f24791jc.setLayoutParams(layoutParams5);
        com.bytedance.sdk.openadsdk.core.lt.fby fbyVar4 = new com.bytedance.sdk.openadsdk.core.lt.fby(context);
        this.f24790ea = fbyVar4;
        int i12 = com.bytedance.sdk.openadsdk.utils.wie.f27191du;
        fbyVar4.setId(i12);
        this.f24790ea.setTextSize(16.0f);
        this.f24790ea.setTextColor(Color.parseColor("#80161823"));
        this.f24790ea.setGravity(17);
        this.f24790ea.setMaxLines(2);
        this.f24790ea.setEllipsize(truncateAt);
        RelativeLayout.LayoutParams layoutParams6 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams6.addRule(3, i11);
        layoutParams6.topMargin = dc.zb(context, 4.0f);
        layoutParams6.addRule(14);
        this.f24790ea.setLayoutParams(layoutParams6);
        wie wieVar = new wie(context);
        this.xkz = wieVar;
        RelativeLayout.LayoutParams layoutParams7 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams7.addRule(14);
        layoutParams7.topMargin = dc.zb(context, 12.0f);
        wieVar.setLayoutParams(layoutParams7);
        com.bytedance.sdk.openadsdk.core.lt.fby fbyVar5 = new com.bytedance.sdk.openadsdk.core.lt.fby(context);
        this.lud = fbyVar5;
        fbyVar5.setId(520093717);
        this.lud.setBackground(ea.ycx(context, "tt_reward_full_video_backup_btn_bg"));
        this.lud.setEllipsize(truncateAt);
        this.lud.setLines(1);
        this.lud.setGravity(17);
        this.lud.setTextColor(-1);
        this.lud.setTextSize(16.0f);
        this.lud.setTag("open_ad_click_button_tag");
        RelativeLayout.LayoutParams layoutParams8 = new RelativeLayout.LayoutParams(-1, dc.zb(context, 44.0f));
        layoutParams8.addRule(3, i12);
        layoutParams8.topMargin = dc.zb(context, 54.0f);
        layoutParams8.addRule(14);
        this.lud.setLayoutParams(layoutParams8);
        PAGLogoView pAGLogoViewCreatePAGLogoViewByMaterial = PAGLogoView.createPAGLogoViewByMaterial(context, tnVar);
        this.f24789dj = pAGLogoViewCreatePAGLogoViewByMaterial;
        pAGLogoViewCreatePAGLogoViewByMaterial.setId(520093757);
        RelativeLayout.LayoutParams layoutParams9 = new RelativeLayout.LayoutParams(-2, dc.zb(context, 14.0f));
        layoutParams9.leftMargin = dc.zb(context, 16.0f);
        layoutParams9.bottomMargin = dc.zb(context, 24.0f);
        layoutParams9.addRule(12);
        this.f24789dj.setLayoutParams(layoutParams9);
        addView(this.fby);
        ludVar.addView(this.f24793lt);
        ludVar.addView(this.f24795ul);
        addView(ludVar);
        ulVar.addView(this.f24792jw);
        ulVar.addView(this.f24791jc);
        ulVar.addView(this.f24790ea);
        ulVar.addView(wieVar);
        ulVar.addView(this.lud);
        addView(ulVar);
        addView(this.f24789dj);
    }

    @Override // com.bytedance.sdk.openadsdk.component.jw.sya
    public com.bytedance.sdk.openadsdk.core.lt.dj getAdIconView() {
        return null;
    }

    @Override // com.bytedance.sdk.openadsdk.component.jw.sya
    public com.bytedance.sdk.openadsdk.core.lt.fby getAdTitleTextView() {
        return null;
    }

    @Override // com.bytedance.sdk.openadsdk.component.jw.sya
    public wie getScoreBar() {
        return this.xkz;
    }

    @Override // com.bytedance.sdk.openadsdk.component.jw.sya
    public View getUserInfo() {
        return this.f24787ry;
    }
}
