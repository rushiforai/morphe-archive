package com.bytedance.adsdk.ugeno.ul.ycx;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;

/* loaded from: classes2.dex */
public class zb extends ycx {
    public zb(Context context) {
        super(context);
    }

    @Override // com.bytedance.adsdk.ugeno.ul.ycx.ycx
    public Drawable zb(int i5) {
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(1);
        gradientDrawable.setColor(i5);
        return gradientDrawable;
    }
}
