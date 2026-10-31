package o9;

import android.animation.LayoutTransition;
import android.content.Context;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.os.Build;
import android.os.Bundle;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseBooleanArray;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;
import android.widget.OverScroller;
import android.widget.ScrollView;
import androidx.compose.ui.node.LayoutNode;
import com.teslacoilsw.launcher.preferences.fragments.ScrollEffectPreviewPagedView;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.function.Consumer;

/* loaded from: classes.dex */
public abstract class s2 extends ViewGroup {
    public static final /* synthetic */ int S = 0;
    public int A;
    public boolean B;
    public Runnable C;
    public final int D;
    public View E;
    public final Rect F;
    public final boolean G;
    public boolean H;
    public final int[] I;
    public ya.i J;
    public ya.i K;
    public boolean L;
    public l30.p M;
    public b00.z0 N;
    public final SparseBooleanArray O;
    public final z20.a P;
    public final int Q;
    public boolean R;

    /* renamed from: a, reason: collision with root package name */
    public final int f80101a;

    /* renamed from: b, reason: collision with root package name */
    public final int f80102b;

    /* renamed from: c, reason: collision with root package name */
    public final int f80103c;

    /* renamed from: d, reason: collision with root package name */
    public final int f80104d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f80105e;

    /* renamed from: f, reason: collision with root package name */
    public int f80106f;

    /* renamed from: g, reason: collision with root package name */
    public int f80107g;

    /* renamed from: h, reason: collision with root package name */
    public int f80108h;

    /* renamed from: i, reason: collision with root package name */
    public int f80109i;

    /* renamed from: j, reason: collision with root package name */
    public final OverScroller f80110j;

    /* renamed from: k, reason: collision with root package name */
    public VelocityTracker f80111k;

    /* renamed from: l, reason: collision with root package name */
    public int f80112l;

    /* renamed from: m, reason: collision with root package name */
    public float f80113m;
    public float n;
    public float o;

    /* renamed from: p, reason: collision with root package name */
    public float f80114p;

    /* renamed from: q, reason: collision with root package name */
    public float f80115q;

    /* renamed from: r, reason: collision with root package name */
    public float f80116r;

    /* renamed from: s, reason: collision with root package name */
    public boolean f80117s;

    /* renamed from: t, reason: collision with root package name */
    public ua.f f80118t;

    /* renamed from: u, reason: collision with root package name */
    public int[] f80119u;

    /* renamed from: v, reason: collision with root package name */
    public boolean f80120v;

    /* renamed from: w, reason: collision with root package name */
    public final int f80121w;

    /* renamed from: x, reason: collision with root package name */
    public final int f80122x;

    /* renamed from: y, reason: collision with root package name */
    public final int f80123y;

    /* renamed from: z, reason: collision with root package name */
    public boolean f80124z;

    public s2(Context context, AttributeSet attributeSet, int i5) {
        int i11;
        super(context, attributeSet, 0);
        this.f80105e = true;
        this.f80108h = -100;
        this.f80112l = 0;
        this.f80118t = ua.f.f90757lp;
        this.f80124z = true;
        this.A = -1;
        this.B = false;
        this.F = new Rect();
        this.I = new int[2];
        this.L = false;
        this.O = new SparseBooleanArray();
        z20.a aVar = new z20.a();
        int i12 = 4;
        while (true) {
            i11 = 40;
            if (i12 >= 32) {
                break;
            }
            int i13 = (1 << i12) - 12;
            if (40 <= i13) {
                i11 = i13;
                break;
            }
            i12++;
        }
        int i14 = i11 / 4;
        aVar.f98184a = new int[i14];
        aVar.f98185b = new float[i14];
        aVar.f98186c = 0;
        this.P = aVar;
        this.Q = androidx.recyclerview.widget.n0.DEFAULT_SWIPE_ANIMATION_DURATION;
        this.R = false;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, u2.H, 0, 0);
        this.D = typedArrayObtainStyledAttributes.getResourceId(0, -1);
        typedArrayObtainStyledAttributes.recycle();
        setHapticFeedbackEnabled(false);
        this.G = g3.p(getResources());
        this.f80110j = new OverScroller(context, s9.k.f86805t);
        this.f80106f = 0;
        this.f80107g = 0;
        ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
        this.f80121w = viewConfiguration.getScaledTouchSlop();
        this.f80122x = viewConfiguration.getScaledPagingTouchSlop();
        this.f80123y = viewConfiguration.getScaledMaximumFlingVelocity();
        float f11 = getResources().getDisplayMetrics().density;
        this.f80101a = (int) (500.0f * f11);
        this.f80102b = (int) (400.0f * f11);
        this.f80103c = (int) (250.0f * f11);
        this.f80104d = (int) (f11 * 1500.0f);
        this.J = new ya.i(getContext());
        this.K = new ya.i(getContext());
        setDefaultFocusHighlightEnabled(false);
        setWillNotDraw(false);
    }

    public final int B(int i5) {
        if (i5 < 0 || i5 > getChildCount() - 1) {
            return 0;
        }
        return this.f80118t.a(H(i5));
    }

    public String C() {
        return getContext().getString(2132017717, Integer.valueOf(G() + 1), Integer.valueOf(getChildCount()));
    }

    public final int D(int i5) {
        return i5 - (i5 % M());
    }

    public final ya.r F(int i5) {
        int i11;
        int iM = M();
        int iG = G();
        if (i5 == 17) {
            i11 = iG - iM;
        } else {
            if (i5 != 66) {
                return new ya.r();
            }
            i11 = iG + iM;
        }
        int iS0 = s0(i11);
        return iS0 == iG ? new ya.r() : I(iS0);
    }

    public final int G() {
        int i5 = this.f80108h;
        return i5 != -100 ? i5 : this.f80106f;
    }

    public View H(int i5) {
        return getChildAt(i5);
    }

    public final ya.r I(int i5) {
        int iD = D(i5);
        ya.r rVar = new ya.r();
        int iM = M();
        int childCount = getChildCount();
        for (int i11 = iD; i11 < iD + iM && i11 < childCount; i11++) {
            rVar.c(i11);
        }
        return rVar;
    }

    public final int J(int i5) {
        float fX = this.f80118t.x(this);
        float fH = this.f80118t.h(getPivotX(), getPivotY());
        int iRound = Math.round((((this.f80118t.y(this) / 2.0f) - fH) / fX) + i5 + fH);
        int iY = this.f80118t.y(this);
        int i11 = -1;
        if (S() && i5 < (-iY) / 2.0f) {
            return -1;
        }
        if (S()) {
            if (i5 > (iY / 2.0f) + this.f80109i) {
                return getChildCount();
            }
        }
        int childCount = getChildCount();
        int i12 = LayoutNode.NotPlacedPlaceOrder;
        for (int i13 = 0; i13 < childCount; i13++) {
            int iAbs = Math.abs((B(i13) + (Math.round(this.f80118t.y(H(i13))) / 2)) - iRound);
            if (iAbs < i12) {
                i11 = i13;
                i12 = iAbs;
            }
        }
        return i11;
    }

    public final boolean K(int[] iArr, boolean z11) {
        int i5;
        int childCount = getChildCount();
        boolean zT = T();
        int i11 = zT ? -1 : childCount;
        int i12 = zT ? -1 : 1;
        ua.f fVar = this.f80118t;
        Rect rect = this.F;
        int iE = fVar.e(this, rect);
        int iS = this.f80118t.s(this, rect);
        int i13 = this.f80118t.i(this, rect);
        int iM = M();
        int iT = iS;
        boolean z12 = false;
        for (int i14 = zT ? childCount - 1 : 0; i14 != i11; i14 += i12) {
            View viewH = H(i14);
            if (viewH.getVisibility() != 8) {
                a5.z zVarU = this.f80118t.u(viewH, iT, iE, z11);
                int i15 = zVarU.f384a;
                int i16 = zT ? zVarU.f385b - i13 : iT - iS;
                if (iArr[i14] != i16) {
                    if (!z11) {
                        this.L = true;
                    }
                    iArr[i14] = i16;
                    z12 = true;
                }
                iT += t() + i15;
                if (i14 % iM == (this.G ? 0 : iM - 1)) {
                    iT += this.f80112l;
                }
            }
        }
        if (this.L && z11) {
            i5 = 0;
            this.L = false;
            z12 = true;
        } else {
            i5 = 0;
        }
        if (iM > 1) {
            for (int i17 = i5; i17 < childCount; i17++) {
                int i18 = iArr[D(i17)];
                if (iArr[i17] != i18) {
                    iArr[i17] = i18;
                    z12 = true;
                }
            }
        }
        return z12;
    }

    public final int L() {
        return Math.abs(N(0) - N(1));
    }

    public int M() {
        return 1;
    }

    public final int N(int i5) {
        int[] iArr;
        int i11;
        int iL;
        int i12;
        int iL2;
        int[] iArr2 = this.f80119u;
        if (iArr2 != null && iArr2.length == getChildCount()) {
            int[] iArr3 = this.f80119u;
            if (iArr3 != null && i5 < iArr3.length && i5 >= 0) {
                return iArr3[i5];
            }
            if (S() && (iArr = this.f80119u) != null && iArr.length > 1) {
                if (i5 == iArr.length) {
                    if (T()) {
                        i11 = this.f80119u[getChildCount() - 1];
                        iL = L();
                        return i11 - iL;
                    }
                    i12 = this.f80119u[getChildCount() - 1];
                    iL2 = L();
                    return iL2 + i12;
                }
                if (i5 == -1) {
                    if (T()) {
                        i12 = this.f80119u[0];
                        iL2 = L();
                        return iL2 + i12;
                    }
                    i11 = this.f80119u[0];
                    iL = L();
                    return i11 - iL;
                }
            }
        }
        return 0;
    }

    public final float O(View view, int i5, int i11, boolean z11) {
        int measuredWidth = getMeasuredWidth() / 2;
        int iN = i5 - (N(i11) + measuredWidth);
        int iM = M();
        int childCount = getChildCount();
        int i12 = i11 + iM;
        boolean zT = T();
        if ((iN < 0 && !zT) || (iN > 0 && zT)) {
            i12 = i11 - iM;
        }
        int measuredWidth2 = (i12 < 0 || i12 > childCount + (-1)) ? (view.getMeasuredWidth() + this.f80112l) * iM : Math.abs(N(i12) - N(i11));
        if (S()) {
            if (i11 == getChildCount() - 1 && Math.abs(iN) > measuredWidth2) {
                iN = i5 - (N(-1) + measuredWidth);
            }
            if (i11 == 0 && Math.abs(iN) > measuredWidth2) {
                iN = i5 - (N(childCount) + measuredWidth);
            }
        }
        float f11 = iN / (measuredWidth2 * 1.0f);
        return z11 ? Math.max(Math.min(f11, 1.0f), -1.0f) : f11;
    }

    public final int[] P() {
        float f11 = 0.0f;
        float measuredWidth = getMeasuredWidth() + 0.0f;
        float scaleX = getScaleX();
        if (scaleX < 1.0f && scaleX > 0.0f) {
            float measuredWidth2 = getMeasuredWidth() / 2;
            f11 = measuredWidth2 - ((measuredWidth2 - 0.0f) / scaleX);
            measuredWidth = a2.c.z(measuredWidth, measuredWidth2, scaleX, measuredWidth2);
        }
        int childCount = getChildCount();
        int i5 = -1;
        int i11 = -1;
        for (int i12 = 0; i12 < childCount; i12++) {
            float translationX = (H(i12).getTranslationX() + r8.getLeft()) - getScrollX();
            if (translationX <= measuredWidth && translationX + r8.getMeasuredWidth() >= f11) {
                if (i5 == -1) {
                    i5 = i12;
                }
                i11 = i12;
            }
        }
        if (S()) {
            if (i5 == 0 && getScrollX() <= 0) {
                i5--;
            }
            if (i11 == childCount - 1) {
                if (getScrollX() >= (this.f80118t == ua.f.f90757lp ? this.f80109i : getMeasuredWidth())) {
                    i11++;
                }
            }
        }
        int[] iArr = this.I;
        iArr[0] = i5;
        iArr[1] = i11;
        return iArr;
    }

    public final int Q() {
        int iG = G();
        if (!S()) {
            return iG;
        }
        if (iG == -1) {
            return getChildCount() - 1;
        }
        if (iG == getChildCount()) {
            return 0;
        }
        return iG;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public void R(View view) {
        int i5 = this.D;
        if (i5 > -1) {
            View viewFindViewById = view.findViewById(i5);
            this.E = viewFindViewById;
            ((ia.a) viewFindViewById).c(getChildCount() / M());
        }
    }

    public boolean S() {
        return this instanceof ScrollEffectPreviewPagedView;
    }

    public final boolean T() {
        return this.G && this.f80118t.o(1, 0) != 0;
    }

    public void U(int i5) {
        b00.z0 z0Var = this.N;
        if (z0Var != null) {
            z0Var.i(G(), H(G()));
        }
        r0();
    }

    public void V(int i5, View view) {
    }

    public void W() {
    }

    public void X() {
        ps.f.q(getContext());
        ps.f.o(H(this.f80106f), 8, null);
        Runnable runnable = this.C;
        if (runnable != null) {
            runnable.run();
            this.C = null;
        }
    }

    public void Y(int i5, View view) {
    }

    public final void Z(MotionEvent motionEvent) {
        int actionIndex = motionEvent.getActionIndex();
        if (motionEvent.getPointerId(actionIndex) == this.A) {
            int i5 = actionIndex == 0 ? 1 : 0;
            float fD = this.f80118t.d(motionEvent, i5);
            this.o = fD;
            this.f80114p = fD;
            this.f80115q = 0.0f;
            this.A = motionEvent.getPointerId(i5);
            VelocityTracker velocityTracker = this.f80111k;
            if (velocityTracker != null) {
                velocityTracker.clear();
            }
        }
    }

    public final void a0() {
        if (this.B && !this.f80120v && this.f80110j.isFinished()) {
            if (!isShown() || (this.J.isFinished() && this.K.isFinished())) {
                this.B = false;
                X();
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void addFocusables(final ArrayList arrayList, final int i5, final int i11) {
        if (getDescendantFocusability() != 393216 && G() == Q()) {
            ya.r rVarI = I(G());
            F(i5).forEach(new ya.q(rVarI, 0));
            rVarI.forEach(new Consumer() { // from class: o9.q2
                @Override // java.util.function.Consumer
                public final void accept(Object obj) {
                    s2 s2Var = this.f80077a;
                    s2Var.getClass();
                    s2Var.H(((Integer) obj).intValue()).addFocusables(arrayList, i5, i11);
                }
            });
        }
    }

    public void b0(int i5) {
        float fO;
        if (this.M == null || getChildCount() <= 0) {
            return;
        }
        int i11 = this.f80106f;
        int childCount = getChildCount();
        int i12 = 0;
        if (S() || i5 > 0) {
            int i13 = i11;
            float f11 = 1.0f;
            for (int i14 = 0; i14 < childCount; i14++) {
                float fO2 = O(H(i14), i5, i14, false);
                if (fO2 > -1.0f && fO2 < 1.0f && Math.abs(fO2) < Math.abs(f11)) {
                    i13 = i14;
                    f11 = fO2;
                }
            }
            fO = f11;
            i12 = i13;
        } else {
            fO = O(H(0), i5, 0, false);
        }
        this.M.d(fO, i12);
    }

    public boolean c0() {
        if (G() <= 0) {
            return this.f80124z;
        }
        l0(G() - M());
        return true;
    }

    @Override // android.view.View
    public void computeScroll() {
        OverScroller overScroller = this.f80110j;
        if (overScroller.computeScrollOffset()) {
            int iG = this.f80118t.g(this);
            int currX = overScroller.getCurrX();
            if (iG != currX) {
                this.f80118t.t(this, ua.f.f90760pp, overScroller.getCurrX());
            }
            if (this.f80124z && !S()) {
                if (currX >= 0 || iG < 0) {
                    int i5 = this.f80109i;
                    if (currX > i5 && iG <= i5) {
                        this.K.onAbsorb((int) overScroller.getCurrVelocity());
                        overScroller.abortAnimation();
                    }
                } else {
                    this.J.onAbsorb((int) overScroller.getCurrVelocity());
                    overScroller.abortAnimation();
                }
            }
            if (currX == this.f80118t.o(overScroller.getFinalX(), overScroller.getFinalY()) && this.J.isFinished() && this.K.isFinished()) {
                overScroller.abortAnimation();
            }
            invalidate();
            return;
        }
        if (this.f80108h != -100) {
            int iG2 = this.f80118t.g(this);
            int iAbs = Math.abs(iG2 - overScroller.getCurrX());
            int iAbs2 = Math.abs(this.f80118t.g(this) - overScroller.getCurrX());
            if ((iAbs > 0 && iAbs < 10) || (iAbs2 > 0 && iAbs2 < 10)) {
                this.f80118t.t(this, ua.f.f90760pp, overScroller.getCurrX());
            }
            if (ps.f.l(getContext()) && this.f80106f != G()) {
                AccessibilityEvent accessibilityEventObtain = AccessibilityEvent.obtain(androidx.recyclerview.widget.u1.FLAG_APPEARED_IN_PRE_LAYOUT);
                accessibilityEventObtain.setScrollable(true);
                accessibilityEventObtain.setScrollX(getScrollX());
                accessibilityEventObtain.setScrollY(getScrollY());
                this.f80118t.m(this.f80109i, accessibilityEventObtain);
                sendAccessibilityEventUnchecked(accessibilityEventObtain);
            }
            int i11 = this.f80106f;
            int childCount = this.f80108h;
            if (S()) {
                if (childCount == -1) {
                    childCount = getChildCount() - 1;
                } else if (childCount == getChildCount()) {
                    childCount = 0;
                }
            }
            int iS0 = s0(childCount);
            this.f80106f = iS0;
            this.f80107g = iS0;
            this.f80108h = -100;
            if (S()) {
                int iL = L() / 2;
                if (iG2 < 0 - iL) {
                    this.f80118t.t(this, ua.f.f90760pp, L() + this.f80109i + iG2);
                } else {
                    int i12 = this.f80109i;
                    if (iG2 > iL + i12) {
                        this.f80118t.t(this, ua.f.f90760pp, (iG2 - i12) - L());
                    }
                }
            }
            U(i11);
            if (!this.f80120v) {
                a0();
            }
            if (m() && ps.f.i(getContext())) {
                announceForAccessibility(C());
            }
        }
    }

    public boolean d0() {
        if (G() >= getChildCount() - 1) {
            return this.f80124z;
        }
        l0(M() + G());
        return true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void dispatchDraw(Canvas canvas) {
        super.dispatchDraw(canvas);
        if (S()) {
            long drawingTime = getDrawingTime();
            int iG = this.f80118t.g(this);
            if (iG > this.f80109i) {
                int iSave = canvas.save();
                View childAt = getChildAt(T() ? getChildCount() - 1 : 0);
                this.f80118t.c(canvas, ua.f.f90761qp, (this.f80109i + L()) - N(r6));
                if (getClipToPadding()) {
                    canvas.clipRect(Integer.MIN_VALUE, getPaddingTop(), LayoutNode.NotPlacedPlaceOrder, getHeight() - getPaddingBottom());
                }
                Y(getChildCount(), childAt);
                r(canvas, childAt, drawingTime);
                canvas.restoreToCount(iSave);
                return;
            }
            if (iG < 0) {
                int iSave2 = canvas.save();
                View childAt2 = getChildAt(T() ? 0 : getChildCount() - 1);
                Y(-1, childAt2);
                this.f80118t.c(canvas, ua.f.f90761qp, (0 - N(r3)) - L());
                if (getClipToPadding()) {
                    canvas.clipRect(Integer.MIN_VALUE, getPaddingTop(), LayoutNode.NotPlacedPlaceOrder, getHeight() - getPaddingBottom());
                }
                r(canvas, childAt2, drawingTime);
                canvas.restoreToCount(iSave2);
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public boolean dispatchUnhandledMove(View view, int i5) {
        if (super.dispatchUnhandledMove(view, i5)) {
            return true;
        }
        if (T()) {
            if (i5 == 17) {
                i5 = 66;
            } else if (i5 == 66) {
                i5 = 17;
            }
        }
        int iG = G();
        Iterator it = F(i5).iterator();
        int i11 = LayoutNode.NotPlacedPlaceOrder;
        int i12 = -1;
        while (true) {
            com.google.android.gms.internal.measurement.u uVar = (com.google.android.gms.internal.measurement.u) it;
            if (!uVar.hasNext()) {
                break;
            }
            int iIntValue = ((Integer) uVar.next()).intValue();
            int iAbs = Math.abs(iIntValue - iG);
            if (i11 > iAbs) {
                i12 = iIntValue;
                i11 = iAbs;
            }
        }
        if (i12 == -1) {
            return false;
        }
        View viewH = H(i12);
        l0(i12);
        viewH.requestFocus(i5);
        return true;
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        super.draw(canvas);
        if (this.f80124z && (!this.K.isFinished() || !this.J.isFinished())) {
            int width = getWidth();
            int height = getHeight();
            if (!this.J.isFinished()) {
                int iSave = canvas.save();
                if (this.f80118t == ua.f.f90757lp) {
                    ya.i iVar = this.J;
                    iVar.getClass();
                    if (!(iVar instanceof cz.i)) {
                        canvas.rotate(-90.0f);
                        canvas.translate(-height, Math.min(0, getScrollX()));
                    }
                }
                this.J.setSize(height, width);
                if (this.J.draw(canvas)) {
                    postInvalidateOnAnimation();
                }
                canvas.restoreToCount(iSave);
            }
            if (!this.K.isFinished()) {
                int iSave2 = canvas.save();
                ya.i iVar2 = this.K;
                iVar2.getClass();
                if (!(iVar2 instanceof cz.i)) {
                    if (this.f80118t == ua.f.f90757lp) {
                        float f11 = width;
                        canvas.rotate(90.0f, f11, 0.0f);
                        canvas.translate(f11, -Math.max(this.f80109i, getScrollX()));
                    } else {
                        canvas.rotate(180.0f, width / 2.0f, height / 2.0f);
                    }
                }
                this.K.setSize(height, width);
                if (this.K.draw(canvas)) {
                    postInvalidateOnAnimation();
                }
                canvas.restoreToCount(iSave2);
            }
        }
        a0();
    }

    @Override // android.view.ViewGroup
    public final boolean drawChild(Canvas canvas, View view, long j11) {
        int[] iArrP = P();
        int iIndexOfChild = indexOfChild(view);
        if (iIndexOfChild >= iArrP[0] && iIndexOfChild <= iArrP[1]) {
            Y(indexOfChild(view), view);
        }
        return r(canvas, view, j11);
    }

    public void e0(View view, float f11) {
        view.setAlpha(f11);
    }

    public final void f0(float f11, int i5) {
        z20.a aVar = this.P;
        if (f11 == 1.0f) {
            int iA = w20.h.a(aVar.f98186c, i5, aVar.f98184a);
            if (iA >= 0) {
                int[] iArr = aVar.f98184a;
                int i11 = iA + 1;
                System.arraycopy(iArr, i11, iArr, iA, aVar.f98186c - i11);
                float[] fArr = aVar.f98185b;
                System.arraycopy(fArr, i11, fArr, iA, aVar.f98186c - i11);
                aVar.f98186c--;
                return;
            }
            return;
        }
        int iA2 = w20.h.a(aVar.f98186c, i5, aVar.f98184a);
        if (iA2 >= 0) {
            aVar.f98185b[iA2] = f11;
            return;
        }
        int i12 = ~iA2;
        int i13 = aVar.f98186c;
        if (i13 >= aVar.f98184a.length) {
            int i14 = (i13 + 1) * 4;
            int i15 = 4;
            while (true) {
                if (i15 >= 32) {
                    break;
                }
                int i16 = (1 << i15) - 12;
                if (i14 <= i16) {
                    i14 = i16;
                    break;
                }
                i15++;
            }
            int i17 = i14 / 4;
            int[] iArr2 = new int[i17];
            float[] fArr2 = new float[i17];
            int[] iArr3 = aVar.f98184a;
            System.arraycopy(iArr3, 0, iArr2, 0, iArr3.length);
            float[] fArr3 = aVar.f98185b;
            System.arraycopy(fArr3, 0, fArr2, 0, fArr3.length);
            aVar.f98184a = iArr2;
            aVar.f98185b = fArr2;
        }
        int i18 = aVar.f98186c - i12;
        if (i18 != 0) {
            int[] iArr4 = aVar.f98184a;
            int i19 = i12 + 1;
            System.arraycopy(iArr4, i12, iArr4, i19, i18);
            float[] fArr4 = aVar.f98185b;
            System.arraycopy(fArr4, i12, fArr4, i19, aVar.f98186c - i12);
        }
        aVar.f98184a[i12] = i5;
        aVar.f98185b[i12] = f11;
        aVar.f98186c++;
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void focusableViewAvailable(View view) {
        View viewH = H(this.f80106f);
        for (View view2 = view; view2 != viewH; view2 = (View) view2.getParent()) {
            if (view2 == this || !(view2.getParent() instanceof View)) {
                return;
            }
        }
        super.focusableViewAvailable(view);
    }

    @Override // android.view.View
    public final void forceLayout() {
        this.H = false;
        super.forceLayout();
    }

    public final void g0(int i5) {
        h0(i5, -100);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final CharSequence getAccessibilityClassName() {
        return ScrollView.class.getName();
    }

    public final void h0(int i5, int i11) {
        if (!this.f80110j.isFinished()) {
            k(true);
        }
        if (getChildCount() == 0) {
            return;
        }
        if (i11 == -100) {
            i11 = this.f80106f;
        }
        if (S()) {
            if (i5 == -1) {
                i5 = getChildCount() - 1;
            } else if (i5 == getChildCount()) {
                i5 = 0;
            }
        }
        int iS0 = s0(i5);
        this.f80106f = iS0;
        this.f80107g = iS0;
        p0();
        U(i11);
        invalidate();
    }

    public final void i0(l30.p pVar) {
        this.M = pVar;
        if (!isAttachedToWindow() || this.M == null) {
            return;
        }
        computeScroll();
    }

    public boolean j0(int i5) {
        return ((float) Math.abs(i5)) > ((float) (this.f80117s ? this.f80102b : this.f80101a));
    }

    public final void k(boolean z11) {
        this.f80110j.abortAnimation();
        if (z11) {
            this.f80108h = -100;
            a0();
        }
    }

    public void k0() {
        n0(J(this.f80118t.g(this)), false);
    }

    public boolean l() {
        return getChildCount() > 1;
    }

    public boolean l0(int i5) {
        return n0(i5, false);
    }

    public boolean m() {
        return true;
    }

    public final boolean m0(int i5, int i11, int i12, boolean z11) {
        int i13;
        if (this.f80105e) {
            g0(i5);
            return false;
        }
        if (!S()) {
            i5 = s0(i5);
        }
        this.f80108h = i5;
        awakenScrollBars(i12);
        if (z11) {
            i13 = 0;
        } else {
            if (i12 == 0) {
                i12 = Math.abs(i11);
            }
            i13 = i12;
        }
        if (i13 != 0 && !this.B) {
            this.B = true;
            W();
        }
        OverScroller overScroller = this.f80110j;
        if (!overScroller.isFinished()) {
            k(false);
        }
        overScroller.startScroll(this.f80118t.g(this), 0, i11, 0, i13);
        r0();
        if (z11) {
            computeScroll();
            a0();
        }
        invalidate();
        return Math.abs(i11) > 0;
    }

    public boolean n(float f11, float f12) {
        return a.P((za.d) za.d.p(getContext()), 7471103) == null;
    }

    public final boolean n0(int i5, boolean z11) {
        int iS0 = s0(i5);
        return m0(iS0, N(iS0) - this.f80118t.g(this), 750, z11);
    }

    public final void o0(int i5, int i11) {
        if (!S()) {
            i5 = s0(i5);
        }
        int iY = this.f80118t.y(this) / 2;
        int iN = N(i5) - (S() ? this.f80118t.g(this) : Math.max(this.f80118t.g(this), 0));
        if (Math.abs(i11) < this.f80103c) {
            n0(i5, false);
            return;
        }
        float fMin = Math.min(1.0f, (Math.abs(iN) * 1.0f) / (iY * 2));
        float f11 = iY;
        m0(i5, iN, Math.round(Math.abs(((((float) Math.sin((float) ((fMin - 0.5f) * 0.4712389167638204d))) * f11) + f11) / Math.max(this.f80104d, Math.abs(i11))) * 1000.0f) * 4, false);
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.M != null) {
            computeScroll();
        }
    }

    @Override // android.view.View
    public final boolean onGenericMotionEvent(MotionEvent motionEvent) {
        float f11;
        float axisValue;
        if ((motionEvent.getSource() & 2) != 0 && motionEvent.getAction() == 8) {
            if ((motionEvent.getMetaState() & 1) != 0) {
                axisValue = motionEvent.getAxisValue(9);
                f11 = 0.0f;
            } else {
                f11 = -motionEvent.getAxisValue(9);
                axisValue = motionEvent.getAxisValue(10);
            }
            if (!n(Math.abs(f11), Math.abs(axisValue))) {
                return false;
            }
            if (axisValue != 0.0f || f11 != 0.0f) {
                if (!T() ? !(axisValue > 0.0f || f11 > 0.0f) : !(axisValue < 0.0f || f11 < 0.0f)) {
                    d0();
                    return true;
                }
                c0();
                return true;
            }
        }
        return super.onGenericMotionEvent(motionEvent);
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        super.onInitializeAccessibilityEvent(accessibilityEvent);
        boolean z11 = true;
        if (!this.f80124z && getChildCount() <= 1) {
            z11 = false;
        }
        accessibilityEvent.setScrollable(z11);
    }

    @Override // android.view.View
    public final void onInitializeAccessibilityNodeInfo(AccessibilityNodeInfo accessibilityNodeInfo) {
        super.onInitializeAccessibilityNodeInfo(accessibilityNodeInfo);
        accessibilityNodeInfo.setScrollable(getChildCount() > 0);
        int iG = this.f80118t.g(this);
        if (this.f80106f < getChildCount() - M() || (this.f80106f == getChildCount() - M() && iG != N(getChildCount() - M()))) {
            accessibilityNodeInfo.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_FORWARD);
            if (Build.VERSION.SDK_INT >= 29) {
                accessibilityNodeInfo.addAction(T() ? AccessibilityNodeInfo.AccessibilityAction.ACTION_PAGE_LEFT : AccessibilityNodeInfo.AccessibilityAction.ACTION_PAGE_RIGHT);
            }
        }
        int i5 = this.f80106f;
        if (i5 > 0 || (i5 == 0 && iG != N(0))) {
            accessibilityNodeInfo.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_SCROLL_BACKWARD);
            if (Build.VERSION.SDK_INT >= 29) {
                accessibilityNodeInfo.addAction(T() ? AccessibilityNodeInfo.AccessibilityAction.ACTION_PAGE_RIGHT : AccessibilityNodeInfo.AccessibilityAction.ACTION_PAGE_LEFT);
            }
        }
        accessibilityNodeInfo.setLongClickable(false);
        accessibilityNodeInfo.removeAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_LONG_CLICK);
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x004f  */
    @Override // android.view.ViewGroup
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        if (!l()) {
            return false;
        }
        if (this.f80111k == null) {
            this.f80111k = VelocityTracker.obtain();
        }
        this.f80111k.addMovement(motionEvent);
        int action = motionEvent.getAction();
        if (action == 2 && this.f80120v) {
            return true;
        }
        int i5 = action & 255;
        if (i5 == 0) {
            float x11 = motionEvent.getX();
            float y11 = motionEvent.getY();
            this.f80113m = x11;
            this.n = y11;
            float fD = this.f80118t.d(motionEvent, 0);
            this.f80114p = fD;
            this.o = fD;
            this.f80115q = 0.0f;
            this.f80116r = 0.0f;
            this.f80117s = false;
            this.A = motionEvent.getPointerId(0);
            q0(motionEvent);
        } else if (i5 == 1) {
            VelocityTracker velocityTracker = this.f80111k;
            if (velocityTracker != null) {
                velocityTracker.clear();
                this.f80111k.recycle();
                this.f80111k = null;
            }
            this.f80120v = false;
            this.A = -1;
        } else if (i5 != 2) {
            if (i5 != 3) {
                if (i5 == 6) {
                    Z(motionEvent);
                    VelocityTracker velocityTracker2 = this.f80111k;
                    if (velocityTracker2 != null) {
                        velocityTracker2.clear();
                        this.f80111k.recycle();
                        this.f80111k = null;
                    }
                }
            }
        } else if (this.A != -1) {
            p(motionEvent);
        }
        return this.f80120v;
    }

    @Override // android.view.ViewGroup, android.view.View
    public void onLayout(boolean z11, int i5, int i11, int i12, int i13) {
        boolean z12;
        int iN;
        int i14;
        this.H = true;
        int childCount = getChildCount();
        int[] iArr = this.f80119u;
        if (iArr == null || childCount != iArr.length) {
            this.f80119u = new int[childCount];
            z12 = true;
        } else {
            z12 = false;
        }
        if (childCount == 0) {
            return;
        }
        if (K(this.f80119u, true)) {
            z12 = true;
        }
        LayoutTransition layoutTransition = getLayoutTransition();
        if (layoutTransition == null || !layoutTransition.isRunning()) {
            int childCount2 = getChildCount();
            if (childCount2 > 0) {
                iN = N(T() ? 0 : childCount2 - 1);
            } else {
                iN = 0;
            }
            this.f80109i = iN;
        } else {
            layoutTransition.addTransitionListener(new r2(this));
        }
        if (this.f80105e && (i14 = this.f80106f) >= 0 && i14 < childCount) {
            p0();
            this.f80105e = false;
        }
        if (this.f80110j.isFinished() && z12) {
            g0(G());
        }
    }

    @Override // android.view.View
    public final void onMeasure(int i5, int i11) {
        if (getChildCount() == 0) {
            super.onMeasure(i5, i11);
            return;
        }
        int mode = View.MeasureSpec.getMode(i5);
        int size = View.MeasureSpec.getSize(i5);
        int mode2 = View.MeasureSpec.getMode(i11);
        int size2 = View.MeasureSpec.getSize(i11);
        if (mode == 0 || mode2 == 0) {
            super.onMeasure(i5, i11);
            return;
        }
        if (size <= 0 || size2 <= 0) {
            super.onMeasure(i5, i11);
            return;
        }
        Rect rect = this.F;
        measureChildren(View.MeasureSpec.makeMeasureSpec(getPaddingRight() + getPaddingLeft() + (((((size - rect.left) - rect.right) - getPaddingLeft()) - getPaddingRight()) / M()), 1073741824), View.MeasureSpec.makeMeasureSpec((size2 - rect.top) - rect.bottom, 1073741824));
        setMeasuredDimension(size, size2);
    }

    @Override // android.view.ViewGroup
    public final boolean onRequestFocusInDescendants(int i5, Rect rect) {
        int i11 = this.f80108h;
        if (i11 == -100) {
            i11 = this.f80106f;
        }
        View viewH = H(i11);
        if (viewH != null) {
            return viewH.requestFocus(i5, rect);
        }
        return false;
    }

    @Override // android.view.View
    public void onScrollChanged(int i5, int i11, int i12, int i13) {
        int iJ;
        if (this.f80110j.isFinished() || (iJ = J(this.f80118t.g(this))) < 0 || iJ == this.f80107g) {
            return;
        }
        this.f80107g = iJ;
    }

    @Override // android.view.View
    public boolean onTouchEvent(MotionEvent motionEvent) {
        float f11;
        float f12;
        float fOnPullDistance;
        if (!l()) {
            return false;
        }
        if (this.f80111k == null) {
            this.f80111k = VelocityTracker.obtain();
        }
        this.f80111k.addMovement(motionEvent);
        int action = motionEvent.getAction() & 255;
        if (action == 0) {
            q0(motionEvent);
            if (!this.f80110j.isFinished()) {
                k(false);
            }
            this.f80113m = motionEvent.getX();
            this.n = motionEvent.getY();
            float fD = this.f80118t.d(motionEvent, 0);
            this.f80114p = fD;
            this.o = fD;
            this.f80115q = 0.0f;
            this.f80116r = 0.0f;
            this.f80117s = false;
            this.A = motionEvent.getPointerId(0);
            if (this.f80120v && !this.B) {
                this.B = true;
                W();
            }
        } else {
            if (action == 1) {
                if (this.f80120v) {
                    int iFindPointerIndex = motionEvent.findPointerIndex(this.A);
                    if (iFindPointerIndex != -1) {
                        float fD2 = this.f80118t.d(motionEvent, iFindPointerIndex);
                        VelocityTracker velocityTracker = this.f80111k;
                        velocityTracker.computeCurrentVelocity(1000, this.f80123y);
                        int iV = (int) this.f80118t.v(velocityTracker, this.A);
                        float fX = (fD2 - this.o) / this.f80118t.x(this);
                        int i5 = this.f80106f;
                        if (i5 < 0 || i5 >= getChildCount()) {
                            throw new IllegalStateException("Current page out of range " + this.f80106f + " " + getChildCount());
                        }
                        float fY = this.f80118t.y(H(this.f80106f));
                        boolean z11 = Math.abs(fX) > 0.4f * fY;
                        float fAbs = Math.abs((this.f80114p + this.f80115q) - fD2) + this.f80116r;
                        this.f80116r = fAbs;
                        boolean z12 = (this.f80117s || fAbs > ((float) this.f80122x)) && j0(iV);
                        boolean zT = T();
                        boolean z13 = !zT ? fX >= 0.0f : fX <= 0.0f;
                        boolean z14 = !zT ? iV >= 0 : iV <= 0;
                        boolean z15 = Math.abs(fX) > fY * 0.33f && Math.signum((float) iV) != Math.signum(fX) && z12;
                        boolean z16 = this.f80106f > 0 || S();
                        boolean z17 = this.f80106f < getChildCount() - 1 || S();
                        if (((z11 && !z13 && !z12) || (z12 && !z14)) && z16) {
                            o0(z15 ? this.f80106f : this.f80106f - M(), iV);
                        } else if (((z11 && z13 && !z12) || (z12 && z14)) && z17) {
                            o0(z15 ? this.f80106f : this.f80106f + M(), iV);
                        } else {
                            k0();
                        }
                    }
                }
                this.J.onRelease();
                this.K.onRelease();
                VelocityTracker velocityTracker2 = this.f80111k;
                if (velocityTracker2 != null) {
                    velocityTracker2.clear();
                    this.f80111k.recycle();
                    this.f80111k = null;
                }
                this.f80120v = false;
                this.A = -1;
                return true;
            }
            if (action != 2) {
                if (action == 3) {
                    if (this.f80120v) {
                        k0();
                    }
                    this.J.onRelease();
                    this.K.onRelease();
                    VelocityTracker velocityTracker3 = this.f80111k;
                    if (velocityTracker3 != null) {
                        velocityTracker3.clear();
                        this.f80111k.recycle();
                        this.f80111k = null;
                    }
                    this.f80120v = false;
                    this.A = -1;
                    return true;
                }
                if (action == 6) {
                    Z(motionEvent);
                    VelocityTracker velocityTracker4 = this.f80111k;
                    if (velocityTracker4 != null) {
                        velocityTracker4.clear();
                        this.f80111k.recycle();
                        this.f80111k = null;
                        return true;
                    }
                } else if (action == 254) {
                    p(motionEvent);
                    this.f80117s = true;
                    return true;
                }
            } else {
                if (!this.f80120v) {
                    p(motionEvent);
                    return true;
                }
                int iFindPointerIndex2 = motionEvent.findPointerIndex(this.A);
                if (iFindPointerIndex2 != -1) {
                    float fG = this.f80118t.g(this);
                    float x11 = motionEvent.getX(iFindPointerIndex2);
                    float y11 = motionEvent.getY(iFindPointerIndex2);
                    float fH = this.f80118t.h(x11, y11);
                    float f13 = (this.f80114p + this.f80115q) - fH;
                    int iO = this.f80118t.o(getWidth(), getHeight());
                    float fP = this.f80118t.p(x11, y11) / this.f80118t.f(r7, r8);
                    this.f80116r = Math.abs(f13) + this.f80116r;
                    if (this.f80124z) {
                        if (f13 < 0.0f && this.K.getDistance() != 0.0f) {
                            f12 = iO;
                            fOnPullDistance = this.K.onPullDistance(f13 / f12, fP);
                        } else if (f13 <= 0.0f || this.J.getDistance() == 0.0f) {
                            f11 = 0.0f;
                            f13 -= f11;
                        } else {
                            f12 = -iO;
                            fOnPullDistance = this.J.onPullDistance((-f13) / iO, 1.0f - fP);
                        }
                        f11 = fOnPullDistance * f12;
                        f13 -= f11;
                    }
                    float fX2 = f13 / this.f80118t.x(this);
                    this.f80114p = fH;
                    int i11 = (int) fX2;
                    this.f80115q = fX2 - i11;
                    if (fX2 == 0.0f) {
                        awakenScrollBars();
                        return true;
                    }
                    this.f80118t.t(this, ua.f.f90759op, i11);
                    if (this.f80124z && !S()) {
                        float f14 = fG + fX2;
                        if (f14 < 0) {
                            this.J.onPullDistance((-fX2) / iO, 1.0f - fP);
                            if (!this.K.isFinished()) {
                                this.K.onRelease();
                            }
                        } else if (f14 > this.f80109i) {
                            this.K.onPullDistance(fX2 / iO, fP);
                            if (!this.J.isFinished()) {
                                this.J.onRelease();
                            }
                        }
                        if (!this.J.isFinished() || !this.K.isFinished()) {
                            postInvalidateOnAnimation();
                            return true;
                        }
                    }
                }
            }
        }
        return true;
    }

    @Override // android.view.ViewGroup
    public void onViewAdded(View view) {
        super.onViewAdded(view);
        KeyEvent.Callback callback = this.E;
        if (callback != null) {
            ((ia.a) callback).c(getChildCount() / M());
        }
        invalidate();
    }

    @Override // android.view.ViewGroup
    public final void onViewRemoved(View view) {
        super.onViewRemoved(view);
        int iS0 = s0(this.f80106f);
        this.f80106f = iS0;
        this.f80107g = iS0;
        KeyEvent.Callback callback = this.E;
        if (callback != null) {
            ((ia.a) callback).c(getChildCount() / M());
        }
        invalidate();
        int childCount = getChildCount();
        int[] iArr = this.f80119u;
        if (iArr == null || childCount != iArr.length) {
            this.f80119u = new int[childCount];
        }
        if (childCount != 0) {
            K(this.f80119u, false);
        }
    }

    @Override // android.view.View
    public final void onVisibilityAggregated(boolean z11) {
        a0();
        super.onVisibilityAggregated(z11);
    }

    public void p(MotionEvent motionEvent) {
        q(motionEvent, 1.0f);
    }

    public final void p0() {
        int i5 = this.f80106f;
        int iN = (i5 < 0 || i5 >= getChildCount()) ? 0 : N(this.f80106f);
        this.f80118t.t(this, ua.f.f90760pp, iN);
        OverScroller overScroller = this.f80110j;
        overScroller.startScroll(overScroller.getCurrX(), 0, iN - overScroller.getCurrX(), 0);
        overScroller.forceFinished(true);
        this.f80108h = -100;
        a0();
    }

    @Override // android.view.View
    public final boolean performAccessibilityAction(int i5, Bundle bundle) {
        if (super.performAccessibilityAction(i5, bundle)) {
            return true;
        }
        if (i5 == 4096) {
            return d0();
        }
        if (i5 == 8192) {
            return c0();
        }
        switch (i5) {
            case 16908360:
                return !T() ? c0() : d0();
            case 16908361:
                return !T() ? d0() : c0();
            default:
                return false;
        }
    }

    public void q(MotionEvent motionEvent, float f11) {
        int iFindPointerIndex = motionEvent.findPointerIndex(this.A);
        if (iFindPointerIndex == -1) {
            return;
        }
        float fD = this.f80118t.d(motionEvent, iFindPointerIndex);
        if (((int) Math.abs(fD - this.f80114p)) > Math.round(f11 * this.f80121w) || motionEvent.getAction() == 254) {
            this.f80120v = true;
            this.f80116r = Math.abs(this.f80114p - fD) + this.f80116r;
            this.f80114p = fD;
            this.f80115q = 0.0f;
            if (!this.B) {
                this.B = true;
                W();
            }
            requestDisallowInterceptTouchEvent(true);
        }
    }

    public void q0(MotionEvent motionEvent) {
        OverScroller overScroller = this.f80110j;
        int iAbs = Math.abs(overScroller.getFinalX() - overScroller.getCurrX());
        boolean z11 = true;
        if (overScroller.isFinished() || iAbs < this.f80122x / 3 || this.R) {
            this.f80120v = false;
            if (!overScroller.isFinished()) {
                g0(G());
                a0();
            }
            if (this.J.isFinished() && this.K.isFinished()) {
                z11 = false;
            }
            this.f80120v = z11;
        } else {
            this.f80120v = true;
        }
        float fP = this.f80118t.p(motionEvent.getX(), motionEvent.getY()) / this.f80118t.f(getWidth(), getHeight());
        if (!this.J.isFinished()) {
            this.J.onPullDistance(0.0f, 1.0f - fP);
        }
        if (this.K.isFinished()) {
            return;
        }
        this.K.onPullDistance(0.0f, fP);
    }

    public final boolean r(Canvas canvas, View view, long j11) {
        int iSave;
        if (getScaleX() != 1.0f) {
            return super.drawChild(canvas, view, j11);
        }
        int iIndexOfChild = indexOfChild(view);
        z20.a aVar = this.P;
        int iA = w20.h.a(aVar.f98186c, iIndexOfChild, aVar.f98184a);
        float f11 = iA < 0 ? 1.0f : aVar.f98185b[iA];
        if (f11 < 1.0f) {
            iSave = canvas.save();
            canvas.translate(getPaddingLeft() + (getScrollX() - B(iIndexOfChild)), 0.0f);
            int iB = B(iIndexOfChild);
            int measuredWidth = getMeasuredWidth() + iB;
            int scrollY = getScrollY();
            int bottom = (getBottom() + getScrollY()) - getTop();
            int i5 = measuredWidth - iB;
            if (f11 < 0.0f) {
                iB += x7.f.y(Math.abs(i5 * f11));
            } else {
                measuredWidth = x7.f.t(i5 * f11) + iB;
            }
            canvas.clipRect(iB, scrollY, measuredWidth, bottom);
        } else {
            iSave = -1;
        }
        try {
            return super.drawChild(canvas, view, j11);
        } finally {
            if (iSave != -1) {
                canvas.restoreToCount(iSave);
            }
        }
    }

    public final void r0() {
        KeyEvent.Callback callback = this.E;
        if (callback != null) {
            ((ia.a) callback).b(G(), Q());
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void requestChildFocus(View view, View view2) {
        super.requestChildFocus(view, view2);
        int iG = G();
        if (iG != this.f80106f) {
            g0(iG);
        }
        int iIndexOfChild = indexOfChild(view);
        if (iIndexOfChild < 0 || D(iIndexOfChild) == this.f80106f || isInTouchMode()) {
            return;
        }
        l0(iIndexOfChild);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean requestChildRectangleOnScreen(View view, Rect rect, boolean z11) {
        int iIndexOfChild = indexOfChild(view);
        if (D(iIndexOfChild) == this.f80106f && this.f80110j.isFinished()) {
            return false;
        }
        if (z11) {
            g0(iIndexOfChild);
            return true;
        }
        l0(iIndexOfChild);
        return true;
    }

    @Override // android.view.View, android.view.ViewParent
    public final void requestLayout() {
        this.H = false;
        super.requestLayout();
    }

    public final void s(Consumer consumer) {
        I(this.f80106f).forEach(new ab.f0(8, this, consumer));
    }

    public final int s0(int i5) {
        int i11 = !T() ? 1 : -1;
        int iN = N(i5);
        while (true) {
            if (iN >= 0) {
                break;
            }
            i5 += i11;
            int iN2 = N(i5);
            if (iN2 <= iN) {
                Log.e("PagedView", "validateNewPage: failed to find a page > mMinScrollX");
                iN = iN2;
                break;
            }
            iN = iN2;
        }
        while (true) {
            if (iN <= this.f80109i) {
                break;
            }
            i5 -= i11;
            int iN3 = N(i5);
            if (iN3 >= iN) {
                Log.e("PagedView", "validateNewPage: failed to find a page < mMaxScrollX");
                break;
            }
            iN = iN3;
        }
        int iC = g3.c(i5, 0, getChildCount() - 1);
        return M() > 1 ? D(iC) : iC;
    }

    @Override // android.view.View
    public final void scrollTo(int i5, int i11) {
        if (!S()) {
            i5 = g3.c(i5, this.f80118t.o(0, 0), this.f80109i);
            i11 = g3.c(i11, this.f80118t.o(0, 0), this.f80109i);
        }
        super.scrollTo(i5, i11);
        b0((getMeasuredWidth() / 2) + i5);
    }

    @Override // android.view.View, android.view.accessibility.AccessibilityEventSource
    public final void sendAccessibilityEvent(int i5) {
        if (i5 != 4096) {
            super.sendAccessibilityEvent(i5);
        }
    }

    public int t() {
        return 0;
    }
}
