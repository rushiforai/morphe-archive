package com.teslacoilsw.launcher.widget;

import a5.a1;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import java.util.WeakHashMap;
import o9.r0;
import o9.u2;

/* loaded from: classes4.dex */
public class FitWindowableFrameLayout extends FrameLayout {

    /* renamed from: a, reason: collision with root package name */
    public final Drawable f46409a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f46410b;

    /* renamed from: c, reason: collision with root package name */
    public final Rect f46411c;

    /* renamed from: d, reason: collision with root package name */
    public final Rect f46412d;

    public FitWindowableFrameLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f46411c = new Rect();
        this.f46412d = new Rect();
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.L, 0, 0);
        if (typedArrayObtainStyledAttributes == null) {
            return;
        }
        this.f46409a = typedArrayObtainStyledAttributes.getDrawable(0);
        this.f46410b = typedArrayObtainStyledAttributes.getBoolean(1, true);
        typedArrayObtainStyledAttributes.recycle();
        setWillNotDraw(true);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static void a(View view, Rect rect, Rect rect2) {
        View viewFindViewById = view.findViewById(2131429060);
        if (viewFindViewById != null) {
            viewFindViewById.setPadding((viewFindViewById.getPaddingLeft() + rect.left) - rect2.left, (viewFindViewById.getPaddingTop() + rect.top) - rect2.top, (viewFindViewById.getPaddingRight() + rect.right) - rect2.right, viewFindViewById.getPaddingBottom());
        }
        View viewFindViewById2 = view.findViewById(2131428085);
        if (viewFindViewById2 != 0) {
            if (viewFindViewById2 instanceof r0) {
                ((r0) viewFindViewById2).h(rect);
            } else {
                viewFindViewById2.setPadding((viewFindViewById2.getPaddingLeft() + rect.left) - rect2.left, viewFindViewById2.getPaddingTop(), (viewFindViewById2.getPaddingRight() + rect.right) - rect2.right, (viewFindViewById2.getPaddingBottom() + rect.bottom) - rect2.bottom);
            }
        }
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i5, ViewGroup.LayoutParams layoutParams) {
        super.addView(view, i5, layoutParams);
        a(view, this.f46411c, new Rect());
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        super.draw(canvas);
        int width = getWidth();
        int height = getHeight();
        if (this.f46409a != null) {
            int iSave = canvas.save();
            canvas.translate(getScrollX(), getScrollY());
            Rect rect = this.f46411c;
            int i5 = rect.top;
            Rect rect2 = this.f46412d;
            rect2.set(0, 0, width, i5);
            this.f46409a.setBounds(rect2);
            this.f46409a.draw(canvas);
            if (this.f46410b) {
                rect2.set(0, height - rect.bottom, width, height);
                this.f46409a.setBounds(rect2);
                this.f46409a.draw(canvas);
            }
            if (width > height) {
                rect2.set(0, rect.top, rect.left, height - rect.bottom);
                this.f46409a.setBounds(rect2);
                this.f46409a.draw(canvas);
                rect2.set(width - rect.right, rect.top, width, height - rect.bottom);
                this.f46409a.setBounds(rect2);
                this.f46409a.draw(canvas);
            }
            canvas.restoreToCount(iSave);
        }
    }

    @Override // android.view.View
    public final boolean fitSystemWindows(Rect rect) {
        Rect rect2;
        int i5 = 0;
        while (true) {
            int childCount = getChildCount();
            rect2 = this.f46411c;
            if (i5 >= childCount) {
                break;
            }
            a(getChildAt(i5), rect, rect2);
            i5++;
        }
        rect2.set(rect);
        setWillNotDraw(this.f46409a == null);
        WeakHashMap weakHashMap = a1.f250a;
        postInvalidateOnAnimation();
        return true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        Drawable drawable = this.f46409a;
        if (drawable != null) {
            drawable.setCallback(this);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        Drawable drawable = this.f46409a;
        if (drawable != null) {
            drawable.setCallback(null);
        }
    }
}
