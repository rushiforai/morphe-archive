package com.bytedance.adsdk.ugeno.ul.ycx;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;

/* loaded from: classes2.dex */
public class sya extends ycx {
    public sya(Context context) {
        super(context);
    }

    @Override // com.bytedance.adsdk.ugeno.ul.ycx.ycx
    public Drawable zb(int i5) {
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(0);
        gradientDrawable.setColor(i5);
        return gradientDrawable;
    }
}
