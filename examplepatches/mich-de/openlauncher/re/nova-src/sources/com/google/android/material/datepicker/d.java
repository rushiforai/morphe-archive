package com.google.android.material.datepicker;

import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Paint;
import ps.e0;
import ps.f0;

/* loaded from: classes3.dex */
public final class d {

    /* renamed from: a, reason: collision with root package name */
    public final c f34241a;

    /* renamed from: b, reason: collision with root package name */
    public final c f34242b;

    public d(Context context) throws Resources.NotFoundException {
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(e0.w(context, 2130969593, MaterialCalendar.class.getCanonicalName()).data, bj.a.f17932u);
        c.a(context, typedArrayObtainStyledAttributes.getResourceId(4, 0));
        c.a(context, typedArrayObtainStyledAttributes.getResourceId(2, 0));
        c.a(context, typedArrayObtainStyledAttributes.getResourceId(3, 0));
        c.a(context, typedArrayObtainStyledAttributes.getResourceId(5, 0));
        ColorStateList colorStateListM = f0.m(context, typedArrayObtainStyledAttributes, 7);
        this.f34241a = c.a(context, typedArrayObtainStyledAttributes.getResourceId(9, 0));
        c.a(context, typedArrayObtainStyledAttributes.getResourceId(8, 0));
        this.f34242b = c.a(context, typedArrayObtainStyledAttributes.getResourceId(10, 0));
        new Paint().setColor(colorStateListM.getDefaultColor());
        typedArrayObtainStyledAttributes.recycle();
    }
}
