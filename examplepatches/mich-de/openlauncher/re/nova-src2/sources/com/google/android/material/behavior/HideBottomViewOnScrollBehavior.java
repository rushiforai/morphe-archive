package com.google.android.material.behavior;

import aa.i0;
import android.animation.TimeInterpolator;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewPropertyAnimator;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import b.u4;
import cj.a;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Iterator;
import java.util.LinkedHashSet;
import l4.b;
import ps.l;

/* loaded from: classes3.dex */
public class HideBottomViewOnScrollBehavior<V extends View> extends b {

    /* renamed from: b, reason: collision with root package name */
    public int f34068b;

    /* renamed from: c, reason: collision with root package name */
    public int f34069c;

    /* renamed from: d, reason: collision with root package name */
    public TimeInterpolator f34070d;

    /* renamed from: e, reason: collision with root package name */
    public TimeInterpolator f34071e;

    /* renamed from: h, reason: collision with root package name */
    public ViewPropertyAnimator f34074h;

    /* renamed from: a, reason: collision with root package name */
    public final LinkedHashSet f34067a = new LinkedHashSet();

    /* renamed from: f, reason: collision with root package name */
    public int f34072f = 0;

    /* renamed from: g, reason: collision with root package name */
    public int f34073g = 2;

    public HideBottomViewOnScrollBehavior() {
    }

    @Override // l4.b
    public boolean l(CoordinatorLayout coordinatorLayout, View view, int i5) {
        this.f34072f = view.getMeasuredHeight() + ((ViewGroup.MarginLayoutParams) view.getLayoutParams()).bottomMargin;
        this.f34068b = l.q(view.getContext(), 2130969697, Sdk.SDKError.Reason.AD_LOAD_FAIL_PLACEMENT_ID_MISMATCH_VALUE);
        this.f34069c = l.q(view.getContext(), 2130969703, 175);
        this.f34070d = l.r(view.getContext(), 2130969713, a.f19954d);
        this.f34071e = l.r(view.getContext(), 2130969713, a.f19953c);
        return false;
    }

    @Override // l4.b
    public final void p(CoordinatorLayout coordinatorLayout, View view, int i5, int i11, int i12, int[] iArr) {
        LinkedHashSet linkedHashSet = this.f34067a;
        if (i5 > 0) {
            if (this.f34073g == 1) {
                return;
            }
            ViewPropertyAnimator viewPropertyAnimator = this.f34074h;
            if (viewPropertyAnimator != null) {
                viewPropertyAnimator.cancel();
                view.clearAnimation();
            }
            this.f34073g = 1;
            Iterator it = linkedHashSet.iterator();
            if (it.hasNext()) {
                throw u4.e(it);
            }
            this.f34074h = view.animate().translationY(this.f34072f).setInterpolator(this.f34071e).setDuration(this.f34069c).setListener(new i0(this, 4));
            return;
        }
        if (i5 >= 0 || this.f34073g == 2) {
            return;
        }
        ViewPropertyAnimator viewPropertyAnimator2 = this.f34074h;
        if (viewPropertyAnimator2 != null) {
            viewPropertyAnimator2.cancel();
            view.clearAnimation();
        }
        this.f34073g = 2;
        Iterator it2 = linkedHashSet.iterator();
        if (it2.hasNext()) {
            throw u4.e(it2);
        }
        this.f34074h = view.animate().translationY(0).setInterpolator(this.f34070d).setDuration(this.f34068b).setListener(new i0(this, 4));
    }

    @Override // l4.b
    public boolean t(CoordinatorLayout coordinatorLayout, View view, View view2, int i5, int i11) {
        return i5 == 2;
    }

    public HideBottomViewOnScrollBehavior(Context context, AttributeSet attributeSet) {
    }
}
