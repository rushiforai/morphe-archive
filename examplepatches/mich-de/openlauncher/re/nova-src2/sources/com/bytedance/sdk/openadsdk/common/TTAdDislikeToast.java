package com.bytedance.sdk.openadsdk.common;

import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.bytedance.sdk.openadsdk.utils.dc;
import com.vungle.ads.internal.protos.Sdk;

/* loaded from: classes.dex */
public class TTAdDislikeToast extends com.bytedance.sdk.openadsdk.core.lt.sya {
    private static String sDislikeSendTip;
    private static String sDislikeTip;
    private static String sSkipText;
    private final Handler mHandler;
    private TextView mTextView;

    public TTAdDislikeToast(Context context) {
        this(context, null);
    }

    public static String getDislikeSendTip() {
        if (sDislikeSendTip == null) {
            Context contextYcx = com.bytedance.sdk.openadsdk.core.pmi.ycx();
            sDislikeSendTip = com.bytedance.sdk.component.utils.wwx.ycx(contextYcx, "tt_feedback_thank_text") + "\n" + com.bytedance.sdk.component.utils.wwx.ycx(contextYcx, "tt_feedback_experience_text");
        }
        return sDislikeSendTip;
    }

    public static String getDislikeTip() {
        if (sDislikeTip == null) {
            sDislikeTip = com.bytedance.sdk.component.utils.wwx.ycx(com.bytedance.sdk.openadsdk.core.pmi.ycx(), "tt_feedback_submit_text");
        }
        return sDislikeTip;
    }

    public static String getSkipText() {
        if (sSkipText == null) {
            sSkipText = com.bytedance.sdk.component.utils.wwx.ycx(com.bytedance.sdk.openadsdk.core.pmi.ycx(), "tt_reward_screen_skip_tx");
        }
        return sSkipText;
    }

    private void initToast(Context context) {
        com.bytedance.sdk.openadsdk.core.lt.fby fbyVar = new com.bytedance.sdk.openadsdk.core.lt.fby(context);
        this.mTextView = fbyVar;
        fbyVar.setClickable(false);
        this.mTextView.setFocusable(false);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2);
        layoutParams.gravity = 49;
        layoutParams.topMargin = dc.zb(getContext(), 75.0f);
        int iZb = dc.zb(com.bytedance.sdk.openadsdk.core.pmi.ycx(), 16.0f);
        int iZb2 = dc.zb(com.bytedance.sdk.openadsdk.core.pmi.ycx(), 12.0f);
        this.mTextView.setPadding(iZb, iZb2, iZb, iZb2);
        this.mTextView.setLayoutParams(layoutParams);
        this.mTextView.setTextColor(-1);
        this.mTextView.setTextSize(16.0f);
        this.mTextView.setGravity(8388611);
        Drawable drawableSya = com.bytedance.sdk.component.utils.wwx.sya(getContext(), "tt_dislike_toast");
        int iZb3 = dc.zb(getContext(), 16.0f);
        drawableSya.setBounds(0, 0, iZb3, iZb3);
        this.mTextView.setCompoundDrawablePadding(iZb3 / 2);
        this.mTextView.setCompoundDrawables(drawableSya, null, null, null);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(0);
        gradientDrawable.setColor(Color.argb(Sdk.SDKError.Reason.INVALID_JSON_BID_PAYLOAD_VALUE, 37, 37, 37));
        gradientDrawable.setCornerRadius(dc.zb(com.bytedance.sdk.openadsdk.core.pmi.ycx(), 12.0f));
        this.mTextView.setBackground(gradientDrawable);
        addView(this.mTextView);
    }

    public static void onResourceUpdated() {
        Context contextYcx = com.bytedance.sdk.openadsdk.core.pmi.ycx();
        sSkipText = com.bytedance.sdk.component.utils.wwx.ycx(contextYcx, "tt_reward_screen_skip_tx");
        sDislikeTip = com.bytedance.sdk.component.utils.wwx.ycx(contextYcx, "tt_feedback_submit_text");
        sDislikeSendTip = com.bytedance.sdk.component.utils.wwx.ycx(contextYcx, "tt_feedback_thank_text") + "\n" + com.bytedance.sdk.component.utils.wwx.ycx(contextYcx, "tt_feedback_experience_text");
    }

    public void hide() {
        setVisibility(8);
        this.mHandler.removeCallbacksAndMessages(null);
    }

    public void onDestroy() {
        setVisibility(8);
        this.mHandler.removeCallbacksAndMessages(null);
    }

    public void show(final String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        this.mHandler.removeCallbacksAndMessages(null);
        this.mHandler.post(new Runnable() { // from class: com.bytedance.sdk.openadsdk.common.TTAdDislikeToast.1
            @Override // java.lang.Runnable
            public void run() {
                if (TTAdDislikeToast.this.mTextView != null) {
                    TTAdDislikeToast.this.mTextView.setText(String.valueOf(str));
                }
                TTAdDislikeToast.this.setVisibility(0);
            }
        });
        this.mHandler.postDelayed(new Runnable() { // from class: com.bytedance.sdk.openadsdk.common.TTAdDislikeToast.2
            @Override // java.lang.Runnable
            public void run() {
                TTAdDislikeToast.this.setVisibility(8);
            }
        }, 2000L);
    }

    public TTAdDislikeToast(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public TTAdDislikeToast(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet, i5);
        this.mHandler = new Handler(Looper.getMainLooper());
        setVisibility(8);
        setClickable(false);
        setFocusable(false);
        initToast(context);
    }
}
