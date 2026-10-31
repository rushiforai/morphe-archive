package com.bytedance.sdk.openadsdk.sya;

import android.content.Context;
import android.graphics.Color;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.view.View;
import android.widget.LinearLayout;
import com.bytedance.sdk.component.utils.wwx;
import com.bytedance.sdk.openadsdk.FilterWord;
import com.bytedance.sdk.openadsdk.sya.jc;
import com.bytedance.sdk.openadsdk.utils.dc;

/* loaded from: classes2.dex */
public class lud extends com.bytedance.sdk.openadsdk.core.lt.lud implements View.OnClickListener, jc.sya {

    /* renamed from: dj, reason: collision with root package name */
    private final jc f27014dj;

    /* renamed from: lt, reason: collision with root package name */
    private StateListDrawable f27015lt;
    private FilterWord lud;

    /* renamed from: ul, reason: collision with root package name */
    private final int f27016ul;
    public static FilterWord ycx = new FilterWord("100:1", "GOOD");

    /* renamed from: zb, reason: collision with root package name */
    public static FilterWord f27013zb = new FilterWord("100:2", "NOT_BAD");
    public static FilterWord sya = new FilterWord("100:3", "BAD");

    public lud(Context context, int i5, jc jcVar) {
        super(context);
        this.f27016ul = i5;
        this.f27014dj = jcVar;
        if (jcVar != null) {
            jcVar.ycx(this);
        }
        ycx(i5);
        ycx();
        zb();
    }

    private void ycx(int i5) {
        if (i5 == 1) {
            this.lud = ycx;
        } else if (i5 == 2) {
            this.lud = f27013zb;
        } else {
            if (i5 != 3) {
                return;
            }
            this.lud = sya;
        }
    }

    private void zb() {
        com.bytedance.sdk.openadsdk.core.lt.fby fbyVar = new com.bytedance.sdk.openadsdk.core.lt.fby(getContext());
        fbyVar.setTextSize(this.f27014dj.jw() ? 40 : 30);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(-2, -2);
        layoutParams.gravity = 1;
        layoutParams.setMargins(0, dc.zb(getContext(), 12.0f), 0, dc.zb(getContext(), this.f27014dj.jw() ? 8.0f : 4.0f));
        addView(fbyVar, layoutParams);
        ycx ycxVar = new ycx(getContext());
        ycxVar.setTextSize(this.f27014dj.jw() ? 17 : 12);
        ycxVar.setTextColor(-16777216);
        ycxVar.setMaxLines(1);
        ycxVar.setSingleLine();
        ycxVar.setGravity(17);
        LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-2, -2);
        layoutParams2.gravity = 1;
        layoutParams2.setMargins(0, 0, 0, dc.zb(getContext(), 12.0f));
        addView(ycxVar, layoutParams2);
        int i5 = this.f27016ul;
        if (i5 == 1) {
            fbyVar.setText("😍");
            ycxVar.setText(wwx.ycx(getContext(), "tt_good"));
        } else if (i5 == 2) {
            ycxVar.setText(wwx.ycx(getContext(), "tt_not_bad"));
            fbyVar.setText("😐");
        } else {
            if (i5 != 3) {
                return;
            }
            ycxVar.setText(wwx.ycx(getContext(), "tt_bad"));
            fbyVar.setText("😡");
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        if (isSelected()) {
            this.f27014dj.ycx(jc.ycx);
        } else {
            this.f27014dj.ycx(this.lud);
        }
    }

    private void ycx() {
        if (this.f27015lt == null) {
            GradientDrawable gradientDrawable = new GradientDrawable();
            gradientDrawable.setCornerRadius(dc.zb(getContext(), 12.0f));
            gradientDrawable.setColor(Color.parseColor("#F8F8F8"));
            GradientDrawable gradientDrawable2 = new GradientDrawable();
            gradientDrawable2.setStroke(dc.zb(getContext(), 2.0f), Color.parseColor("#FE2C55"));
            gradientDrawable2.setCornerRadius(dc.zb(getContext(), 12.0f));
            gradientDrawable2.setColor(Color.parseColor("#12FE2C55"));
            StateListDrawable stateListDrawable = new StateListDrawable();
            this.f27015lt = stateListDrawable;
            stateListDrawable.addState(new int[]{16842913}, gradientDrawable2);
            this.f27015lt.addState(new int[0], gradientDrawable);
        }
        setBackground(this.f27015lt);
        setSelected(false);
        setOrientation(1);
        LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(0, -2);
        layoutParams.weight = 1.0f;
        setLayoutParams(layoutParams);
        setOnClickListener(this);
    }

    @Override // com.bytedance.sdk.openadsdk.sya.jc.sya
    public void ycx(FilterWord filterWord) {
        FilterWord filterWord2;
        if (filterWord == null || (filterWord2 = this.lud) == null) {
            return;
        }
        setSelected(filterWord.equals(filterWord2));
    }
}
