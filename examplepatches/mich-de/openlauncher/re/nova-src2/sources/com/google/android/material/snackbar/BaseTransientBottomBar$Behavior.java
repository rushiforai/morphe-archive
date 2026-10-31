package com.google.android.material.snackbar;

import android.view.MotionEvent;
import android.view.View;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import b5.f;
import br.a;
import com.google.android.material.behavior.SwipeDismissBehavior;

/* loaded from: classes3.dex */
public class BaseTransientBottomBar$Behavior extends SwipeDismissBehavior<View> {

    /* renamed from: h, reason: collision with root package name */
    public final a f34353h;

    public BaseTransientBottomBar$Behavior() {
        a aVar = new a(2);
        this.f34079e = Math.min(Math.max(0.0f, 0.1f), 1.0f);
        this.f34080f = Math.min(Math.max(0.0f, 0.6f), 1.0f);
        this.f34078d = 0;
        this.f34353h = aVar;
    }

    @Override // com.google.android.material.behavior.SwipeDismissBehavior, l4.b
    public final boolean k(CoordinatorLayout coordinatorLayout, View view, MotionEvent motionEvent) {
        this.f34353h.getClass();
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked != 0) {
            if (actionMasked == 1 || actionMasked == 3) {
                if (f.f17549b == null) {
                    f.f17549b = new f(3);
                }
                synchronized (f.f17549b.f17550a) {
                }
            }
        } else if (coordinatorLayout.p(view, (int) motionEvent.getX(), (int) motionEvent.getY())) {
            if (f.f17549b == null) {
                f.f17549b = new f(3);
            }
            synchronized (f.f17549b.f17550a) {
            }
        }
        return super.k(coordinatorLayout, view, motionEvent);
    }

    @Override // com.google.android.material.behavior.SwipeDismissBehavior
    public final boolean w(View view) {
        this.f34353h.getClass();
        return view instanceof Snackbar$SnackbarLayout;
    }
}
