package com.google.android.material.transformation;

import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import defpackage.da2;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Deprecated
public abstract class ExpandableBehavior extends da2 {
    public ExpandableBehavior() {
    }

    @Override // defpackage.da2
    public abstract boolean f(CoordinatorLayout coordinatorLayout, View view, View view2);

    @Override // defpackage.da2
    public final boolean h(CoordinatorLayout coordinatorLayout, View view, View view2) {
        view2.getClass();
        throw new ClassCastException();
    }

    @Override // defpackage.da2
    public final boolean k(CoordinatorLayout coordinatorLayout, View view, int i) {
        if (!view.isLaidOut()) {
            ArrayList arrayListD = coordinatorLayout.d(view);
            int size = arrayListD.size();
            for (int i2 = 0; i2 < size; i2++) {
                f(coordinatorLayout, view, (View) arrayListD.get(i2));
            }
        }
        return false;
    }

    public ExpandableBehavior(Context context, AttributeSet attributeSet) {
    }
}
