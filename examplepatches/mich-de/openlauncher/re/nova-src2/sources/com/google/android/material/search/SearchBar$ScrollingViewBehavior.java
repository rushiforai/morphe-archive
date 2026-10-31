package com.google.android.material.search;

import android.content.Context;
import android.content.res.Resources;
import android.util.AttributeSet;
import android.view.View;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import com.google.android.material.appbar.AppBarLayout;
import dj.i;

/* loaded from: classes3.dex */
public class SearchBar$ScrollingViewBehavior extends AppBarLayout.ScrollingViewBehavior {

    /* renamed from: g, reason: collision with root package name */
    public boolean f34330g;

    public SearchBar$ScrollingViewBehavior() {
        this.f34330g = false;
    }

    @Override // com.google.android.material.appbar.AppBarLayout.ScrollingViewBehavior, l4.b
    public final boolean h(CoordinatorLayout coordinatorLayout, View view, View view2) throws Resources.NotFoundException {
        super.h(coordinatorLayout, view, view2);
        if (!this.f34330g && (view2 instanceof AppBarLayout)) {
            this.f34330g = true;
            AppBarLayout appBarLayout = (AppBarLayout) view2;
            appBarLayout.setBackgroundColor(0);
            i.a(appBarLayout, 0.0f);
        }
        return false;
    }

    public SearchBar$ScrollingViewBehavior(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.f34330g = false;
    }
}
