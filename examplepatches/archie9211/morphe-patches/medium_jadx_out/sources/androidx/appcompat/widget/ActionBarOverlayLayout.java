package androidx.appcompat.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.util.AttributeSet;
import android.util.Log;
import android.view.KeyEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewPropertyAnimator;
import android.view.Window;
import android.view.WindowInsets;
import android.widget.OverScroller;
import com.medium.reader.R;
import defpackage.b36;
import defpackage.bod;
import defpackage.g4f;
import defpackage.guc;
import defpackage.h4f;
import defpackage.h6;
import defpackage.i4f;
import defpackage.j4f;
import defpackage.jy7;
import defpackage.k4f;
import defpackage.kve;
import defpackage.l4f;
import defpackage.lx7;
import defpackage.m4f;
import defpackage.mte;
import defpackage.mw2;
import defpackage.n4f;
import defpackage.od8;
import defpackage.pd8;
import defpackage.qd8;
import defpackage.und;
import defpackage.ute;
import defpackage.v3f;
import defpackage.v5;
import defpackage.w4f;
import defpackage.w5;
import defpackage.x5;
import defpackage.y5;
import defpackage.ygf;
import defpackage.z4f;
import defpackage.z5;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class ActionBarOverlayLayout extends ViewGroup implements od8, pd8 {
    public static final int[] C = {R.attr.actionBarSize, android.R.attr.windowContentOverlay};
    public static final z4f D;
    public static final Rect E;
    public final qd8 A;
    public final z5 B;
    public int a;
    public int b;
    public ContentFrameLayout c;
    public ActionBarContainer d;
    public mw2 e;
    public Drawable f;
    public boolean g;
    public boolean h;
    public boolean i;
    public boolean j;
    public int k;
    public int l;
    public final Rect m;
    public final Rect n;
    public final Rect o;
    public final Rect p;
    public z4f q;
    public z4f r;
    public z4f s;
    public z4f t;
    public x5 u;
    public OverScroller v;
    public ViewPropertyAnimator w;
    public final v5 x;
    public final w5 y;
    public final w5 z;

    static {
        int i = Build.VERSION.SDK_INT;
        n4f m4fVar = i >= 36 ? new m4f() : i >= 35 ? new l4f() : i >= 34 ? new k4f() : i >= 31 ? new j4f() : i >= 30 ? new i4f() : i >= 29 ? new h4f() : new g4f();
        m4fVar.h(b36.c(0, 1, 0, 1));
        D = m4fVar.b();
        E = new Rect();
    }

    public ActionBarOverlayLayout(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.b = 0;
        this.m = new Rect();
        this.n = new Rect();
        this.o = new Rect();
        this.p = new Rect();
        new Rect();
        new Rect();
        new Rect();
        new Rect();
        z4f z4fVar = z4f.b;
        this.q = z4fVar;
        this.r = z4fVar;
        this.s = z4fVar;
        this.t = z4fVar;
        this.x = new v5(0, this);
        this.y = new w5(this, 0);
        this.z = new w5(this, 1);
        c(context);
        this.A = new qd8();
        z5 z5Var = new z5(context);
        z5Var.setWillNotDraw(true);
        this.B = z5Var;
        addView(z5Var);
    }

    public static boolean a(View view, Rect rect, boolean z) {
        boolean z2;
        y5 y5Var = (y5) view.getLayoutParams();
        int i = ((ViewGroup.MarginLayoutParams) y5Var).leftMargin;
        int i2 = rect.left;
        if (i != i2) {
            ((ViewGroup.MarginLayoutParams) y5Var).leftMargin = i2;
            z2 = true;
        } else {
            z2 = false;
        }
        int i3 = ((ViewGroup.MarginLayoutParams) y5Var).topMargin;
        int i4 = rect.top;
        if (i3 != i4) {
            ((ViewGroup.MarginLayoutParams) y5Var).topMargin = i4;
            z2 = true;
        }
        int i5 = ((ViewGroup.MarginLayoutParams) y5Var).rightMargin;
        int i6 = rect.right;
        if (i5 != i6) {
            ((ViewGroup.MarginLayoutParams) y5Var).rightMargin = i6;
            z2 = true;
        }
        if (z) {
            int i7 = ((ViewGroup.MarginLayoutParams) y5Var).bottomMargin;
            int i8 = rect.bottom;
            if (i7 != i8) {
                ((ViewGroup.MarginLayoutParams) y5Var).bottomMargin = i8;
                return true;
            }
        }
        return z2;
    }

    public final void b() {
        removeCallbacks(this.y);
        removeCallbacks(this.z);
        ViewPropertyAnimator viewPropertyAnimator = this.w;
        if (viewPropertyAnimator != null) {
            viewPropertyAnimator.cancel();
        }
    }

    public final void c(Context context) {
        TypedArray typedArrayObtainStyledAttributes = getContext().getTheme().obtainStyledAttributes(C);
        this.a = typedArrayObtainStyledAttributes.getDimensionPixelSize(0, 0);
        Drawable drawable = typedArrayObtainStyledAttributes.getDrawable(1);
        this.f = drawable;
        setWillNotDraw(drawable == null);
        typedArrayObtainStyledAttributes.recycle();
        this.v = new OverScroller(context);
    }

    @Override // android.view.ViewGroup
    public final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof y5;
    }

    public final void d(int i) {
        e();
        if (i == 2) {
            ((bod) this.e).getClass();
            Log.i("ToolbarWidgetWrapper", "Progress display unsupported");
        } else if (i == 5) {
            ((bod) this.e).getClass();
            Log.i("ToolbarWidgetWrapper", "Progress display unsupported");
        } else {
            if (i != 109) {
                return;
            }
            setOverlayMode(true);
        }
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        int translationY;
        super.draw(canvas);
        if (this.f != null) {
            if (this.d.getVisibility() == 0) {
                translationY = (int) (this.d.getTranslationY() + this.d.getBottom() + 0.5f);
            } else {
                translationY = 0;
            }
            this.f.setBounds(0, translationY, getWidth(), this.f.getIntrinsicHeight() + translationY);
            this.f.draw(canvas);
        }
    }

    public final void e() {
        mw2 wrapper;
        if (this.c == null) {
            this.c = (ContentFrameLayout) findViewById(R.id.action_bar_activity_content);
            this.d = (ActionBarContainer) findViewById(R.id.action_bar_container);
            KeyEvent.Callback callbackFindViewById = findViewById(R.id.action_bar);
            if (callbackFindViewById instanceof mw2) {
                wrapper = (mw2) callbackFindViewById;
            } else {
                if (!(callbackFindViewById instanceof Toolbar)) {
                    ygf.f("Can't make a decor toolbar out of ".concat(callbackFindViewById.getClass().getSimpleName()));
                    return;
                }
                wrapper = ((Toolbar) callbackFindViewById).getWrapper();
            }
            this.e = wrapper;
        }
    }

    public final void f(lx7 lx7Var, jy7 jy7Var) {
        e();
        bod bodVar = (bod) this.e;
        Toolbar toolbar = bodVar.a;
        h6 h6Var = bodVar.m;
        if (h6Var == null) {
            h6Var = new h6(toolbar.getContext());
            bodVar.m = h6Var;
        }
        h6Var.e = jy7Var;
        if (lx7Var == null && toolbar.a == null) {
            return;
        }
        toolbar.f();
        lx7 lx7Var2 = toolbar.a.p;
        if (lx7Var2 == lx7Var) {
            return;
        }
        if (lx7Var2 != null) {
            lx7Var2.r(toolbar.K);
            lx7Var2.r(toolbar.L);
        }
        if (toolbar.L == null) {
            toolbar.L = new und(toolbar);
        }
        h6Var.q = true;
        Context context = toolbar.j;
        if (lx7Var != null) {
            lx7Var.b(h6Var, context);
            lx7Var.b(toolbar.L, toolbar.j);
        } else {
            h6Var.k(context, null);
            toolbar.L.k(toolbar.j, null);
            h6Var.i();
            toolbar.L.i();
        }
        toolbar.a.setPopupTheme(toolbar.k);
        toolbar.a.setPresenter(h6Var);
        toolbar.K = h6Var;
        toolbar.t();
    }

    @Override // android.view.View
    public final boolean fitSystemWindows(Rect rect) {
        return super.fitSystemWindows(rect);
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new y5(-1, -1);
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        return new y5(getContext(), attributeSet);
    }

    public int getActionBarHideOffset() {
        ActionBarContainer actionBarContainer = this.d;
        if (actionBarContainer != null) {
            return -((int) actionBarContainer.getTranslationY());
        }
        return 0;
    }

    @Override // android.view.ViewGroup
    public int getNestedScrollAxes() {
        qd8 qd8Var = this.A;
        return qd8Var.b | qd8Var.a;
    }

    public CharSequence getTitle() {
        e();
        return ((bod) this.e).a.getTitle();
    }

    @Override // android.view.View
    public final WindowInsets onApplyWindowInsets(WindowInsets windowInsets) {
        e();
        z4f z4fVarH = z4f.h(windowInsets, this);
        boolean zA = a(this.d, new Rect(z4fVarH.b(), z4fVarH.d(), z4fVarH.c(), z4fVarH.a()), false);
        WeakHashMap weakHashMap = ute.a;
        Rect rect = this.m;
        mte.b(this, z4fVarH, rect);
        int i = rect.left;
        int i2 = rect.top;
        int i3 = rect.right;
        int i4 = rect.bottom;
        w4f w4fVar = z4fVarH.a;
        z4f z4fVarR = w4fVar.r(i, i2, i3, i4);
        this.q = z4fVarR;
        boolean z = true;
        if (!this.r.equals(z4fVarR)) {
            this.r = this.q;
            zA = true;
        }
        Rect rect2 = this.n;
        if (rect2.equals(rect)) {
            z = zA;
        } else {
            rect2.set(rect);
        }
        if (z) {
            requestLayout();
        }
        return w4fVar.a().a.c().a.b().g();
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        c(getContext());
        WeakHashMap weakHashMap = ute.a;
        requestApplyInsets();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        b();
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        int childCount = getChildCount();
        int paddingLeft = getPaddingLeft();
        int paddingTop = getPaddingTop();
        for (int i5 = 0; i5 < childCount; i5++) {
            View childAt = getChildAt(i5);
            if (childAt.getVisibility() != 8) {
                y5 y5Var = (y5) childAt.getLayoutParams();
                int measuredWidth = childAt.getMeasuredWidth();
                int measuredHeight = childAt.getMeasuredHeight();
                int i6 = ((ViewGroup.MarginLayoutParams) y5Var).leftMargin + paddingLeft;
                int i7 = ((ViewGroup.MarginLayoutParams) y5Var).topMargin + paddingTop;
                childAt.layout(i6, i7, measuredWidth + i6, measuredHeight + i7);
            }
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x00ab  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onMeasure(int r13, int r14) {
        /*
            Method dump skipped, instruction units count: 412
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.appcompat.widget.ActionBarOverlayLayout.onMeasure(int, int):void");
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean onNestedFling(View view, float f, float f2, boolean z) {
        if (!this.i || !z) {
            return false;
        }
        this.v.fling(0, 0, 0, (int) f2, 0, 0, Integer.MIN_VALUE, Integer.MAX_VALUE);
        if (this.v.getFinalY() > this.d.getHeight()) {
            b();
            this.z.run();
        } else {
            b();
            this.y.run();
        }
        this.j = true;
        return true;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean onNestedPreFling(View view, float f, float f2) {
        return false;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onNestedScroll(View view, int i, int i2, int i3, int i4) {
        int i5 = this.k + i2;
        this.k = i5;
        setActionBarHideOffset(i5);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onNestedScrollAccepted(View view, View view2, int i) {
        v3f v3fVar;
        kve kveVar;
        this.A.a = i;
        this.k = getActionBarHideOffset();
        b();
        x5 x5Var = this.u;
        if (x5Var == null || (kveVar = (v3fVar = (v3f) x5Var).s) == null) {
            return;
        }
        kveVar.a();
        v3fVar.s = null;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean onStartNestedScroll(View view, View view2, int i) {
        if ((i & 2) == 0 || this.d.getVisibility() != 0) {
            return false;
        }
        return this.i;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onStopNestedScroll(View view) {
        if (!this.i || this.j) {
            return;
        }
        if (this.k <= this.d.getHeight()) {
            b();
            postDelayed(this.y, 600L);
        } else {
            b();
            postDelayed(this.z, 600L);
        }
    }

    @Override // android.view.View
    public final void onWindowSystemUiVisibilityChanged(int i) {
        super.onWindowSystemUiVisibilityChanged(i);
        e();
        int i2 = this.l ^ i;
        this.l = i;
        boolean z = (i & 4) == 0;
        boolean z2 = (i & 256) != 0;
        x5 x5Var = this.u;
        if (x5Var != null) {
            v3f v3fVar = (v3f) x5Var;
            v3fVar.o = !z2;
            if (z || !z2) {
                if (v3fVar.p) {
                    v3fVar.p = false;
                    v3fVar.f(true);
                }
            } else if (!v3fVar.p) {
                v3fVar.p = true;
                v3fVar.f(true);
            }
        }
        if ((i2 & 256) == 0 || this.u == null) {
            return;
        }
        WeakHashMap weakHashMap = ute.a;
        requestApplyInsets();
    }

    @Override // android.view.View
    public final void onWindowVisibilityChanged(int i) {
        super.onWindowVisibilityChanged(i);
        this.b = i;
        x5 x5Var = this.u;
        if (x5Var != null) {
            ((v3f) x5Var).n = i;
        }
    }

    public void setActionBarHideOffset(int i) {
        b();
        this.d.setTranslationY(-Math.max(0, Math.min(i, this.d.getHeight())));
    }

    public void setActionBarVisibilityCallback(x5 x5Var) {
        this.u = x5Var;
        if (getWindowToken() != null) {
            ((v3f) this.u).n = this.b;
            int i = this.l;
            if (i != 0) {
                onWindowSystemUiVisibilityChanged(i);
                WeakHashMap weakHashMap = ute.a;
                requestApplyInsets();
            }
        }
    }

    public void setHasNonEmbeddedTabs(boolean z) {
        this.h = z;
    }

    public void setHideOnContentScrollEnabled(boolean z) {
        if (z != this.i) {
            this.i = z;
            if (z) {
                return;
            }
            b();
            setActionBarHideOffset(0);
        }
    }

    public void setIcon(int i) {
        e();
        bod bodVar = (bod) this.e;
        bodVar.d = i != 0 ? guc.E(bodVar.a.getContext(), i) : null;
        bodVar.c();
    }

    public void setLogo(int i) {
        e();
        bod bodVar = (bod) this.e;
        bodVar.e = i != 0 ? guc.E(bodVar.a.getContext(), i) : null;
        bodVar.c();
    }

    public void setOverlayMode(boolean z) {
        this.g = z;
    }

    public void setWindowCallback(Window.Callback callback) {
        e();
        ((bod) this.e).k = callback;
    }

    public void setWindowTitle(CharSequence charSequence) {
        e();
        bod bodVar = (bod) this.e;
        if (bodVar.g) {
            return;
        }
        Toolbar toolbar = bodVar.a;
        bodVar.h = charSequence;
        if ((bodVar.b & 8) != 0) {
            toolbar.setTitle(charSequence);
            if (bodVar.g) {
                ute.p(toolbar.getRootView(), charSequence);
            }
        }
    }

    @Override // android.view.ViewGroup
    public final boolean shouldDelayChildPressedState() {
        return false;
    }

    @Override // defpackage.od8
    public final void onNestedPreScroll(View view, int i, int i2, int[] iArr, int i3) {
    }

    @Override // defpackage.od8
    public final void onNestedScroll(View view, int i, int i2, int i3, int i4, int i5) {
        if (i5 == 0) {
            onNestedScroll(view, i, i2, i3, i4);
        }
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return new y5(layoutParams);
    }

    @Override // defpackage.pd8
    public final void onNestedScroll(View view, int i, int i2, int i3, int i4, int i5, int[] iArr) {
        onNestedScroll(view, i, i2, i3, i4, i5);
    }

    @Override // defpackage.od8
    public final boolean onStartNestedScroll(View view, View view2, int i, int i2) {
        return i2 == 0 && onStartNestedScroll(view, view2, i);
    }

    public void setIcon(Drawable drawable) {
        e();
        bod bodVar = (bod) this.e;
        bodVar.d = drawable;
        bodVar.c();
    }

    public void setShowingForActionMode(boolean z) {
    }

    public void setUiOptions(int i) {
    }

    @Override // defpackage.od8
    public final void onNestedScrollAccepted(View view, View view2, int i, int i2) {
        if (i2 == 0) {
            onNestedScrollAccepted(view, view2, i);
        }
    }

    @Override // defpackage.od8
    public final void onStopNestedScroll(View view, int i) {
        if (i == 0) {
            onStopNestedScroll(view);
        }
    }

    public ActionBarOverlayLayout(Context context) {
        this(context, null);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void onNestedPreScroll(View view, int i, int i2, int[] iArr) {
    }
}
