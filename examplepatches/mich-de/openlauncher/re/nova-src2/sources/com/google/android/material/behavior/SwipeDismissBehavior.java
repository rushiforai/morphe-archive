package com.google.android.material.behavior;

import a5.a1;
import android.view.MotionEvent;
import android.view.View;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import cm.f;
import ej.a;
import java.util.WeakHashMap;
import l4.b;
import r5.d;

/* loaded from: classes3.dex */
public class SwipeDismissBehavior<V extends View> extends b {

    /* renamed from: a, reason: collision with root package name */
    public d f34075a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f34076b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f34077c;

    /* renamed from: d, reason: collision with root package name */
    public int f34078d = 2;

    /* renamed from: e, reason: collision with root package name */
    public float f34079e = 0.0f;

    /* renamed from: f, reason: collision with root package name */
    public float f34080f = 0.5f;

    /* renamed from: g, reason: collision with root package name */
    public final a f34081g = new a(this);

    @Override // l4.b
    public boolean k(CoordinatorLayout coordinatorLayout, View view, MotionEvent motionEvent) {
        boolean zP = this.f34076b;
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 0) {
            zP = coordinatorLayout.p(view, (int) motionEvent.getX(), (int) motionEvent.getY());
            this.f34076b = zP;
        } else if (actionMasked == 1 || actionMasked == 3) {
            this.f34076b = false;
        }
        if (zP) {
            if (this.f34075a == null) {
                this.f34075a = new d(coordinatorLayout.getContext(), coordinatorLayout, this.f34081g);
            }
            if (!this.f34077c && this.f34075a.p(motionEvent)) {
                return true;
            }
        }
        return false;
    }

    @Override // l4.b
    public final boolean l(CoordinatorLayout coordinatorLayout, View view, int i5) {
        WeakHashMap weakHashMap = a1.f250a;
        if (view.getImportantForAccessibility() == 0) {
            view.setImportantForAccessibility(1);
            a1.h(1048576, view);
            a1.f(0, view);
            if (w(view)) {
                a1.i(view, b5.d.f17542l, new f(this, 14));
            }
        }
        return false;
    }

    @Override // l4.b
    public final boolean v(CoordinatorLayout coordinatorLayout, View view, MotionEvent motionEvent) {
        if (this.f34075a == null) {
            return false;
        }
        if (this.f34077c && motionEvent.getActionMasked() == 3) {
            return true;
        }
        this.f34075a.j(motionEvent);
        return true;
    }

    public boolean w(View view) {
        return true;
    }
}
