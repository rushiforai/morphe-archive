package com.google.android.material.datepicker;

import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Rect;
import ps.f0;

/* loaded from: classes3.dex */
public final class c {
    public static c a(Context context, int i5) throws Resources.NotFoundException {
        if (!(i5 != 0)) {
            throw new IllegalArgumentException("Cannot create a CalendarItemStyle with a styleResId of 0");
        }
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(i5, bj.a.f17933v);
        Rect rect = new Rect(typedArrayObtainStyledAttributes.getDimensionPixelOffset(0, 0), typedArrayObtainStyledAttributes.getDimensionPixelOffset(2, 0), typedArrayObtainStyledAttributes.getDimensionPixelOffset(1, 0), typedArrayObtainStyledAttributes.getDimensionPixelOffset(3, 0));
        f0.m(context, typedArrayObtainStyledAttributes, 4);
        f0.m(context, typedArrayObtainStyledAttributes, 9);
        f0.m(context, typedArrayObtainStyledAttributes, 7);
        typedArrayObtainStyledAttributes.getDimensionPixelSize(8, 0);
        bk.j.b(context, typedArrayObtainStyledAttributes.getResourceId(5, 0), typedArrayObtainStyledAttributes.getResourceId(6, 0), new bk.a(0)).a();
        typedArrayObtainStyledAttributes.recycle();
        c cVar = new c();
        v30.e.c(rect.left);
        v30.e.c(rect.top);
        v30.e.c(rect.right);
        v30.e.c(rect.bottom);
        return cVar;
    }
}
