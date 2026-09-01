package com.google.android.material.behavior;

import android.view.MotionEvent;
import android.view.View;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import defpackage.a5d;
import defpackage.cue;
import defpackage.da2;
import defpackage.hha;
import defpackage.md5;
import defpackage.t4;
import defpackage.ute;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class SwipeDismissBehavior<V extends View> extends da2 {
    public cue a;
    public md5 b;
    public boolean c;
    public boolean d;
    public int e = 2;
    public float f = 0.0f;
    public float g = 0.5f;
    public final a5d h = new a5d(this);

    @Override // defpackage.da2
    public boolean j(CoordinatorLayout coordinatorLayout, View view, MotionEvent motionEvent) {
        boolean zH = this.c;
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 0) {
            zH = coordinatorLayout.h(view, (int) motionEvent.getX(), (int) motionEvent.getY());
            this.c = zH;
        } else if (actionMasked == 1 || actionMasked == 3) {
            this.c = false;
        }
        if (zH) {
            cue cueVar = this.a;
            if (cueVar == null) {
                cueVar = new cue(coordinatorLayout.getContext(), coordinatorLayout, this.h);
                this.a = cueVar;
            }
            if (!this.d && cueVar.o(motionEvent)) {
                return true;
            }
        }
        return false;
    }

    @Override // defpackage.da2
    public final boolean k(CoordinatorLayout coordinatorLayout, View view, int i) {
        if (view.getImportantForAccessibility() == 0) {
            view.setImportantForAccessibility(1);
            ute.l(view, 1048576);
            ute.i(view, 0);
            if (v(view)) {
                ute.m(view, t4.j, new hha(this));
            }
        }
        return false;
    }

    @Override // defpackage.da2
    public final boolean u(View view, MotionEvent motionEvent) {
        if (this.a == null) {
            return false;
        }
        if (this.d && motionEvent.getActionMasked() == 3) {
            return true;
        }
        this.a.i(motionEvent);
        return true;
    }

    public boolean v(View view) {
        return true;
    }
}
