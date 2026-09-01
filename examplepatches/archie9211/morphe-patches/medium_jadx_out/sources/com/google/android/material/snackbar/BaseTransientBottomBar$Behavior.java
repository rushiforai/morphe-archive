package com.google.android.material.snackbar;

import android.view.MotionEvent;
import android.view.View;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import com.google.android.material.behavior.SwipeDismissBehavior;
import defpackage.go0;
import defpackage.io0;
import defpackage.o2b;
import defpackage.zg7;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class BaseTransientBottomBar$Behavior extends SwipeDismissBehavior<View> {
    public final zg7 i;

    public BaseTransientBottomBar$Behavior() {
        zg7 zg7Var = new zg7(15, false);
        this.f = Math.min(Math.max(0.0f, 0.1f), 1.0f);
        this.g = Math.min(Math.max(0.0f, 0.6f), 1.0f);
        this.e = 0;
        this.i = zg7Var;
    }

    @Override // com.google.android.material.behavior.SwipeDismissBehavior, defpackage.da2
    public final boolean j(CoordinatorLayout coordinatorLayout, View view, MotionEvent motionEvent) {
        zg7 zg7Var = this.i;
        zg7Var.getClass();
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked != 0) {
            if (actionMasked == 1 || actionMasked == 3) {
                o2b.k().H((go0) zg7Var.b);
            }
        } else if (coordinatorLayout.h(view, (int) motionEvent.getX(), (int) motionEvent.getY())) {
            o2b.k().B((go0) zg7Var.b);
        }
        return super.j(coordinatorLayout, view, motionEvent);
    }

    @Override // com.google.android.material.behavior.SwipeDismissBehavior
    public final boolean v(View view) {
        this.i.getClass();
        return view instanceof io0;
    }
}
