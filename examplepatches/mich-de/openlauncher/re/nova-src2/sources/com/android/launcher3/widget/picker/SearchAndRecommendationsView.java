package com.android.launcher3.widget.picker;

import android.content.Context;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.widget.LinearLayout;
import eb.c;

/* loaded from: classes2.dex */
public class SearchAndRecommendationsView extends LinearLayout {

    /* renamed from: a, reason: collision with root package name */
    public c f21345a;

    public SearchAndRecommendationsView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 0, 0);
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        c cVar = this.f21345a;
        boolean zB = cVar.b(motionEvent, c.n);
        cVar.f52466l = zB;
        return zB || super.onInterceptTouchEvent(motionEvent);
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        c cVar = this.f21345a;
        return (cVar.f52466l && cVar.b(motionEvent, c.o)) || super.onTouchEvent(motionEvent);
    }
}
