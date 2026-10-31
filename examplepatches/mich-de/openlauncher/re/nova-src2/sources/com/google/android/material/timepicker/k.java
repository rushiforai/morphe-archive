package com.google.android.material.timepicker;

import a5.a1;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.TypedArray;
import android.os.Handler;
import android.util.AttributeSet;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import androidx.constraintlayout.widget.ConstraintLayout;
import java.util.WeakHashMap;

/* loaded from: classes3.dex */
public abstract class k extends ConstraintLayout {

    /* renamed from: p, reason: collision with root package name */
    public final g f34496p;

    /* renamed from: q, reason: collision with root package name */
    public int f34497q;

    /* renamed from: r, reason: collision with root package name */
    public final bk.g f34498r;

    public k(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 2130969601);
        LayoutInflater.from(context).inflate(2131624208, this);
        bk.g gVar = new bk.g();
        this.f34498r = gVar;
        bk.h hVar = new bk.h(0.5f);
        bk.j jVarF = gVar.f17980a.f17964a.f();
        jVarF.f18007e = hVar;
        jVarF.f18008f = hVar;
        jVarF.f18009g = hVar;
        jVarF.f18010h = hVar;
        gVar.c(jVarF.a());
        this.f34498r.l(ColorStateList.valueOf(-1));
        bk.g gVar2 = this.f34498r;
        WeakHashMap weakHashMap = a1.f250a;
        setBackground(gVar2);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, bj.a.E, 2130969601, 0);
        this.f34497q = typedArrayObtainStyledAttributes.getDimensionPixelSize(0, 0);
        this.f34496p = new g(this, 1);
        typedArrayObtainStyledAttributes.recycle();
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i5, ViewGroup.LayoutParams layoutParams) {
        super.addView(view, i5, layoutParams);
        if (view.getId() == -1) {
            WeakHashMap weakHashMap = a1.f250a;
            view.setId(View.generateViewId());
        }
        Handler handler = getHandler();
        if (handler != null) {
            g gVar = this.f34496p;
            handler.removeCallbacks(gVar);
            handler.post(gVar);
        }
    }

    public abstract void n();

    @Override // android.view.View
    public final void onFinishInflate() {
        super.onFinishInflate();
        n();
    }

    @Override // androidx.constraintlayout.widget.ConstraintLayout, android.view.ViewGroup
    public final void onViewRemoved(View view) {
        super.onViewRemoved(view);
        Handler handler = getHandler();
        if (handler != null) {
            g gVar = this.f34496p;
            handler.removeCallbacks(gVar);
            handler.post(gVar);
        }
    }

    @Override // android.view.View
    public final void setBackgroundColor(int i5) {
        this.f34498r.l(ColorStateList.valueOf(i5));
    }
}
