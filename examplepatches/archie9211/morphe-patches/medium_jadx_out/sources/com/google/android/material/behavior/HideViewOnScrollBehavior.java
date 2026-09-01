package com.google.android.material.behavior;

import android.animation.TimeInterpolator;
import android.content.Context;
import android.util.AttributeSet;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewPropertyAnimator;
import android.view.accessibility.AccessibilityManager;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import com.medium.reader.R;
import defpackage.ay0;
import defpackage.bgf;
import defpackage.da2;
import defpackage.ev6;
import defpackage.ga2;
import defpackage.hk7;
import defpackage.oj5;
import defpackage.pj5;
import defpackage.pp;
import defpackage.qj5;
import defpackage.sgg;
import defpackage.yw;
import java.util.Iterator;
import java.util.LinkedHashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class HideViewOnScrollBehavior<V extends View> extends da2 {
    public bgf a;
    public AccessibilityManager b;
    public oj5 c;
    public int e;
    public int f;
    public TimeInterpolator g;
    public TimeInterpolator h;
    public ViewPropertyAnimator k;
    public final LinkedHashSet d = new LinkedHashSet();
    public int i = 0;
    public int j = 2;
    public int l = 0;
    public int m = 0;

    public HideViewOnScrollBehavior() {
    }

    @Override // defpackage.da2
    public final boolean k(CoordinatorLayout coordinatorLayout, View view, int i) {
        AccessibilityManager accessibilityManager = this.b;
        if (accessibilityManager == null) {
            accessibilityManager = (AccessibilityManager) view.getContext().getSystemService(AccessibilityManager.class);
            this.b = accessibilityManager;
        }
        if (accessibilityManager != null && this.c == null) {
            oj5 oj5Var = new oj5(this, view, 1);
            this.c = oj5Var;
            accessibilityManager.addTouchExplorationStateChangeListener(oj5Var);
            view.addOnAttachStateChangeListener(new pp(4, this));
        }
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
        int i2 = ((ga2) view.getLayoutParams()).c;
        if (i2 == 80 || i2 == 81) {
            v(1);
        } else {
            int absoluteGravity = Gravity.getAbsoluteGravity(i2, i);
            v((absoluteGravity == 3 || absoluteGravity == 19) ? 2 : 0);
        }
        this.i = this.a.A(view, marginLayoutParams);
        this.e = sgg.W(view.getContext(), R.attr.motionDurationLong2, 225);
        this.f = sgg.W(view.getContext(), R.attr.motionDurationMedium4, NikonType2MakernoteDirectory.TAG_UNKNOWN_30);
        this.g = hk7.F(view.getContext(), yw.d);
        this.h = hk7.F(view.getContext(), yw.c);
        return false;
    }

    @Override // defpackage.da2
    public final void o(CoordinatorLayout coordinatorLayout, View view, int i, int i2, int i3, int[] iArr) {
        if (i <= 0) {
            if (i < 0) {
                w(view);
                return;
            }
            return;
        }
        if (this.j == 1) {
            return;
        }
        AccessibilityManager accessibilityManager = this.b;
        if (accessibilityManager == null || !accessibilityManager.isTouchExplorationEnabled()) {
            ViewPropertyAnimator viewPropertyAnimator = this.k;
            if (viewPropertyAnimator != null) {
                viewPropertyAnimator.cancel();
                view.clearAnimation();
            }
            x(view, 1);
            this.k = this.a.C(view, this.i).setInterpolator(this.h).setDuration(this.f).setListener(new pj5(1, view, this));
        }
    }

    @Override // defpackage.da2
    public final boolean s(CoordinatorLayout coordinatorLayout, View view, View view2, View view3, int i, int i2) {
        return i == 2;
    }

    public final void v(int i) {
        bgf bgfVar = this.a;
        if (bgfVar == null || bgfVar.B() != i) {
            if (i == 0) {
                this.a = new qj5(2);
                return;
            }
            if (i == 1) {
                this.a = new qj5(0);
            } else if (i == 2) {
                this.a = new qj5(1);
            } else {
                ay0.e(ev6.w("Invalid view edge position value: ", i, ". Must be 0, 1 or 2."));
            }
        }
    }

    public final void w(View view) {
        if (this.j == 2) {
            return;
        }
        x(view, 2);
        ViewPropertyAnimator viewPropertyAnimator = this.k;
        if (viewPropertyAnimator != null) {
            viewPropertyAnimator.cancel();
            view.clearAnimation();
        }
        this.a.getClass();
        this.k = this.a.C(view, 0).setInterpolator(this.g).setDuration(this.e).setListener(new pj5(1, view, this));
    }

    public final void x(View view, int i) {
        this.j = i;
        if (i == 1) {
            if (view.hasFocus()) {
                view.clearFocus();
            }
            if (view.getImportantForAccessibility() != 4) {
                this.l = view.getImportantForAccessibility();
            }
            if (view.getVisibility() != 4) {
                this.m = view.getVisibility();
            }
            view.setImportantForAccessibility(4);
        } else if (i == 2) {
            if (view.getImportantForAccessibility() == 4) {
                view.setImportantForAccessibility(this.l);
            }
            if (view.getVisibility() == 4) {
                view.setVisibility(this.m);
            }
        }
        Iterator it2 = this.d.iterator();
        if (it2.hasNext()) {
            throw ev6.q(it2);
        }
    }

    public HideViewOnScrollBehavior(Context context, AttributeSet attributeSet) {
    }
}
