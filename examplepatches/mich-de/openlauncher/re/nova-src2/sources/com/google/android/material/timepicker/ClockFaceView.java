package com.google.android.material.timepicker;

import a5.a1;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.RadialGradient;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader;
import android.util.AttributeSet;
import android.util.DisplayMetrics;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.TextView;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import ps.f0;

/* loaded from: classes3.dex */
class ClockFaceView extends k implements f {
    public final int A;
    public final int B;
    public final int C;
    public final int D;
    public String[] E;
    public float F;
    public final ColorStateList G;

    /* renamed from: s, reason: collision with root package name */
    public final ClockHandView f34420s;

    /* renamed from: t, reason: collision with root package name */
    public final Rect f34421t;

    /* renamed from: u, reason: collision with root package name */
    public final RectF f34422u;

    /* renamed from: v, reason: collision with root package name */
    public final Rect f34423v;

    /* renamed from: w, reason: collision with root package name */
    public final SparseArray f34424w;

    /* renamed from: x, reason: collision with root package name */
    public final c f34425x;

    /* renamed from: y, reason: collision with root package name */
    public final int[] f34426y;

    /* renamed from: z, reason: collision with root package name */
    public final float[] f34427z;

    public ClockFaceView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f34421t = new Rect();
        this.f34422u = new RectF();
        this.f34423v = new Rect();
        this.f34424w = new SparseArray();
        this.f34427z = new float[]{0.0f, 0.9f, 1.0f};
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, bj.a.f17922i, 2130969601, 2132084050);
        Resources resources = getResources();
        ColorStateList colorStateListM = f0.m(context, typedArrayObtainStyledAttributes, 1);
        this.G = colorStateListM;
        LayoutInflater.from(context).inflate(2131624207, (ViewGroup) this, true);
        ClockHandView clockHandView = (ClockHandView) findViewById(2131428323);
        this.f34420s = clockHandView;
        this.A = resources.getDimensionPixelSize(2131165989);
        int colorForState = colorStateListM.getColorForState(new int[]{16842913}, colorStateListM.getDefaultColor());
        this.f34426y = new int[]{colorForState, colorForState, colorStateListM.getDefaultColor()};
        clockHandView.f34438j.add(this);
        int defaultColor = o4.a.b(context, 2131100580).getDefaultColor();
        ColorStateList colorStateListM2 = f0.m(context, typedArrayObtainStyledAttributes, 0);
        setBackgroundColor(colorStateListM2 != null ? colorStateListM2.getDefaultColor() : defaultColor);
        getViewTreeObserver().addOnPreDrawListener(new b(this));
        setFocusable(true);
        typedArrayObtainStyledAttributes.recycle();
        this.f34425x = new c(this);
        String[] strArr = new String[12];
        Arrays.fill(strArr, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b);
        p(0, strArr);
        this.B = resources.getDimensionPixelSize(2131166017);
        this.C = resources.getDimensionPixelSize(2131166018);
        this.D = resources.getDimensionPixelSize(2131165996);
    }

    @Override // com.google.android.material.timepicker.f
    public final void d(float f11, boolean z11) {
        if (Math.abs(this.F - f11) > 0.001f) {
            this.F = f11;
            o();
        }
    }

    @Override // com.google.android.material.timepicker.k
    public final void n() {
        j4.m mVar = new j4.m();
        mVar.b(this);
        HashMap map = new HashMap();
        for (int i5 = 0; i5 < getChildCount(); i5++) {
            View childAt = getChildAt(i5);
            if (childAt.getId() != 2131427678 && !"skip".equals(childAt.getTag())) {
                int i11 = (Integer) childAt.getTag(2131428324);
                if (i11 == null) {
                    i11 = 1;
                }
                if (!map.containsKey(i11)) {
                    map.put(i11, new ArrayList());
                }
                ((List) map.get(i11)).add(childAt);
            }
        }
        for (Map.Entry entry : map.entrySet()) {
            List list = (List) entry.getValue();
            int iRound = ((Integer) entry.getKey()).intValue() == 2 ? Math.round(this.f34497q * 0.66f) : this.f34497q;
            Iterator it = list.iterator();
            float size = 0.0f;
            while (it.hasNext()) {
                int id2 = ((View) it.next()).getId();
                Integer numValueOf = Integer.valueOf(id2);
                HashMap map2 = mVar.f69048c;
                if (!map2.containsKey(numValueOf)) {
                    map2.put(Integer.valueOf(id2), new j4.h());
                }
                j4.i iVar = ((j4.h) map2.get(Integer.valueOf(id2))).f68973d;
                iVar.f69015z = 2131427678;
                iVar.A = iRound;
                iVar.B = size;
                size += 360.0f / list.size();
            }
        }
        mVar.a(this);
        this.f14190j = null;
        requestLayout();
        int i12 = 0;
        while (true) {
            SparseArray sparseArray = this.f34424w;
            if (i12 >= sparseArray.size()) {
                return;
            }
            ((TextView) sparseArray.get(i12)).setVisibility(0);
            i12++;
        }
    }

    public final void o() {
        SparseArray sparseArray;
        Rect rect;
        RectF rectF;
        RectF rectF2 = this.f34420s.n;
        float f11 = Float.MAX_VALUE;
        TextView textView = null;
        int i5 = 0;
        while (true) {
            sparseArray = this.f34424w;
            int size = sparseArray.size();
            rect = this.f34421t;
            rectF = this.f34422u;
            if (i5 >= size) {
                break;
            }
            TextView textView2 = (TextView) sparseArray.get(i5);
            if (textView2 != null) {
                textView2.getHitRect(rect);
                rectF.set(rect);
                rectF.union(rectF2);
                float fHeight = rectF.height() * rectF.width();
                if (fHeight < f11) {
                    textView = textView2;
                    f11 = fHeight;
                }
            }
            i5++;
        }
        for (int i11 = 0; i11 < sparseArray.size(); i11++) {
            TextView textView3 = (TextView) sparseArray.get(i11);
            if (textView3 != null) {
                textView3.setSelected(textView3 == textView);
                textView3.getHitRect(rect);
                rectF.set(rect);
                textView3.getLineBounds(0, this.f34423v);
                rectF.inset(r8.left, r8.top);
                textView3.getPaint().setShader(!RectF.intersects(rectF2, rectF) ? null : new RadialGradient(rectF2.centerX() - rectF.left, rectF2.centerY() - rectF.top, 0.5f * rectF2.width(), this.f34426y, this.f34427z, Shader.TileMode.CLAMP));
                textView3.invalidate();
            }
        }
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        accessibilityNodeInfo.setCollectionInfo((AccessibilityNodeInfo.CollectionInfo) b5.f.j(1, this.E.length, 1, false).f17550a);
    }

    @Override // androidx.constraintlayout.widget.ConstraintLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        super.onLayout(z11, i5, i11, i12, i13);
        o();
    }

    @Override // androidx.constraintlayout.widget.ConstraintLayout, android.view.View
    public final void onMeasure(int i5, int i11) {
        DisplayMetrics displayMetrics = getResources().getDisplayMetrics();
        int iMax = (int) (this.D / Math.max(Math.max(this.B / displayMetrics.heightPixels, this.C / displayMetrics.widthPixels), 1.0f));
        int iMakeMeasureSpec = View.MeasureSpec.makeMeasureSpec(iMax, 1073741824);
        setMeasuredDimension(iMax, iMax);
        super.onMeasure(iMakeMeasureSpec, iMakeMeasureSpec);
    }

    public final void p(int i5, String[] strArr) {
        this.E = strArr;
        LayoutInflater layoutInflaterFrom = LayoutInflater.from(getContext());
        SparseArray sparseArray = this.f34424w;
        int size = sparseArray.size();
        boolean z11 = false;
        for (int i11 = 0; i11 < Math.max(this.E.length, size); i11++) {
            TextView textView = (TextView) sparseArray.get(i11);
            if (i11 >= this.E.length) {
                removeView(textView);
                sparseArray.remove(i11);
            } else {
                if (textView == null) {
                    textView = (TextView) layoutInflaterFrom.inflate(2131624206, (ViewGroup) this, false);
                    sparseArray.put(i11, textView);
                    addView(textView);
                }
                textView.setText(this.E[i11]);
                textView.setTag(2131428339, Integer.valueOf(i11));
                int i12 = (i11 / 12) + 1;
                textView.setTag(2131428324, Integer.valueOf(i12));
                if (i12 > 1) {
                    z11 = true;
                }
                a1.k(textView, this.f34425x);
                textView.setTextColor(this.G);
                if (i5 != 0) {
                    textView.setContentDescription(getResources().getString(i5, this.E[i11]));
                }
            }
        }
        ClockHandView clockHandView = this.f34420s;
        if (clockHandView.f34437i && !z11) {
            clockHandView.f34447u = 1;
        }
        clockHandView.f34437i = z11;
        clockHandView.invalidate();
    }
}
