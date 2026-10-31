package com.bytedance.sdk.openadsdk.common;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.Typeface;
import android.graphics.drawable.GradientDrawable;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class thx extends com.bytedance.sdk.openadsdk.core.lt.sya {

    /* renamed from: dj, reason: collision with root package name */
    private boolean f24720dj;
    private ycx sya;
    private Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private LinearLayout f24721zb;

    public interface ycx {
        void dj();

        void lt();

        void lud();

        void sya();

        void ycx();

        void zb();
    }

    public thx(Context context, boolean z11) {
        super(context);
        this.ycx = context;
        this.f24720dj = z11;
        zb();
    }

    public void setOnMenuItemClickListener(ycx ycxVar) {
        this.sya = ycxVar;
    }

    private void ycx(com.bytedance.sdk.openadsdk.core.lt.lud ludVar, String str, String str2, View.OnClickListener onClickListener) {
        com.bytedance.sdk.openadsdk.core.lt.lud ludVar2 = new com.bytedance.sdk.openadsdk.core.lt.lud(this.ycx);
        ludVar2.setOrientation(0);
        ludVar2.setGravity(16);
        ludVar2.setOnClickListener(onClickListener);
        ImageView imageView = new ImageView(this.ycx);
        imageView.setImageResource(com.bytedance.sdk.component.utils.wwx.dj(this.ycx, str2));
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(ycx(20.0f), ycx(20.0f));
        layoutParams.setMargins(ycx(16.0f), ycx(0.0f), ycx(16.0f), ycx(0.0f));
        ludVar2.addView(imageView, layoutParams);
        com.bytedance.sdk.openadsdk.core.lt.fby fbyVar = new com.bytedance.sdk.openadsdk.core.lt.fby(this.ycx);
        fbyVar.setText(str);
        fbyVar.setTextColor(Color.parseColor("#000000"));
        fbyVar.setTextSize(2, 16.0f);
        fbyVar.setGravity(8388627);
        fbyVar.setTypeface(Typeface.defaultFromStyle(0));
        ludVar2.addView(fbyVar, new LinearLayout.LayoutParams(-2, -2));
        ViewGroup.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-1, ycx(52.0f));
        if (ludVar.getChildCount() > 0) {
            View view = new View(this.ycx);
            view.setBackgroundColor(Color.parseColor("#1F000000"));
            ludVar.addView(view, new LinearLayout.LayoutParams(-1, ycx(1.0f)));
        }
        ludVar.addView(ludVar2, layoutParams2);
    }

    @SuppressLint({"ClickableViewAccessibility"})
    private void zb() {
        setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
        setBackgroundColor(Color.parseColor("#80000000"));
        setOnTouchListener(new View.OnTouchListener() { // from class: com.bytedance.sdk.openadsdk.common.thx.1
            @Override // android.view.View.OnTouchListener
            public boolean onTouch(View view, MotionEvent motionEvent) {
                if (motionEvent.getAction() == 1) {
                    Rect rect = new Rect();
                    thx.this.f24721zb.getGlobalVisibleRect(rect);
                    if (!rect.contains((int) motionEvent.getRawX(), (int) motionEvent.getRawY())) {
                        thx.this.ycx();
                    }
                }
                return true;
            }
        });
        LinearLayout linearLayout = new LinearLayout(this.ycx);
        this.f24721zb = linearLayout;
        linearLayout.setOrientation(1);
        this.f24721zb.setGravity(80);
        this.f24721zb.setPadding(ycx(16.0f), 0, ycx(16.0f), ycx(58.0f));
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(0);
        gradientDrawable.setCornerRadius(ycx(16.0f));
        gradientDrawable.setColor(Color.parseColor("#E1E1E1"));
        this.f24721zb.setBackground(gradientDrawable);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -2);
        layoutParams.gravity = 81;
        layoutParams.bottomMargin = ycx(16.0f);
        this.f24721zb.setLayoutParams(layoutParams);
        com.bytedance.sdk.openadsdk.core.lt.sya syaVar = new com.bytedance.sdk.openadsdk.core.lt.sya(this.ycx);
        syaVar.setPadding(ycx(6.0f), 0, ycx(6.0f), 0);
        syaVar.setLayoutParams(new LinearLayout.LayoutParams(-1, ycx(44.0f)));
        com.bytedance.sdk.openadsdk.core.lt.fby fbyVar = new com.bytedance.sdk.openadsdk.core.lt.fby(this.ycx);
        Context context = this.ycx;
        fbyVar.setText(context.getString(com.bytedance.sdk.component.utils.wwx.zb(context, "tt_more_title")));
        fbyVar.setTextColor(Color.parseColor("#000000"));
        fbyVar.setTextSize(2, 17.0f);
        fbyVar.setGravity(17);
        fbyVar.setTypeface(Typeface.defaultFromStyle(1));
        syaVar.addView(fbyVar, new FrameLayout.LayoutParams(-1, -1));
        ImageView imageView = new ImageView(this.ycx);
        imageView.setImageResource(com.bytedance.sdk.component.utils.wwx.dj(this.ycx, "tt_titlebar_close_drawable"));
        imageView.setPadding(ycx(10.0f), ycx(10.0f), ycx(10.0f), ycx(10.0f));
        imageView.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.common.thx.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                thx.this.ycx();
            }
        });
        FrameLayout.LayoutParams layoutParams2 = new FrameLayout.LayoutParams(ycx(44.0f), ycx(44.0f));
        layoutParams2.gravity = 8388629;
        syaVar.addView(imageView, layoutParams2);
        this.f24721zb.addView(syaVar);
        boolean zYcx = com.bytedance.sdk.openadsdk.dv.lud.ycx("lp_iab_history", true);
        if (!this.f24720dj && zYcx) {
            com.bytedance.sdk.openadsdk.core.lt.lud ludVarYcx = ycx(8);
            Context context2 = this.ycx;
            ycx(ludVarYcx, context2.getString(com.bytedance.sdk.component.utils.wwx.zb(context2, "tt_more_history")), "tt_more_history_icon", new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.common.thx.3
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    if (thx.this.sya != null) {
                        thx.this.sya.ycx();
                    }
                }
            });
            this.f24721zb.addView(ludVarYcx);
        }
        com.bytedance.sdk.openadsdk.core.lt.lud ludVarYcx2 = ycx(8);
        Context context3 = this.ycx;
        ycx(ludVarYcx2, context3.getString(com.bytedance.sdk.component.utils.wwx.zb(context3, "tt_more_retry")), "tt_more_retry_icon", new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.common.thx.4
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (thx.this.sya != null) {
                    thx.this.sya.zb();
                }
            }
        });
        Context context4 = this.ycx;
        ycx(ludVarYcx2, context4.getString(com.bytedance.sdk.component.utils.wwx.zb(context4, "tt_more_copy_link")), "tt_more_copy_icon", new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.common.thx.5
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (thx.this.sya != null) {
                    thx.this.sya.sya();
                }
            }
        });
        Context context5 = this.ycx;
        ycx(ludVarYcx2, context5.getString(com.bytedance.sdk.component.utils.wwx.zb(context5, "tt_more_open_browser")), "tt_more_browser_icon", new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.common.thx.6
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (thx.this.sya != null) {
                    thx.this.sya.dj();
                }
            }
        });
        this.f24721zb.addView(ludVarYcx2);
        com.bytedance.sdk.openadsdk.core.lt.lud ludVarYcx3 = ycx(8);
        if (!this.f24720dj) {
            Context context6 = this.ycx;
            ycx(ludVarYcx3, context6.getString(com.bytedance.sdk.component.utils.wwx.zb(context6, "tt_privacy")), "tt_more_privacy_icon", new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.common.thx.7
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    if (thx.this.sya != null) {
                        thx.this.sya.lt();
                    }
                }
            });
        }
        Context context7 = this.ycx;
        ycx(ludVarYcx3, context7.getString(com.bytedance.sdk.component.utils.wwx.zb(context7, "tt_more_report")), "tt_more_report_icon", new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.common.thx.8
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (thx.this.sya != null) {
                    thx.this.sya.lud();
                }
            }
        });
        this.f24721zb.addView(ludVarYcx3);
        addView(this.f24721zb);
    }

    private com.bytedance.sdk.openadsdk.core.lt.lud ycx(int i5) {
        com.bytedance.sdk.openadsdk.core.lt.lud ludVar = new com.bytedance.sdk.openadsdk.core.lt.lud(this.ycx);
        ludVar.setOrientation(1);
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(0);
        gradientDrawable.setCornerRadius(ycx(i5));
        gradientDrawable.setColor(-1);
        ludVar.setBackgroundDrawable(gradientDrawable);
        ludVar.setPadding(ycx(8.0f), ycx(8.0f), ycx(8.0f), ycx(8.0f));
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-1, -2);
        layoutParams.topMargin = ycx(8.0f);
        ludVar.setLayoutParams(layoutParams);
        return ludVar;
    }

    public void ycx(View view) {
        View viewFindViewById = view.getRootView().findViewById(16908290);
        if (viewFindViewById instanceof ViewGroup) {
            ViewGroup viewGroup = (ViewGroup) viewFindViewById;
            if (viewGroup.getChildCount() > 0) {
                View childAt = viewGroup.getChildAt(0);
                if (childAt instanceof ViewGroup) {
                    viewGroup = (ViewGroup) childAt;
                }
            }
            ViewGroup.LayoutParams layoutParams = new ViewGroup.LayoutParams(-1, -1);
            if (getParent() == null) {
                viewGroup.addView(this, layoutParams);
            }
            setVisibility(0);
        }
    }

    public void ycx() {
        setVisibility(8);
        if (getParent() != null) {
            ((ViewGroup) getParent()).removeView(this);
        }
    }

    private int ycx(float f11) {
        return dc.zb(this.ycx, f11);
    }
}
