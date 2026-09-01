package com.google.android.material.behavior;

import android.animation.TimeInterpolator;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewPropertyAnimator;
import android.view.accessibility.AccessibilityManager;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import com.medium.reader.R;
import defpackage.da2;
import defpackage.ev6;
import defpackage.hk7;
import defpackage.oj5;
import defpackage.pj5;
import defpackage.pp;
import defpackage.sgg;
import defpackage.yw;
import java.util.Iterator;
import java.util.LinkedHashSet;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Deprecated
public class HideBottomViewOnScrollBehavior<V extends View> extends da2 {
    public int b;
    public int c;
    public TimeInterpolator d;
    public TimeInterpolator e;
    public AccessibilityManager g;
    public oj5 h;
    public ViewPropertyAnimator k;
    public final LinkedHashSet a = new LinkedHashSet();
    public int f = 0;
    public final boolean i = true;
    public int j = 2;
    public int l = 0;
    public int m = 0;

    public HideBottomViewOnScrollBehavior() {
    }

    @Override // defpackage.da2
    public boolean k(CoordinatorLayout coordinatorLayout, View view, int i) {
        this.f = view.getMeasuredHeight() + ((ViewGroup.MarginLayoutParams) view.getLayoutParams()).bottomMargin;
        this.b = sgg.W(view.getContext(), R.attr.motionDurationLong2, 225);
        this.c = sgg.W(view.getContext(), R.attr.motionDurationMedium4, NikonType2MakernoteDirectory.TAG_UNKNOWN_30);
        this.d = hk7.F(view.getContext(), yw.d);
        this.e = hk7.F(view.getContext(), yw.c);
        AccessibilityManager accessibilityManager = this.g;
        if (accessibilityManager == null) {
            accessibilityManager = (AccessibilityManager) view.getContext().getSystemService(AccessibilityManager.class);
            this.g = accessibilityManager;
        }
        if (accessibilityManager != null && this.h == null) {
            oj5 oj5Var = new oj5(this, view, 0);
            this.h = oj5Var;
            accessibilityManager.addTouchExplorationStateChangeListener(oj5Var);
            view.addOnAttachStateChangeListener(new pp(3, this));
        }
        return false;
    }

    @Override // defpackage.da2
    public final void o(CoordinatorLayout coordinatorLayout, View view, int i, int i2, int i3, int[] iArr) {
        AccessibilityManager accessibilityManager;
        if (i <= 0) {
            if (i < 0) {
                v(view);
            }
        } else {
            if (this.j == 1) {
                return;
            }
            if (this.i && (accessibilityManager = this.g) != null && accessibilityManager.isTouchExplorationEnabled()) {
                return;
            }
            ViewPropertyAnimator viewPropertyAnimator = this.k;
            if (viewPropertyAnimator != null) {
                viewPropertyAnimator.cancel();
                view.clearAnimation();
            }
            w(view, 1);
            this.k = view.animate().translationY(this.f).setInterpolator(this.e).setDuration(this.c).setListener(new pj5(0, view, this));
        }
    }

    @Override // defpackage.da2
    public boolean s(CoordinatorLayout coordinatorLayout, View view, View view2, View view3, int i, int i2) {
        return i == 2;
    }

    public final void v(View view) {
        if (this.j == 2) {
            return;
        }
        w(view, 2);
        ViewPropertyAnimator viewPropertyAnimator = this.k;
        if (viewPropertyAnimator != null) {
            viewPropertyAnimator.cancel();
            view.clearAnimation();
        }
        this.k = view.animate().translationY(0.0f).setInterpolator(this.d).setDuration(this.b).setListener(new pj5(0, view, this));
    }

    public final void w(View view, int i) {
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
        Iterator it2 = this.a.iterator();
        if (it2.hasNext()) {
            throw ev6.q(it2);
        }
    }

    public HideBottomViewOnScrollBehavior(Context context, AttributeSet attributeSet) {
    }
}
