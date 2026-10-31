package com.bytedance.sdk.component.adexpress.dj;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.GradientDrawable;

/* loaded from: classes2.dex */
public class sya {
    public static Drawable ycx(Context context, com.bytedance.sdk.component.adexpress.dynamic.dj.ul ulVar) {
        if (context == null || ulVar == null) {
            return null;
        }
        return ycx(context, (int) ul.ycx(context, ulVar.wie()), ulVar.dy(), ulVar.bhi());
    }

    public static Drawable ycx(Context context, int i5, int i11, int i12) {
        GradientDrawable gradientDrawable = new GradientDrawable();
        gradientDrawable.setShape(1);
        if (context != null) {
            gradientDrawable.setStroke(i5, i11);
        }
        gradientDrawable.setColor(i12);
        return gradientDrawable;
    }
}
