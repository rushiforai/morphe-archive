package com.google.android.material.appbar;

import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.view.View;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import defpackage.ga2;
import defpackage.ok7;
import defpackage.ura;
import defpackage.ute;
import defpackage.yue;
import java.util.ArrayList;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class AppBarLayout$ScrollingViewBehavior extends yue {
    public final int b;

    public AppBarLayout$ScrollingViewBehavior(Context context, AttributeSet attributeSet) {
        new Rect();
        new Rect();
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, ura.n);
        this.b = typedArrayObtainStyledAttributes.getDimensionPixelSize(0, 0);
        typedArrayObtainStyledAttributes.recycle();
    }

    public static void w(ArrayList arrayList) {
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
        }
    }

    @Override // defpackage.da2
    public final boolean f(CoordinatorLayout coordinatorLayout, View view, View view2) {
        return false;
    }

    @Override // defpackage.da2
    public boolean h(CoordinatorLayout coordinatorLayout, View view, View view2) {
        if (((ga2) view2.getLayoutParams()).a instanceof AppBarLayout$BaseBehavior) {
            int bottom = view2.getBottom() - view.getTop();
            int i = this.b;
            int iW = bottom - (i == 0 ? 0 : ok7.w((int) (0.0f * i), 0, i));
            WeakHashMap weakHashMap = ute.a;
            view.offsetTopAndBottom(iW);
        }
        return false;
    }

    @Override // defpackage.da2
    public final boolean l(CoordinatorLayout coordinatorLayout, View view, int i, int i2, int i3) {
        int i4 = view.getLayoutParams().height;
        if (i4 != -1 && i4 != -2) {
            return false;
        }
        w(coordinatorLayout.d(view));
        return false;
    }

    @Override // defpackage.da2
    public final boolean p(CoordinatorLayout coordinatorLayout, View view, Rect rect) {
        w(coordinatorLayout.d(view));
        return false;
    }

    @Override // defpackage.yue
    public final void v(CoordinatorLayout coordinatorLayout, View view, int i) {
        w(coordinatorLayout.d(view));
        coordinatorLayout.j(view, i);
    }

    public AppBarLayout$ScrollingViewBehavior() {
        new Rect();
        new Rect();
    }
}
