package com.bytedance.sdk.openadsdk.component.reward.top;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.core.lt.dj;
import com.bytedance.sdk.openadsdk.core.lt.fby;
import com.bytedance.sdk.openadsdk.core.lt.lud;
import com.bytedance.sdk.openadsdk.core.model.av;
import com.bytedance.sdk.openadsdk.core.model.htf;
import com.bytedance.sdk.openadsdk.core.model.oty;
import com.bytedance.sdk.openadsdk.core.model.tn;
import com.bytedance.sdk.openadsdk.core.pmi;
import com.bytedance.sdk.openadsdk.core.widget.ul;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.bytedance.sdk.openadsdk.utils.ea;
import com.bytedance.sdk.openadsdk.utils.wie;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;

/* loaded from: classes2.dex */
public class TopLayoutDislike2 extends lud implements ycx<TopLayoutDislike2> {
    lud container;
    private boolean hasCutDown;
    private boolean hasShowClose;
    private boolean isVast;
    private dj mCloseBackupBtn;
    private dj mCloseBtn;
    private View mImgDislike;
    private ImageView mImgSound;
    private boolean mIsSoundMute;
    private TextView mNextAdTextTv;
    private lud mPlayableNextAd;
    private com.bytedance.sdk.openadsdk.core.ry.zb.lud.ycx mProgressBar;
    private int mProgressBgColor;
    private int mProgressColor;
    private int mProgressRadiusSize;
    private com.bytedance.sdk.openadsdk.core.ry.zb.lud.ycx mProgressRing;
    private int mProgressSize;
    private CharSequence mProgressStr;
    private int mProgressType;
    private ImageView mSkipIV;
    private TextView mTextViewCountDown;
    private zb mTopListener;
    private boolean shouldShowSkipTime;
    private int skipTime;
    private int videoDuration;

    public TopLayoutDislike2(Context context) {
        this(context, null);
    }

    private ImageView getCommonRingBGImageView() {
        dj djVar = new dj(getContext());
        int iZb = dc.zb(getContext(), 5.0f);
        djVar.setPadding(iZb, iZb, iZb, iZb);
        djVar.setScaleType(ImageView.ScaleType.CENTER);
        djVar.setBackground(com.bytedance.sdk.openadsdk.core.widget.dj.ycx());
        return djVar;
    }

    private void initListener(final tn tnVar) {
        View view = this.mImgDislike;
        if (view != null) {
            view.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.component.reward.top.TopLayoutDislike2.1
                @Override // android.view.View.OnClickListener
                public void onClick(View view2) {
                    if (TopLayoutDislike2.this.mTopListener != null) {
                        TopLayoutDislike2.this.mTopListener.zb(view2);
                    }
                }
            });
        }
        ImageView imageView = this.mImgSound;
        if (imageView != null) {
            imageView.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.component.reward.top.TopLayoutDislike2.2
                @Override // android.view.View.OnClickListener
                public void onClick(View view2) {
                    TopLayoutDislike2.this.mIsSoundMute = !r0.mIsSoundMute;
                    TopLayoutDislike2.this.mImgSound.setImageDrawable(TopLayoutDislike2.this.mSkipIV != null ? TopLayoutDislike2.this.mIsSoundMute ? wwx.sya(TopLayoutDislike2.this.getContext(), "tt_reward_full_mute") : wwx.sya(TopLayoutDislike2.this.getContext(), "tt_reward_full_unmute") : TopLayoutDislike2.this.mIsSoundMute ? ea.ycx(TopLayoutDislike2.this.getContext(), "tt_mute_wrapper") : ea.ycx(TopLayoutDislike2.this.getContext(), "tt_unmute_wrapper"));
                    if (TopLayoutDislike2.this.mImgSound.getDrawable() != null) {
                        TopLayoutDislike2.this.mImgSound.getDrawable().setAutoMirrored(true);
                    }
                    if (TopLayoutDislike2.this.mTopListener != null) {
                        Object tag = TopLayoutDislike2.this.mImgSound.getTag(TopLayoutDislike2.this.mImgSound.getId());
                        TopLayoutDislike2.this.mTopListener.ycx(view2, tag instanceof String ? tag.toString() : "nativeClick");
                    }
                    TopLayoutDislike2.this.mImgSound.setTag(TopLayoutDislike2.this.mImgSound.getId(), null);
                }
            });
        }
        ImageView imageView2 = this.mSkipIV;
        if (imageView2 != null) {
            imageView2.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.component.reward.top.TopLayoutDislike2.3
                @Override // android.view.View.OnClickListener
                public void onClick(View view2) {
                    if (TopLayoutDislike2.this.mTopListener != null) {
                        TopLayoutDislike2.this.mTopListener.ycx(view2);
                    }
                }
            });
        } else {
            TextView textView = this.mTextViewCountDown;
            if (textView != null) {
                textView.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.component.reward.top.TopLayoutDislike2.4
                    @Override // android.view.View.OnClickListener
                    public void onClick(View view2) {
                        if (TopLayoutDislike2.this.mTopListener != null) {
                            TopLayoutDislike2.this.mTopListener.ycx(view2);
                        }
                    }
                });
            }
        }
        dj djVar = this.mCloseBtn;
        if (djVar != null) {
            djVar.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.component.reward.top.TopLayoutDislike2.5
                @Override // android.view.View.OnClickListener
                public void onClick(View view2) {
                    if (TopLayoutDislike2.this.mTopListener != null) {
                        TopLayoutDislike2.this.mTopListener.sya(view2);
                    }
                }
            });
        }
        dj djVar2 = this.mCloseBackupBtn;
        if (djVar2 != null) {
            djVar2.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.component.reward.top.TopLayoutDislike2.6
                @Override // android.view.View.OnClickListener
                public void onClick(View view2) {
                    if (TopLayoutDislike2.this.mTopListener != null) {
                        TopLayoutDislike2.this.mTopListener.sya(view2);
                        com.bytedance.sdk.openadsdk.component.dj.zb.ycx("force_button_tracker", TTEDPEventConstants.EDP_EVENT_NAME_CLICK, tnVar);
                    }
                }
            });
        }
        lud ludVar = this.mPlayableNextAd;
        if (ludVar != null) {
            ludVar.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.component.reward.top.TopLayoutDislike2.7
                @Override // android.view.View.OnClickListener
                public void onClick(View view2) {
                    if (TopLayoutDislike2.this.mTopListener != null) {
                        TopLayoutDislike2.this.mTopListener.dj(view2);
                    }
                }
            });
        }
    }

    private void initProgressBar(tn tnVar) {
        oty otyVarEa;
        oty.zb zbVarWie;
        if (tnVar == null || tnVar.dj() == null || tnVar.dj().ea() == null || (otyVarEa = tnVar.dj().ea()) == null || otyVarEa.wie() == null || (zbVarWie = otyVarEa.wie()) == null) {
            return;
        }
        if (!TextUtils.isEmpty(zbVarWie.zb())) {
            this.mProgressColor = com.bytedance.adsdk.ugeno.fby.ycx.ycx(zbVarWie.zb());
        }
        if (!TextUtils.isEmpty(zbVarWie.sya())) {
            this.mProgressBgColor = com.bytedance.adsdk.ugeno.fby.ycx.ycx(zbVarWie.sya());
        }
        if (zbVarWie.dj() <= 0.0f) {
            this.mProgressSize = dc.zb(getContext(), 1.0f);
        } else {
            this.mProgressSize = dc.zb(getContext(), zbVarWie.dj());
        }
        if (zbVarWie.lud() > 0.0f) {
            this.mProgressRadiusSize = dc.zb(getContext(), zbVarWie.lud());
        }
        this.mProgressType = zbVarWie.ycx();
    }

    private void initView(tn tnVar) {
        lud ludVar = new lud(getContext());
        this.container = ludVar;
        ludVar.setOrientation(0);
        int iZb = dc.zb(getContext(), 16.0f);
        int iZb2 = dc.zb(getContext(), 12.0f);
        int iZb3 = dc.zb(getContext(), 24.0f);
        int iZb4 = dc.zb(getContext(), 28.0f);
        ImageView commonRingBGImageView = getCommonRingBGImageView();
        this.mImgDislike = commonRingBGImageView;
        commonRingBGImageView.setId(520093713);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(iZb4, iZb4);
        layoutParams.topMargin = iZb3;
        layoutParams.leftMargin = iZb;
        this.mImgDislike.setLayoutParams(layoutParams);
        this.mImgSound = getCommonRingBGImageView();
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(iZb4, iZb4);
        layoutParams2.leftMargin = iZb2;
        layoutParams2.topMargin = iZb3;
        this.mImgSound.setId(wie.lbb);
        this.mImgSound.setLayoutParams(layoutParams2);
        View view = new View(getContext());
        LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(0, 0);
        layoutParams3.weight = 1.0f;
        view.setLayoutParams(layoutParams3);
        fby fbyVar = new fby(getContext());
        this.mTextViewCountDown = fbyVar;
        fbyVar.setBackground(com.bytedance.sdk.openadsdk.core.widget.dj.zb());
        LinearLayout.LayoutParams layoutParams4 = new LinearLayout.LayoutParams(-2, dc.zb(getContext(), 28.0f));
        layoutParams4.topMargin = iZb3;
        layoutParams4.rightMargin = iZb;
        this.mTextViewCountDown.setPadding(iZb2, 0, iZb2, 0);
        this.mTextViewCountDown.setLayoutParams(layoutParams4);
        this.mTextViewCountDown.setGravity(17);
        this.mTextViewCountDown.setTextColor(-1);
        this.mTextViewCountDown.setTextSize(14.0f);
        this.mTextViewCountDown.setVisibility(8);
        lud ludVar2 = new lud(getContext());
        this.mPlayableNextAd = ludVar2;
        ludVar2.setOrientation(0);
        LinearLayout.LayoutParams layoutParams5 = new LinearLayout.LayoutParams(-2, iZb4);
        layoutParams5.topMargin = iZb3;
        if (tnVar == null || !tnVar.qlw()) {
            layoutParams5.rightMargin = iZb;
        } else {
            layoutParams5.rightMargin = dc.zb(getContext(), 8.0f);
        }
        this.mPlayableNextAd.setLayoutParams(layoutParams5);
        this.mPlayableNextAd.setBackground(com.bytedance.sdk.openadsdk.core.widget.dj.zb());
        this.mPlayableNextAd.setVisibility(8);
        this.mNextAdTextTv = new fby(getContext());
        LinearLayout.LayoutParams layoutParams6 = new LinearLayout.LayoutParams(-2, dc.zb(getContext(), 28.0f));
        layoutParams6.gravity = 16;
        this.mNextAdTextTv.setLayoutParams(layoutParams6);
        this.mNextAdTextTv.setPadding(iZb2, 0, 0, 0);
        String strWwx = av.wwx(tnVar);
        if (TextUtils.isEmpty(strWwx)) {
            this.mNextAdTextTv.setText(wwx.zb(getContext(), "tt_multiple_playable_next_ad_tips"));
        } else {
            this.mNextAdTextTv.setText(strWwx);
        }
        this.mNextAdTextTv.setGravity(17);
        this.mNextAdTextTv.setTextColor(-1);
        this.mNextAdTextTv.setTextSize(14.0f);
        dj djVar = new dj(getContext());
        LinearLayout.LayoutParams layoutParams7 = new LinearLayout.LayoutParams(iZb2, iZb2);
        layoutParams7.rightMargin = iZb2;
        djVar.setScaleType(ImageView.ScaleType.CENTER);
        layoutParams7.gravity = 16;
        djVar.setLayoutParams(layoutParams7);
        djVar.setImageResource(wwx.dj(pmi.ycx(), "tt_ad_arrow_right"));
        this.mPlayableNextAd.addView(this.mNextAdTextTv);
        this.mPlayableNextAd.addView(djVar);
        ImageView commonRingBGImageView2 = getCommonRingBGImageView();
        this.mSkipIV = commonRingBGImageView2;
        commonRingBGImageView2.setId(520093714);
        LinearLayout.LayoutParams layoutParams8 = new LinearLayout.LayoutParams(iZb4, iZb4);
        layoutParams8.topMargin = iZb3;
        layoutParams8.rightMargin = iZb;
        this.mSkipIV.setLayoutParams(layoutParams8);
        this.mSkipIV.setScaleType(ImageView.ScaleType.CENTER_CROP);
        dj djVarZb = ul.zb(getContext());
        this.mCloseBtn = djVarZb;
        djVarZb.setId(520093708);
        FrameLayout.LayoutParams layoutParams9 = new FrameLayout.LayoutParams(-2, -2);
        layoutParams9.gravity = 8388661;
        layoutParams9.topMargin = iZb3;
        layoutParams9.rightMargin = iZb3;
        this.mCloseBtn.setLayoutParams(layoutParams9);
        this.mCloseBtn.setContentDescription(wwx.ycx(getContext(), "tt_ad_close_text"));
        this.mCloseBtn.setVisibility(8);
        dj djVarYcx = ul.ycx(getContext(), this.container);
        this.mCloseBackupBtn = djVarYcx;
        djVarYcx.setId(wie.ixr);
        this.mCloseBackupBtn.setContentDescription(wwx.ycx(getContext(), "tt_close_backup_button_text"));
        if (this.mProgressType == 1) {
            this.mProgressRing = new com.bytedance.sdk.openadsdk.core.ry.zb.lud.ycx(getContext());
            GradientDrawable gradientDrawable = new GradientDrawable();
            gradientDrawable.setColor(Color.parseColor("#66666666"));
            gradientDrawable.setCornerRadius(dc.zb(getContext(), 14.0f));
            gradientDrawable.setShape(0);
            this.mProgressRing.setBackground(gradientDrawable);
            LinearLayout.LayoutParams layoutParams10 = new LinearLayout.LayoutParams(iZb4, iZb4);
            layoutParams10.topMargin = iZb3;
            layoutParams10.rightMargin = iZb;
            this.mProgressRing.setLayoutParams(layoutParams10);
            this.mProgressRing.ycx("ring").ycx(this.mProgressSize).ycx(this.mProgressColor).zb(this.mProgressBgColor).zb(this.mProgressRadiusSize);
            this.mProgressRing.setVisibility(8);
        }
        com.bytedance.sdk.openadsdk.core.lt.sya syaVar = new com.bytedance.sdk.openadsdk.core.lt.sya(getContext());
        syaVar.addView(this.mSkipIV);
        com.bytedance.sdk.openadsdk.core.ry.zb.lud.ycx ycxVar = this.mProgressRing;
        if (ycxVar != null) {
            syaVar.addView(ycxVar);
        }
        if (this.mProgressType == 2) {
            this.mProgressBar = new com.bytedance.sdk.openadsdk.core.ry.zb.lud.ycx(getContext());
            this.mProgressBar.setLayoutParams(new LinearLayout.LayoutParams(-1, -2));
            this.mProgressBar.ycx("line").ycx(this.mProgressSize).ycx(this.mProgressColor).zb(this.mProgressBgColor).zb(this.mProgressRadiusSize);
            this.mProgressBar.setVisibility(8);
        }
        this.container.addView(this.mImgDislike);
        this.container.addView(this.mImgSound);
        this.container.addView(view);
        if (this.mProgressRing == null) {
            this.container.addView(this.mPlayableNextAd);
        } else {
            syaVar.addView(this.mPlayableNextAd);
        }
        this.container.addView(this.mTextViewCountDown);
        this.container.addView(syaVar);
        this.container.addView(this.mCloseBtn);
        com.bytedance.sdk.openadsdk.core.ry.zb.lud.ycx ycxVar2 = this.mProgressBar;
        if (ycxVar2 != null) {
            addView(ycxVar2);
        }
        addView(this.container);
    }

    private void updateTime(boolean z11) {
        if (this.hasShowClose) {
            return;
        }
        if (this.shouldShowSkipTime) {
            this.mSkipIV.setVisibility(8);
            this.mTextViewCountDown.setVisibility(0);
        } else if (z11) {
            this.mTextViewCountDown.setVisibility(0);
            this.mSkipIV.setVisibility(8);
        } else {
            this.mTextViewCountDown.setVisibility(8);
            this.mSkipIV.setVisibility(0);
        }
    }

    public void clickDislike() {
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void clickSkip() {
        ImageView imageView = this.mSkipIV;
        if (imageView != null) {
            imageView.performClick();
        }
        TextView textView = this.mTextViewCountDown;
        if (textView != null) {
            textView.performClick();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void clickSound(String str) {
        ImageView imageView = this.mImgSound;
        if (imageView != null) {
            imageView.setTag(imageView.getId(), str);
            this.mImgSound.performClick();
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public View getCloseBackupButton() {
        return this.mCloseBackupBtn;
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public View getCloseButton() {
        return this.mCloseBtn;
    }

    public void hideCountDownText() {
        this.mTextViewCountDown.setVisibility(8);
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void setCountDownFor1InN(CharSequence charSequence, int i5) {
        int i11 = this.mProgressType;
        if (i11 == 1) {
            this.mTextViewCountDown.setVisibility(8);
            if (i5 < 0) {
                this.mProgressRing.setVisibility(8);
                this.mSkipIV.setVisibility(8);
                return;
            }
            this.mProgressRing.setVisibility(0);
            this.mProgressRing.setAnimationDuration(1000);
            this.mProgressRing.setProgress(i5);
            this.mProgressRing.setClickable(false);
            this.mProgressRing.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.component.reward.top.TopLayoutDislike2.8
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                }
            });
            ImageView imageView = this.mSkipIV;
            if (imageView != null) {
                imageView.setVisibility(0);
                return;
            }
            return;
        }
        if (i11 == 2) {
            this.mTextViewCountDown.setVisibility(8);
            if (i5 < 0) {
                this.mProgressBar.setVisibility(8);
                this.mSkipIV.setVisibility(8);
                return;
            } else {
                this.mProgressBar.setVisibility(0);
                this.mProgressBar.setAnimationDuration(1000);
                this.mProgressBar.setProgress(i5);
                return;
            }
        }
        if (TextUtils.isEmpty(charSequence)) {
            this.mTextViewCountDown.setVisibility(8);
            return;
        }
        this.mTextViewCountDown.setText(charSequence);
        if (this.mTextViewCountDown.getVisibility() != 0) {
            this.mTextViewCountDown.setVisibility(0);
        }
        ImageView imageView2 = this.mSkipIV;
        if (imageView2 != null) {
            imageView2.setVisibility(8);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void setListener(zb zbVar) {
        this.mTopListener = zbVar;
    }

    public void setShouldShowSkipTime(boolean z11) {
        this.shouldShowSkipTime = z11;
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void setShowDislike(boolean z11) {
        View view = this.mImgDislike;
        if (view == null || this.isVast) {
            return;
        }
        view.setVisibility(z11 ? 0 : 8);
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void setShowEndCardNextAd(boolean z11, tn tnVar) {
        lud ludVar = this.mPlayableNextAd;
        if (ludVar != null) {
            ludVar.setVisibility(z11 ? 0 : 8);
            if (this.mNextAdTextTv == null || !z11 || tnVar == null || tnVar.ln() == null) {
                return;
            }
            String strSya = tnVar.ln().sya();
            if (TextUtils.isEmpty(strSya)) {
                return;
            }
            this.mNextAdTextTv.setText(strSya);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void setShowPlayableNextAd(boolean z11, tn tnVar) {
        lud ludVar = this.mPlayableNextAd;
        if (ludVar != null) {
            ludVar.setVisibility(z11 ? 0 : 8);
            if (this.mNextAdTextTv == null || !z11) {
                return;
            }
            String strWwx = av.wwx(tnVar);
            if (TextUtils.isEmpty(strWwx)) {
                this.mNextAdTextTv.setText(wwx.zb(getContext(), "tt_multiple_playable_next_ad_tips"));
            } else {
                this.mNextAdTextTv.setText(strWwx);
            }
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void setShowSkip(boolean z11) {
        TextView textView = this.mTextViewCountDown;
        if (textView == null) {
            return;
        }
        if (!z11) {
            textView.setText(b.f42142b);
        }
        if (this.mSkipIV.getVisibility() == 4) {
            return;
        }
        this.hasShowClose = !z11;
        this.mSkipIV.setVisibility((z11 && this.hasCutDown) ? 0 : 8);
        this.mTextViewCountDown.setVisibility(z11 & (TextUtils.isEmpty(this.mTextViewCountDown.getText()) ^ true) ? 0 : 8);
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void setShowSound(boolean z11) {
        ImageView imageView = this.mImgSound;
        if (imageView != null) {
            imageView.setVisibility(z11 ? 0 : 8);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void setSkipEnable(boolean z11) {
        ImageView imageView = this.mSkipIV;
        if (imageView != null) {
            imageView.setEnabled(z11);
            this.mSkipIV.setClickable(z11);
            return;
        }
        TextView textView = this.mTextViewCountDown;
        if (textView != null) {
            textView.setEnabled(z11);
            this.mTextViewCountDown.setClickable(z11);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void setSkipInvisiable() {
        this.mTextViewCountDown.setWidth(20);
        this.mTextViewCountDown.setVisibility(4);
        this.mSkipIV.setVisibility(4);
        this.hasShowClose = true;
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void setSkipText(CharSequence charSequence) {
        if (TextUtils.isEmpty(charSequence)) {
            this.mTextViewCountDown.setVisibility(8);
            return;
        }
        this.mTextViewCountDown.setText(charSequence);
        if (this.mTextViewCountDown.getVisibility() != 0) {
            this.mTextViewCountDown.setVisibility(0);
        }
        ImageView imageView = this.mSkipIV;
        if (imageView != null) {
            imageView.setVisibility(8);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void setSoundMute(boolean z11) {
        this.mIsSoundMute = z11;
        this.mImgSound.setImageDrawable(this.mSkipIV != null ? z11 ? wwx.sya(getContext(), "tt_reward_full_mute") : wwx.sya(getContext(), "tt_reward_full_unmute") : z11 ? ea.ycx(getContext(), "tt_mute_wrapper") : ea.ycx(getContext(), "tt_unmute_wrapper"));
        if (this.mImgSound.getDrawable() != null) {
            this.mImgSound.getDrawable().setAutoMirrored(true);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    @SuppressLint({"SetTextI18n"})
    public void setTime(CharSequence charSequence, CharSequence charSequence2) {
        if (!TextUtils.isEmpty(charSequence)) {
            this.mProgressStr = charSequence;
        }
        if (this.mSkipIV == null) {
            return;
        }
        this.hasCutDown = true;
        if (this.shouldShowSkipTime) {
            this.mTextViewCountDown.setText(((Object) this.mProgressStr) + "s");
            updateTime(false);
            return;
        }
        String str = (String) this.mProgressStr;
        try {
            int i5 = this.skipTime;
            int i11 = i5 == 0 ? Integer.parseInt(str) : i5 - (this.videoDuration - Integer.parseInt(str));
            if (i11 <= 0) {
                this.mTextViewCountDown.setText(((Object) this.mProgressStr) + "s");
                updateTime(false);
                return;
            }
            if (this.skipTime == 0) {
                updateTime(false);
                return;
            }
            this.mTextViewCountDown.setText(i11 + "s");
            updateTime(true);
        } catch (Exception e3) {
            com.bytedance.sdk.openadsdk.oty.sya.ycx(e3, "WOEg2wGlfcKES9leiV+zLFCgIoUGsmjDk07cE48erThU4CibF/J7wpdLxVnCBa84", "b+E9uQKlZtKUbt5OgBirLQk=", "SOs5oQqxbA==", 509);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void showCloseButton() {
        setSkipInvisiable();
        this.mSkipIV.setVisibility(8);
        this.mCloseBtn.setVisibility(0);
        com.bytedance.sdk.openadsdk.core.ry.zb.lud.ycx ycxVar = this.mProgressRing;
        if (ycxVar != null) {
            ycxVar.setVisibility(8);
        }
        com.bytedance.sdk.openadsdk.core.ry.zb.lud.ycx ycxVar2 = this.mProgressBar;
        if (ycxVar2 != null) {
            ycxVar2.setVisibility(8);
        }
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void showCountDownText() {
        this.mTextViewCountDown.setVisibility(0);
    }

    @Override // com.bytedance.sdk.openadsdk.component.reward.top.ycx
    public void showSkipButton() {
        ImageView imageView = this.mSkipIV;
        if (imageView != null) {
            imageView.setVisibility(0);
        }
        this.mTextViewCountDown.setVisibility(8);
        com.bytedance.sdk.openadsdk.core.ry.zb.lud.ycx ycxVar = this.mProgressRing;
        if (ycxVar != null) {
            ycxVar.setVisibility(8);
        }
        com.bytedance.sdk.openadsdk.core.ry.zb.lud.ycx ycxVar2 = this.mProgressBar;
        if (ycxVar2 != null) {
            ycxVar2.setVisibility(8);
        }
    }

    public TopLayoutDislike2(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    /* JADX WARN: Removed duplicated region for block: B:49:0x0105  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public TopLayoutDislike2 load(tn tnVar) {
        boolean z11;
        initProgressBar(tnVar);
        initView(tnVar);
        this.mImgDislike.setVisibility(0);
        ((ImageView) this.mImgDislike).setImageResource(wwx.dj(pmi.ycx(), "tt_reward_full_feedback"));
        if (!com.bytedance.sdk.openadsdk.core.settings.ea.zb().syc(String.valueOf(tnVar.ksy())) || tnVar.iq() == 5 || tnVar.iq() == 6) {
            this.mSkipIV.setImageResource(wwx.dj(pmi.ycx(), "tt_close_btn"));
        } else {
            this.mSkipIV.setImageResource(wwx.dj(pmi.ycx(), "tt_skip_btn"));
        }
        if (this.mSkipIV.getDrawable() != null) {
            this.mSkipIV.getDrawable().setAutoMirrored(true);
        }
        this.mSkipIV.setVisibility(8);
        this.videoDuration = tnVar.ci() == null ? 0 : ((int) tnVar.ci().f22186d) * tnVar.ci().f22198r;
        if (htf.dj(tnVar) && tnVar.oty() != null) {
            this.videoDuration = (int) tnVar.oty().zb();
        } else if (htf.fby(tnVar) && tnVar.oty() != null) {
            this.videoDuration = (int) tnVar.oty().dj();
        }
        if (this.videoDuration <= 0) {
            this.videoDuration = 10;
        }
        if (tnVar.an() != 8 || tnVar.qn() == null) {
            this.skipTime = tnVar.jxj();
        } else {
            this.skipTime = tnVar.jvd();
        }
        if (!av.sya(tnVar)) {
            int i5 = this.skipTime;
            if (i5 != -1 && i5 < this.videoDuration) {
                z11 = false;
            }
            this.shouldShowSkipTime = z11;
            if (tnVar.wnd()) {
                this.mImgDislike.setVisibility(8);
                this.isVast = true;
            }
            this.mTextViewCountDown.setVisibility(4);
            this.mTextViewCountDown.setText(b.f42142b);
            this.mTextViewCountDown.setEnabled(false);
            this.mTextViewCountDown.setClickable(false);
            initListener(tnVar);
            return this;
        }
        this.skipTime = tnVar.om();
        this.videoDuration = tnVar.qu();
        z11 = true;
        this.shouldShowSkipTime = z11;
        if (tnVar.wnd()) {
        }
        this.mTextViewCountDown.setVisibility(4);
        this.mTextViewCountDown.setText(b.f42142b);
        this.mTextViewCountDown.setEnabled(false);
        this.mTextViewCountDown.setClickable(false);
        initListener(tnVar);
        return this;
    }

    public TopLayoutDislike2(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        this.mProgressStr = b.f42142b;
        this.mProgressColor = com.bytedance.adsdk.ugeno.fby.ycx.ycx("#FFD813");
        this.mProgressBgColor = com.bytedance.adsdk.ugeno.fby.ycx.ycx("rgba(0, 0, 0, 0.5)");
        setOrientation(1);
    }
}
