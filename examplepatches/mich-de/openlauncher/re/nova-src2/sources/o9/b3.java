package o9;

import android.app.WallpaperManager;
import android.content.Context;
import android.graphics.PointF;
import android.graphics.Rect;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import com.android.launcher3.CellLayout;

/* loaded from: classes.dex */
public final class b3 extends ViewGroup implements y9.r {

    /* renamed from: a, reason: collision with root package name */
    public final int[] f79774a;

    /* renamed from: b, reason: collision with root package name */
    public final Rect f79775b;

    /* renamed from: c, reason: collision with root package name */
    public final int f79776c;

    /* renamed from: d, reason: collision with root package name */
    public final WallpaperManager f79777d;

    /* renamed from: e, reason: collision with root package name */
    public final za.d f79778e;

    /* renamed from: f, reason: collision with root package name */
    public boolean f79779f;

    public b3(Context context, int i5) {
        super(context);
        this.f79774a = new int[2];
        this.f79775b = new Rect();
        this.f79779f = false;
        this.f79778e = (za.d) za.d.p(context);
        this.f79777d = WallpaperManager.getInstance(context);
        this.f79776c = i5;
    }

    public final View a(int i5, int i11) {
        int i12;
        int childCount = getChildCount();
        for (int i13 = 0; i13 < childCount; i13++) {
            View childAt = getChildAt(i13);
            v vVar = (v) childAt.getLayoutParams();
            int i14 = vVar.f80177a;
            if (i14 <= i5 && i5 < i14 + vVar.f80182f && (i12 = vVar.f80178b) <= i11 && i11 < i12 + vVar.f80183g) {
                return childAt;
            }
        }
        return null;
    }

    public final boolean b(View view, View view2) {
        Rect rect;
        v vVar = (v) view.getLayoutParams();
        if (vVar.f80181e) {
            int i5 = vVar.f80179c;
            int i11 = vVar.f80180d;
            rect = new Rect(i5, i11, vVar.f80182f + i5, vVar.f80183g + i11);
        } else {
            int i12 = vVar.f80177a;
            int i13 = vVar.f80178b;
            rect = new Rect(i12, i13, vVar.f80182f + i12, vVar.f80183g + i13);
        }
        int childCount = getChildCount();
        for (int i14 = 0; i14 < childCount; i14++) {
            View childAt = getChildAt(i14);
            if (childAt != view && childAt != view2) {
                v vVar2 = (v) childAt.getLayoutParams();
                boolean z11 = vVar2.f80181e;
                int i15 = z11 ? vVar2.f80179c : vVar2.f80177a;
                int i16 = z11 ? vVar2.f80180d : vVar2.f80178b;
                if (rect.intersects(i15, i16, vVar2.f80182f + i15, vVar2.f80183g + i16)) {
                    return true;
                }
            }
        }
        return false;
    }

    public final void c(View view) {
        v vVar = (v) view.getLayoutParams();
        if (view instanceof ab.q) {
            ab.q qVar = (ab.q) view;
            PointF pointF = this.f79778e.P().f77154l0;
            float f11 = pointF.x;
            float f12 = pointF.y;
            qVar.g(Math.min(f11, f12));
            float f13 = ((ViewGroup.MarginLayoutParams) vVar).width;
            float f14 = ((ViewGroup.MarginLayoutParams) vVar).height;
            qVar.f751b.set((-(f13 - (f11 * f13))) / 2.0f, (-(f14 - (f12 * f14))) / 2.0f);
            qVar.r();
        }
        int i5 = vVar.f80186j;
        int i11 = vVar.f80187k;
        view.layout(i5, i11, ((ViewGroup.MarginLayoutParams) vVar).width + i5, ((ViewGroup.MarginLayoutParams) vVar).height + i11);
        if (vVar.f80188l) {
            vVar.f80188l = false;
            if (this.f79777d == null) {
                return;
            }
            int[] iArr = this.f79774a;
            getLocationOnScreen(iArr);
            this.f79777d.sendWallpaperCommand(getWindowToken(), "android.home.drop", (((ViewGroup.MarginLayoutParams) vVar).width / 2) + iArr[0] + i5, (((ViewGroup.MarginLayoutParams) vVar).height / 2) + iArr[1] + i11, 0, null);
        }
    }

    @Override // android.view.View
    public final void cancelLongPress() {
        super.cancelLongPress();
        int childCount = getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            getChildAt(i5).cancelLongPress();
        }
    }

    public final void d(View view) {
        int i5;
        v vVar = (v) view.getLayoutParams();
        za.d dVar = this.f79778e;
        mx.j0 j0VarP = dVar.P();
        if (view instanceof ab.q) {
            Rect rect = this.f79775b;
            ((ab.q) view).f(j0VarP, rect);
            CellLayout cellLayout = (CellLayout) getParent();
            PointF pointF = j0VarP.f77154l0;
            cellLayout.S(vVar, pointF.x, pointF.y, rect);
        } else {
            ((CellLayout) getParent()).S(vVar, 1.0f, 1.0f, null);
            int measuredHeight = getMeasuredHeight();
            mx.j0 j0VarP2 = dVar.P();
            int i11 = this.f79776c;
            if (i11 == 0) {
                i5 = j0VarP2.J;
            } else if (i11 == 1) {
                i5 = j0VarP2.X;
            } else if (i11 == 2) {
                i5 = j0VarP2.S;
            } else if (i11 != 3) {
                j0VarP2.getClass();
                i5 = 0;
            } else {
                i5 = j0VarP2.f77138d0;
            }
            int iMax = (j0VarP.f77159p && i11 == 0) ? j0VarP.L : (int) Math.max(0.0f, (((ViewGroup.MarginLayoutParams) vVar).height - Math.min(measuredHeight, i5)) / 2.0f);
            int i12 = ((j0VarP.f77167t.x <= 0 || i11 != 0) && (j0VarP.O.x <= 0 || i11 != 2)) ? i11 == 0 ? j0VarP.K : (int) (j0VarP.f77173w / 2.0f) : 0;
            view.setPadding(i12, iMax, i12, 0);
        }
        view.measure(View.MeasureSpec.makeMeasureSpec(((ViewGroup.MarginLayoutParams) vVar).width, 1073741824), View.MeasureSpec.makeMeasureSpec(((ViewGroup.MarginLayoutParams) vVar).height, 1073741824));
    }

    public final void e(View view) {
        v vVar = (v) view.getLayoutParams();
        if (!(view instanceof ab.q)) {
            ((CellLayout) getParent()).S(vVar, 1.0f, 1.0f, null);
            return;
        }
        mx.j0 j0VarP = this.f79778e.P();
        Rect rect = this.f79775b;
        ((ab.q) view).f(j0VarP, rect);
        CellLayout cellLayout = (CellLayout) getParent();
        PointF pointF = j0VarP.f77154l0;
        cellLayout.S(vVar, pointF.x, pointF.y, rect);
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        if (motionEvent.getAction() == 0 && getAlpha() == 0.0f) {
            return true;
        }
        return super.onInterceptTouchEvent(motionEvent);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        int childCount = getChildCount();
        for (int i14 = 0; i14 < childCount; i14++) {
            View childAt = getChildAt(i14);
            if (childAt.getVisibility() != 8) {
                c(childAt);
            }
        }
    }

    @Override // android.view.View
    public final void onMeasure(int i5, int i11) {
        int childCount = getChildCount();
        setMeasuredDimension(View.MeasureSpec.getSize(i5), View.MeasureSpec.getSize(i11));
        for (int i12 = 0; i12 < childCount; i12++) {
            View childAt = getChildAt(i12);
            if (childAt.getVisibility() != 8) {
                d(childAt);
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void requestChildFocus(View view, View view2) {
        super.requestChildFocus(view, view2);
        if (view != null) {
            Rect rect = new Rect();
            view.getDrawingRect(rect);
            requestRectangleOnScreen(rect);
        }
    }

    @Override // android.view.ViewGroup
    public final boolean shouldDelayChildPressedState() {
        return false;
    }
}
