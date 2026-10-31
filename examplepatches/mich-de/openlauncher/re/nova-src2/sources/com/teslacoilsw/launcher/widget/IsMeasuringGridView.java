package com.teslacoilsw.launcher.widget;

import android.content.Context;
import android.graphics.Canvas;
import android.util.AttributeSet;
import x30.e;

/* loaded from: classes4.dex */
public class IsMeasuringGridView extends e {

    /* renamed from: l, reason: collision with root package name */
    public boolean f46422l;

    public IsMeasuringGridView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f95042a = 2;
        this.f95043b = 0;
        this.f95045d = 2;
        setDivider(null);
        this.f46422l = false;
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        super.onDraw(canvas);
    }

    @Override // x30.e, android.widget.ListView, android.widget.AbsListView, android.view.View
    public final void onMeasure(int i5, int i11) {
        this.f46422l = true;
        super.onMeasure(i5, i11);
        this.f46422l = false;
    }
}
