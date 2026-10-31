package com.google.android.gms.wallet.button;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;
import android.graphics.drawable.RippleDrawable;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import gi.c;
import gu.j;
import hi.b;

/* loaded from: classes3.dex */
public final class PayButton extends FrameLayout implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public View.OnClickListener f33915a;

    /* renamed from: b, reason: collision with root package name */
    public final j f33916b;

    /* renamed from: c, reason: collision with root package name */
    public View f33917c;

    public PayButton(Context context, AttributeSet attributeSet) throws Resources.NotFoundException {
        super(context, attributeSet, 0);
        j jVarD = ButtonOptions.d();
        this.f33916b = jVarD;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, c.f57680a);
        int i5 = typedArrayObtainStyledAttributes.getInt(0, 1);
        int dimensionPixelSize = typedArrayObtainStyledAttributes.getDimensionPixelSize(1, (int) TypedValue.applyDimension(1, 100.0f, Resources.getSystem().getDisplayMetrics()));
        ButtonOptions buttonOptions = (ButtonOptions) jVarD.f57836b;
        buttonOptions.f33912g = i5;
        buttonOptions.f33913h = dimensionPixelSize;
        typedArrayObtainStyledAttributes.hasValue(1);
        typedArrayObtainStyledAttributes.recycle();
        buttonOptions.f33911f = 1;
        if (isInEditMode()) {
            a(buttonOptions);
        }
    }

    public final void a(ButtonOptions buttonOptions) throws Resources.NotFoundException {
        removeAllViews();
        b bVar = new b(new ContextThemeWrapper(getContext(), buttonOptions.f33912g == 2 ? 2132083119 : 2132083118), null);
        LinearLayout linearLayout = (LinearLayout) LayoutInflater.from(bVar.getContext()).inflate(2131624293, (ViewGroup) bVar, true).findViewById(2131428529);
        Context context = bVar.getContext();
        int i5 = buttonOptions.f33913h;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(new TypedValue().data, new int[]{2130969799});
        Drawable drawable = typedArrayObtainStyledAttributes.getDrawable(0);
        typedArrayObtainStyledAttributes.recycle();
        if (drawable == null) {
            drawable = new GradientDrawable();
        }
        GradientDrawable gradientDrawable = (GradientDrawable) drawable.mutate();
        gradientDrawable.setCornerRadius(i5);
        TypedArray typedArrayObtainStyledAttributes2 = context.obtainStyledAttributes(new TypedValue().data, new int[]{2130969801});
        int color = typedArrayObtainStyledAttributes2.getColor(0, 0);
        typedArrayObtainStyledAttributes2.recycle();
        linearLayout.setBackground(new RippleDrawable(ColorStateList.valueOf(color), gradientDrawable, null));
        bVar.setContentDescription(bVar.getContext().getString(2132017975));
        this.f33917c = bVar;
        addView(bVar);
        this.f33917c.setOnClickListener(this);
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        View.OnClickListener onClickListener = this.f33915a;
        if (onClickListener == null || view != this.f33917c) {
            return;
        }
        onClickListener.onClick(this);
    }

    @Override // android.view.View
    public final void setOnClickListener(View.OnClickListener onClickListener) {
        this.f33915a = onClickListener;
    }
}
