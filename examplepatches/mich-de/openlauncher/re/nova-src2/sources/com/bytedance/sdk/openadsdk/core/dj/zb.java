package com.bytedance.sdk.openadsdk.core.dj;

import android.content.Context;
import android.graphics.Color;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import androidx.recyclerview.widget.n0;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.TTAdConstant;
import com.bytedance.sdk.openadsdk.TTDislikeDialogAbstract;
import com.bytedance.sdk.openadsdk.activity.single.IABLandingPageActivity;
import com.bytedance.sdk.openadsdk.activity.single.TTDelegateActivity;
import com.bytedance.sdk.openadsdk.activity.single.TTWebsiteActivity;
import com.bytedance.sdk.openadsdk.api.banner.PAGBannerAdWrapperListener;
import com.bytedance.sdk.openadsdk.core.jc.htf;
import com.bytedance.sdk.openadsdk.core.jc.thx;
import com.bytedance.sdk.openadsdk.core.jc.uh;
import com.bytedance.sdk.openadsdk.core.model.dy;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.syc.zb.lt;
import com.bytedance.sdk.openadsdk.core.widget.PAGLogoView;
import com.bytedance.sdk.openadsdk.core.widget.pmi;
import com.bytedance.sdk.openadsdk.core.widget.ry;
import com.bytedance.sdk.openadsdk.core.widget.wie;
import com.bytedance.sdk.openadsdk.core.widget.xkz;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.ea;
import com.vungle.ads.internal.protos.Sdk;
import java.util.List;
import org.json.JSONException;

/* loaded from: classes2.dex */
public class zb extends com.bytedance.sdk.openadsdk.core.jc.ycx {
    public static uh[] ycx = {new uh(1, 6.4f, Sdk.SDKError.Reason.WEBVIEW_ERROR_VALUE, 50), new uh(4, 1.2f, 300, n0.DEFAULT_SWIPE_ANIMATION_DURATION)};

    /* renamed from: ok, reason: collision with root package name */
    private ycx f25322ok;

    /* renamed from: ry, reason: collision with root package name */
    private thx f25323ry;
    private PAGBannerAdWrapperListener syc;
    private String xkz;

    public zb(Context context) {
        super(context);
        this.f25519zb = context;
    }

    private ycx fby() {
        int iZb = dc.zb(this.f25519zb, 8.0f);
        int iZb2 = dc.zb(this.f25519zb, 21.0f);
        RelativeLayout relativeLayout = new RelativeLayout(this.f25519zb);
        ViewGroup.LayoutParams layoutParams = new ViewGroup.LayoutParams(-1, -1);
        relativeLayout.setPadding(iZb, iZb, iZb, iZb2);
        relativeLayout.setLayoutParams(layoutParams);
        addView(relativeLayout);
        LinearLayout linearLayout = new LinearLayout(this.f25519zb);
        linearLayout.setId(520093737);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams2.addRule(12);
        linearLayout.setGravity(16);
        linearLayout.setOrientation(0);
        linearLayout.setLayoutParams(layoutParams2);
        relativeLayout.addView(linearLayout);
        pmi pmiVar = new pmi(this.f25519zb);
        pmiVar.setId(520093738);
        LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(dc.zb(this.f25519zb, 52.0f), dc.zb(this.f25519zb, 52.0f));
        pmiVar.setScaleType(ImageView.ScaleType.FIT_XY);
        pmiVar.setLayoutParams(layoutParams3);
        linearLayout.addView(pmiVar);
        LinearLayout linearLayout2 = new LinearLayout(this.f25519zb);
        linearLayout2.setOrientation(1);
        LinearLayout.LayoutParams layoutParams4 = new LinearLayout.LayoutParams(0, -2);
        layoutParams4.weight = 1.0f;
        layoutParams4.leftMargin = iZb;
        layoutParams4.rightMargin = iZb;
        layoutParams4.setMarginStart(iZb);
        layoutParams4.setMarginEnd(iZb);
        linearLayout.addView(linearLayout2, layoutParams4);
        TextView textView = new TextView(this.f25519zb);
        textView.setId(520093730);
        LinearLayout.LayoutParams layoutParams5 = new LinearLayout.LayoutParams(-1, -2);
        TextUtils.TruncateAt truncateAt = TextUtils.TruncateAt.END;
        textView.setEllipsize(truncateAt);
        textView.setMaxLines(1);
        textView.setTextColor(Color.parseColor("#FF3E3E3E"));
        textView.setTextSize(16.0f);
        textView.setLayoutParams(layoutParams5);
        linearLayout2.addView(textView);
        wie wieVar = new wie(this.f25519zb);
        wieVar.setId(520093735);
        linearLayout2.addView(wieVar, new LinearLayout.LayoutParams(-2, -2));
        TextView textView2 = new TextView(this.f25519zb);
        textView2.setId(520093703);
        LinearLayout.LayoutParams layoutParams6 = new LinearLayout.LayoutParams(dc.zb(this.f25519zb, 76.0f), dc.zb(this.f25519zb, 36.0f));
        textView2.setBackground(ea.ycx(this.f25519zb, 18));
        textView2.setEllipsize(truncateAt);
        textView2.setMaxLines(1);
        textView2.setGravity(17);
        textView2.setText(wwx.ycx(this.f25519zb, "tt_video_download_apk"));
        textView2.setTextColor(-1);
        textView2.setTextSize(14.0f);
        textView2.setLayoutParams(layoutParams6);
        linearLayout.addView(textView2);
        FrameLayout frameLayout = new FrameLayout(this.f25519zb);
        frameLayout.setLayoutDirection(3);
        RelativeLayout.LayoutParams layoutParams7 = new RelativeLayout.LayoutParams(-1, -1);
        layoutParams7.addRule(2, linearLayout.getId());
        layoutParams7.bottomMargin = iZb2;
        frameLayout.setLayoutParams(layoutParams7);
        relativeLayout.addView(frameLayout);
        xkz xkzVar = new xkz(this.f25519zb);
        xkzVar.setId(520093736);
        xkzVar.setScaleType(ImageView.ScaleType.FIT_CENTER);
        FrameLayout.LayoutParams layoutParams8 = new FrameLayout.LayoutParams(-2, -1);
        layoutParams8.gravity = 17;
        frameLayout.addView(xkzVar, layoutParams8);
        View viewCreatePAGLogoViewByMaterial = PAGLogoView.createPAGLogoViewByMaterial(this.f25519zb, this.sya);
        viewCreatePAGLogoViewByMaterial.setId(520093739);
        RelativeLayout.LayoutParams layoutParams9 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams9.addRule(10);
        layoutParams9.addRule(9);
        layoutParams9.setMargins(iZb, iZb, 0, 0);
        viewCreatePAGLogoViewByMaterial.setLayoutParams(layoutParams9);
        relativeLayout.addView(viewCreatePAGLogoViewByMaterial);
        return new ycx(pmiVar, viewCreatePAGLogoViewByMaterial, textView2, textView, xkzVar, wieVar, frameLayout);
    }

    private View.OnClickListener jc() {
        return new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.core.dj.zb.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (com.bytedance.sdk.openadsdk.utils.zb.lud() && com.bytedance.sdk.openadsdk.core.pmi.dj().av()) {
                    IABLandingPageActivity.ycx(((com.bytedance.sdk.openadsdk.core.jc.ycx) zb.this).f25519zb, ((com.bytedance.sdk.openadsdk.core.jc.ycx) zb.this).sya, ((com.bytedance.sdk.openadsdk.core.jc.ycx) zb.this).f25517lt);
                } else {
                    TTWebsiteActivity.ycx(((com.bytedance.sdk.openadsdk.core.jc.ycx) zb.this).f25519zb, ((com.bytedance.sdk.openadsdk.core.jc.ycx) zb.this).sya, ((com.bytedance.sdk.openadsdk.core.jc.ycx) zb.this).f25517lt);
                }
            }
        };
    }

    private ycx jw() {
        int iZb = dc.zb(this.f25519zb, 8.0f);
        int iZb2 = dc.zb(this.f25519zb, 21.0f);
        RelativeLayout relativeLayout = new RelativeLayout(this.f25519zb);
        ViewGroup.LayoutParams layoutParams = new ViewGroup.LayoutParams(-1, -1);
        relativeLayout.setPadding(iZb, iZb, iZb, iZb2);
        relativeLayout.setLayoutParams(layoutParams);
        addView(relativeLayout);
        LinearLayout linearLayout = new LinearLayout(this.f25519zb);
        linearLayout.setId(520093737);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams2.addRule(12);
        linearLayout.setGravity(16);
        linearLayout.setOrientation(0);
        linearLayout.setLayoutParams(layoutParams2);
        relativeLayout.addView(linearLayout);
        pmi pmiVar = new pmi(this.f25519zb);
        pmiVar.setId(520093738);
        LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(dc.zb(this.f25519zb, 52.0f), dc.zb(this.f25519zb, 52.0f));
        pmiVar.setScaleType(ImageView.ScaleType.FIT_XY);
        pmiVar.setLayoutParams(layoutParams3);
        linearLayout.addView(pmiVar);
        LinearLayout linearLayout2 = new LinearLayout(this.f25519zb);
        linearLayout2.setOrientation(1);
        LinearLayout.LayoutParams layoutParams4 = new LinearLayout.LayoutParams(0, -2);
        layoutParams4.weight = 1.0f;
        layoutParams4.leftMargin = iZb;
        layoutParams4.rightMargin = iZb;
        layoutParams4.setMarginStart(iZb);
        layoutParams4.setMarginEnd(iZb);
        linearLayout.addView(linearLayout2, layoutParams4);
        TextView textView = new TextView(this.f25519zb);
        textView.setId(520093730);
        LinearLayout.LayoutParams layoutParams5 = new LinearLayout.LayoutParams(-1, -2);
        TextUtils.TruncateAt truncateAt = TextUtils.TruncateAt.END;
        textView.setEllipsize(truncateAt);
        textView.setMaxLines(1);
        textView.setTextColor(Color.parseColor("#FF3E3E3E"));
        textView.setTextSize(16.0f);
        textView.setLayoutParams(layoutParams5);
        linearLayout2.addView(textView);
        wie wieVar = new wie(this.f25519zb);
        wieVar.setId(520093735);
        LinearLayout.LayoutParams layoutParams6 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams6.topMargin = dc.zb(this.f25519zb, 4.0f);
        linearLayout2.addView(wieVar, layoutParams6);
        TextView textView2 = new TextView(this.f25519zb);
        textView2.setId(520093703);
        LinearLayout.LayoutParams layoutParams7 = new LinearLayout.LayoutParams(dc.zb(this.f25519zb, 76.0f), dc.zb(this.f25519zb, 36.0f));
        textView2.setBackground(ea.ycx(this.f25519zb, 18));
        textView2.setEllipsize(truncateAt);
        textView2.setMaxLines(1);
        textView2.setGravity(17);
        textView2.setText(wwx.ycx(this.f25519zb, "tt_video_download_apk"));
        textView2.setTextColor(-1);
        textView2.setTextSize(14.0f);
        textView2.setLayoutParams(layoutParams7);
        linearLayout.addView(textView2);
        FrameLayout frameLayout = new FrameLayout(this.f25519zb);
        RelativeLayout.LayoutParams layoutParams8 = new RelativeLayout.LayoutParams(-1, -1);
        layoutParams8.addRule(2, linearLayout.getId());
        layoutParams8.bottomMargin = iZb2;
        frameLayout.setLayoutParams(layoutParams8);
        relativeLayout.addView(frameLayout);
        ry ryVar = new ry(this.f25519zb);
        ryVar.setId(520093736);
        FrameLayout.LayoutParams layoutParams9 = new FrameLayout.LayoutParams(-2, -1);
        layoutParams9.gravity = 17;
        ryVar.setLayoutParams(layoutParams9);
        frameLayout.addView(ryVar);
        View viewCreatePAGLogoViewByMaterial = PAGLogoView.createPAGLogoViewByMaterial(this.f25519zb, this.sya);
        viewCreatePAGLogoViewByMaterial.setId(520093739);
        RelativeLayout.LayoutParams layoutParams10 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams10.addRule(10);
        layoutParams10.addRule(9);
        layoutParams10.setMargins(iZb, iZb, 0, 0);
        viewCreatePAGLogoViewByMaterial.setLayoutParams(layoutParams10);
        relativeLayout.addView(viewCreatePAGLogoViewByMaterial);
        return new ycx(pmiVar, viewCreatePAGLogoViewByMaterial, textView2, textView, ryVar, wieVar, frameLayout);
    }

    public void setAdInteractionListener(PAGBannerAdWrapperListener pAGBannerAdWrapperListener) {
        this.syc = pAGBannerAdWrapperListener;
    }

    public void setClosedListenerKey(String str) {
        this.xkz = str;
    }

    private void dj() {
        ycx ycxVarLt = lt();
        this.f25322ok = ycxVarLt;
        View view = ycxVarLt.f25325lt;
        if (view != null) {
            view.setOnClickListener(jc());
        }
        xkz xkzVar = this.f25322ok.ycx;
        if (xkzVar != null) {
            List<com.bytedance.sdk.openadsdk.core.model.pmi> listCu = this.sya.cu();
            if (listCu != null && !listCu.isEmpty()) {
                com.bytedance.sdk.openadsdk.htf.zb.zb().ycx(listCu.get(0), xkzVar, this.sya);
            }
            ycx((View) xkzVar, true);
            xkzVar.setTag(520093762, Boolean.TRUE);
        }
    }

    private ycx lt() {
        int iZb = dc.zb(this.f25519zb, 8.0f);
        xkz xkzVar = new xkz(this.f25519zb);
        xkzVar.setId(520093736);
        xkzVar.setScaleType(ImageView.ScaleType.FIT_CENTER);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -1);
        layoutParams.gravity = 17;
        addView(xkzVar, layoutParams);
        View viewCreatePAGLogoViewByMaterial = PAGLogoView.createPAGLogoViewByMaterial(this.f25519zb, this.sya);
        viewCreatePAGLogoViewByMaterial.setId(520093739);
        FrameLayout.LayoutParams layoutParams2 = new FrameLayout.LayoutParams(-2, -2);
        layoutParams2.setMargins(iZb, iZb, 0, 0);
        layoutParams2.gravity = 8388659;
        viewCreatePAGLogoViewByMaterial.setLayoutParams(layoutParams2);
        addView(viewCreatePAGLogoViewByMaterial);
        return new ycx(viewCreatePAGLogoViewByMaterial, xkzVar);
    }

    private void lud() {
        TextView textView;
        tn tnVar = this.sya;
        if (tnVar != null) {
            int iPk = tnVar.pk();
            if (this.sya.ci() == null) {
                ycx ycxVarFby = fby();
                this.f25322ok = ycxVarFby;
                xkz xkzVar = ycxVarFby.ycx;
                ImageView imageView = ycxVarFby.sya;
                TextView textView2 = ycxVarFby.f25327zb;
                TextView textView3 = ycxVarFby.f25326ul;
                View view = ycxVarFby.f25325lt;
                if (view != null) {
                    view.setOnClickListener(jc());
                }
                ViewGroup.LayoutParams layoutParams = xkzVar.getLayoutParams();
                if (this.f25518ul - (dc.zb(this.f25519zb, 8.0f) * 2) >= ((this.fby - dc.zb(this.f25519zb, 8.0f)) - (dc.zb(this.f25519zb, 21.0f) * 2)) - dc.zb(this.f25519zb, 52.0f)) {
                    layoutParams.width = -2;
                    layoutParams.height = -1;
                } else {
                    layoutParams.width = -1;
                    layoutParams.height = -2;
                }
                xkzVar.setLayoutParams(layoutParams);
                if (iPk == 33) {
                    xkzVar.setRatio(1.0f);
                } else {
                    xkzVar.setRatio(1.91f);
                }
                List<com.bytedance.sdk.openadsdk.core.model.pmi> listCu = this.sya.cu();
                if (listCu != null && !listCu.isEmpty()) {
                    com.bytedance.sdk.openadsdk.htf.zb.zb().ycx(listCu.get(0), xkzVar, this.sya);
                    com.bytedance.sdk.openadsdk.htf.zb.zb().ycx(listCu.get(0).ycx(), this.f25322ok.lud);
                }
                if (this.sya.yyc() == null || TextUtils.isEmpty(this.sya.yyc().ycx())) {
                    textView = textView2;
                } else {
                    textView = textView2;
                    com.bytedance.sdk.openadsdk.htf.zb.zb().ycx(this.sya.yyc().ycx(), this.sya.yyc().zb(), this.sya.yyc().sya(), imageView, this.sya);
                }
                textView.setText(this.sya.spv());
                if (TextUtils.isEmpty(this.sya.bah())) {
                    textView3.setVisibility(8);
                } else {
                    textView3.setText(this.sya.bah());
                }
                dc.ycx((TextView) null, this.f25322ok.f25324dj, this.sya);
                ycx((View) xkzVar, true);
                xkzVar.setTag(520093762, Boolean.TRUE);
                ycx((View) this, true);
                ycx((View) textView3, true);
                return;
            }
            ycx ycxVarJw = jw();
            this.f25322ok = ycxVarJw;
            TextView textView4 = ycxVarJw.f25327zb;
            TextView textView5 = ycxVarJw.f25326ul;
            ry ryVar = ycxVarJw.fby;
            com.bytedance.sdk.openadsdk.htf.zb.zb().ycx(this.sya.ci().f22188f, this.f25322ok.lud);
            View view2 = this.f25322ok.f25325lt;
            if (view2 != null) {
                view2.setOnClickListener(jc());
            }
            ViewGroup.LayoutParams layoutParams2 = ryVar.getLayoutParams();
            if (iPk == 15) {
                layoutParams2.width = -2;
                layoutParams2.height = -1;
                ryVar.setLayoutParams(layoutParams2);
                ryVar.setRatio(0.5625f);
            } else if (iPk == 5) {
                layoutParams2.width = -1;
                layoutParams2.height = -2;
                ryVar.setLayoutParams(layoutParams2);
                ryVar.setRatio(1.7777778f);
            } else {
                if (this.f25518ul - (dc.zb(this.f25519zb, 8.0f) * 2) >= ((this.fby - dc.zb(this.f25519zb, 8.0f)) - (dc.zb(this.f25519zb, 21.0f) * 2)) - dc.zb(this.f25519zb, 52.0f)) {
                    layoutParams2.width = -2;
                    layoutParams2.height = -1;
                } else {
                    layoutParams2.width = -1;
                    layoutParams2.height = -2;
                }
                ryVar.setLayoutParams(layoutParams2);
                ryVar.setRatio(1.0f);
            }
            ryVar.removeAllViews();
            FrameLayout.LayoutParams layoutParams3 = new FrameLayout.LayoutParams(-1, -1);
            com.bytedance.sdk.openadsdk.core.syc.zb.lt videoView = getVideoView();
            if (videoView != null) {
                if (this.f25323ry instanceof htf) {
                    videoView.setNeedSelfManagerVideo(!((htf) r7).xkz());
                    ((htf) this.f25323ry).setBackupVideoView(videoView);
                    videoView.setVideoAdInteractionListener((htf) this.f25323ry);
                }
                ryVar.addView(videoView, layoutParams3);
                videoView.setAdCreativeClickListener(new lt.ycx() { // from class: com.bytedance.sdk.openadsdk.core.dj.zb.1
                    @Override // com.bytedance.sdk.openadsdk.core.syc.zb.lt.ycx
                    public void ycx(View view3, int i5) {
                        if (zb.this.syc != null) {
                            zb.this.syc.onAdClicked();
                        }
                    }
                });
                com.bytedance.sdk.openadsdk.core.jc.jw clickCreativeListener = this.f25323ry.getClickCreativeListener();
                if (clickCreativeListener != null) {
                    clickCreativeListener.ycx(videoView.getNativeVideoController());
                }
            }
            if (this.sya.yyc() != null && !TextUtils.isEmpty(this.sya.yyc().ycx())) {
                com.bytedance.sdk.openadsdk.htf.zb.zb().ycx(this.sya.yyc().ycx(), this.sya.yyc().zb(), this.sya.yyc().sya(), this.f25322ok.sya, this.sya);
            }
            textView4.setText(this.sya.spv());
            dc.ycx((TextView) null, this.f25322ok.f25324dj, this.sya);
            if (TextUtils.isEmpty(this.sya.bah())) {
                textView5.setVisibility(8);
            } else {
                textView5.setText(this.sya.bah());
            }
            ycx((View) videoView, true);
            if (videoView != null) {
                videoView.setTag(520093762, Boolean.TRUE);
            }
            ycx((View) this, true);
            ycx((View) textView5, true);
            ycx(ryVar);
        }
    }

    private void sya() {
        dc.zb(this.f25519zb, 50.0f);
        ycx ycxVarUl = ul();
        this.f25322ok = ycxVarUl;
        ImageView imageView = ycxVarUl.sya;
        TextView textView = ycxVarUl.f25327zb;
        wie wieVar = ycxVarUl.f25324dj;
        TextView textView2 = ycxVarUl.f25326ul;
        View view = ycxVarUl.f25325lt;
        if (view != null) {
            view.setOnClickListener(jc());
        }
        if (this.sya.yyc() != null && !TextUtils.isEmpty(this.sya.yyc().ycx())) {
            com.bytedance.sdk.openadsdk.htf.zb.zb().ycx(this.sya.yyc().ycx(), this.sya.yyc().zb(), this.sya.yyc().sya(), imageView, this.sya);
        }
        textView.setText(this.sya.spv());
        if (TextUtils.isEmpty(this.sya.bah())) {
            textView2.setVisibility(8);
        } else {
            textView2.setText(this.sya.bah());
        }
        dc.ycx((TextView) null, wieVar, this.sya);
        ycx((View) imageView, true);
        imageView.setTag(520093762, Boolean.TRUE);
        ycx((View) this, true);
        ycx((View) textView2, true);
    }

    private ycx ul() {
        int iZb = dc.zb(this.f25519zb, 38.0f);
        int iZb2 = (int) (dc.zb(this.f25519zb, 25.0f) / 5.0d);
        int iZb3 = dc.zb(this.f25519zb, 10.0f);
        int iZb4 = dc.zb(this.f25519zb, 2.0f);
        int iZb5 = dc.zb(this.f25519zb, 6.0f);
        int iZb6 = dc.zb(this.f25519zb, 8.0f);
        RelativeLayout relativeLayout = new RelativeLayout(this.f25519zb);
        addView(relativeLayout, -1, -1);
        pmi pmiVar = new pmi(this.f25519zb);
        pmiVar.setId(520093738);
        TextView textView = new TextView(this.f25519zb);
        textView.setId(520093730);
        wie wieVar = new wie(this.f25519zb);
        wieVar.setId(520093735);
        View viewCreatePAGLogoViewByMaterial = PAGLogoView.createPAGLogoViewByMaterial(this.f25519zb, this.sya);
        viewCreatePAGLogoViewByMaterial.setId(520093739);
        TextView textView2 = new TextView(this.f25519zb);
        textView2.setId(520093703);
        ycx ycxVar = new ycx(pmiVar, textView, wieVar, viewCreatePAGLogoViewByMaterial, textView2);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(iZb, iZb);
        layoutParams.addRule(15);
        layoutParams.addRule(9);
        layoutParams.addRule(20);
        layoutParams.setMarginStart(iZb5);
        layoutParams.setMargins(iZb5, 0, 0, 0);
        pmiVar.setLayoutParams(layoutParams);
        pmiVar.setBackgroundColor(-1);
        pmiVar.setScaleType(ImageView.ScaleType.FIT_XY);
        relativeLayout.addView(pmiVar);
        LinearLayout linearLayout = new LinearLayout(this.f25519zb);
        linearLayout.setOrientation(1);
        RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-1, -2);
        layoutParams2.addRule(15);
        layoutParams2.addRule(16, textView2.getId());
        layoutParams2.addRule(17, pmiVar.getId());
        layoutParams2.setMarginStart(iZb6);
        layoutParams2.setMarginEnd(iZb6);
        layoutParams2.addRule(0, textView2.getId());
        layoutParams2.addRule(1, pmiVar.getId());
        layoutParams2.setMargins(iZb6, 0, iZb6, 0);
        relativeLayout.addView(linearLayout, layoutParams2);
        LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(-1, -2);
        textView.setTextDirection(5);
        TextUtils.TruncateAt truncateAt = TextUtils.TruncateAt.END;
        textView.setEllipsize(truncateAt);
        textView.setGravity(80);
        textView.setMaxLines(1);
        textView.setTextColor(Color.parseColor("#FF333333"));
        textView.setTextSize(12.0f);
        textView.setLayoutParams(layoutParams3);
        linearLayout.addView(textView);
        LinearLayout.LayoutParams layoutParams4 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams4.topMargin = iZb4;
        wieVar.setLayoutParams(layoutParams4);
        linearLayout.addView(wieVar);
        RelativeLayout.LayoutParams layoutParams5 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams5.addRule(20);
        layoutParams5.addRule(9);
        layoutParams5.addRule(12);
        viewCreatePAGLogoViewByMaterial.setLayoutParams(layoutParams5);
        relativeLayout.addView(viewCreatePAGLogoViewByMaterial);
        RelativeLayout.LayoutParams layoutParams6 = new RelativeLayout.LayoutParams(-2, -2);
        layoutParams6.addRule(11);
        layoutParams6.addRule(15);
        layoutParams6.setMarginEnd(iZb5);
        layoutParams6.addRule(21);
        layoutParams6.rightMargin = iZb5;
        textView2.setBackground(ea.ycx(this.f25519zb, 12));
        textView2.setEllipsize(truncateAt);
        textView2.setGravity(17);
        textView2.setMaxLines(1);
        textView2.setPadding(iZb3, iZb2, iZb3, iZb2);
        textView2.setText(wwx.ycx(this.f25519zb, "tt_video_download_apk"));
        textView2.setTextColor(Color.parseColor("#f0f0f0"));
        textView2.setTextSize(10.0f);
        textView2.setLayoutParams(layoutParams6);
        relativeLayout.addView(textView2);
        return ycxVar;
    }

    private void zb() {
        uh uhVarYcx = ycx(this.f25323ry.getExpectExpressWidth(), this.f25323ry.getExpectExpressHeight());
        if (this.f25323ry.getExpectExpressWidth() <= 0 || this.f25323ry.getExpectExpressHeight() <= 0) {
            int iDj = dc.dj(this.f25519zb);
            this.f25518ul = iDj;
            this.fby = Float.valueOf(iDj / uhVarYcx.f25503zb).intValue();
        } else {
            this.f25518ul = dc.zb(this.f25519zb, this.f25323ry.getExpectExpressWidth());
            this.fby = dc.zb(this.f25519zb, this.f25323ry.getExpectExpressHeight());
        }
        int i5 = this.f25518ul;
        if (i5 > 0 && i5 > dc.dj(this.f25519zb)) {
            this.f25518ul = dc.dj(this.f25519zb);
            this.fby = Float.valueOf(this.fby * (dc.dj(this.f25519zb) / this.f25518ul)).intValue();
        }
        ViewGroup.LayoutParams layoutParams = getLayoutParams();
        if (layoutParams == null) {
            layoutParams = new ViewGroup.LayoutParams(this.f25518ul, this.fby);
        }
        layoutParams.width = this.f25518ul;
        layoutParams.height = this.fby;
        if (layoutParams instanceof FrameLayout.LayoutParams) {
            ((FrameLayout.LayoutParams) layoutParams).gravity = 17;
        }
        setLayoutParams(layoutParams);
        tn tnVar = this.sya;
        if (tnVar != null) {
            int iPk = tnVar.pk();
            if (iPk == 1010 || iPk == 1011 || iPk == 1012) {
                dj();
            } else {
                ycx(uhVarYcx);
            }
        }
    }

    @Override // com.bytedance.sdk.openadsdk.core.jc.ycx
    public void ycx(View view, int i5, dy dyVar) throws JSONException {
        thx thxVar = this.f25323ry;
        if (thxVar != null) {
            thxVar.ycx(view, i5, dyVar);
        }
    }

    public void ycx(tn tnVar, thx thxVar, com.bytedance.sdk.openadsdk.thx.ycx.ycx.sya syaVar) {
        setBackgroundColor(-1);
        this.sya = tnVar;
        this.f25323ry = thxVar;
        this.f25517lt = "banner_ad";
        thxVar.addView(this, new ViewGroup.LayoutParams(-2, -2));
        zb();
    }

    public static class ycx {

        /* renamed from: dj, reason: collision with root package name */
        wie f25324dj;
        private ry fby;

        /* renamed from: lt, reason: collision with root package name */
        View f25325lt;
        FrameLayout lud;
        ImageView sya;

        /* renamed from: ul, reason: collision with root package name */
        TextView f25326ul;
        public xkz ycx;

        /* renamed from: zb, reason: collision with root package name */
        public TextView f25327zb;

        public ycx(ImageView imageView, TextView textView, wie wieVar, View view, TextView textView2) {
            this.sya = imageView;
            this.f25327zb = textView;
            this.f25324dj = wieVar;
            this.f25325lt = view;
            this.f25326ul = textView2;
        }

        public ycx(ImageView imageView, View view, TextView textView, TextView textView2, xkz xkzVar, wie wieVar, FrameLayout frameLayout) {
            this.sya = imageView;
            this.f25325lt = view;
            this.f25326ul = textView;
            this.f25327zb = textView2;
            this.ycx = xkzVar;
            this.f25324dj = wieVar;
            this.lud = frameLayout;
        }

        public ycx(ImageView imageView, View view, TextView textView, TextView textView2, ry ryVar, wie wieVar, FrameLayout frameLayout) {
            this.sya = imageView;
            this.f25325lt = view;
            this.f25326ul = textView;
            this.f25327zb = textView2;
            this.fby = ryVar;
            this.f25324dj = wieVar;
            this.lud = frameLayout;
        }

        public ycx(View view, xkz xkzVar) {
            this.f25325lt = view;
            this.ycx = xkzVar;
        }
    }

    private void ycx(uh uhVar) {
        if (uhVar.ycx == 1) {
            sya();
        } else {
            lud();
        }
    }

    public static uh ycx(int i5, int i11) {
        try {
            return ((double) i11) >= Math.floor((((double) i5) * 450.0d) / 600.0d) ? ycx[1] : ycx[0];
        } catch (Throwable th2) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(th2, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48esi0V7CybDbl7wphaxVifAg==", "ee8jmwauTN+QWNJOnzOhK1D7PaMKuX4=", "S+8/hgauRMiETw==", TTAdConstant.LANDING_PAGE_TYPE_CODE);
            return ycx[0];
        }
    }

    @Override // com.bytedance.sdk.openadsdk.core.jc.ycx
    public void ycx() {
        TTDislikeDialogAbstract tTDislikeDialogAbstract = this.lud;
        if (tTDislikeDialogAbstract != null) {
            tTDislikeDialogAbstract.show();
            return;
        }
        com.bytedance.sdk.openadsdk.sya.sya syaVar = this.f25513dj;
        if (syaVar != null) {
            syaVar.ycx();
        } else {
            TTDelegateActivity.ycx(this.sya, this.xkz);
        }
    }
}
