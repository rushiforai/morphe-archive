package com.google.android.material.appbar;

import a5.a1;
import android.os.Bundle;
import android.view.View;
import android.widget.ScrollView;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import b5.d;
import b5.g;
import com.google.android.material.appbar.AppBarLayout;
import java.util.WeakHashMap;

/* loaded from: classes3.dex */
public final class b extends a5.b {

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ AppBarLayout f34064d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ CoordinatorLayout f34065e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ AppBarLayout.BaseBehavior f34066f;

    public b(CoordinatorLayout coordinatorLayout, AppBarLayout.BaseBehavior baseBehavior, AppBarLayout appBarLayout) {
        this.f34066f = baseBehavior;
        this.f34064d = appBarLayout;
        this.f34065e = coordinatorLayout;
    }

    @Override // a5.b
    public final void d(View view, g gVar) {
        this.f258a.onInitializeAccessibilityNodeInfo(view, gVar.k0());
        gVar.y(ScrollView.class.getName());
        AppBarLayout appBarLayout = this.f34064d;
        if (appBarLayout.g() == 0) {
            return;
        }
        CoordinatorLayout coordinatorLayout = this.f34065e;
        AppBarLayout.BaseBehavior baseBehavior = this.f34066f;
        View viewB = AppBarLayout.BaseBehavior.B(baseBehavior, coordinatorLayout);
        if (viewB == null) {
            return;
        }
        int childCount = appBarLayout.getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            if (((dj.b) appBarLayout.getChildAt(i5).getLayoutParams()).f49242a != 0) {
                if (baseBehavior.y() != (-appBarLayout.g())) {
                    gVar.b(d.f17538h);
                    gVar.Y(true);
                }
                if (baseBehavior.y() != 0) {
                    if (!viewB.canScrollVertically(-1)) {
                        gVar.b(d.f17539i);
                        gVar.Y(true);
                        return;
                    } else {
                        if ((-appBarLayout.d()) != 0) {
                            gVar.b(d.f17539i);
                            gVar.Y(true);
                            return;
                        }
                        return;
                    }
                }
                return;
            }
        }
    }

    @Override // a5.b
    public final boolean g(View view, int i5, Bundle bundle) {
        AppBarLayout appBarLayout = this.f34064d;
        if (i5 == 4096) {
            appBarLayout.getClass();
            WeakHashMap weakHashMap = a1.f250a;
            appBarLayout.j(false, appBarLayout.isLaidOut(), true);
            return true;
        }
        if (i5 != 8192) {
            return super.g(view, i5, bundle);
        }
        AppBarLayout.BaseBehavior baseBehavior = this.f34066f;
        if (baseBehavior.y() != 0) {
            CoordinatorLayout coordinatorLayout = this.f34065e;
            View viewB = AppBarLayout.BaseBehavior.B(baseBehavior, coordinatorLayout);
            if (!viewB.canScrollVertically(-1)) {
                appBarLayout.getClass();
                WeakHashMap weakHashMap2 = a1.f250a;
                appBarLayout.j(true, appBarLayout.isLaidOut(), true);
                return true;
            }
            int i11 = -appBarLayout.d();
            if (i11 != 0) {
                baseBehavior.E(coordinatorLayout, this.f34064d, viewB, i11, new int[]{0, 0});
                return true;
            }
        }
        return false;
    }
}
