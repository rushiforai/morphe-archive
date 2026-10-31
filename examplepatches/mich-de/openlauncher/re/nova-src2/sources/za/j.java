package za;

import android.content.Context;
import android.graphics.Insets;
import android.graphics.Rect;
import android.graphics.RectF;
import android.util.AttributeSet;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
import android.view.accessibility.AccessibilityEvent;
import android.widget.FrameLayout;
import com.android.launcher3.InsettableFrameLayout;
import java.util.ArrayList;
import o9.g3;
import o9.s0;
import ya.b0;
import ya.k0;

/* loaded from: classes.dex */
public abstract class j extends InsettableFrameLayout {

    /* renamed from: m, reason: collision with root package name */
    public static final aa.l f98434m;
    public static final aa.l n;
    public static final o7.a o;

    /* renamed from: b, reason: collision with root package name */
    public final float[] f98435b;

    /* renamed from: c, reason: collision with root package name */
    public final float[] f98436c;

    /* renamed from: d, reason: collision with root package name */
    public final Rect f98437d;

    /* renamed from: e, reason: collision with root package name */
    public final RectF f98438e;

    /* renamed from: f, reason: collision with root package name */
    public int f98439f;

    /* renamed from: g, reason: collision with root package name */
    public final Context f98440g;

    /* renamed from: h, reason: collision with root package name */
    public final b0 f98441h;

    /* renamed from: i, reason: collision with root package name */
    public k0[] f98442i;

    /* renamed from: j, reason: collision with root package name */
    public k0 f98443j;

    /* renamed from: k, reason: collision with root package name */
    public ViewGroup f98444k;

    /* renamed from: l, reason: collision with root package name */
    public int f98445l;

    static {
        Class cls = Integer.TYPE;
        f98434m = new aa.l(11, cls, "x");
        n = new aa.l(12, cls, "y");
        o = new o7.a(20);
    }

    public j(Context context, AttributeSet attributeSet, int i5) {
        super(context, attributeSet);
        this.f98435b = new float[2];
        this.f98436c = new float[4];
        this.f98437d = new Rect();
        this.f98438e = new RectF();
        this.f98439f = 0;
        this.f98445l = 0;
        this.f98440g = d.p(context);
        this.f98441h = new b0(this, i5);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void addChildrenForAccessibility(ArrayList arrayList) {
        o9.a aVarP = o9.a.P((d) this.f98440g, 7470271);
        if (aVarP == null || aVarP.T()) {
            super.addChildrenForAccessibility(arrayList);
        } else if (aVarP.isImportantForAccessibility()) {
            arrayList.add(aVarP);
        } else {
            aVarP.addChildrenForAccessibility(arrayList);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void addFocusables(ArrayList arrayList, int i5, int i11) {
        o9.a aVarP = o9.a.P((d) this.f98440g, 7471103);
        if (aVarP != null) {
            aVarP.addFocusables(arrayList, i5);
        } else {
            super.addFocusables(arrayList, i5, i11);
        }
    }

    @Override // com.android.launcher3.InsettableFrameLayout
    /* renamed from: b */
    public final s0 generateDefaultLayoutParams() {
        return new h(-2, -2);
    }

    @Override // com.android.launcher3.InsettableFrameLayout
    /* renamed from: c */
    public final s0 generateLayoutParams(AttributeSet attributeSet) {
        h hVar = new h(getContext(), attributeSet);
        hVar.f98433d = false;
        return hVar;
    }

    @Override // com.android.launcher3.InsettableFrameLayout, android.widget.FrameLayout, android.view.ViewGroup
    public final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return layoutParams instanceof h;
    }

    @Override // com.android.launcher3.InsettableFrameLayout
    /* renamed from: d */
    public final s0 generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        h hVar = new h(layoutParams);
        hVar.f98433d = false;
        return hVar;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final WindowInsets dispatchApplyWindowInsets(WindowInsets windowInsets) {
        if (g3.f79851f) {
            Insets mandatorySystemGestureInsets = windowInsets.getMandatorySystemGestureInsets();
            this.f98438e.set(mandatorySystemGestureInsets.left, mandatorySystemGestureInsets.top, mandatorySystemGestureInsets.right, mandatorySystemGestureInsets.bottom);
        }
        return super.dispatchApplyWindowInsets(windowInsets);
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchTouchEvent(MotionEvent motionEvent) {
        if (motionEvent.getPointerCount() >= 2) {
            requestDisallowInterceptTouchEvent(false);
        }
        int action = motionEvent.getAction();
        if (action == 0) {
            if ((this.f98439f & 8) != 0) {
                int action2 = motionEvent.getAction();
                motionEvent.setAction(3);
                super.dispatchTouchEvent(motionEvent);
                motionEvent.setAction(action2);
            }
            this.f98439f |= 9;
            if (l(motionEvent)) {
                this.f98439f &= -3;
            } else {
                this.f98439f |= 2;
            }
        } else if (action == 1 || action == 3) {
            this.f98439f &= -12;
        }
        super.dispatchTouchEvent(motionEvent);
        return true;
    }

    public final boolean f(MotionEvent motionEvent) {
        k0 k0Var = null;
        this.f98443j = null;
        if ((this.f98439f & 6) == 0) {
            o9.a aVarP = o9.a.P((d) this.f98440g, 7471103);
            if (aVarP == null || !((l(motionEvent) || aVarP.J()) && aVarP.l(motionEvent))) {
                k0[] k0VarArr = this.f98442i;
                int length = k0VarArr.length;
                o7.a aVar = null;
                int i5 = 0;
                while (true) {
                    if (i5 >= length) {
                        k0Var = aVar;
                        break;
                    }
                    k0 k0Var2 = k0VarArr[i5];
                    int i11 = this.f98445l;
                    if (i11 == 0 || !k0Var2.G(i11)) {
                        int iN = k0Var2.n(motionEvent);
                        if (iN == 1) {
                            k0Var = k0Var2;
                            break;
                        }
                        if (iN == 2) {
                            break;
                        }
                        if (iN == 3) {
                            aVar = o;
                        }
                    }
                    i5++;
                }
            } else {
                k0Var = aVarP;
            }
            this.f98443j = k0Var;
        }
        return this.f98443j != null;
    }

    public final float g(View view, int[] iArr) {
        float f11 = iArr[0];
        float[] fArr = this.f98435b;
        fArr[0] = f11;
        fArr[1] = iArr[1];
        float fI = g3.i(view, this, fArr, false, false);
        g3.s(fArr, iArr);
        return fI;
    }

    @Override // com.android.launcher3.InsettableFrameLayout, android.widget.FrameLayout, android.view.ViewGroup
    public final ViewGroup.LayoutParams generateDefaultLayoutParams() {
        return new h(-2, -2);
    }

    @Override // com.android.launcher3.InsettableFrameLayout, android.widget.FrameLayout, android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        h hVar = new h(getContext(), attributeSet);
        hVar.f98433d = false;
        return hVar;
    }

    public final float i(View view, Rect rect) {
        float[] fArr = this.f98436c;
        fArr[0] = 0.0f;
        fArr[1] = 0.0f;
        fArr[2] = view.getWidth();
        fArr[3] = view.getHeight();
        float fI = g3.i(view, this, fArr, false, false);
        rect.left = Math.round(Math.min(fArr[0], fArr[2]));
        rect.top = Math.round(Math.min(fArr[1], fArr[3]));
        rect.right = Math.round(Math.max(fArr[0], fArr[2]));
        rect.bottom = Math.round(Math.max(fArr[1], fArr[3]));
        return fI;
    }

    public final float j(View view, int[] iArr) {
        iArr[0] = 0;
        iArr[1] = 0;
        return g(view, iArr);
    }

    public final void k(View view, Rect rect) {
        int[] iArr = {i, i};
        getLocationInWindow(iArr);
        int i5 = iArr[0];
        int i11 = iArr[1];
        view.getLocationInWindow(iArr);
        int i12 = iArr[0] - i5;
        int i13 = iArr[1] - i11;
        rect.set(i12, i13, view.getMeasuredWidth() + i12, view.getMeasuredHeight() + iArr[1]);
    }

    public final boolean l(MotionEvent motionEvent) {
        float x11 = motionEvent.getX();
        float y11 = motionEvent.getY();
        RectF rectF = this.f98438e;
        return x11 >= rectF.left && x11 < ((float) getWidth()) - rectF.right && y11 >= rectF.top && y11 < ((float) getHeight()) - rectF.bottom;
    }

    public final boolean m(View view, MotionEvent motionEvent) {
        Rect rect = this.f98437d;
        i(view, rect);
        return rect.contains((int) motionEvent.getX(), (int) motionEvent.getY());
    }

    public abstract void n();

    /* JADX WARN: Type inference failed for: r0v1, types: [android.view.ViewGroup, za.i] */
    @Override // android.view.ViewGroup
    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        if (action == 1 || action == 3) {
            this.f98445l = 0;
            ?? r02 = this.f98444k;
            if (r02 != 0) {
                r02.a();
            }
            this.f98444k = null;
        } else if (action == 0) {
            this.f98445l = 0;
            ((d) this.f98440g).m();
        }
        return f(motionEvent);
    }

    @Override // android.widget.FrameLayout, android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        super.onLayout(z11, i5, i11, i12, i13);
        int childCount = getChildCount();
        for (int i14 = 0; i14 < childCount; i14++) {
            View childAt = getChildAt(i14);
            FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) childAt.getLayoutParams();
            if (layoutParams instanceof h) {
                h hVar = (h) layoutParams;
                if (hVar.f98433d) {
                    int i15 = hVar.f98431b;
                    int i16 = hVar.f98432c;
                    childAt.layout(i15, i16, ((FrameLayout.LayoutParams) hVar).width + i15, ((FrameLayout.LayoutParams) hVar).height + i16);
                }
            }
        }
    }

    @Override // android.view.ViewGroup
    public final boolean onRequestFocusInDescendants(int i5, Rect rect) {
        o9.a aVarP = o9.a.P((d) this.f98440g, 7471103);
        return aVarP != null ? aVarP.requestFocus(i5, rect) : super.onRequestFocusInDescendants(i5, rect);
    }

    @Override // android.view.ViewGroup
    public boolean onRequestSendAccessibilityEvent(View view, AccessibilityEvent accessibilityEvent) {
        o9.a aVarP = o9.a.P((d) this.f98440g, 7470271);
        if (aVarP == null || aVarP.T()) {
            return super.onRequestSendAccessibilityEvent(view, accessibilityEvent);
        }
        if (view == aVarP) {
            return super.onRequestSendAccessibilityEvent(view, accessibilityEvent);
        }
        return false;
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [android.view.ViewGroup, za.i] */
    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        int action = motionEvent.getAction();
        if (action == 1 || action == 3) {
            ?? r02 = this.f98444k;
            if (r02 != 0) {
                r02.a();
            }
            this.f98444k = null;
        }
        k0 k0Var = this.f98443j;
        return (k0Var == null || k0Var == o) ? f(motionEvent) : k0Var.k(motionEvent);
    }

    @Override // android.view.ViewGroup
    public void onViewRemoved(View view) {
        super.onViewRemoved(view);
        if (view instanceof o9.a) {
            o9.a aVar = (o9.a) view;
            if (aVar.f79742a) {
                postDelayed(new ra.g(aVar, 3), ya.g.b(getContext()));
            }
        }
    }

    @Override // com.android.launcher3.InsettableFrameLayout, android.widget.FrameLayout, android.view.ViewGroup
    public final FrameLayout.LayoutParams generateDefaultLayoutParams() {
        return new h(-2, -2);
    }

    @Override // com.android.launcher3.InsettableFrameLayout, android.widget.FrameLayout, android.view.ViewGroup
    public final FrameLayout.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        h hVar = new h(getContext(), attributeSet);
        hVar.f98433d = false;
        return hVar;
    }

    @Override // com.android.launcher3.InsettableFrameLayout, android.widget.FrameLayout, android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        h hVar = new h(layoutParams);
        hVar.f98433d = false;
        return hVar;
    }
}
