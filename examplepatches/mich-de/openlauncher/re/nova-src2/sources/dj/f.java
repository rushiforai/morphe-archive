package dj;

import a5.a1;
import a5.h2;
import android.graphics.Rect;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import com.google.android.material.appbar.AppBarLayout;
import com.google.android.material.search.SearchBar$ScrollingViewBehavior;
import java.util.WeakHashMap;

/* loaded from: classes3.dex */
public abstract class f extends g {

    /* renamed from: c, reason: collision with root package name */
    public final Rect f49255c;

    /* renamed from: d, reason: collision with root package name */
    public final Rect f49256d;

    /* renamed from: e, reason: collision with root package name */
    public int f49257e;

    /* renamed from: f, reason: collision with root package name */
    public int f49258f;

    public f() {
        this.f49255c = new Rect();
        this.f49256d = new Rect();
        this.f49257e = 0;
    }

    @Override // l4.b
    public final boolean m(CoordinatorLayout coordinatorLayout, View view, int i5, int i11, int i12) {
        AppBarLayout appBarLayoutZ;
        h2 h2Var;
        int i13 = view.getLayoutParams().height;
        if ((i13 != -1 && i13 != -2) || (appBarLayoutZ = AppBarLayout.ScrollingViewBehavior.z(coordinatorLayout.k(view))) == null) {
            return false;
        }
        int size = View.MeasureSpec.getSize(i12);
        if (size > 0) {
            WeakHashMap weakHashMap = a1.f250a;
            if (appBarLayoutZ.getFitsSystemWindows() && (h2Var = coordinatorLayout.n) != null) {
                size += h2Var.a() + h2Var.d();
            }
        } else {
            size = coordinatorLayout.getHeight();
        }
        int iG = appBarLayoutZ.g() + size;
        int measuredHeight = appBarLayoutZ.getMeasuredHeight();
        if (this instanceof SearchBar$ScrollingViewBehavior) {
            view.setTranslationY(-measuredHeight);
        } else {
            view.setTranslationY(0.0f);
            iG -= measuredHeight;
        }
        coordinatorLayout.s(i5, i11, View.MeasureSpec.makeMeasureSpec(iG, i13 == -1 ? 1073741824 : Integer.MIN_VALUE), view);
        return true;
    }

    @Override // dj.g
    public final void x(CoordinatorLayout coordinatorLayout, View view, int i5) {
        AppBarLayout appBarLayoutZ = AppBarLayout.ScrollingViewBehavior.z(coordinatorLayout.k(view));
        if (appBarLayoutZ == null) {
            coordinatorLayout.r(i5, view);
            this.f49257e = 0;
            return;
        }
        l4.e eVar = (l4.e) view.getLayoutParams();
        int paddingLeft = coordinatorLayout.getPaddingLeft() + ((ViewGroup.MarginLayoutParams) eVar).leftMargin;
        int bottom = appBarLayoutZ.getBottom() + ((ViewGroup.MarginLayoutParams) eVar).topMargin;
        int width = (coordinatorLayout.getWidth() - coordinatorLayout.getPaddingRight()) - ((ViewGroup.MarginLayoutParams) eVar).rightMargin;
        int bottom2 = ((appBarLayoutZ.getBottom() + coordinatorLayout.getHeight()) - coordinatorLayout.getPaddingBottom()) - ((ViewGroup.MarginLayoutParams) eVar).bottomMargin;
        Rect rect = this.f49255c;
        rect.set(paddingLeft, bottom, width, bottom2);
        h2 h2Var = coordinatorLayout.n;
        if (h2Var != null) {
            WeakHashMap weakHashMap = a1.f250a;
            if (coordinatorLayout.getFitsSystemWindows() && !view.getFitsSystemWindows()) {
                rect.left = h2Var.b() + rect.left;
                rect.right -= h2Var.c();
            }
        }
        int i11 = eVar.f74698c;
        if (i11 == 0) {
            i11 = 8388659;
        }
        int measuredWidth = view.getMeasuredWidth();
        int measuredHeight = view.getMeasuredHeight();
        Rect rect2 = this.f49256d;
        Gravity.apply(i11, measuredWidth, measuredHeight, rect, rect2, i5);
        int iY = y(appBarLayoutZ);
        view.layout(rect2.left, rect2.top - iY, rect2.right, rect2.bottom - iY);
        this.f49257e = rect2.top - appBarLayoutZ.getBottom();
    }

    public final int y(View view) {
        int i5;
        if (this.f49258f == 0) {
            return 0;
        }
        float f11 = 0.0f;
        if (view instanceof AppBarLayout) {
            AppBarLayout appBarLayout = (AppBarLayout) view;
            int iG = appBarLayout.g();
            int iD = appBarLayout.d();
            l4.b bVar = ((l4.e) appBarLayout.getLayoutParams()).f74696a;
            int iY = bVar instanceof AppBarLayout.BaseBehavior ? ((AppBarLayout.BaseBehavior) bVar).y() : 0;
            if ((iD == 0 || iG + iY > iD) && (i5 = iG - iD) != 0) {
                f11 = (iY / i5) + 1.0f;
            }
        }
        int i11 = this.f49258f;
        return v4.a.f((int) (f11 * i11), 0, i11);
    }

    public f(int i5) {
        super(0);
        this.f49255c = new Rect();
        this.f49256d = new Rect();
        this.f49257e = 0;
    }
}
