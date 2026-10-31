package com.bytedance.sdk.openadsdk.xkz.ycx.zb;

import android.annotation.SuppressLint;
import android.content.Context;
import android.graphics.Color;
import android.graphics.Rect;
import android.graphics.drawable.GradientDrawable;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.core.lt.fby;
import com.bytedance.sdk.openadsdk.core.lt.lud;
import com.bytedance.sdk.openadsdk.core.lt.sya;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class ycx extends sya {
    private InterfaceC0117ycx sya;
    private Context ycx;

    /* renamed from: zb, reason: collision with root package name */
    private lud f27436zb;

    /* renamed from: com.bytedance.sdk.openadsdk.xkz.ycx.zb.ycx$ycx, reason: collision with other inner class name */
    public interface InterfaceC0117ycx {
        void ycx();

        void zb();
    }

    public ycx(Context context) {
        super(context);
        this.ycx = context;
        zb();
    }

    public void setOnMenuItemClickListener(InterfaceC0117ycx interfaceC0117ycx) {
        this.sya = interfaceC0117ycx;
    }

    @SuppressLint({"ClickableViewAccessibility"})
    private void zb() {
        setLayoutParams(new ViewGroup.LayoutParams(-1, -2));
        setBackgroundColor(Color.parseColor("#80000000"));
        lud ludVar = new lud(this.ycx);
        this.f27436zb = ludVar;
        ludVar.setOrientation(1);
        this.f27436zb.setGravity(80);
        this.f27436zb.setPadding(ycx(0.0f), 0, ycx(0.0f), ycx(34.0f));
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(0);
        gradientDrawable.setCornerRadius(ycx(16.0f));
        gradientDrawable.setColor(-1);
        this.f27436zb.setBackground(gradientDrawable);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -2);
        layoutParams.gravity = 81;
        layoutParams.bottomMargin = ycx(16.0f);
        this.f27436zb.setLayoutParams(layoutParams);
        lud ludVar2 = new lud(this.ycx);
        ludVar2.setLayoutParams(new LinearLayout.LayoutParams(-1, ycx(52.0f)));
        ludVar2.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.xkz.ycx.zb.ycx.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (ycx.this.sya != null) {
                    ycx.this.sya.ycx();
                }
            }
        });
        Context context = this.ycx;
        String string = context.getString(wwx.zb(context, "tt_history_delete_all"));
        fby fbyVar = new fby(this.ycx);
        fbyVar.setText(string);
        fbyVar.setTextAppearance(16974331);
        fbyVar.setTextColor(-65536);
        fbyVar.setTextSize(2, 15.0f);
        fbyVar.setGravity(17);
        ludVar2.addView(fbyVar);
        ludVar2.setGravity(17);
        this.f27436zb.addView(ludVar2);
        lud ludVar3 = new lud(this.ycx);
        ludVar3.setLayoutParams(new LinearLayout.LayoutParams(-1, ycx(8.0f)));
        ludVar3.setBackgroundColor(Color.argb(8, 22, 24, 35));
        this.f27436zb.addView(ludVar3);
        lud ludVar4 = new lud(this.ycx);
        ludVar4.setLayoutParams(new LinearLayout.LayoutParams(-1, ycx(52.0f)));
        ludVar4.setGravity(17);
        ludVar4.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.xkz.ycx.zb.ycx.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (ycx.this.sya != null) {
                    ycx.this.sya.zb();
                }
            }
        });
        fby fbyVar2 = new fby(this.ycx);
        Context context2 = this.ycx;
        fbyVar2.setText(context2.getString(wwx.zb(context2, "tt_history_cancel")));
        fbyVar2.setTextAppearance(16974331);
        fbyVar2.setTextColor(Color.parseColor("#000000"));
        fbyVar2.setTextSize(2, 15.0f);
        fbyVar2.setGravity(17);
        ludVar4.addView(fbyVar2);
        this.f27436zb.addView(ludVar4);
        addView(this.f27436zb);
        setOnTouchListener(new View.OnTouchListener() { // from class: com.bytedance.sdk.openadsdk.xkz.ycx.zb.ycx.3
            @Override // android.view.View.OnTouchListener
            public boolean onTouch(View view, MotionEvent motionEvent) {
                if (motionEvent.getAction() == 1) {
                    Rect rect = new Rect();
                    ycx.this.f27436zb.getGlobalVisibleRect(rect);
                    if (!rect.contains((int) motionEvent.getRawX(), (int) motionEvent.getRawY())) {
                        ycx.this.ycx();
                    }
                }
                return true;
            }
        });
    }

    public void ycx(View view) {
        View viewFindViewById = view.getRootView().findViewById(16908290);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, -1);
        layoutParams.gravity = 80;
        if (getParent() == null) {
            ((ViewGroup) viewFindViewById).addView(this, layoutParams);
        }
        setVisibility(0);
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
