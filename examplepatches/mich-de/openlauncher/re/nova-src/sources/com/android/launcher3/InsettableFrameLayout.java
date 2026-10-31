package com.android.launcher3;

import android.content.Context;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import o9.r0;
import o9.s0;

/* loaded from: classes.dex */
public class InsettableFrameLayout extends FrameLayout implements r0 {

    /* renamed from: a, reason: collision with root package name */
    public final Rect f20960a;

    public InsettableFrameLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f20960a = new Rect();
    }

    public static void a(ViewGroup viewGroup, Rect rect) {
        int childCount = viewGroup.getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            KeyEvent.Callback childAt = viewGroup.getChildAt(i5);
            if (childAt instanceof r0) {
                ((r0) childAt).h(rect);
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static void e(View view, Rect rect, Rect rect2) {
        s0 s0Var = (s0) view.getLayoutParams();
        if (view instanceof r0) {
            ((r0) view).h(rect);
        } else if (!s0Var.f80099a) {
            ((FrameLayout.LayoutParams) s0Var).topMargin = (rect.top - rect2.top) + ((FrameLayout.LayoutParams) s0Var).topMargin;
            ((FrameLayout.LayoutParams) s0Var).leftMargin = (rect.left - rect2.left) + ((FrameLayout.LayoutParams) s0Var).leftMargin;
            ((FrameLayout.LayoutParams) s0Var).rightMargin = (rect.right - rect2.right) + ((FrameLayout.LayoutParams) s0Var).rightMargin;
            ((FrameLayout.LayoutParams) s0Var).bottomMargin = (rect.bottom - rect2.bottom) + ((FrameLayout.LayoutParams) s0Var).bottomMargin;
        }
        view.setLayoutParams(s0Var);
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup
    /* renamed from: b, reason: merged with bridge method [inline-methods] */
    public s0 generateDefaultLayoutParams() {
        return new s0(-2, -2);
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup
    /* renamed from: c, reason: merged with bridge method [inline-methods] */
    public s0 generateLayoutParams(AttributeSet attributeSet) {
        return new s0(getContext(), attributeSet);
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup
    public boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof s0;
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup
    /* renamed from: d, reason: merged with bridge method [inline-methods] */
    public s0 generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return new s0(layoutParams);
    }

    @Override // o9.r0
    public void h(Rect rect) {
        int childCount = getChildCount();
        int i5 = 0;
        while (true) {
            Rect rect2 = this.f20960a;
            if (i5 >= childCount) {
                rect2.set(rect);
                return;
            } else {
                e(getChildAt(i5), rect, rect2);
                i5++;
            }
        }
    }

    @Override // android.view.ViewGroup
    public void onViewAdded(View view) {
        super.onViewAdded(view);
        if (isAttachedToWindow()) {
            e(view, this.f20960a, new Rect());
        }
    }
}
