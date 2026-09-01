package com.medium.android.donkey.write;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.widget.LinearLayout;
import defpackage.h1;
import defpackage.m45;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ParagraphContainer extends LinearLayout {
    public final ArrayList a;
    public final Rect b;
    public m45 c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ParagraphContainer(Context context) {
        super(context);
        context.getClass();
        this.a = new ArrayList();
        this.b = new Rect();
    }

    public final m45 getOnTouchEmptyArea() {
        return this.c;
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        motionEvent.getClass();
        float x = motionEvent.getX();
        float y = motionEvent.getY();
        ArrayList<Rect> arrayList = this.a;
        if (arrayList == null || !arrayList.isEmpty()) {
            for (Rect rect : arrayList) {
                if (x > rect.left && x < rect.right && y > rect.top && y < rect.bottom) {
                    return super.onInterceptTouchEvent(motionEvent);
                }
            }
        }
        m45 m45Var = this.c;
        if (m45Var == null) {
            return true;
        }
        m45Var.invoke();
        return true;
    }

    @Override // android.widget.LinearLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        super.onLayout(z, i, i2, i3, i4);
        ArrayList arrayList = this.a;
        arrayList.clear();
        arrayList.getClass();
        h1 h1Var = new h1(7, this);
        while (h1Var.hasNext()) {
            View view = (View) h1Var.next();
            view.getClass();
            int left = view.getLeft();
            int top = view.getTop();
            int right = view.getRight();
            int bottom = view.getBottom();
            Rect rect = this.b;
            rect.set(left, top, right, bottom);
            arrayList.add(rect);
        }
    }

    public final void setOnTouchEmptyArea(m45 m45Var) {
        this.c = m45Var;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ParagraphContainer(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        context.getClass();
        this.a = new ArrayList();
        this.b = new Rect();
    }
}
