package com.google.android.material.bottomsheet;

import a5.a1;
import a5.q0;
import a5.s0;
import aa.i0;
import android.animation.AnimatorSet;
import android.animation.ObjectAnimator;
import android.animation.ValueAnimator;
import android.content.Context;
import android.content.res.ColorStateList;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.os.Build;
import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import android.util.AttributeSet;
import android.util.Log;
import android.util.Property;
import android.util.SparseIntArray;
import android.util.TypedValue;
import android.view.AbsSavedState;
import android.view.MotionEvent;
import android.view.RoundedCorner;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.WindowInsets;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import androidx.recyclerview.widget.a0;
import androidx.recyclerview.widget.l0;
import b.c0;
import bk.g;
import bk.j;
import ck.e;
import com.google.android.gms.internal.measurement.ag;
import com.google.android.gms.internal.measurement.wg;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.WeakHashMap;
import l4.b;
import mx.n1;
import nx.l;
import ps.f0;
import r5.d;
import vj.f;

/* loaded from: classes3.dex */
public class BottomSheetBehavior<V extends View> extends b implements vj.b {
    public final e A;
    public final ValueAnimator B;
    public final int C;
    public int D;
    public int E;
    public final float F;
    public int G;
    public final float H;
    public boolean I;
    public boolean J;
    public final boolean K;
    public int L;
    public d M;
    public boolean N;
    public int O;
    public boolean P;
    public final float Q;
    public int R;
    public int S;
    public int T;
    public WeakReference U;
    public WeakReference V;
    public final ArrayList W;
    public VelocityTracker X;
    public f Y;
    public int Z;

    /* renamed from: a, reason: collision with root package name */
    public final int f34082a;

    /* renamed from: a0, reason: collision with root package name */
    public int f34083a0;

    /* renamed from: b, reason: collision with root package name */
    public boolean f34084b;

    /* renamed from: b0, reason: collision with root package name */
    public boolean f34085b0;

    /* renamed from: c, reason: collision with root package name */
    public final float f34086c;

    /* renamed from: c0, reason: collision with root package name */
    public HashMap f34087c0;

    /* renamed from: d, reason: collision with root package name */
    public final int f34088d;

    /* renamed from: d0, reason: collision with root package name */
    public final SparseIntArray f34089d0;

    /* renamed from: e, reason: collision with root package name */
    public int f34090e;

    /* renamed from: e0, reason: collision with root package name */
    public final ck.d f34091e0;

    /* renamed from: f, reason: collision with root package name */
    public boolean f34092f;

    /* renamed from: g, reason: collision with root package name */
    public int f34093g;

    /* renamed from: h, reason: collision with root package name */
    public final int f34094h;

    /* renamed from: i, reason: collision with root package name */
    public final g f34095i;

    /* renamed from: j, reason: collision with root package name */
    public final ColorStateList f34096j;

    /* renamed from: k, reason: collision with root package name */
    public final int f34097k;

    /* renamed from: l, reason: collision with root package name */
    public final int f34098l;

    /* renamed from: m, reason: collision with root package name */
    public int f34099m;
    public final boolean n;
    public final boolean o;

    /* renamed from: p, reason: collision with root package name */
    public final boolean f34100p;

    /* renamed from: q, reason: collision with root package name */
    public final boolean f34101q;

    /* renamed from: r, reason: collision with root package name */
    public final boolean f34102r;

    /* renamed from: s, reason: collision with root package name */
    public final boolean f34103s;

    /* renamed from: t, reason: collision with root package name */
    public final boolean f34104t;

    /* renamed from: u, reason: collision with root package name */
    public final boolean f34105u;

    /* renamed from: v, reason: collision with root package name */
    public int f34106v;

    /* renamed from: w, reason: collision with root package name */
    public int f34107w;

    /* renamed from: x, reason: collision with root package name */
    public final boolean f34108x;

    /* renamed from: y, reason: collision with root package name */
    public final j f34109y;

    /* renamed from: z, reason: collision with root package name */
    public boolean f34110z;

    public BottomSheetBehavior() {
        this.f34082a = 0;
        this.f34084b = true;
        this.f34097k = -1;
        this.f34098l = -1;
        this.A = new e(this);
        this.F = 0.5f;
        this.H = -1.0f;
        this.K = true;
        this.L = 4;
        this.Q = 0.1f;
        this.W = new ArrayList();
        this.f34083a0 = -1;
        this.f34089d0 = new SparseIntArray();
        this.f34091e0 = new ck.d(this, 1);
    }

    public static View A(View view) {
        if (view.getVisibility() != 0) {
            return null;
        }
        WeakHashMap weakHashMap = a1.f250a;
        if (s0.h(view)) {
            return view;
        }
        if (!(view instanceof ViewGroup)) {
            return null;
        }
        ViewGroup viewGroup = (ViewGroup) view;
        int childCount = viewGroup.getChildCount();
        for (int i5 = 0; i5 < childCount; i5++) {
            View viewA = A(viewGroup.getChildAt(i5));
            if (viewA != null) {
                return viewA;
            }
        }
        return null;
    }

    public static BottomSheetBehavior B(View view) {
        ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        if (!(layoutParams instanceof l4.e)) {
            throw new IllegalArgumentException("The view is not a child of CoordinatorLayout");
        }
        b bVar = ((l4.e) layoutParams).f74696a;
        if (bVar instanceof BottomSheetBehavior) {
            return (BottomSheetBehavior) bVar;
        }
        throw new IllegalArgumentException("The view is not associated with BottomSheetBehavior");
    }

    public static int C(int i5, int i11, int i12, int i13) {
        int childMeasureSpec = ViewGroup.getChildMeasureSpec(i5, i11, i13);
        if (i12 == -1) {
            return childMeasureSpec;
        }
        int mode = View.MeasureSpec.getMode(childMeasureSpec);
        int size = View.MeasureSpec.getSize(childMeasureSpec);
        if (mode == 1073741824) {
            return View.MeasureSpec.makeMeasureSpec(Math.min(size, i12), 1073741824);
        }
        if (size != 0) {
            i12 = Math.min(size, i12);
        }
        return View.MeasureSpec.makeMeasureSpec(i12, Integer.MIN_VALUE);
    }

    public final int D() {
        if (this.f34084b) {
            return this.D;
        }
        return Math.max(this.C, this.f34102r ? 0 : this.f34107w);
    }

    public final int E(int i5) {
        if (i5 == 3) {
            return D();
        }
        if (i5 == 4) {
            return this.G;
        }
        if (i5 == 5) {
            return this.T;
        }
        if (i5 == 6) {
            return this.E;
        }
        throw new IllegalArgumentException(c0.h(i5, "Invalid state to get top offset: "));
    }

    public final boolean F() {
        WeakReference weakReference = this.U;
        if (weakReference != null && weakReference.get() != null) {
            int[] iArr = new int[2];
            ((View) this.U.get()).getLocationOnScreen(iArr);
            if (iArr[1] == 0) {
                return true;
            }
        }
        return false;
    }

    public final void G(boolean z11) throws Resources.NotFoundException {
        if (this.f34084b == z11) {
            return;
        }
        this.f34084b = z11;
        if (this.U != null) {
            w();
        }
        K((this.f34084b && this.L == 6) ? 3 : this.L);
        O(this.L, true);
        N();
    }

    public final void H(boolean z11) throws Resources.NotFoundException {
        if (this.I != z11) {
            this.I = z11;
            if (!z11 && this.L == 5) {
                J(4);
            }
            N();
        }
    }

    public final void I(int i5) {
        if (i5 == -1) {
            if (this.f34092f) {
                return;
            } else {
                this.f34092f = true;
            }
        } else {
            if (!this.f34092f && this.f34090e == i5) {
                return;
            }
            this.f34092f = false;
            this.f34090e = Math.max(0, i5);
        }
        Q();
    }

    public final void J(int i5) {
        int i11 = 1;
        if (i5 == 1 || i5 == 2) {
            throw new IllegalArgumentException(c0.q(new StringBuilder("STATE_"), i5 == 1 ? "DRAGGING" : "SETTLING", " should not be set externally."));
        }
        if (!this.I && i5 == 5) {
            Log.w("BottomSheetBehavior", "Cannot set state: " + i5);
            return;
        }
        int i12 = (i5 == 6 && this.f34084b && E(i5) <= this.D) ? 3 : i5;
        WeakReference weakReference = this.U;
        if (weakReference == null || weakReference.get() == null) {
            K(i5);
            return;
        }
        View view = (View) this.U.get();
        l0 l0Var = new l0(this, view, i12, i11);
        ViewParent parent = view.getParent();
        if (parent != null && parent.isLayoutRequested()) {
            WeakHashMap weakHashMap = a1.f250a;
            if (view.isAttachedToWindow()) {
                view.post(l0Var);
                return;
            }
        }
        l0Var.run();
    }

    public final void K(int i5) {
        View view;
        if (this.L == i5) {
            return;
        }
        this.L = i5;
        if (i5 != 4 && i5 != 3 && i5 != 6) {
            boolean z11 = this.I;
        }
        WeakReference weakReference = this.U;
        if (weakReference == null || (view = (View) weakReference.get()) == null) {
            return;
        }
        int i11 = 0;
        if (i5 == 3) {
            P(true);
        } else if (i5 == 6 || i5 == 5 || i5 == 4) {
            P(false);
        }
        O(i5, true);
        while (true) {
            ArrayList arrayList = this.W;
            if (i11 >= arrayList.size()) {
                N();
                return;
            } else {
                ((gj.a) arrayList.get(i11)).c(i5, view);
                i11++;
            }
        }
    }

    public final boolean L(View view, float f11) {
        if (this.J) {
            return true;
        }
        if (view.getTop() < this.G) {
            return false;
        }
        return Math.abs(((f11 * this.Q) + ((float) view.getTop())) - ((float) this.G)) / ((float) y()) > 0.5f;
    }

    /* JADX WARN: Code restructure failed: missing block: B:15:0x0030, code lost:
    
        if (r3 != false) goto L16;
     */
    /* JADX WARN: Code restructure failed: missing block: B:16:0x0032, code lost:
    
        K(2);
        O(r4, true);
        r2.A.i(r4);
     */
    /* JADX WARN: Code restructure failed: missing block: B:17:0x003f, code lost:
    
        return;
     */
    /* JADX WARN: Code restructure failed: missing block: B:6:0x0012, code lost:
    
        if (r1.o(r3.getLeft(), r0) != false) goto L16;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void M(View view, int i5, boolean z11) {
        int iE = E(i5);
        d dVar = this.M;
        if (dVar != null) {
            if (!z11) {
                int left = view.getLeft();
                dVar.f85521r = view;
                dVar.f85508c = -1;
                boolean zH = dVar.h(left, iE, 0, 0);
                if (!zH && dVar.f85506a == 0 && dVar.f85521r != null) {
                    dVar.f85521r = null;
                }
            }
        }
        K(i5);
    }

    public final void N() throws Resources.NotFoundException {
        View view;
        int iB;
        WeakReference weakReference = this.U;
        if (weakReference == null || (view = (View) weakReference.get()) == null) {
            return;
        }
        a1.h(524288, view);
        a1.f(0, view);
        a1.h(SQLiteDatabase.OPEN_PRIVATECACHE, view);
        a1.f(0, view);
        a1.h(1048576, view);
        a1.f(0, view);
        SparseIntArray sparseIntArray = this.f34089d0;
        int i5 = sparseIntArray.get(0, -1);
        if (i5 != -1) {
            a1.h(i5, view);
            a1.f(0, view);
            sparseIntArray.delete(0);
        }
        if (!this.f34084b && this.L != 6) {
            String string = view.getResources().getString(2132017572);
            ag agVar = new ag(this, i);
            ArrayList arrayListD = a1.d(view);
            int i11 = 0;
            while (true) {
                if (i11 >= arrayListD.size()) {
                    int i12 = 0;
                    int i13 = -1;
                    while (true) {
                        int[] iArr = a1.f253d;
                        if (i12 >= 32 || i13 != -1) {
                            break;
                        }
                        int i14 = iArr[i12];
                        boolean z11 = true;
                        for (int i15 = 0; i15 < arrayListD.size(); i15++) {
                            z11 &= ((b5.d) arrayListD.get(i15)).b() != i14;
                        }
                        if (z11) {
                            i13 = i14;
                        }
                        i12++;
                    }
                    iB = i13;
                } else {
                    if (TextUtils.equals(string, ((b5.d) arrayListD.get(i11)).c())) {
                        iB = ((b5.d) arrayListD.get(i11)).b();
                        break;
                    }
                    i11++;
                }
            }
            if (iB != -1) {
                b5.d dVar = new b5.d(null, iB, string, agVar, null);
                View.AccessibilityDelegate accessibilityDelegateB = a1.b(view);
                a5.b bVar = accessibilityDelegateB == null ? null : accessibilityDelegateB instanceof a5.a ? ((a5.a) accessibilityDelegateB).f249a : new a5.b(accessibilityDelegateB);
                if (bVar == null) {
                    bVar = new a5.b();
                }
                a1.k(view, bVar);
                a1.h(dVar.b(), view);
                a1.d(view).add(dVar);
                a1.f(0, view);
            }
            sparseIntArray.put(0, iB);
        }
        if (this.I) {
            int i16 = 5;
            if (this.L != 5) {
                a1.i(view, b5.d.f17542l, new ag(this, i16));
            }
        }
        int i17 = this.L;
        int i18 = 4;
        int i19 = 3;
        if (i17 == 3) {
            a1.i(view, b5.d.f17541k, new ag(this, this.f34084b ? 4 : 6));
            return;
        }
        if (i17 == 4) {
            a1.i(view, b5.d.f17540j, new ag(this, this.f34084b ? 3 : 6));
        } else {
            if (i17 != 6) {
                return;
            }
            a1.i(view, b5.d.f17541k, new ag(this, i18));
            a1.i(view, b5.d.f17540j, new ag(this, i19));
        }
    }

    public final void O(int i5, boolean z11) {
        g gVar;
        if (i5 == 2) {
            return;
        }
        boolean z12 = this.L == 3 && (this.f34108x || F());
        if (this.f34110z == z12 || (gVar = this.f34095i) == null) {
            return;
        }
        this.f34110z = z12;
        ValueAnimator valueAnimator = this.B;
        if (z11 && valueAnimator != null) {
            if (valueAnimator.isRunning()) {
                valueAnimator.reverse();
                return;
            } else {
                valueAnimator.setFloatValues(gVar.f17980a.f17972i, z12 ? x() : 1.0f);
                valueAnimator.start();
                return;
            }
        }
        if (valueAnimator != null && valueAnimator.isRunning()) {
            valueAnimator.cancel();
        }
        float fX = this.f34110z ? x() : 1.0f;
        bk.f fVar = gVar.f17980a;
        if (fVar.f17972i != fX) {
            fVar.f17972i = fX;
            gVar.f17984e = true;
            gVar.invalidateSelf();
        }
    }

    public final void P(boolean z11) {
        WeakReference weakReference = this.U;
        if (weakReference == null) {
            return;
        }
        ViewParent parent = ((View) weakReference.get()).getParent();
        if (parent instanceof CoordinatorLayout) {
            CoordinatorLayout coordinatorLayout = (CoordinatorLayout) parent;
            int childCount = coordinatorLayout.getChildCount();
            if (z11) {
                if (this.f34087c0 != null) {
                    return;
                } else {
                    this.f34087c0 = new HashMap(childCount);
                }
            }
            for (int i5 = 0; i5 < childCount; i5++) {
                View childAt = coordinatorLayout.getChildAt(i5);
                if (childAt != this.U.get() && z11) {
                    this.f34087c0.put(childAt, Integer.valueOf(childAt.getImportantForAccessibility()));
                }
            }
            if (z11) {
                return;
            }
            this.f34087c0 = null;
        }
    }

    public final void Q() {
        View view;
        if (this.U != null) {
            w();
            if (this.L != 4 || (view = (View) this.U.get()) == null) {
                return;
            }
            view.requestLayout();
        }
    }

    @Override // vj.b
    public final void a(g.b bVar) {
        f fVar = this.Y;
        if (fVar == null) {
            return;
        }
        if (fVar.f92791f == null) {
            Log.w("MaterialBackHelper", "Must call startBackProgress() before updateBackProgress()");
        }
        g.b bVar2 = fVar.f92791f;
        fVar.f92791f = bVar;
        if (bVar2 == null) {
            return;
        }
        fVar.b(bVar.f56404c);
    }

    @Override // vj.b
    public final void b(g.b bVar) {
        f fVar = this.Y;
        if (fVar == null) {
            return;
        }
        fVar.f92791f = bVar;
    }

    @Override // vj.b
    public final void c() {
        f fVar = this.Y;
        if (fVar == null) {
            return;
        }
        if (fVar.f92791f == null) {
            Log.w("MaterialBackHelper", "Must call startBackProgress() and updateBackProgress() before cancelBackProgress()");
        }
        g.b bVar = fVar.f92791f;
        fVar.f92791f = null;
        if (bVar == null) {
            return;
        }
        AnimatorSet animatorSetA = fVar.a();
        animatorSetA.setDuration(fVar.f92790e);
        animatorSetA.start();
    }

    @Override // vj.b
    public final void d() {
        f fVar = this.Y;
        if (fVar == null) {
            return;
        }
        int i5 = fVar.f92789d;
        int i11 = fVar.f92788c;
        g.b bVar = fVar.f92791f;
        fVar.f92791f = null;
        if (bVar != null) {
            float f11 = bVar.f56404c;
            if (Build.VERSION.SDK_INT >= 34) {
                if (!this.I) {
                    AnimatorSet animatorSetA = fVar.a();
                    animatorSetA.setDuration(cj.a.c(f11, i11, i5));
                    animatorSetA.start();
                    J(4);
                    return;
                }
                i0 i0Var = new i0(this, 6);
                View view = fVar.f92787b;
                ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(view, (Property<View, Float>) View.TRANSLATION_Y, view.getScaleY() * view.getHeight());
                objectAnimatorOfFloat.setInterpolator(new f6.a(1));
                objectAnimatorOfFloat.setDuration(cj.a.c(f11, i11, i5));
                objectAnimatorOfFloat.addListener(new i0(fVar, 20));
                objectAnimatorOfFloat.addListener(i0Var);
                objectAnimatorOfFloat.start();
                return;
            }
        }
        J(this.I ? 5 : 4);
    }

    @Override // l4.b
    public final void g(l4.e eVar) {
        this.U = null;
        this.M = null;
        this.Y = null;
    }

    @Override // l4.b
    public final void j() {
        this.U = null;
        this.M = null;
        this.Y = null;
    }

    @Override // l4.b
    public final boolean k(CoordinatorLayout coordinatorLayout, View view, MotionEvent motionEvent) {
        int i5;
        d dVar;
        if (!view.isShown() || !this.K) {
            this.N = true;
            return false;
        }
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 0) {
            this.Z = -1;
            this.f34083a0 = -1;
            VelocityTracker velocityTracker = this.X;
            if (velocityTracker != null) {
                velocityTracker.recycle();
                this.X = null;
            }
        }
        if (this.X == null) {
            this.X = VelocityTracker.obtain();
        }
        this.X.addMovement(motionEvent);
        if (actionMasked == 0) {
            int x11 = (int) motionEvent.getX();
            this.f34083a0 = (int) motionEvent.getY();
            if (this.L != 2) {
                WeakReference weakReference = this.V;
                View view2 = weakReference != null ? (View) weakReference.get() : null;
                if (view2 != null && coordinatorLayout.p(view2, x11, this.f34083a0)) {
                    this.Z = motionEvent.getPointerId(motionEvent.getActionIndex());
                    this.f34085b0 = true;
                }
            }
            this.N = this.Z == -1 && !coordinatorLayout.p(view, x11, this.f34083a0);
        } else if (actionMasked == 1 || actionMasked == 3) {
            this.f34085b0 = false;
            this.Z = -1;
            if (this.N) {
                this.N = false;
                return false;
            }
        }
        if (this.N || (dVar = this.M) == null || !dVar.p(motionEvent)) {
            WeakReference weakReference2 = this.V;
            View view3 = weakReference2 != null ? (View) weakReference2.get() : null;
            if (actionMasked != 2 || view3 == null || this.N || this.L == 1 || coordinatorLayout.p(view3, (int) motionEvent.getX(), (int) motionEvent.getY()) || this.M == null || (i5 = this.f34083a0) == -1 || Math.abs(i5 - motionEvent.getY()) <= this.M.f85507b) {
                return false;
            }
        }
        return true;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // l4.b
    public final boolean l(CoordinatorLayout coordinatorLayout, View view, int i5) throws Resources.NotFoundException {
        WeakHashMap weakHashMap = a1.f250a;
        if (coordinatorLayout.getFitsSystemWindows() && !view.getFitsSystemWindows()) {
            view.setFitsSystemWindows(true);
        }
        int i11 = 0;
        Object[] objArr = 0;
        if (this.U == null) {
            this.f34093g = coordinatorLayout.getResources().getDimensionPixelSize(2131165386);
            boolean z11 = (Build.VERSION.SDK_INT < 29 || this.n || this.f34092f) ? false : true;
            if (this.o || this.f34100p || this.f34101q || this.f34103s || this.f34104t || this.f34105u || z11) {
                e30.j jVar = new e30.j(this, z11);
                int paddingStart = view.getPaddingStart();
                view.getPaddingTop();
                int paddingEnd = view.getPaddingEnd();
                int paddingBottom = view.getPaddingBottom();
                wg wgVar = new wg();
                wgVar.f33198a = paddingStart;
                wgVar.f33199b = paddingEnd;
                wgVar.f33200c = paddingBottom;
                s0.l(view, new l(jVar, wgVar, objArr == true ? 1 : 0));
                if (view.isAttachedToWindow()) {
                    q0.c(view);
                } else {
                    view.addOnAttachStateChangeListener(new n1(1));
                }
            }
            a1.n(view, new gj.e(view));
            this.U = new WeakReference(view);
            this.Y = new f(view);
            g gVar = this.f34095i;
            if (gVar != null) {
                view.setBackground(gVar);
                float fE = this.H;
                if (fE == -1.0f) {
                    fE = s0.e(view);
                }
                gVar.k(fE);
            } else {
                ColorStateList colorStateList = this.f34096j;
                if (colorStateList != null) {
                    s0.i(view, colorStateList);
                }
            }
            N();
            if (view.getImportantForAccessibility() == 0) {
                view.setImportantForAccessibility(1);
            }
        }
        if (this.M == null) {
            this.M = new d(coordinatorLayout.getContext(), coordinatorLayout, this.f34091e0);
        }
        int top = view.getTop();
        coordinatorLayout.r(i5, view);
        this.S = coordinatorLayout.getWidth();
        this.T = coordinatorLayout.getHeight();
        int height = view.getHeight();
        this.R = height;
        int iMin = this.T;
        int i12 = iMin - height;
        int i13 = this.f34107w;
        if (i12 < i13) {
            boolean z12 = this.f34102r;
            int i14 = this.f34098l;
            if (z12) {
                if (i14 != -1) {
                    iMin = Math.min(iMin, i14);
                }
                this.R = iMin;
            } else {
                int iMin2 = iMin - i13;
                if (i14 != -1) {
                    iMin2 = Math.min(iMin2, i14);
                }
                this.R = iMin2;
            }
        }
        this.D = Math.max(0, this.T - this.R);
        this.E = (int) ((1.0f - this.F) * this.T);
        w();
        int i15 = this.L;
        if (i15 == 3) {
            view.offsetTopAndBottom(D());
        } else if (i15 == 6) {
            view.offsetTopAndBottom(this.E);
        } else if (this.I && i15 == 5) {
            view.offsetTopAndBottom(this.T);
        } else if (i15 == 4) {
            view.offsetTopAndBottom(this.G);
        } else if (i15 == 1 || i15 == 2) {
            view.offsetTopAndBottom(top - view.getTop());
        }
        O(this.L, false);
        this.V = new WeakReference(A(view));
        while (true) {
            ArrayList arrayList = this.W;
            if (i11 >= arrayList.size()) {
                return true;
            }
            ((gj.a) arrayList.get(i11)).a(view);
            i11++;
        }
    }

    @Override // l4.b
    public final boolean m(CoordinatorLayout coordinatorLayout, View view, int i5, int i11, int i12) {
        ViewGroup.MarginLayoutParams marginLayoutParams = (ViewGroup.MarginLayoutParams) view.getLayoutParams();
        view.measure(C(i5, coordinatorLayout.getPaddingRight() + coordinatorLayout.getPaddingLeft() + marginLayoutParams.leftMargin + marginLayoutParams.rightMargin + i11, this.f34097k, marginLayoutParams.width), C(i12, coordinatorLayout.getPaddingBottom() + coordinatorLayout.getPaddingTop() + marginLayoutParams.topMargin + marginLayoutParams.bottomMargin, this.f34098l, marginLayoutParams.height));
        return true;
    }

    @Override // l4.b
    public final boolean n(View view) {
        WeakReference weakReference = this.V;
        return (weakReference == null || view != weakReference.get() || this.L == 3) ? false : true;
    }

    @Override // l4.b
    public final void o(CoordinatorLayout coordinatorLayout, View view, View view2, int i5, int i11, int[] iArr, int i12) {
        if (i12 == 1) {
            return;
        }
        WeakReference weakReference = this.V;
        if (view2 != (weakReference != null ? (View) weakReference.get() : null)) {
            return;
        }
        int top = view.getTop();
        int i13 = top - i11;
        boolean z11 = this.K;
        if (i11 > 0) {
            if (i13 < D()) {
                int iD = top - D();
                iArr[1] = iD;
                int i14 = -iD;
                WeakHashMap weakHashMap = a1.f250a;
                view.offsetTopAndBottom(i14);
                K(3);
            } else {
                if (!z11) {
                    return;
                }
                iArr[1] = i11;
                WeakHashMap weakHashMap2 = a1.f250a;
                view.offsetTopAndBottom(-i11);
                K(1);
            }
        } else if (i11 < 0 && !view2.canScrollVertically(-1)) {
            int i15 = this.G;
            if (i13 > i15 && !this.I) {
                int i16 = top - i15;
                iArr[1] = i16;
                int i17 = -i16;
                WeakHashMap weakHashMap3 = a1.f250a;
                view.offsetTopAndBottom(i17);
                K(4);
            } else {
                if (!z11) {
                    return;
                }
                iArr[1] = i11;
                WeakHashMap weakHashMap4 = a1.f250a;
                view.offsetTopAndBottom(-i11);
                K(1);
            }
        }
        z(view.getTop());
        this.O = i11;
        this.P = true;
    }

    @Override // l4.b
    public final void p(CoordinatorLayout coordinatorLayout, View view, int i5, int i11, int i12, int[] iArr) {
    }

    @Override // l4.b
    public final void r(View view, Parcelable parcelable) {
        SavedState savedState = (SavedState) parcelable;
        int i5 = this.f34082a;
        if (i5 != 0) {
            if (i5 == -1 || (i5 & 1) == 1) {
                this.f34090e = savedState.f34112d;
            }
            if (i5 == -1 || (i5 & 2) == 2) {
                this.f34084b = savedState.f34113e;
            }
            if (i5 == -1 || (i5 & 4) == 4) {
                this.I = savedState.f34114f;
            }
            if (i5 == -1 || (i5 & 8) == 8) {
                this.J = savedState.f34115g;
            }
        }
        int i11 = savedState.f34111c;
        if (i11 == 1 || i11 == 2) {
            this.L = 4;
        } else {
            this.L = i11;
        }
    }

    @Override // l4.b
    public final Parcelable s(View view) {
        AbsSavedState absSavedState = View.BaseSavedState.EMPTY_STATE;
        return new SavedState(this);
    }

    @Override // l4.b
    public final boolean t(CoordinatorLayout coordinatorLayout, View view, View view2, int i5, int i11) {
        this.O = 0;
        this.P = false;
        return (i5 & 2) != 0;
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x0097  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00ae  */
    @Override // l4.b
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void u(CoordinatorLayout coordinatorLayout, View view, View view2, int i5) {
        float yVelocity;
        int i11 = 3;
        if (view.getTop() == D()) {
            K(3);
            return;
        }
        WeakReference weakReference = this.V;
        if (weakReference != null && view2 == weakReference.get() && this.P) {
            if (this.O > 0) {
                if (!this.f34084b && view.getTop() > this.E) {
                    i11 = 6;
                }
            } else if (this.I) {
                VelocityTracker velocityTracker = this.X;
                if (velocityTracker == null) {
                    yVelocity = 0.0f;
                } else {
                    velocityTracker.computeCurrentVelocity(1000, this.f34086c);
                    yVelocity = this.X.getYVelocity(this.Z);
                }
                if (L(view, yVelocity)) {
                    i11 = 5;
                }
            } else if (this.O == 0) {
                int top = view.getTop();
                if (!this.f34084b) {
                    int i12 = this.E;
                    if (top < i12) {
                        if (top >= Math.abs(top - this.G)) {
                        }
                    } else if (Math.abs(top - i12) < Math.abs(top - this.G)) {
                    }
                    i11 = 6;
                } else if (Math.abs(top - this.D) >= Math.abs(top - this.G)) {
                    i11 = 4;
                }
            } else {
                if (!this.f34084b) {
                    int top2 = view.getTop();
                    if (Math.abs(top2 - this.E) < Math.abs(top2 - this.G)) {
                    }
                }
                i11 = 4;
            }
            M(view, i11, false);
            this.P = false;
        }
    }

    @Override // l4.b
    public final boolean v(CoordinatorLayout coordinatorLayout, View view, MotionEvent motionEvent) {
        if (!view.isShown()) {
            return false;
        }
        int actionMasked = motionEvent.getActionMasked();
        int i5 = this.L;
        if (i5 == 1 && actionMasked == 0) {
            return true;
        }
        d dVar = this.M;
        if (dVar != null && (this.K || i5 == 1)) {
            dVar.j(motionEvent);
        }
        if (actionMasked == 0) {
            this.Z = -1;
            this.f34083a0 = -1;
            VelocityTracker velocityTracker = this.X;
            if (velocityTracker != null) {
                velocityTracker.recycle();
                this.X = null;
            }
        }
        if (this.X == null) {
            this.X = VelocityTracker.obtain();
        }
        this.X.addMovement(motionEvent);
        if (this.M != null && ((this.K || this.L == 1) && actionMasked == 2 && !this.N)) {
            float fAbs = Math.abs(this.f34083a0 - motionEvent.getY());
            d dVar2 = this.M;
            if (fAbs > dVar2.f85507b) {
                dVar2.b(motionEvent.getPointerId(motionEvent.getActionIndex()), view);
            }
        }
        return !this.N;
    }

    public final void w() {
        int iY = y();
        if (this.f34084b) {
            this.G = Math.max(this.T - iY, this.D);
        } else {
            this.G = this.T - iY;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0044  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final float x() {
        WeakReference weakReference;
        WindowInsets rootWindowInsets;
        float f11;
        float f12 = 0.0f;
        if (this.f34095i != null && (weakReference = this.U) != null && weakReference.get() != null && Build.VERSION.SDK_INT >= 31) {
            View view = (View) this.U.get();
            if (F() && (rootWindowInsets = view.getRootWindowInsets()) != null) {
                float fH = this.f34095i.h();
                RoundedCorner roundedCorner = rootWindowInsets.getRoundedCorner(0);
                if (roundedCorner != null) {
                    float radius = roundedCorner.getRadius();
                    f11 = (radius <= 0.0f || fH <= 0.0f) ? 0.0f : radius / fH;
                }
                g gVar = this.f34095i;
                float fA = gVar.f17980a.f17964a.f18008f.a(gVar.g());
                RoundedCorner roundedCorner2 = rootWindowInsets.getRoundedCorner(1);
                if (roundedCorner2 != null) {
                    float radius2 = roundedCorner2.getRadius();
                    if (radius2 > 0.0f && fA > 0.0f) {
                        f12 = radius2 / fA;
                    }
                }
                return Math.max(f11, f12);
            }
        }
        return 0.0f;
    }

    public final int y() {
        int i5;
        return this.f34092f ? Math.min(Math.max(this.f34093g, this.T - ((this.S * 9) / 16)), this.R) + this.f34106v : (this.n || this.o || (i5 = this.f34099m) <= 0) ? this.f34090e + this.f34106v : Math.max(this.f34090e, i5 + this.f34094h);
    }

    public final void z(int i5) {
        View view = (View) this.U.get();
        if (view != null) {
            ArrayList arrayList = this.W;
            if (arrayList.isEmpty()) {
                return;
            }
            if (i5 <= this.G) {
                D();
            }
            for (int i11 = 0; i11 < arrayList.size(); i11++) {
                ((gj.a) arrayList.get(i11)).b(view);
            }
        }
    }

    public static class SavedState extends androidx.customview.view.AbsSavedState {
        public static final Parcelable.Creator<SavedState> CREATOR = new a();

        /* renamed from: c, reason: collision with root package name */
        public final int f34111c;

        /* renamed from: d, reason: collision with root package name */
        public final int f34112d;

        /* renamed from: e, reason: collision with root package name */
        public final boolean f34113e;

        /* renamed from: f, reason: collision with root package name */
        public final boolean f34114f;

        /* renamed from: g, reason: collision with root package name */
        public final boolean f34115g;

        public SavedState(Parcel parcel, ClassLoader classLoader) {
            super(parcel, classLoader);
            this.f34111c = parcel.readInt();
            this.f34112d = parcel.readInt();
            this.f34113e = parcel.readInt() == 1;
            this.f34114f = parcel.readInt() == 1;
            this.f34115g = parcel.readInt() == 1;
        }

        @Override // androidx.customview.view.AbsSavedState, android.os.Parcelable
        public final void writeToParcel(Parcel parcel, int i5) {
            super.writeToParcel(parcel, i5);
            parcel.writeInt(this.f34111c);
            parcel.writeInt(this.f34112d);
            parcel.writeInt(this.f34113e ? 1 : 0);
            parcel.writeInt(this.f34114f ? 1 : 0);
            parcel.writeInt(this.f34115g ? 1 : 0);
        }

        public SavedState(BottomSheetBehavior bottomSheetBehavior) {
            super(AbsSavedState.EMPTY_STATE);
            this.f34111c = bottomSheetBehavior.L;
            this.f34112d = bottomSheetBehavior.f34090e;
            this.f34113e = bottomSheetBehavior.f34084b;
            this.f34114f = bottomSheetBehavior.I;
            this.f34115g = bottomSheetBehavior.J;
        }
    }

    public BottomSheetBehavior(Context context, AttributeSet attributeSet) throws Resources.NotFoundException {
        int i5;
        this.f34082a = 0;
        this.f34084b = true;
        this.f34097k = -1;
        this.f34098l = -1;
        this.A = new e(this);
        this.F = 0.5f;
        this.H = -1.0f;
        this.K = true;
        this.L = 4;
        this.Q = 0.1f;
        this.W = new ArrayList();
        this.f34083a0 = -1;
        this.f34089d0 = new SparseIntArray();
        this.f34091e0 = new ck.d(this, 1);
        this.f34094h = context.getResources().getDimensionPixelSize(2131166202);
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, bj.a.f17917d);
        if (typedArrayObtainStyledAttributes.hasValue(3)) {
            this.f34096j = f0.m(context, typedArrayObtainStyledAttributes, 3);
        }
        if (typedArrayObtainStyledAttributes.hasValue(21)) {
            this.f34109y = j.c(context, attributeSet, 2130968777, 2132083757).a();
        }
        j jVar = this.f34109y;
        if (jVar != null) {
            g gVar = new g(jVar);
            this.f34095i = gVar;
            gVar.j(context);
            ColorStateList colorStateList = this.f34096j;
            if (colorStateList != null) {
                this.f34095i.l(colorStateList);
            } else {
                TypedValue typedValue = new TypedValue();
                context.getTheme().resolveAttribute(16842801, typedValue, true);
                this.f34095i.setTint(typedValue.data);
            }
        }
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(x(), 1.0f);
        this.B = valueAnimatorOfFloat;
        valueAnimatorOfFloat.setDuration(500L);
        this.B.addUpdateListener(new a0(this, 5));
        this.H = typedArrayObtainStyledAttributes.getDimension(2, -1.0f);
        if (typedArrayObtainStyledAttributes.hasValue(0)) {
            this.f34097k = typedArrayObtainStyledAttributes.getDimensionPixelSize(0, -1);
        }
        if (typedArrayObtainStyledAttributes.hasValue(1)) {
            this.f34098l = typedArrayObtainStyledAttributes.getDimensionPixelSize(1, -1);
        }
        TypedValue typedValuePeekValue = typedArrayObtainStyledAttributes.peekValue(9);
        if (typedValuePeekValue != null && (i5 = typedValuePeekValue.data) == -1) {
            I(i5);
        } else {
            I(typedArrayObtainStyledAttributes.getDimensionPixelSize(9, -1));
        }
        H(typedArrayObtainStyledAttributes.getBoolean(8, false));
        this.n = typedArrayObtainStyledAttributes.getBoolean(13, false);
        G(typedArrayObtainStyledAttributes.getBoolean(6, true));
        this.J = typedArrayObtainStyledAttributes.getBoolean(12, false);
        this.K = typedArrayObtainStyledAttributes.getBoolean(4, true);
        this.f34082a = typedArrayObtainStyledAttributes.getInt(10, 0);
        float f11 = typedArrayObtainStyledAttributes.getFloat(7, 0.5f);
        if (f11 > 0.0f && f11 < 1.0f) {
            this.F = f11;
            if (this.U != null) {
                this.E = (int) ((1.0f - f11) * this.T);
            }
            TypedValue typedValuePeekValue2 = typedArrayObtainStyledAttributes.peekValue(5);
            if (typedValuePeekValue2 != null && typedValuePeekValue2.type == 16) {
                int i11 = typedValuePeekValue2.data;
                if (i11 >= 0) {
                    this.C = i11;
                    O(this.L, true);
                } else {
                    throw new IllegalArgumentException("offset must be greater than or equal to 0");
                }
            } else {
                int dimensionPixelOffset = typedArrayObtainStyledAttributes.getDimensionPixelOffset(5, 0);
                if (dimensionPixelOffset >= 0) {
                    this.C = dimensionPixelOffset;
                    O(this.L, true);
                } else {
                    throw new IllegalArgumentException("offset must be greater than or equal to 0");
                }
            }
            this.f34088d = typedArrayObtainStyledAttributes.getInt(11, 500);
            this.o = typedArrayObtainStyledAttributes.getBoolean(17, false);
            this.f34100p = typedArrayObtainStyledAttributes.getBoolean(18, false);
            this.f34101q = typedArrayObtainStyledAttributes.getBoolean(19, false);
            this.f34102r = typedArrayObtainStyledAttributes.getBoolean(20, true);
            this.f34103s = typedArrayObtainStyledAttributes.getBoolean(14, false);
            this.f34104t = typedArrayObtainStyledAttributes.getBoolean(15, false);
            this.f34105u = typedArrayObtainStyledAttributes.getBoolean(16, false);
            this.f34108x = typedArrayObtainStyledAttributes.getBoolean(23, true);
            typedArrayObtainStyledAttributes.recycle();
            this.f34086c = ViewConfiguration.get(context).getScaledMaximumFlingVelocity();
            return;
        }
        throw new IllegalArgumentException("ratio must be a float value between 0 and 1");
    }
}
