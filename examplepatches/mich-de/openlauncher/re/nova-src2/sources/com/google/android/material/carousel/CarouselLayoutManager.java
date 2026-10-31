package com.google.android.material.carousel;

import android.annotation.SuppressLint;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.PointF;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.View;
import android.view.accessibility.AccessibilityEvent;
import androidx.recyclerview.widget.RecyclerView;
import androidx.recyclerview.widget.a2;
import androidx.recyclerview.widget.h2;
import androidx.recyclerview.widget.m2;
import androidx.recyclerview.widget.o2;
import androidx.recyclerview.widget.z1;
import b.c0;
import com.google.android.material.datepicker.t;
import ie.a;
import jj.b;
import jj.d;

/* loaded from: classes3.dex */
public class CarouselLayoutManager extends z1 implements m2 {

    /* renamed from: a, reason: collision with root package name */
    public final d f34147a;

    /* renamed from: b, reason: collision with root package name */
    public a f34148b;

    /* renamed from: c, reason: collision with root package name */
    public final View.OnLayoutChangeListener f34149c;

    public CarouselLayoutManager() {
        d dVar = new d();
        new jj.a();
        this.f34149c = new bd.a(this, 2);
        this.f34147a = dVar;
        requestLayout();
        setOrientation(0);
    }

    @Override // androidx.recyclerview.widget.z1
    public final boolean canScrollHorizontally() {
        return o();
    }

    @Override // androidx.recyclerview.widget.z1
    public final boolean canScrollVertically() {
        return !o();
    }

    @Override // androidx.recyclerview.widget.z1
    public final int computeHorizontalScrollExtent(o2 o2Var) {
        getChildCount();
        return 0;
    }

    @Override // androidx.recyclerview.widget.z1
    public final int computeHorizontalScrollOffset(o2 o2Var) {
        return 0;
    }

    @Override // androidx.recyclerview.widget.z1
    public final int computeHorizontalScrollRange(o2 o2Var) {
        return 0;
    }

    @Override // androidx.recyclerview.widget.m2
    public final PointF computeScrollVectorForPosition(int i5) {
        return null;
    }

    @Override // androidx.recyclerview.widget.z1
    public final int computeVerticalScrollExtent(o2 o2Var) {
        getChildCount();
        return 0;
    }

    @Override // androidx.recyclerview.widget.z1
    public final int computeVerticalScrollOffset(o2 o2Var) {
        return 0;
    }

    @Override // androidx.recyclerview.widget.z1
    public final int computeVerticalScrollRange(o2 o2Var) {
        return 0;
    }

    @Override // androidx.recyclerview.widget.z1
    public final a2 generateDefaultLayoutParams() {
        return new a2(-2, -2);
    }

    @Override // androidx.recyclerview.widget.z1
    public final void getDecoratedBoundsWithMargins(View view, Rect rect) {
        super.getDecoratedBoundsWithMargins(view, rect);
        rect.centerY();
        if (o()) {
            rect.centerX();
        }
        throw null;
    }

    @Override // androidx.recyclerview.widget.z1
    public final boolean isAutoMeasureEnabled() {
        return true;
    }

    @Override // androidx.recyclerview.widget.z1
    public final void measureChildWithMargins(View view, int i5, int i11) {
        throw new IllegalStateException("All children of a RecyclerView using CarouselLayoutManager must use MaskableFrameLayout as their root ViewGroup.");
    }

    public final boolean o() {
        return this.f34148b.f61556b == 0;
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onAttachedToWindow(RecyclerView recyclerView) throws Resources.NotFoundException {
        super.onAttachedToWindow(recyclerView);
        Context context = recyclerView.getContext();
        d dVar = this.f34147a;
        float dimension = dVar.f69567a;
        if (dimension <= 0.0f) {
            dimension = context.getResources().getDimension(2131165679);
        }
        dVar.f69567a = dimension;
        float dimension2 = dVar.f69568b;
        if (dimension2 <= 0.0f) {
            dimension2 = context.getResources().getDimension(2131165678);
        }
        dVar.f69568b = dimension2;
        requestLayout();
        recyclerView.addOnLayoutChangeListener(this.f34149c);
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onDetachedFromWindow(RecyclerView recyclerView, h2 h2Var) {
        onDetachedFromWindow(recyclerView);
        recyclerView.removeOnLayoutChangeListener(this.f34149c);
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0025  */
    /* JADX WARN: Removed duplicated region for block: B:19:0x0029  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0033  */
    @Override // androidx.recyclerview.widget.z1
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final View onFocusSearchFailed(View view, int i5, h2 h2Var, o2 o2Var) {
        char c11;
        if (getChildCount() == 0) {
            return null;
        }
        int i11 = this.f34148b.f61556b;
        if (i5 == 1) {
            c11 = 65535;
        } else if (i5 == 2) {
            c11 = 1;
        } else if (i5 == 17) {
            if (i11 == 0) {
                if (p()) {
                }
            }
            c11 = 0;
        } else if (i5 != 33) {
            if (i5 == 66) {
                if (i11 == 0) {
                    if (p()) {
                    }
                }
                c11 = 0;
            } else if (i5 != 130 || i11 != 1) {
                c11 = 0;
            }
        } else if (i11 == 1) {
        }
        if (c11 == 0) {
            return null;
        }
        if (c11 == 65535) {
            if (getPosition(view) == 0) {
                return null;
            }
            int position = getPosition(getChildAt(0)) - 1;
            if (position < 0 || position >= getItemCount()) {
                return getChildAt(p() ? getChildCount() - 1 : 0);
            }
            this.f34148b.l();
            throw null;
        }
        if (getPosition(view) == getItemCount() - 1) {
            return null;
        }
        int position2 = getPosition(getChildAt(getChildCount() - 1)) + 1;
        if (position2 < 0 || position2 >= getItemCount()) {
            return getChildAt(p() ? 0 : getChildCount() - 1);
        }
        this.f34148b.l();
        throw null;
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        super.onInitializeAccessibilityEvent(accessibilityEvent);
        if (getChildCount() > 0) {
            accessibilityEvent.setFromIndex(getPosition(getChildAt(0)));
            accessibilityEvent.setToIndex(getPosition(getChildAt(getChildCount() - 1)));
        }
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onItemsAdded(RecyclerView recyclerView, int i5, int i11) {
        super.onItemsAdded(recyclerView, i5, i11);
        getItemCount();
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onItemsRemoved(RecyclerView recyclerView, int i5, int i11) {
        super.onItemsRemoved(recyclerView, i5, i11);
        getItemCount();
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onLayoutChildren(h2 h2Var, o2 o2Var) {
        if (o2Var.b() > 0) {
            if ((o() ? getWidth() : getHeight()) > 0.0f) {
                p();
                measureChildWithMargins(h2Var.l(0, Long.MAX_VALUE).itemView, 0, 0);
                throw null;
            }
        }
        removeAndRecycleAllViews(h2Var);
    }

    @Override // androidx.recyclerview.widget.z1
    public final void onLayoutCompleted(o2 o2Var) {
        if (getChildCount() == 0) {
            return;
        }
        getPosition(getChildAt(0));
    }

    public final boolean p() {
        return o() && getLayoutDirection() == 1;
    }

    @Override // androidx.recyclerview.widget.z1
    public final boolean requestChildRectangleOnScreen(RecyclerView recyclerView, View view, Rect rect, boolean z11, boolean z12) {
        return false;
    }

    @Override // androidx.recyclerview.widget.z1
    public final int scrollHorizontallyBy(int i5, h2 h2Var, o2 o2Var) {
        if (!o() || getChildCount() == 0 || i5 == 0) {
            return 0;
        }
        measureChildWithMargins(h2Var.l(0, Long.MAX_VALUE).itemView, 0, 0);
        throw null;
    }

    @Override // androidx.recyclerview.widget.z1
    public final void scrollToPosition(int i5) {
    }

    @Override // androidx.recyclerview.widget.z1
    public final int scrollVerticallyBy(int i5, h2 h2Var, o2 o2Var) {
        if (!canScrollVertically() || getChildCount() == 0 || i5 == 0) {
            return 0;
        }
        measureChildWithMargins(h2Var.l(0, Long.MAX_VALUE).itemView, 0, 0);
        throw null;
    }

    public final void setOrientation(int i5) {
        b bVar;
        if (i5 != 0 && i5 != 1) {
            throw new IllegalArgumentException(c0.h(i5, "invalid orientation:"));
        }
        assertNotInLayoutOrScroll(null);
        a aVar = this.f34148b;
        if (aVar == null || i5 != aVar.f61556b) {
            if (i5 == 0) {
                bVar = new b(this, 1);
            } else {
                if (i5 != 1) {
                    throw new IllegalArgumentException("invalid orientation");
                }
                bVar = new b(this, 0);
            }
            this.f34148b = bVar;
            requestLayout();
        }
    }

    @Override // androidx.recyclerview.widget.z1
    public final void smoothScrollToPosition(RecyclerView recyclerView, o2 o2Var, int i5) {
        t tVar = new t(this, recyclerView.getContext());
        tVar.setTargetPosition(i5);
        startSmoothScroll(tVar);
    }

    @SuppressLint({"UnknownNullness"})
    public CarouselLayoutManager(Context context, AttributeSet attributeSet, int i5, int i11) {
        new jj.a();
        this.f34149c = new bd.a(this, 2);
        this.f34147a = new d();
        requestLayout();
        if (attributeSet != null) {
            TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, bj.a.f17919f);
            typedArrayObtainStyledAttributes.getInt(0, 0);
            requestLayout();
            setOrientation(typedArrayObtainStyledAttributes.getInt(0, 0));
            typedArrayObtainStyledAttributes.recycle();
        }
    }
}
