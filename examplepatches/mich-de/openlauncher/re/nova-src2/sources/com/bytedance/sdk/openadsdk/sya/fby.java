package com.bytedance.sdk.openadsdk.sya;

import android.content.Context;
import android.content.res.ColorStateList;
import android.graphics.Color;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.StateListDrawable;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.bytedance.sdk.openadsdk.FilterWord;
import com.bytedance.sdk.openadsdk.sya.jc;
import com.bytedance.sdk.openadsdk.utils.dc;
import java.util.List;

/* loaded from: classes2.dex */
public class fby extends ViewGroup implements jc.sya {
    private final jc ycx;

    public fby(Context context, jc jcVar) {
        super(context);
        this.ycx = jcVar;
        jcVar.ycx(this);
    }

    private View zb(FilterWord filterWord) {
        TextView textView = new TextView(getContext());
        textView.setTag(filterWord);
        ViewGroup.MarginLayoutParams marginLayoutParams = new ViewGroup.MarginLayoutParams(-2, -2);
        int iZb = dc.zb(getContext(), 8.0f);
        marginLayoutParams.leftMargin = iZb;
        marginLayoutParams.bottomMargin = iZb;
        textView.setTextColor(ycx());
        textView.setText(filterWord.getName());
        textView.setPadding(iZb, iZb, iZb, iZb);
        textView.setBackground(zb());
        textView.setSelected(false);
        textView.setOnClickListener(new View.OnClickListener() { // from class: com.bytedance.sdk.openadsdk.sya.fby.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (fby.this.ycx != null) {
                    if (view.isSelected()) {
                        fby.this.ycx.ycx(jc.ycx);
                        return;
                    }
                    Object tag = view.getTag();
                    if (tag instanceof FilterWord) {
                        fby.this.ycx.ycx((FilterWord) tag);
                    }
                }
            }
        });
        textView.setSelected(false);
        textView.setLayoutParams(marginLayoutParams);
        return textView;
    }

    @Override // android.view.ViewGroup
    public ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new ViewGroup.MarginLayoutParams(getContext(), attributeSet);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        int i14;
        int childCount = getChildCount();
        int i15 = i12 - i5;
        int i16 = 0;
        int i17 = 0;
        int i18 = 0;
        while (i16 < childCount) {
            View childAt = getChildAt(i16);
            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) childAt.getLayoutParams();
            int measuredWidth = childAt.getMeasuredWidth();
            int measuredHeight = childAt.getMeasuredHeight();
            int i19 = i16 != 0 ? marginLayoutParams.leftMargin : 0;
            if (measuredWidth + i19 + i17 < i15) {
                i14 = i17 + i19;
            } else {
                i18 += marginLayoutParams.bottomMargin + measuredHeight;
                i14 = 0;
            }
            childAt.layout(i14, marginLayoutParams.topMargin + i18, i14 + measuredWidth, measuredHeight + i18);
            i17 = i14 + measuredWidth + marginLayoutParams.rightMargin;
            i16++;
        }
    }

    @Override // android.view.View
    public void onMeasure(int i5, int i11) {
        View.MeasureSpec.getMode(i5);
        View.MeasureSpec.getMode(i11);
        int size = View.MeasureSpec.getSize(i5);
        View.MeasureSpec.getSize(i11);
        int i12 = 0;
        int i13 = 0;
        int i14 = 0;
        while (i12 < getChildCount()) {
            View childAt = getChildAt(i12);
            ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) childAt.getLayoutParams();
            measureChild(childAt, i5, i11);
            int measuredWidth = childAt.getMeasuredWidth();
            int measuredHeight = childAt.getMeasuredHeight();
            int i15 = i12 != 0 ? marginLayoutParams.leftMargin : 0;
            int i16 = (measuredWidth + i15) + i14 < size ? i14 + i15 : 0;
            if (i16 == 0) {
                i13 += measuredHeight + marginLayoutParams.topMargin + marginLayoutParams.bottomMargin;
            }
            i14 = i16 + measuredWidth + marginLayoutParams.rightMargin;
            i12++;
        }
        setMeasuredDimension(size, i13);
    }

    public void ycx(List<FilterWord> list) {
        if (list == null) {
            return;
        }
        for (int i5 = 0; i5 < list.size(); i5++) {
            FilterWord filterWord = list.get(i5);
            if (filterWord != null) {
                addView(zb(filterWord));
            }
        }
    }

    private ColorStateList ycx() {
        return new ColorStateList(new int[][]{new int[]{16842913}, new int[0]}, new int[]{Color.rgb(255, 44, 85), -16777216});
    }

    @Override // com.bytedance.sdk.openadsdk.sya.jc.sya
    public void ycx(FilterWord filterWord) {
        if (filterWord == null) {
            return;
        }
        for (int i5 = 0; i5 < getChildCount(); i5++) {
            View childAt = getChildAt(i5);
            if (childAt != null) {
                if (jc.ycx.equals(filterWord)) {
                    childAt.setSelected(false);
                } else {
                    childAt.setSelected(filterWord.equals(childAt.getTag()));
                }
            }
        }
    }

    private Drawable zb() {
        GradientDrawable gradientDrawable = new GradientDrawable();
        float fZb = dc.zb(getContext(), 5.0f);
        gradientDrawable.setCornerRadius(fZb);
        gradientDrawable.setColor(Color.parseColor("#0D000000"));
        GradientDrawable gradientDrawable2 = new GradientDrawable();
        gradientDrawable2.setStroke(dc.zb(getContext(), 1.0f), Color.parseColor("#FE2C55"));
        gradientDrawable2.setCornerRadius(fZb);
        gradientDrawable2.setColor(Color.parseColor("#12FE2C55"));
        StateListDrawable stateListDrawable = new StateListDrawable();
        stateListDrawable.addState(new int[]{16842913}, gradientDrawable2);
        stateListDrawable.addState(new int[0], gradientDrawable);
        return stateListDrawable;
    }
}
