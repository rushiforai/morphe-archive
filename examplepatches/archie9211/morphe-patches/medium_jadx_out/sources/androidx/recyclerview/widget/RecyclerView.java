package androidx.recyclerview.widget;

import android.R;
import android.animation.LayoutTransition;
import android.content.Context;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.graphics.Canvas;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.StateListDrawable;
import android.os.Build;
import android.os.Parcelable;
import android.os.SystemClock;
import android.os.Trace;
import android.util.AttributeSet;
import android.util.Log;
import android.util.SparseArray;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityManager;
import android.widget.EdgeEffect;
import android.widget.OverScroller;
import androidx.work.impl.yX.VrhD;
import com.drew.lang.RandomAccessStreamReader;
import com.squareup.wire.sjIw.ezwlgQm;
import defpackage.a1a;
import defpackage.ab7;
import defpackage.aec;
import defpackage.aue;
import defpackage.ay0;
import defpackage.aya;
import defpackage.bya;
import defpackage.c03;
import defpackage.d8;
import defpackage.e8;
import defpackage.ec3;
import defpackage.epe;
import defpackage.ev6;
import defpackage.ey6;
import defpackage.eya;
import defpackage.fy6;
import defpackage.fya;
import defpackage.gx1;
import defpackage.gxa;
import defpackage.gy6;
import defpackage.gya;
import defpackage.hxa;
import defpackage.hya;
import defpackage.ik4;
import defpackage.il1;
import defpackage.ixa;
import defpackage.jl1;
import defpackage.jya;
import defpackage.kxa;
import defpackage.ky6;
import defpackage.lg8;
import defpackage.lue;
import defpackage.md8;
import defpackage.my6;
import defpackage.nd8;
import defpackage.nxa;
import defpackage.olb;
import defpackage.op8;
import defpackage.or0;
import defpackage.ote;
import defpackage.oxa;
import defpackage.pr0;
import defpackage.pxa;
import defpackage.qxa;
import defpackage.rr7;
import defpackage.sxa;
import defpackage.tra;
import defpackage.txa;
import defpackage.ute;
import defpackage.uxa;
import defpackage.v65;
import defpackage.vx6;
import defpackage.vxa;
import defpackage.vz6;
import defpackage.w25;
import defpackage.wc9;
import defpackage.wxa;
import defpackage.xte;
import defpackage.xxa;
import defpackage.y94;
import defpackage.ygf;
import defpackage.ym0;
import defpackage.yqa;
import defpackage.ywb;
import defpackage.yxa;
import defpackage.zm7;
import defpackage.zxa;
import java.lang.ref.WeakReference;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.WeakHashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class RecyclerView extends ViewGroup implements md8 {
    public static boolean P0;
    public static boolean Q0;
    public static final int[] R0 = {R.attr.nestedScrollingEnabled};
    public static final float S0 = (float) (Math.log(0.78d) / Math.log(0.9d));
    public static final boolean T0 = true;
    public static final boolean U0 = true;
    public static final Class[] V0;
    public static final hxa W0;
    public static final fya X0;
    public boolean A;
    public boolean A0;
    public final AccessibilityManager B;
    public jya B0;
    public boolean C;
    public final int[] C0;
    public boolean D;
    public nd8 D0;
    public int E;
    public final int[] E0;
    public int F;
    public final int[] F0;
    public oxa G;
    public final int[] G0;
    public EdgeEffect H;
    public final ArrayList H0;
    public EdgeEffect I;
    public final gxa I0;
    public EdgeEffect J;
    public boolean J0;
    public EdgeEffect K;
    public int K0;
    public pxa L;
    public int L0;
    public int M;
    public final boolean M0;
    public int N;
    public final ixa N0;
    public VelocityTracker O;
    public final ec3 O0;
    public int P;
    public int Q;
    public int R;
    public int S;
    public final float a;
    public final aya b;
    public final yxa c;
    public bya d;
    public final e8 e;
    public final jl1 f;
    public final a1a g;
    public boolean h;
    public final gxa i;
    public final Rect j;
    public final Rect k;
    public final RectF l;
    public int l0;
    public kxa m;
    public final int m0;
    public sxa n;
    public final int n0;
    public final ArrayList o;
    public final float o0;
    public final ArrayList p;
    public final float p0;
    public final ArrayList q;
    public boolean q0;
    public y94 r;
    public final hya r0;
    public boolean s;
    public v65 s0;
    public boolean t;
    public final ym0 t0;
    public boolean u;
    public final eya u0;
    public int v;
    public vxa v0;
    public boolean w;
    public ArrayList w0;
    public boolean x;
    public boolean x0;
    public boolean y;
    public boolean y0;
    public int z;
    public final ixa z0;

    static {
        Class cls = Integer.TYPE;
        V0 = new Class[]{Context.class, AttributeSet.class, cls, cls};
        W0 = new hxa(0);
        X0 = new fya();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public RecyclerView(Context context, AttributeSet attributeSet) throws NoSuchMethodException {
        float fA;
        char c;
        int i;
        char c2;
        char c3;
        TypedArray typedArray;
        int i2;
        Object[] objArr;
        Constructor constructor;
        super(context, attributeSet, com.medium.reader.R.attr.recyclerViewStyle);
        this.b = new aya(this);
        this.c = new yxa(this);
        this.g = new a1a(25);
        this.i = new gxa(this, 0);
        this.j = new Rect();
        this.k = new Rect();
        this.l = new RectF();
        this.o = new ArrayList();
        this.p = new ArrayList();
        this.q = new ArrayList();
        this.v = 0;
        this.C = false;
        this.D = false;
        this.E = 0;
        this.F = 0;
        this.G = X0;
        c03 c03Var = new c03();
        c03Var.a = null;
        c03Var.b = new ArrayList();
        c03Var.c = 120L;
        c03Var.d = 120L;
        c03Var.e = 250L;
        c03Var.f = 250L;
        int i3 = 1;
        c03Var.g = true;
        c03Var.h = new ArrayList();
        c03Var.i = new ArrayList();
        c03Var.j = new ArrayList();
        c03Var.k = new ArrayList();
        c03Var.l = new ArrayList();
        c03Var.m = new ArrayList();
        c03Var.n = new ArrayList();
        c03Var.o = new ArrayList();
        c03Var.p = new ArrayList();
        c03Var.q = new ArrayList();
        c03Var.r = new ArrayList();
        this.L = c03Var;
        this.M = 0;
        this.N = -1;
        this.o0 = Float.MIN_VALUE;
        this.p0 = Float.MIN_VALUE;
        this.q0 = true;
        this.r0 = new hya(this);
        this.t0 = U0 ? new ym0(2) : null;
        eya eyaVar = new eya();
        eyaVar.a = -1;
        eyaVar.b = 0;
        eyaVar.c = 0;
        eyaVar.d = 1;
        eyaVar.e = 0;
        eyaVar.f = false;
        eyaVar.g = false;
        eyaVar.h = false;
        eyaVar.i = false;
        eyaVar.j = false;
        eyaVar.k = false;
        this.u0 = eyaVar;
        this.x0 = false;
        this.y0 = false;
        ixa ixaVar = new ixa(this);
        this.z0 = ixaVar;
        this.A0 = false;
        this.C0 = new int[2];
        this.E0 = new int[2];
        this.F0 = new int[2];
        this.G0 = new int[2];
        this.H0 = new ArrayList();
        this.I0 = new gxa(this, i3);
        this.K0 = 0;
        this.L0 = 0;
        this.N0 = new ixa(this);
        this.O0 = new ec3(getContext(), new zm7(24, this));
        setScrollContainer(true);
        setFocusableInTouchMode(true);
        ViewConfiguration viewConfiguration = ViewConfiguration.get(context);
        this.l0 = viewConfiguration.getScaledTouchSlop();
        int i4 = Build.VERSION.SDK_INT;
        int i5 = 26;
        if (i4 >= 26) {
            Method method = aue.a;
            fA = epe.B(viewConfiguration);
        } else {
            fA = aue.a(viewConfiguration, context);
        }
        this.o0 = fA;
        this.p0 = i4 >= 26 ? epe.C(viewConfiguration) : aue.a(viewConfiguration, context);
        this.m0 = viewConfiguration.getScaledMinimumFlingVelocity();
        this.n0 = viewConfiguration.getScaledMaximumFlingVelocity();
        this.a = context.getResources().getDisplayMetrics().density * 160.0f * 386.0878f * 0.84f;
        setWillNotDraw(getOverScrollMode() == 2);
        this.L.a = ixaVar;
        olb olbVar = new olb(i5, this);
        e8 e8Var = new e8();
        e8Var.b = new wc9(30);
        e8Var.c = new ArrayList();
        e8Var.d = new ArrayList();
        e8Var.a = 0;
        e8Var.e = olbVar;
        e8Var.f = new my6(e8Var);
        this.e = e8Var;
        this.f = new jl1(new ixa(this));
        WeakHashMap weakHashMap = ute.a;
        if ((i4 >= 26 ? ote.a(this) : 0) == 0 && i4 >= 26) {
            ote.b(this, 8);
        }
        if (getImportantForAccessibility() == 0) {
            setImportantForAccessibility(1);
        }
        this.B = (AccessibilityManager) getContext().getSystemService("accessibility");
        setAccessibilityDelegateCompat(new jya(this));
        int[] iArr = tra.a;
        TypedArray typedArrayObtainStyledAttributes = context.obtainStyledAttributes(attributeSet, iArr, com.medium.reader.R.attr.recyclerViewStyle, 0);
        ute.n(this, context, iArr, attributeSet, typedArrayObtainStyledAttributes, com.medium.reader.R.attr.recyclerViewStyle);
        String string = typedArrayObtainStyledAttributes.getString(8);
        if (typedArrayObtainStyledAttributes.getInt(2, -1) == -1) {
            setDescendantFocusability(262144);
        }
        this.h = typedArrayObtainStyledAttributes.getBoolean(1, true);
        if (typedArrayObtainStyledAttributes.getBoolean(3, false)) {
            StateListDrawable stateListDrawable = (StateListDrawable) typedArrayObtainStyledAttributes.getDrawable(6);
            Drawable drawable = typedArrayObtainStyledAttributes.getDrawable(7);
            StateListDrawable stateListDrawable2 = (StateListDrawable) typedArrayObtainStyledAttributes.getDrawable(4);
            Drawable drawable2 = typedArrayObtainStyledAttributes.getDrawable(5);
            if (stateListDrawable == null || drawable == null || stateListDrawable2 == null || drawable2 == null) {
                ay0.e("Trying to set fast scroller without both required drawables.".concat(A()));
                throw null;
            }
            Resources resources = getContext().getResources();
            int dimensionPixelSize = resources.getDimensionPixelSize(com.medium.reader.R.dimen.fastscroll_default_thickness);
            int dimensionPixelSize2 = resources.getDimensionPixelSize(com.medium.reader.R.dimen.fastscroll_minimum_range);
            c3 = 2;
            int dimensionPixelOffset = resources.getDimensionPixelOffset(com.medium.reader.R.dimen.fastscroll_margin);
            typedArray = typedArrayObtainStyledAttributes;
            c = 3;
            i = com.medium.reader.R.attr.recyclerViewStyle;
            c2 = 1;
            i2 = 4;
            new y94(this, stateListDrawable, drawable, stateListDrawable2, drawable2, dimensionPixelSize, dimensionPixelSize2, dimensionPixelOffset);
        } else {
            c = 3;
            i = com.medium.reader.R.attr.recyclerViewStyle;
            c2 = 1;
            c3 = 2;
            typedArray = typedArrayObtainStyledAttributes;
            i2 = 4;
        }
        typedArray.recycle();
        this.M0 = context.getPackageManager().hasSystemFeature("android.hardware.rotaryencoder.lowres");
        if (string != null) {
            String strTrim = string.trim();
            if (!strTrim.isEmpty()) {
                if (strTrim.charAt(0) == '.') {
                    strTrim = context.getPackageName() + strTrim;
                } else if (!strTrim.contains(".")) {
                    strTrim = RecyclerView.class.getPackage().getName() + '.' + strTrim;
                }
                String str = strTrim;
                try {
                    Class<? extends U> clsAsSubclass = Class.forName(str, false, isInEditMode() ? getClass().getClassLoader() : context.getClassLoader()).asSubclass(sxa.class);
                    try {
                        Constructor constructor2 = clsAsSubclass.getConstructor(V0);
                        objArr = new Object[i2];
                        objArr[0] = context;
                        objArr[c2] = attributeSet;
                        objArr[c3] = Integer.valueOf(i);
                        objArr[c] = 0;
                        constructor = constructor2;
                    } catch (NoSuchMethodException e) {
                        try {
                            objArr = null;
                            constructor = clsAsSubclass.getConstructor(null);
                        } catch (NoSuchMethodException e2) {
                            e2.initCause(e);
                            throw new IllegalStateException(attributeSet.getPositionDescription() + ": Error creating LayoutManager " + str, e2);
                        }
                    }
                    constructor.setAccessible(c2);
                    setLayoutManager((sxa) constructor.newInstance(objArr));
                } catch (ClassCastException e3) {
                    lg8.j(attributeSet.getPositionDescription(), ": Class is not a LayoutManager ", str, e3);
                    throw null;
                } catch (ClassNotFoundException e4) {
                    lg8.j(attributeSet.getPositionDescription(), ": Unable to find LayoutManager ", str, e4);
                    throw null;
                } catch (IllegalAccessException e5) {
                    lg8.j(attributeSet.getPositionDescription(), ": Cannot access non-public constructor ", str, e5);
                    throw null;
                } catch (InstantiationException e6) {
                    lg8.j(attributeSet.getPositionDescription(), ": Could not instantiate the LayoutManager: ", str, e6);
                    throw null;
                } catch (InvocationTargetException e7) {
                    lg8.j(attributeSet.getPositionDescription(), ": Could not instantiate the LayoutManager: ", str, e7);
                    throw null;
                }
            }
        }
        int[] iArr2 = R0;
        int i6 = i;
        TypedArray typedArrayObtainStyledAttributes2 = context.obtainStyledAttributes(attributeSet, iArr2, i6, 0);
        ute.n(this, context, iArr2, attributeSet, typedArrayObtainStyledAttributes2, i6);
        boolean z = typedArrayObtainStyledAttributes2.getBoolean(0, true);
        typedArrayObtainStyledAttributes2.recycle();
        setNestedScrollingEnabled(z);
        setTag(com.medium.reader.R.id.is_pooling_container_tag, Boolean.TRUE);
    }

    public static RecyclerView F(View view) {
        if (!(view instanceof ViewGroup)) {
            return null;
        }
        if (view instanceof RecyclerView) {
            return (RecyclerView) view;
        }
        ViewGroup viewGroup = (ViewGroup) view;
        int childCount = viewGroup.getChildCount();
        for (int i = 0; i < childCount; i++) {
            RecyclerView recyclerViewF = F(viewGroup.getChildAt(i));
            if (recyclerViewF != null) {
                return recyclerViewF;
            }
        }
        return null;
    }

    public static pr0 K(View view) {
        if (view == null) {
            return null;
        }
        return ((txa) view.getLayoutParams()).a;
    }

    private nd8 getScrollingChildHelper() {
        nd8 nd8Var = this.D0;
        if (nd8Var != null) {
            return nd8Var;
        }
        nd8 nd8Var2 = new nd8(this);
        this.D0 = nd8Var2;
        return nd8Var2;
    }

    public static void j(pr0 pr0Var) {
        WeakReference weakReference = pr0Var.b;
        if (weakReference != null) {
            View view = (View) weakReference.get();
            while (view != null) {
                if (view == pr0Var.a) {
                    return;
                }
                Object parent = view.getParent();
                view = parent instanceof View ? (View) parent : null;
            }
            pr0Var.b = null;
        }
    }

    public static int m(int i, EdgeEffect edgeEffect, EdgeEffect edgeEffect2, int i2) {
        if (i > 0 && edgeEffect != null && gx1.I(edgeEffect) != 0.0f) {
            int iRound = Math.round(gx1.V(edgeEffect, ((-i) * 4.0f) / i2, 0.5f) * ((-i2) / 4.0f));
            if (iRound != i) {
                edgeEffect.finish();
            }
            return i - iRound;
        }
        if (i >= 0 || edgeEffect2 == null || gx1.I(edgeEffect2) == 0.0f) {
            return i;
        }
        float f = i2;
        int iRound2 = Math.round(gx1.V(edgeEffect2, (i * 4.0f) / f, 0.5f) * (f / 4.0f));
        if (iRound2 != i) {
            edgeEffect2.finish();
        }
        return i - iRound2;
    }

    public static void setDebugAssertionsEnabled(boolean z) {
        P0 = z;
    }

    public static void setVerboseLoggingEnabled(boolean z) {
        Q0 = z;
    }

    public final String A() {
        return " " + super.toString() + ", adapter:" + this.m + ", layout:" + this.n + ", context:" + getContext();
    }

    public final void B(eya eyaVar) {
        if (getScrollState() != 2) {
            eyaVar.getClass();
            return;
        }
        OverScroller overScroller = this.r0.c;
        overScroller.getFinalX();
        overScroller.getCurrX();
        eyaVar.getClass();
        overScroller.getFinalY();
        overScroller.getCurrY();
    }

    public final View C(View view) {
        ViewParent parent = view.getParent();
        while (parent != null && parent != this && (parent instanceof View)) {
            view = parent;
            parent = view.getParent();
        }
        if (parent == this) {
            return view;
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x005e A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:27:0x0061 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean D(android.view.MotionEvent r12) {
        /*
            r11 = this;
            int r0 = r12.getAction()
            java.util.ArrayList r1 = r11.q
            int r2 = r1.size()
            r3 = 0
            r4 = r3
        Lc:
            if (r4 >= r2) goto L64
            java.lang.Object r5 = r1.get(r4)
            y94 r5 = (defpackage.y94) r5
            int r6 = r5.v
            r7 = 1
            r8 = 2
            if (r6 != r7) goto L59
            float r6 = r12.getX()
            float r9 = r12.getY()
            boolean r6 = r5.c(r6, r9)
            float r9 = r12.getX()
            float r10 = r12.getY()
            boolean r9 = r5.b(r9, r10)
            int r10 = r12.getAction()
            if (r10 != 0) goto L61
            if (r6 != 0) goto L3c
            if (r9 == 0) goto L61
        L3c:
            if (r9 == 0) goto L49
            r5.w = r7
            float r6 = r12.getX()
            int r6 = (int) r6
            float r6 = (float) r6
            r5.p = r6
            goto L55
        L49:
            if (r6 == 0) goto L55
            r5.w = r8
            float r6 = r12.getY()
            int r6 = (int) r6
            float r6 = (float) r6
            r5.m = r6
        L55:
            r5.e(r8)
            goto L5b
        L59:
            if (r6 != r8) goto L61
        L5b:
            r6 = 3
            if (r0 == r6) goto L61
            r11.r = r5
            return r7
        L61:
            int r4 = r4 + 1
            goto Lc
        L64:
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.RecyclerView.D(android.view.MotionEvent):boolean");
    }

    public final void E(int[] iArr) {
        jl1 jl1Var = this.f;
        int iX = jl1Var.x();
        if (iX == 0) {
            iArr[0] = -1;
            iArr[1] = -1;
            return;
        }
        int i = Integer.MAX_VALUE;
        int i2 = Integer.MIN_VALUE;
        for (int i3 = 0; i3 < iX; i3++) {
            pr0 pr0VarK = K(jl1Var.w(i3));
            if (!pr0VarK.n()) {
                int iB = pr0VarK.b();
                if (iB < i) {
                    i = iB;
                }
                if (iB > i2) {
                    i2 = iB;
                }
            }
        }
        iArr[0] = i;
        iArr[1] = i2;
    }

    public final pr0 G(int i) {
        pr0 pr0Var = null;
        if (this.C) {
            return null;
        }
        jl1 jl1Var = this.f;
        int iD = jl1Var.D();
        for (int i2 = 0; i2 < iD; i2++) {
            pr0 pr0VarK = K(jl1Var.C(i2));
            if (pr0VarK != null && !pr0VarK.g() && I(pr0VarK) == i) {
                if (!((ArrayList) jl1Var.b).contains(pr0VarK.a)) {
                    return pr0VarK;
                }
                pr0Var = pr0VarK;
            }
        }
        return pr0Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:41:0x007b  */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00ba  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x00c1 A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00c3  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00e3  */
    /* JADX WARN: Removed duplicated region for block: B:69:0x00eb  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean H(int r8, int r9, int r10, int r11) {
        /*
            Method dump skipped, instruction units count: 273
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.RecyclerView.H(int, int, int, int):boolean");
    }

    public final int I(pr0 pr0Var) {
        if ((pr0Var.i & 524) == 0 && pr0Var.d()) {
            int i = pr0Var.c;
            ArrayList arrayList = (ArrayList) this.e.c;
            int size = arrayList.size();
            for (int i2 = 0; i2 < size; i2++) {
                d8 d8Var = (d8) arrayList.get(i2);
                int i3 = d8Var.a;
                if (i3 != 1) {
                    if (i3 == 2) {
                        int i4 = d8Var.b;
                        if (i4 <= i) {
                            int i5 = d8Var.d;
                            if (i4 + i5 <= i) {
                                i -= i5;
                            }
                        } else {
                            continue;
                        }
                    } else if (i3 == 8) {
                        int i6 = d8Var.b;
                        if (i6 == i) {
                            i = d8Var.d;
                        } else {
                            if (i6 < i) {
                                i--;
                            }
                            if (d8Var.d <= i) {
                                i++;
                            }
                        }
                    }
                } else if (d8Var.b <= i) {
                    i += d8Var.d;
                }
            }
            return i;
        }
        return -1;
    }

    public final pr0 J(View view) {
        ViewParent parent = view.getParent();
        if (parent == null || parent == this) {
            return K(view);
        }
        ywb.j("View ", view, " is not a direct child of ", this);
        return null;
    }

    public final Rect L(View view) {
        txa txaVar = (txa) view.getLayoutParams();
        boolean z = txaVar.c;
        Rect rect = txaVar.b;
        if (!z || (this.u0.g && (txaVar.a.j() || txaVar.a.e()))) {
            return rect;
        }
        rect.set(0, 0, 0, 0);
        ArrayList arrayList = this.p;
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            Rect rect2 = this.j;
            rect2.set(0, 0, 0, 0);
            ((qxa) arrayList.get(i)).getClass();
            ((txa) view.getLayoutParams()).a.getClass();
            rect2.set(0, 0, 0, 0);
            rect.left += rect2.left;
            rect.top += rect2.top;
            rect.right += rect2.right;
            rect.bottom += rect2.bottom;
        }
        txaVar.c = false;
        return rect;
    }

    public final boolean M() {
        return !this.u || this.C || this.e.j();
    }

    public final boolean N() {
        return this.E > 0;
    }

    public final void O(int i) {
        if (this.n == null) {
            return;
        }
        setScrollState(2);
        this.n.r0(i);
        awakenScrollBars();
    }

    public final void P() {
        jl1 jl1Var = this.f;
        int iD = jl1Var.D();
        for (int i = 0; i < iD; i++) {
            ((txa) jl1Var.C(i).getLayoutParams()).c = true;
        }
        ArrayList arrayList = this.c.c;
        int size = arrayList.size();
        for (int i2 = 0; i2 < size; i2++) {
            txa txaVar = (txa) ((pr0) arrayList.get(i2)).a.getLayoutParams();
            if (txaVar != null) {
                txaVar.c = true;
            }
        }
    }

    public final void Q(int i, int i2, boolean z) {
        int i3 = i + i2;
        jl1 jl1Var = this.f;
        int iD = jl1Var.D();
        for (int i4 = 0; i4 < iD; i4++) {
            pr0 pr0VarK = K(jl1Var.C(i4));
            if (pr0VarK != null && !pr0VarK.n()) {
                int i5 = pr0VarK.c;
                eya eyaVar = this.u0;
                if (i5 >= i3) {
                    if (Q0) {
                        Log.d("RecyclerView", "offsetPositionRecordsForRemove attached child " + i4 + " holder " + pr0VarK + " now at position " + (pr0VarK.c - i2));
                    }
                    pr0VarK.k(-i2, z);
                    eyaVar.f = true;
                } else if (i5 >= i) {
                    if (Q0) {
                        Log.d("RecyclerView", "offsetPositionRecordsForRemove attached child " + i4 + " holder " + pr0VarK + " now REMOVED");
                    }
                    pr0VarK.a(8);
                    pr0VarK.k(-i2, z);
                    pr0VarK.c = i - 1;
                    eyaVar.f = true;
                }
            }
        }
        yxa yxaVar = this.c;
        ArrayList arrayList = yxaVar.c;
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            pr0 pr0Var = (pr0) arrayList.get(size);
            if (pr0Var != null) {
                int i6 = pr0Var.c;
                if (i6 >= i3) {
                    if (Q0) {
                        Log.d("RecyclerView", "offsetPositionRecordsForRemove cached " + size + " holder " + pr0Var + " now at position " + (pr0Var.c - i2));
                    }
                    pr0Var.k(-i2, z);
                } else if (i6 >= i) {
                    pr0Var.a(8);
                    yxaVar.h(size);
                }
            }
        }
        requestLayout();
    }

    public final void R() {
        this.E++;
    }

    public final void S(boolean z) {
        int i;
        AccessibilityManager accessibilityManager;
        int i2 = this.E - 1;
        this.E = i2;
        if (i2 < 1) {
            if (P0 && i2 < 0) {
                ygf.f("layout or scroll counter cannot go below zero.Some calls are not matching".concat(A()));
                return;
            }
            this.E = 0;
            if (z) {
                int i3 = this.z;
                this.z = 0;
                if (i3 != 0 && (accessibilityManager = this.B) != null && accessibilityManager.isEnabled()) {
                    AccessibilityEvent accessibilityEventObtain = AccessibilityEvent.obtain();
                    accessibilityEventObtain.setEventType(RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH);
                    accessibilityEventObtain.setContentChangeTypes(i3);
                    sendAccessibilityEventUnchecked(accessibilityEventObtain);
                }
                ArrayList arrayList = this.H0;
                for (int size = arrayList.size() - 1; size >= 0; size--) {
                    pr0 pr0Var = (pr0) arrayList.get(size);
                    if (pr0Var.a.getParent() == this && !pr0Var.n() && (i = pr0Var.p) != -1) {
                        pr0Var.a.setImportantForAccessibility(i);
                        pr0Var.p = -1;
                    }
                }
                arrayList.clear();
            }
        }
    }

    public final void T(MotionEvent motionEvent) {
        int actionIndex = motionEvent.getActionIndex();
        if (motionEvent.getPointerId(actionIndex) == this.N) {
            int i = actionIndex == 0 ? 1 : 0;
            this.N = motionEvent.getPointerId(i);
            int x = (int) (motionEvent.getX(i) + 0.5f);
            this.R = x;
            this.P = x;
            int y = (int) (motionEvent.getY(i) + 0.5f);
            this.S = y;
            this.Q = y;
        }
    }

    public final void U() {
        if (this.A0 || !this.s) {
            return;
        }
        WeakHashMap weakHashMap = ute.a;
        postOnAnimation(this.I0);
        this.A0 = true;
    }

    public final void V() {
        boolean z;
        boolean z2;
        boolean z3 = this.C;
        e8 e8Var = this.e;
        boolean z4 = false;
        if (z3) {
            e8Var.q((ArrayList) e8Var.c);
            e8Var.q((ArrayList) e8Var.d);
            e8Var.a = 0;
            if (this.D) {
                this.n.a0();
            }
        }
        if (this.L != null && this.n.D0()) {
            e8Var.p();
        } else {
            e8Var.d();
        }
        boolean z5 = this.x0 || this.y0;
        if (!this.u || this.L == null || (!(z2 = this.C) && !z5 && !this.n.f)) {
            z = false;
        } else if (z2) {
            this.m.getClass();
            z = false;
        } else {
            z = true;
        }
        eya eyaVar = this.u0;
        eyaVar.j = z;
        if (z && z5 && !this.C && this.L != null && this.n.D0()) {
            z4 = true;
        }
        eyaVar.k = z4;
    }

    public final void W(boolean z) {
        this.D = z | this.D;
        this.C = true;
        jl1 jl1Var = this.f;
        int iD = jl1Var.D();
        for (int i = 0; i < iD; i++) {
            pr0 pr0VarK = K(jl1Var.C(i));
            if (pr0VarK != null && !pr0VarK.n()) {
                pr0VarK.a(6);
            }
        }
        P();
        yxa yxaVar = this.c;
        ArrayList arrayList = yxaVar.c;
        int size = arrayList.size();
        for (int i2 = 0; i2 < size; i2++) {
            pr0 pr0Var = (pr0) arrayList.get(i2);
            if (pr0Var != null) {
                pr0Var.a(6);
                pr0Var.a(1024);
            }
        }
        yxaVar.g();
    }

    public final void X(pr0 pr0Var, yqa yqaVar) {
        pr0Var.i &= -8193;
        boolean z = this.u0.h;
        a1a a1aVar = this.g;
        if (z && pr0Var.j() && !pr0Var.g() && !pr0Var.n()) {
            this.m.getClass();
            ((ab7) a1aVar.c).i(pr0Var.c, pr0Var);
        }
        aec aecVar = (aec) a1aVar.b;
        lue lueVarA = (lue) aecVar.get(pr0Var);
        if (lueVarA == null) {
            lueVarA = lue.a();
            aecVar.put(pr0Var, lueVarA);
        }
        lueVarA.b = yqaVar;
        lueVarA.a |= 4;
    }

    public final void Y() {
        boolean zIsFinished;
        EdgeEffect edgeEffect = this.H;
        if (edgeEffect != null) {
            edgeEffect.onRelease();
            zIsFinished = this.H.isFinished();
        } else {
            zIsFinished = false;
        }
        EdgeEffect edgeEffect2 = this.I;
        if (edgeEffect2 != null) {
            edgeEffect2.onRelease();
            zIsFinished |= this.I.isFinished();
        }
        EdgeEffect edgeEffect3 = this.J;
        if (edgeEffect3 != null) {
            edgeEffect3.onRelease();
            zIsFinished |= this.J.isFinished();
        }
        EdgeEffect edgeEffect4 = this.K;
        if (edgeEffect4 != null) {
            edgeEffect4.onRelease();
            zIsFinished |= this.K.isFinished();
        }
        if (zIsFinished) {
            postInvalidateOnAnimation();
        }
    }

    public final int Z(int i, float f) {
        float height = f / getHeight();
        float width = i / getWidth();
        EdgeEffect edgeEffect = this.H;
        float f2 = 0.0f;
        if (edgeEffect == null || gx1.I(edgeEffect) == 0.0f) {
            EdgeEffect edgeEffect2 = this.J;
            if (edgeEffect2 != null && gx1.I(edgeEffect2) != 0.0f) {
                boolean zCanScrollHorizontally = canScrollHorizontally(1);
                EdgeEffect edgeEffect3 = this.J;
                if (zCanScrollHorizontally) {
                    edgeEffect3.onRelease();
                } else {
                    float fV = gx1.V(edgeEffect3, width, height);
                    if (gx1.I(this.J) == 0.0f) {
                        this.J.onRelease();
                    }
                    f2 = fV;
                }
                invalidate();
            }
        } else {
            boolean zCanScrollHorizontally2 = canScrollHorizontally(-1);
            EdgeEffect edgeEffect4 = this.H;
            if (zCanScrollHorizontally2) {
                edgeEffect4.onRelease();
            } else {
                float f3 = -gx1.V(edgeEffect4, -width, 1.0f - height);
                if (gx1.I(this.H) == 0.0f) {
                    this.H.onRelease();
                }
                f2 = f3;
            }
            invalidate();
        }
        return Math.round(f2 * getWidth());
    }

    public final int a0(int i, float f) {
        float width = f / getWidth();
        float height = i / getHeight();
        EdgeEffect edgeEffect = this.I;
        float f2 = 0.0f;
        if (edgeEffect == null || gx1.I(edgeEffect) == 0.0f) {
            EdgeEffect edgeEffect2 = this.K;
            if (edgeEffect2 != null && gx1.I(edgeEffect2) != 0.0f) {
                boolean zCanScrollVertically = canScrollVertically(1);
                EdgeEffect edgeEffect3 = this.K;
                if (zCanScrollVertically) {
                    edgeEffect3.onRelease();
                } else {
                    float fV = gx1.V(edgeEffect3, height, 1.0f - width);
                    if (gx1.I(this.K) == 0.0f) {
                        this.K.onRelease();
                    }
                    f2 = fV;
                }
                invalidate();
            }
        } else {
            boolean zCanScrollVertically2 = canScrollVertically(-1);
            EdgeEffect edgeEffect4 = this.I;
            if (zCanScrollVertically2) {
                edgeEffect4.onRelease();
            } else {
                float f3 = -gx1.V(edgeEffect4, -height, width);
                if (gx1.I(this.I) == 0.0f) {
                    this.I.onRelease();
                }
                f2 = f3;
            }
            invalidate();
        }
        return Math.round(f2 * getHeight());
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void addFocusables(ArrayList arrayList, int i, int i2) {
        sxa sxaVar = this.n;
        if (sxaVar != null) {
            sxaVar.getClass();
        }
        super.addFocusables(arrayList, i, i2);
    }

    public final void b0(View view, View view2) {
        View view3 = view2 != null ? view2 : view;
        int width = view3.getWidth();
        int height = view3.getHeight();
        Rect rect = this.j;
        rect.set(0, 0, width, height);
        ViewGroup.LayoutParams layoutParams = view3.getLayoutParams();
        if (layoutParams instanceof txa) {
            txa txaVar = (txa) layoutParams;
            if (!txaVar.c) {
                Rect rect2 = txaVar.b;
                rect.left -= rect2.left;
                rect.right += rect2.right;
                rect.top -= rect2.top;
                rect.bottom += rect2.bottom;
            }
        }
        if (view2 != null) {
            offsetDescendantRectToMyCoords(view2, rect);
            offsetRectIntoDescendantCoords(view, rect);
        }
        this.n.o0(this, view, this.j, !this.u, view2 == null);
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x00cb  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x00e3  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x0100  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x0108  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean c0(int r19, int r20, android.view.MotionEvent r21, int r22) {
        /*
            Method dump skipped, instruction units count: 322
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.RecyclerView.c0(int, int, android.view.MotionEvent, int):boolean");
    }

    @Override // android.view.ViewGroup
    public final boolean checkLayoutParams(ViewGroup.LayoutParams layoutParams) {
        return (layoutParams instanceof txa) && this.n.f((txa) layoutParams);
    }

    @Override // android.view.View
    public final int computeHorizontalScrollExtent() {
        sxa sxaVar = this.n;
        if (sxaVar != null && sxaVar.d()) {
            return this.n.j(this.u0);
        }
        return 0;
    }

    @Override // android.view.View
    public final int computeHorizontalScrollOffset() {
        sxa sxaVar = this.n;
        if (sxaVar != null && sxaVar.d()) {
            return this.n.k(this.u0);
        }
        return 0;
    }

    @Override // android.view.View
    public final int computeHorizontalScrollRange() {
        sxa sxaVar = this.n;
        if (sxaVar != null && sxaVar.d()) {
            return this.n.l(this.u0);
        }
        return 0;
    }

    @Override // android.view.View
    public final int computeVerticalScrollExtent() {
        sxa sxaVar = this.n;
        if (sxaVar != null && sxaVar.e()) {
            return this.n.m(this.u0);
        }
        return 0;
    }

    @Override // android.view.View
    public final int computeVerticalScrollOffset() {
        sxa sxaVar = this.n;
        if (sxaVar != null && sxaVar.e()) {
            return this.n.n(this.u0);
        }
        return 0;
    }

    @Override // android.view.View
    public final int computeVerticalScrollRange() {
        sxa sxaVar = this.n;
        if (sxaVar != null && sxaVar.e()) {
            return this.n.o(this.u0);
        }
        return 0;
    }

    public final void d0(int i, int i2, int[] iArr) {
        pr0 pr0Var;
        i0();
        R();
        Trace.beginSection("RV Scroll");
        eya eyaVar = this.u0;
        B(eyaVar);
        yxa yxaVar = this.c;
        int iQ0 = i != 0 ? this.n.q0(i, yxaVar, eyaVar) : 0;
        int iS0 = i2 != 0 ? this.n.s0(i2, yxaVar, eyaVar) : 0;
        Trace.endSection();
        jl1 jl1Var = this.f;
        int iX = jl1Var.x();
        for (int i3 = 0; i3 < iX; i3++) {
            View viewW = jl1Var.w(i3);
            pr0 pr0VarJ = J(viewW);
            if (pr0VarJ != null && (pr0Var = pr0VarJ.h) != null) {
                View view = pr0Var.a;
                int left = viewW.getLeft();
                int top = viewW.getTop();
                if (left != view.getLeft() || top != view.getTop()) {
                    view.layout(left, top, view.getWidth() + left, view.getHeight() + top);
                }
            }
        }
        S(true);
        k0(false);
        if (iArr != null) {
            iArr[0] = iQ0;
            iArr[1] = iS0;
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        if (super.dispatchKeyEvent(keyEvent)) {
            return true;
        }
        sxa layoutManager = getLayoutManager();
        int iY = 0;
        if (layoutManager != null) {
            if (layoutManager.e()) {
                int keyCode = keyEvent.getKeyCode();
                if (keyCode == 92 || keyCode == 93) {
                    int measuredHeight = getMeasuredHeight();
                    if (keyCode == 93) {
                        g0(0, measuredHeight, false);
                        return true;
                    }
                    g0(0, -measuredHeight, false);
                    return true;
                }
                if (keyCode == 122 || keyCode == 123) {
                    boolean zM = layoutManager.M();
                    if (keyCode == 122) {
                        if (zM) {
                            iY = op8.Y(((gy6) getAdapter()).c);
                        }
                    } else if (!zM) {
                        iY = op8.Y(((gy6) getAdapter()).c);
                    }
                    h0(iY);
                    return true;
                }
            } else if (layoutManager.d()) {
                int keyCode2 = keyEvent.getKeyCode();
                if (keyCode2 == 92 || keyCode2 == 93) {
                    int measuredWidth = getMeasuredWidth();
                    if (keyCode2 == 93) {
                        g0(measuredWidth, 0, false);
                        return true;
                    }
                    g0(-measuredWidth, 0, false);
                    return true;
                }
                if (keyCode2 == 122 || keyCode2 == 123) {
                    boolean zM2 = layoutManager.M();
                    if (keyCode2 == 122) {
                        if (zM2) {
                            iY = op8.Y(((gy6) getAdapter()).c);
                        }
                    } else if (!zM2) {
                        iY = op8.Y(((gy6) getAdapter()).c);
                    }
                    h0(iY);
                    return true;
                }
            }
        }
        return false;
    }

    @Override // android.view.View
    public final boolean dispatchNestedFling(float f, float f2, boolean z) {
        return getScrollingChildHelper().a(f, f2, z);
    }

    @Override // android.view.View
    public final boolean dispatchNestedPreFling(float f, float f2) {
        return getScrollingChildHelper().b(f, f2);
    }

    @Override // android.view.View
    public final boolean dispatchNestedPreScroll(int i, int i2, int[] iArr, int[] iArr2) {
        return getScrollingChildHelper().c(i, i2, iArr, iArr2, 0);
    }

    @Override // android.view.View
    public final boolean dispatchNestedScroll(int i, int i2, int i3, int i4, int[] iArr) {
        return getScrollingChildHelper().d(i, i2, i3, i4, iArr, 0, null);
    }

    @Override // android.view.View
    public final boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent accessibilityEvent) {
        onPopulateAccessibilityEvent(accessibilityEvent);
        return true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchRestoreInstanceState(SparseArray sparseArray) {
        dispatchThawSelfOnly(sparseArray);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchSaveInstanceState(SparseArray sparseArray) {
        dispatchFreezeSelfOnly(sparseArray);
    }

    @Override // android.view.View
    public final void draw(Canvas canvas) {
        boolean z;
        super.draw(canvas);
        ArrayList arrayList = this.p;
        int size = arrayList.size();
        boolean z2 = false;
        for (int i = 0; i < size; i++) {
            ((qxa) arrayList.get(i)).a(canvas, this);
        }
        EdgeEffect edgeEffect = this.H;
        if (edgeEffect == null || edgeEffect.isFinished()) {
            z = false;
        } else {
            int iSave = canvas.save();
            int paddingBottom = this.h ? getPaddingBottom() : 0;
            canvas.rotate(270.0f);
            canvas.translate((-getHeight()) + paddingBottom, 0.0f);
            EdgeEffect edgeEffect2 = this.H;
            z = edgeEffect2 != null && edgeEffect2.draw(canvas);
            canvas.restoreToCount(iSave);
        }
        EdgeEffect edgeEffect3 = this.I;
        if (edgeEffect3 != null && !edgeEffect3.isFinished()) {
            int iSave2 = canvas.save();
            if (this.h) {
                canvas.translate(getPaddingLeft(), getPaddingTop());
            }
            EdgeEffect edgeEffect4 = this.I;
            z |= edgeEffect4 != null && edgeEffect4.draw(canvas);
            canvas.restoreToCount(iSave2);
        }
        EdgeEffect edgeEffect5 = this.J;
        if (edgeEffect5 != null && !edgeEffect5.isFinished()) {
            int iSave3 = canvas.save();
            int width = getWidth();
            int paddingTop = this.h ? getPaddingTop() : 0;
            canvas.rotate(90.0f);
            canvas.translate(paddingTop, -width);
            EdgeEffect edgeEffect6 = this.J;
            z |= edgeEffect6 != null && edgeEffect6.draw(canvas);
            canvas.restoreToCount(iSave3);
        }
        EdgeEffect edgeEffect7 = this.K;
        if (edgeEffect7 != null && !edgeEffect7.isFinished()) {
            int iSave4 = canvas.save();
            canvas.rotate(180.0f);
            if (this.h) {
                canvas.translate(getPaddingRight() + (-getWidth()), getPaddingBottom() + (-getHeight()));
            } else {
                canvas.translate(-getWidth(), -getHeight());
            }
            EdgeEffect edgeEffect8 = this.K;
            if (edgeEffect8 != null && edgeEffect8.draw(canvas)) {
                z2 = true;
            }
            z |= z2;
            canvas.restoreToCount(iSave4);
        }
        if ((z || this.L == null || arrayList.size() <= 0 || !this.L.f()) ? z : true) {
            postInvalidateOnAnimation();
        }
    }

    @Override // android.view.ViewGroup
    public final boolean drawChild(Canvas canvas, View view, long j) {
        return super.drawChild(canvas, view, j);
    }

    public final boolean f0(EdgeEffect edgeEffect, int i, int i2) {
        if (i > 0) {
            return true;
        }
        float fI = gx1.I(edgeEffect) * i2;
        float fAbs = Math.abs(-i) * 0.35f;
        float f = this.a * 0.015f;
        double dLog = Math.log(fAbs / f);
        double d = S0;
        return ((float) (Math.exp((d / (d - 1.0d)) * dLog) * ((double) f))) < fI;
    }

    /* JADX WARN: Code restructure failed: missing block: B:115:0x0161, code lost:
    
        if (r16 > 0) goto L134;
     */
    /* JADX WARN: Code restructure failed: missing block: B:119:0x017f, code lost:
    
        if (r5 > 0) goto L134;
     */
    /* JADX WARN: Code restructure failed: missing block: B:121:0x0182, code lost:
    
        if (r16 < 0) goto L134;
     */
    /* JADX WARN: Code restructure failed: missing block: B:123:0x0185, code lost:
    
        if (r5 < 0) goto L134;
     */
    /* JADX WARN: Code restructure failed: missing block: B:128:0x018d, code lost:
    
        if ((r5 * r6) <= 0) goto L135;
     */
    /* JADX WARN: Code restructure failed: missing block: B:133:0x0195, code lost:
    
        if ((r5 * r6) >= 0) goto L135;
     */
    /* JADX WARN: Removed duplicated region for block: B:109:0x0155  */
    /* JADX WARN: Removed duplicated region for block: B:130:0x0190  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x0063  */
    /* JADX WARN: Removed duplicated region for block: B:31:0x0065  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0068  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x006a  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x006e  */
    /* JADX WARN: Removed duplicated region for block: B:38:0x0070  */
    /* JADX WARN: Removed duplicated region for block: B:41:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:44:0x007c  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x00b8  */
    /* JADX WARN: Removed duplicated region for block: B:67:0x00cf A[ADDED_TO_REGION] */
    /* JADX WARN: Removed duplicated region for block: B:80:0x0113  */
    /* JADX WARN: Removed duplicated region for block: B:81:0x0115  */
    @Override // android.view.ViewGroup, android.view.ViewParent
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final android.view.View focusSearch(android.view.View r18, int r19) {
        /*
            Method dump skipped, instruction units count: 413
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.RecyclerView.focusSearch(android.view.View, int):android.view.View");
    }

    public final void g(pr0 pr0Var) {
        View view = pr0Var.a;
        boolean z = view.getParent() == this;
        this.c.m(J(view));
        boolean zI = pr0Var.i();
        jl1 jl1Var = this.f;
        if (zI) {
            jl1Var.e(view, -1, view.getLayoutParams(), true);
            return;
        }
        if (!z) {
            jl1Var.c(view, -1, true);
            return;
        }
        int iIndexOfChild = ((ixa) jl1Var.d).a.indexOfChild(view);
        if (iIndexOfChild < 0) {
            ik4.h("view is not a child, cannot hide ", view);
        } else {
            ((il1) jl1Var.e).j(iIndexOfChild);
            jl1Var.E(view);
        }
    }

    public final void g0(int i, int i2, boolean z) {
        sxa sxaVar = this.n;
        if (sxaVar == null) {
            Log.e("RecyclerView", "Cannot smooth scroll without a LayoutManager set. Call setLayoutManager with a non-null argument.");
            return;
        }
        if (this.x) {
            return;
        }
        if (!sxaVar.d()) {
            i = 0;
        }
        if (!this.n.e()) {
            i2 = 0;
        }
        if (i == 0 && i2 == 0) {
            return;
        }
        if (z) {
            int i3 = i != 0 ? 1 : 0;
            if (i2 != 0) {
                i3 |= 2;
            }
            getScrollingChildHelper().f(i3, 1);
        }
        this.r0.c(i, i2, Integer.MIN_VALUE, null);
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateDefaultLayoutParams() {
        sxa sxaVar = this.n;
        if (sxaVar != null) {
            return sxaVar.r();
        }
        ygf.f("RecyclerView has no LayoutManager".concat(A()));
        return null;
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(AttributeSet attributeSet) {
        sxa sxaVar = this.n;
        if (sxaVar != null) {
            return sxaVar.s(getContext(), attributeSet);
        }
        ygf.f("RecyclerView has no LayoutManager".concat(A()));
        return null;
    }

    @Override // android.view.ViewGroup, android.view.View
    public CharSequence getAccessibilityClassName() {
        return "androidx.recyclerview.widget.RecyclerView";
    }

    public kxa getAdapter() {
        return this.m;
    }

    @Override // android.view.View
    public int getBaseline() {
        sxa sxaVar = this.n;
        if (sxaVar == null) {
            return super.getBaseline();
        }
        sxaVar.getClass();
        return -1;
    }

    @Override // android.view.ViewGroup
    public final int getChildDrawingOrder(int i, int i2) {
        return super.getChildDrawingOrder(i, i2);
    }

    @Override // android.view.ViewGroup
    public boolean getClipToPadding() {
        return this.h;
    }

    public jya getCompatAccessibilityDelegate() {
        return this.B0;
    }

    public oxa getEdgeEffectFactory() {
        return this.G;
    }

    public pxa getItemAnimator() {
        return this.L;
    }

    public int getItemDecorationCount() {
        return this.p.size();
    }

    public sxa getLayoutManager() {
        return this.n;
    }

    public int getMaxFlingVelocity() {
        return this.n0;
    }

    public int getMinFlingVelocity() {
        return this.m0;
    }

    public long getNanoTime() {
        if (U0) {
            return System.nanoTime();
        }
        return 0L;
    }

    public uxa getOnFlingListener() {
        return null;
    }

    public boolean getPreserveFocusAfterLayout() {
        return this.q0;
    }

    public xxa getRecycledViewPool() {
        return this.c.c();
    }

    public int getScrollState() {
        return this.M;
    }

    public final void h(vxa vxaVar) {
        ArrayList arrayList = this.w0;
        if (arrayList == null) {
            arrayList = new ArrayList();
            this.w0 = arrayList;
        }
        arrayList.add(vxaVar);
    }

    public final void h0(int i) {
        if (this.x) {
            return;
        }
        sxa sxaVar = this.n;
        if (sxaVar == null) {
            Log.e("RecyclerView", "Cannot smooth scroll without a LayoutManager set. Call setLayoutManager with a non-null argument.");
        } else {
            sxaVar.B0(this, i);
        }
    }

    @Override // android.view.View
    public final boolean hasNestedScrollingParent() {
        return getScrollingChildHelper().e(0) != null;
    }

    public final void i(String str) {
        if (!N()) {
            if (this.F > 0) {
                Log.w("RecyclerView", "Cannot call this method in a scroll callback. Scroll callbacks mightbe run during a measure & layout pass where you cannot change theRecyclerView data. Any method call that might change the structureof the RecyclerView or the adapter contents should be postponed tothe next frame.", new IllegalStateException(A()));
            }
        } else if (str == null) {
            ygf.f("Cannot call this method while RecyclerView is computing a layout or scrolling".concat(A()));
        } else {
            ygf.f(str);
        }
    }

    public final void i0() {
        int i = this.v + 1;
        this.v = i;
        if (i != 1 || this.x) {
            return;
        }
        this.w = false;
    }

    @Override // android.view.View
    public final boolean isAttachedToWindow() {
        return this.s;
    }

    @Override // android.view.ViewGroup
    public final boolean isLayoutSuppressed() {
        return this.x;
    }

    @Override // android.view.View
    public final boolean isNestedScrollingEnabled() {
        return getScrollingChildHelper().d;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void j0(int i) {
        boolean zD = this.n.d();
        int i2 = zD;
        if (this.n.e()) {
            i2 = (zD ? 1 : 0) | 2;
        }
        getScrollingChildHelper().f(i2, i);
    }

    public final void k() {
        jl1 jl1Var = this.f;
        int iD = jl1Var.D();
        for (int i = 0; i < iD; i++) {
            pr0 pr0VarK = K(jl1Var.C(i));
            if (!pr0VarK.n()) {
                pr0VarK.d = -1;
                pr0VarK.f = -1;
            }
        }
        yxa yxaVar = this.c;
        ArrayList arrayList = yxaVar.a;
        ArrayList arrayList2 = yxaVar.c;
        int size = arrayList2.size();
        for (int i2 = 0; i2 < size; i2++) {
            pr0 pr0Var = (pr0) arrayList2.get(i2);
            pr0Var.d = -1;
            pr0Var.f = -1;
        }
        int size2 = arrayList.size();
        for (int i3 = 0; i3 < size2; i3++) {
            pr0 pr0Var2 = (pr0) arrayList.get(i3);
            pr0Var2.d = -1;
            pr0Var2.f = -1;
        }
        ArrayList arrayList3 = yxaVar.b;
        if (arrayList3 != null) {
            int size3 = arrayList3.size();
            for (int i4 = 0; i4 < size3; i4++) {
                pr0 pr0Var3 = (pr0) yxaVar.b.get(i4);
                pr0Var3.d = -1;
                pr0Var3.f = -1;
            }
        }
    }

    public final void k0(boolean z) {
        int i = this.v;
        if (i < 1) {
            if (P0) {
                ygf.f("stopInterceptRequestLayout was called more times than startInterceptRequestLayout.".concat(A()));
                return;
            } else {
                this.v = 1;
                i = 1;
            }
        }
        if (!z && !this.x) {
            this.w = false;
        }
        if (i == 1) {
            if (z && this.w && !this.x && this.n != null && this.m != null) {
                q();
            }
            if (!this.x) {
                this.w = false;
            }
        }
        this.v--;
    }

    public final void l(int i, int i2) {
        boolean zIsFinished;
        EdgeEffect edgeEffect = this.H;
        if (edgeEffect == null || edgeEffect.isFinished() || i <= 0) {
            zIsFinished = false;
        } else {
            this.H.onRelease();
            zIsFinished = this.H.isFinished();
        }
        EdgeEffect edgeEffect2 = this.J;
        if (edgeEffect2 != null && !edgeEffect2.isFinished() && i < 0) {
            this.J.onRelease();
            zIsFinished |= this.J.isFinished();
        }
        EdgeEffect edgeEffect3 = this.I;
        if (edgeEffect3 != null && !edgeEffect3.isFinished() && i2 > 0) {
            this.I.onRelease();
            zIsFinished |= this.I.isFinished();
        }
        EdgeEffect edgeEffect4 = this.K;
        if (edgeEffect4 != null && !edgeEffect4.isFinished() && i2 < 0) {
            this.K.onRelease();
            zIsFinished |= this.K.isFinished();
        }
        if (zIsFinished) {
            postInvalidateOnAnimation();
        }
    }

    public final void l0(int i) {
        getScrollingChildHelper().g(i);
    }

    public final void m0() {
        vz6 vz6Var;
        setScrollState(0);
        hya hyaVar = this.r0;
        hyaVar.g.removeCallbacks(hyaVar);
        hyaVar.c.abortAnimation();
        sxa sxaVar = this.n;
        if (sxaVar == null || (vz6Var = sxaVar.e) == null) {
            return;
        }
        vz6Var.h();
    }

    public final void n() {
        if (!this.u || this.C) {
            Trace.beginSection("RV FullInvalidate");
            q();
            Trace.endSection();
            return;
        }
        e8 e8Var = this.e;
        if (e8Var.j()) {
            int i = e8Var.a;
            if ((i & 4) == 0 || (i & 11) != 0) {
                if (e8Var.j()) {
                    Trace.beginSection("RV FullInvalidate");
                    q();
                    Trace.endSection();
                    return;
                }
                return;
            }
            Trace.beginSection("RV PartialInvalidate");
            i0();
            R();
            e8Var.p();
            if (!this.w) {
                jl1 jl1Var = this.f;
                int iX = jl1Var.x();
                int i2 = 0;
                while (true) {
                    if (i2 < iX) {
                        pr0 pr0VarK = K(jl1Var.w(i2));
                        if (pr0VarK != null && !pr0VarK.n() && pr0VarK.j()) {
                            q();
                            break;
                        }
                        i2++;
                    } else {
                        e8Var.c();
                        break;
                    }
                }
            }
            k0(true);
            S(true);
            Trace.endSection();
        }
    }

    public final void o(int i, int i2) {
        int paddingRight = getPaddingRight() + getPaddingLeft();
        WeakHashMap weakHashMap = ute.a;
        setMeasuredDimension(sxa.g(i, paddingRight, getMinimumWidth()), sxa.g(i2, getPaddingBottom() + getPaddingTop(), getMinimumHeight()));
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0058  */
    @Override // android.view.ViewGroup, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onAttachedToWindow() {
        /*
            r5 = this;
            super.onAttachedToWindow()
            r0 = 0
            r5.E = r0
            r1 = 1
            r5.s = r1
            boolean r2 = r5.u
            if (r2 == 0) goto L15
            boolean r2 = r5.isLayoutRequested()
            if (r2 != 0) goto L15
            r2 = r1
            goto L16
        L15:
            r2 = r0
        L16:
            r5.u = r2
            yxa r2 = r5.c
            r2.e()
            sxa r2 = r5.n
            if (r2 == 0) goto L26
            r2.g = r1
            r2.S(r5)
        L26:
            r5.A0 = r0
            boolean r0 = androidx.recyclerview.widget.RecyclerView.U0
            if (r0 == 0) goto L7e
            java.lang.ThreadLocal r0 = defpackage.v65.e
            java.lang.Object r1 = r0.get()
            v65 r1 = (defpackage.v65) r1
            r5.s0 = r1
            if (r1 != 0) goto L66
            v65 r1 = new v65
            r1.<init>()
            r5.s0 = r1
            java.util.WeakHashMap r1 = defpackage.ute.a
            android.view.Display r1 = r5.getDisplay()
            boolean r2 = r5.isInEditMode()
            if (r2 != 0) goto L58
            if (r1 == 0) goto L58
            float r1 = r1.getRefreshRate()
            r2 = 1106247680(0x41f00000, float:30.0)
            int r2 = (r1 > r2 ? 1 : (r1 == r2 ? 0 : -1))
            if (r2 < 0) goto L58
            goto L5a
        L58:
            r1 = 1114636288(0x42700000, float:60.0)
        L5a:
            v65 r2 = r5.s0
            r3 = 1315859240(0x4e6e6b28, float:1.0E9)
            float r3 = r3 / r1
            long r3 = (long) r3
            r2.c = r3
            r0.set(r2)
        L66:
            v65 r0 = r5.s0
            java.util.ArrayList r0 = r0.a
            boolean r1 = androidx.recyclerview.widget.RecyclerView.P0
            if (r1 == 0) goto L7b
            boolean r1 = r0.contains(r5)
            if (r1 != 0) goto L75
            goto L7b
        L75:
            java.lang.String r5 = "RecyclerView already present in worker list!"
            defpackage.ygf.f(r5)
            return
        L7b:
            r0.add(r5)
        L7e:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.RecyclerView.onAttachedToWindow():void");
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        v65 v65Var;
        super.onDetachedFromWindow();
        pxa pxaVar = this.L;
        if (pxaVar != null) {
            pxaVar.e();
        }
        m0();
        int i = 0;
        this.s = false;
        sxa sxaVar = this.n;
        if (sxaVar != null) {
            sxaVar.g = false;
            sxaVar.T(this);
        }
        this.H0.clear();
        removeCallbacks(this.I0);
        this.g.getClass();
        while (lue.d.a() != null) {
        }
        yxa yxaVar = this.c;
        ArrayList arrayList = yxaVar.c;
        for (int i2 = 0; i2 < arrayList.size(); i2++) {
            rr7.w(((pr0) arrayList.get(i2)).a);
        }
        yxaVar.f(yxaVar.h.m, false);
        while (i < getChildCount()) {
            int i3 = i + 1;
            View childAt = getChildAt(i);
            if (childAt == null) {
                throw new IndexOutOfBoundsException();
            }
            ArrayList arrayList2 = rr7.z(childAt).a;
            int size = arrayList2.size();
            while (true) {
                size--;
                if (-1 < size) {
                    ((xte) arrayList2.get(size)).a.e();
                }
            }
            i = i3;
        }
        if (!U0 || (v65Var = this.s0) == null) {
            return;
        }
        boolean zRemove = v65Var.a.remove(this);
        if (!P0 || zRemove) {
            this.s0 = null;
        } else {
            ygf.f("RecyclerView removal failed!");
        }
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        ArrayList arrayList = this.p;
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            ((qxa) arrayList.get(i)).getClass();
        }
    }

    @Override // android.view.View
    public final boolean onGenericMotionEvent(MotionEvent motionEvent) {
        float axisValue;
        int i;
        boolean z;
        if (this.n != null && !this.x && motionEvent.getAction() == 8) {
            if ((motionEvent.getSource() & 2) != 0) {
                float f = this.n.e() ? -motionEvent.getAxisValue(9) : 0.0f;
                axisValue = this.n.d() ? motionEvent.getAxisValue(10) : 0.0f;
                i = 0;
                z = false;
                f = f;
            } else if ((motionEvent.getSource() & 4194304) != 0) {
                axisValue = motionEvent.getAxisValue(26);
                if (this.n.e()) {
                    float f2 = -axisValue;
                    axisValue = 0.0f;
                    f = f2;
                } else if (!this.n.d()) {
                    axisValue = 0.0f;
                }
                i = 26;
                z = this.M0;
            } else {
                axisValue = 0.0f;
                i = 0;
                z = false;
            }
            int i2 = (int) (f * this.p0);
            int i3 = (int) (axisValue * this.o0);
            if (z) {
                OverScroller overScroller = this.r0.c;
                g0((overScroller.getFinalX() - overScroller.getCurrX()) + i3, (overScroller.getFinalY() - overScroller.getCurrY()) + i2, true);
            } else {
                sxa sxaVar = this.n;
                if (sxaVar == null) {
                    Log.e("RecyclerView", "Cannot scroll without a LayoutManager set. Call setLayoutManager with a non-null argument.");
                } else if (!this.x) {
                    int[] iArr = this.G0;
                    iArr[0] = 0;
                    iArr[1] = 0;
                    boolean zD = sxaVar.d();
                    boolean zE = this.n.e();
                    int i4 = zE ? (zD ? 1 : 0) | 2 : zD ? 1 : 0;
                    float y = motionEvent.getY();
                    float x = motionEvent.getX();
                    int iZ = i3 - Z(i3, y);
                    int iA0 = i2 - a0(i2, x);
                    getScrollingChildHelper().f(i4, 1);
                    if (t(zD ? iZ : 0, zE ? iA0 : 0, this.G0, this.E0, 1)) {
                        iZ -= iArr[0];
                        iA0 -= iArr[1];
                    }
                    c0(zD ? iZ : 0, zE ? iA0 : 0, motionEvent, 1);
                    v65 v65Var = this.s0;
                    if (v65Var != null && (iZ != 0 || iA0 != 0)) {
                        v65Var.a(this, iZ, iA0);
                    }
                    l0(1);
                }
            }
            if (i != 0 && !z) {
                this.O0.a(motionEvent, i);
            }
        }
        return false;
    }

    @Override // android.view.ViewGroup
    public final boolean onInterceptTouchEvent(MotionEvent motionEvent) {
        boolean z;
        boolean z2;
        if (!this.x) {
            this.r = null;
            if (D(motionEvent)) {
                VelocityTracker velocityTracker = this.O;
                if (velocityTracker != null) {
                    velocityTracker.clear();
                }
                l0(0);
                Y();
                setScrollState(0);
                return true;
            }
            sxa sxaVar = this.n;
            if (sxaVar != null) {
                boolean zD = sxaVar.d();
                boolean zE = this.n.e();
                VelocityTracker velocityTrackerObtain = this.O;
                if (velocityTrackerObtain == null) {
                    velocityTrackerObtain = VelocityTracker.obtain();
                    this.O = velocityTrackerObtain;
                }
                velocityTrackerObtain.addMovement(motionEvent);
                int actionMasked = motionEvent.getActionMasked();
                int actionIndex = motionEvent.getActionIndex();
                if (actionMasked == 0) {
                    if (this.y) {
                        this.y = false;
                    }
                    this.N = motionEvent.getPointerId(0);
                    int x = (int) (motionEvent.getX() + 0.5f);
                    this.R = x;
                    this.P = x;
                    int y = (int) (motionEvent.getY() + 0.5f);
                    this.S = y;
                    this.Q = y;
                    EdgeEffect edgeEffect = this.H;
                    if (edgeEffect == null || gx1.I(edgeEffect) == 0.0f || canScrollHorizontally(-1)) {
                        z = false;
                    } else {
                        gx1.V(this.H, 0.0f, 1.0f - (motionEvent.getY() / getHeight()));
                        z = true;
                    }
                    EdgeEffect edgeEffect2 = this.J;
                    if (edgeEffect2 != null && gx1.I(edgeEffect2) != 0.0f && !canScrollHorizontally(1)) {
                        gx1.V(this.J, 0.0f, motionEvent.getY() / getHeight());
                        z = true;
                    }
                    EdgeEffect edgeEffect3 = this.I;
                    if (edgeEffect3 != null && gx1.I(edgeEffect3) != 0.0f && !canScrollVertically(-1)) {
                        gx1.V(this.I, 0.0f, motionEvent.getX() / getWidth());
                        z = true;
                    }
                    EdgeEffect edgeEffect4 = this.K;
                    if (edgeEffect4 != null && gx1.I(edgeEffect4) != 0.0f && !canScrollVertically(1)) {
                        gx1.V(this.K, 0.0f, 1.0f - (motionEvent.getX() / getWidth()));
                        z = true;
                    }
                    if (z || this.M == 2) {
                        getParent().requestDisallowInterceptTouchEvent(true);
                        setScrollState(1);
                        l0(1);
                    }
                    int[] iArr = this.F0;
                    iArr[1] = 0;
                    iArr[0] = 0;
                    j0(0);
                } else if (actionMasked == 1) {
                    this.O.clear();
                    l0(0);
                } else if (actionMasked == 2) {
                    int iFindPointerIndex = motionEvent.findPointerIndex(this.N);
                    if (iFindPointerIndex < 0) {
                        Log.e("RecyclerView", "Error processing scroll; pointer index for id " + this.N + " not found. Did any MotionEvents get skipped?");
                        return false;
                    }
                    int x2 = (int) (motionEvent.getX(iFindPointerIndex) + 0.5f);
                    int y2 = (int) (motionEvent.getY(iFindPointerIndex) + 0.5f);
                    if (this.M != 1) {
                        int i = x2 - this.P;
                        int i2 = y2 - this.Q;
                        if (!zD || Math.abs(i) <= this.l0) {
                            z2 = false;
                        } else {
                            this.R = x2;
                            z2 = true;
                        }
                        if (zE && Math.abs(i2) > this.l0) {
                            this.S = y2;
                            z2 = true;
                        }
                        if (z2) {
                            setScrollState(1);
                        }
                    }
                } else if (actionMasked == 3) {
                    VelocityTracker velocityTracker2 = this.O;
                    if (velocityTracker2 != null) {
                        velocityTracker2.clear();
                    }
                    l0(0);
                    Y();
                    setScrollState(0);
                } else if (actionMasked == 5) {
                    this.N = motionEvent.getPointerId(actionIndex);
                    int x3 = (int) (motionEvent.getX(actionIndex) + 0.5f);
                    this.R = x3;
                    this.P = x3;
                    int y3 = (int) (motionEvent.getY(actionIndex) + 0.5f);
                    this.S = y3;
                    this.Q = y3;
                } else if (actionMasked == 6) {
                    T(motionEvent);
                }
                if (this.M == 1) {
                    return true;
                }
            }
        }
        return false;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        Trace.beginSection("RV OnLayout");
        q();
        Trace.endSection();
        this.u = true;
    }

    @Override // android.view.View
    public final void onMeasure(int i, int i2) {
        sxa sxaVar = this.n;
        if (sxaVar == null) {
            o(i, i2);
            return;
        }
        boolean zL = sxaVar.L();
        boolean z = false;
        eya eyaVar = this.u0;
        if (zL) {
            int mode = View.MeasureSpec.getMode(i);
            int mode2 = View.MeasureSpec.getMode(i2);
            this.n.b.o(i, i2);
            if (mode == 1073741824 && mode2 == 1073741824) {
                z = true;
            }
            this.J0 = z;
            if (z || this.m == null) {
                return;
            }
            if (eyaVar.d == 1) {
                r();
            }
            this.n.u0(i, i2);
            eyaVar.i = true;
            s();
            this.n.w0(i, i2);
            if (this.n.z0()) {
                this.n.u0(View.MeasureSpec.makeMeasureSpec(getMeasuredWidth(), 1073741824), View.MeasureSpec.makeMeasureSpec(getMeasuredHeight(), 1073741824));
                eyaVar.i = true;
                s();
                this.n.w0(i, i2);
            }
            this.K0 = getMeasuredWidth();
            this.L0 = getMeasuredHeight();
            return;
        }
        if (this.t) {
            this.n.b.o(i, i2);
            return;
        }
        if (this.A) {
            i0();
            R();
            V();
            S(true);
            if (eyaVar.k) {
                eyaVar.g = true;
            } else {
                this.e.d();
                eyaVar.g = false;
            }
            this.A = false;
            k0(false);
        } else if (eyaVar.k) {
            setMeasuredDimension(getMeasuredWidth(), getMeasuredHeight());
            return;
        }
        kxa kxaVar = this.m;
        if (kxaVar != null) {
            eyaVar.e = op8.Y(((gy6) kxaVar).c);
        } else {
            eyaVar.e = 0;
        }
        i0();
        this.n.b.o(i, i2);
        k0(false);
        eyaVar.g = false;
    }

    @Override // android.view.ViewGroup
    public final boolean onRequestFocusInDescendants(int i, Rect rect) {
        if (N()) {
            return false;
        }
        return super.onRequestFocusInDescendants(i, rect);
    }

    @Override // android.view.View
    public final void onRestoreInstanceState(Parcelable parcelable) {
        if (!(parcelable instanceof bya)) {
            super.onRestoreInstanceState(parcelable);
            return;
        }
        bya byaVar = (bya) parcelable;
        this.d = byaVar;
        super.onRestoreInstanceState(byaVar.a);
        requestLayout();
    }

    @Override // android.view.View
    public final Parcelable onSaveInstanceState() {
        bya byaVar = new bya(super.onSaveInstanceState());
        bya byaVar2 = this.d;
        if (byaVar2 != null) {
            byaVar.c = byaVar2.c;
            return byaVar;
        }
        sxa sxaVar = this.n;
        if (sxaVar != null) {
            byaVar.c = sxaVar.h0();
            return byaVar;
        }
        byaVar.c = null;
        return byaVar;
    }

    @Override // android.view.View
    public final void onSizeChanged(int i, int i2, int i3, int i4) {
        super.onSizeChanged(i, i2, i3, i4);
        if (i == i3 && i2 == i4) {
            return;
        }
        this.K = null;
        this.I = null;
        this.J = null;
        this.H = null;
    }

    /* JADX WARN: Removed duplicated region for block: B:102:0x0209 A[PHI: r1
      0x0209: PHI (r1v49 int) = (r1v33 int), (r1v53 int) binds: [B:95:0x01f4, B:100:0x0205] A[DONT_GENERATE, DONT_INLINE]] */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean onTouchEvent(android.view.MotionEvent r19) {
        /*
            Method dump skipped, instruction units count: 795
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.RecyclerView.onTouchEvent(android.view.MotionEvent):boolean");
    }

    public final void p(View view) {
        pr0 pr0VarK = K(view);
        if (this.m == null || pr0VarK == null) {
            return;
        }
        or0 or0Var = pr0VarK.u;
        if (or0Var != null) {
            vx6 vx6Var = vx6.CREATED;
            vx6Var.getClass();
            ky6 ky6Var = or0Var.a;
            vx6 vx6Var2 = ky6Var.d;
            vx6Var2.getClass();
            if (vx6Var2.compareTo(vx6Var) <= 0) {
                vx6Var = vx6Var2;
            }
            ky6Var.g(vx6Var);
        }
        pr0VarK.s.j(pr0VarK);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:117:0x0265  */
    /* JADX WARN: Removed duplicated region for block: B:157:0x0333  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void q() {
        /*
            Method dump skipped, instruction units count: 931
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.RecyclerView.q():void");
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0063  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void r() {
        /*
            Method dump skipped, instruction units count: 514
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: androidx.recyclerview.widget.RecyclerView.r():void");
    }

    @Override // android.view.ViewGroup
    public final void removeDetachedView(View view, boolean z) {
        pr0 pr0VarK = K(view);
        if (pr0VarK != null) {
            if (pr0VarK.i()) {
                pr0VarK.i &= -257;
            } else if (!pr0VarK.n()) {
                StringBuilder sb = new StringBuilder("Called removeDetachedView with a view which is not flagged as tmp detached.");
                sb.append(pr0VarK);
                ay0.i(sb, A());
                return;
            }
        } else if (P0) {
            StringBuilder sb2 = new StringBuilder("No ViewHolder found for child: ");
            sb2.append(view);
            ay0.i(sb2, A());
            return;
        }
        view.clearAnimation();
        p(view);
        super.removeDetachedView(view, z);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void requestChildFocus(View view, View view2) {
        vz6 vz6Var = this.n.e;
        if ((vz6Var == null || !vz6Var.e) && !N() && view2 != null) {
            b0(view, view2);
        }
        super.requestChildFocus(view, view2);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final boolean requestChildRectangleOnScreen(View view, Rect rect, boolean z) {
        return this.n.o0(this, view, rect, z, false);
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final void requestDisallowInterceptTouchEvent(boolean z) {
        ArrayList arrayList = this.q;
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            ((y94) arrayList.get(i)).getClass();
        }
        super.requestDisallowInterceptTouchEvent(z);
    }

    @Override // android.view.View, android.view.ViewParent
    public final void requestLayout() {
        if (this.v != 0 || this.x) {
            this.w = true;
        } else {
            super.requestLayout();
        }
    }

    public final void s() {
        i0();
        R();
        eya eyaVar = this.u0;
        eyaVar.a(6);
        this.e.d();
        eyaVar.e = op8.Y(((gy6) this.m).c);
        eyaVar.c = 0;
        if (this.d != null) {
            kxa kxaVar = this.m;
            int iOrdinal = kxaVar.b.ordinal();
            if (iOrdinal == 1 ? op8.Y(((gy6) kxaVar).c) > 0 : iOrdinal != 2) {
                Parcelable parcelable = this.d.c;
                if (parcelable != null) {
                    this.n.g0(parcelable);
                }
                this.d = null;
            }
        }
        eyaVar.g = false;
        this.n.e0(this.c, eyaVar);
        eyaVar.f = false;
        eyaVar.j = eyaVar.j && this.L != null;
        eyaVar.d = 4;
        S(true);
        k0(false);
    }

    @Override // android.view.View
    public final void scrollBy(int i, int i2) {
        sxa sxaVar = this.n;
        if (sxaVar == null) {
            Log.e("RecyclerView", "Cannot scroll without a LayoutManager set. Call setLayoutManager with a non-null argument.");
            return;
        }
        if (this.x) {
            return;
        }
        boolean zD = sxaVar.d();
        boolean zE = this.n.e();
        if (zD || zE) {
            if (!zD) {
                i = 0;
            }
            if (!zE) {
                i2 = 0;
            }
            c0(i, i2, null, 0);
        }
    }

    @Override // android.view.View
    public final void scrollTo(int i, int i2) {
        Log.w("RecyclerView", "RecyclerView does not support scrolling to an absolute position. Use scrollToPosition instead");
    }

    @Override // android.view.View, android.view.accessibility.AccessibilityEventSource
    public final void sendAccessibilityEventUnchecked(AccessibilityEvent accessibilityEvent) {
        if (!N()) {
            super.sendAccessibilityEventUnchecked(accessibilityEvent);
        } else {
            int contentChangeTypes = accessibilityEvent != null ? accessibilityEvent.getContentChangeTypes() : 0;
            this.z |= contentChangeTypes != 0 ? contentChangeTypes : 0;
        }
    }

    public void setAccessibilityDelegateCompat(jya jyaVar) {
        this.B0 = jyaVar;
        ute.o(this, jyaVar);
    }

    public void setAdapter(kxa kxaVar) {
        int i = 0;
        setLayoutFrozen(false);
        kxa kxaVar2 = this.m;
        aya ayaVar = this.b;
        if (kxaVar2 != null) {
            kxaVar2.a.unregisterObserver(ayaVar);
            gy6 gy6Var = (gy6) this.m;
            gy6Var.getClass();
            ey6 ey6Var = gy6Var.i;
            ArrayList arrayList = this.w0;
            if (arrayList != null) {
                arrayList.remove(ey6Var);
            }
        }
        pxa pxaVar = this.L;
        if (pxaVar != null) {
            pxaVar.e();
        }
        sxa sxaVar = this.n;
        yxa yxaVar = this.c;
        if (sxaVar != null) {
            sxaVar.k0(yxaVar);
            this.n.l0(yxaVar);
        }
        yxaVar.a.clear();
        yxaVar.g();
        e8 e8Var = this.e;
        e8Var.q((ArrayList) e8Var.c);
        e8Var.q((ArrayList) e8Var.d);
        e8Var.a = 0;
        kxa kxaVar3 = this.m;
        this.m = kxaVar;
        if (kxaVar != null) {
            kxaVar.a.registerObserver(ayaVar);
            gy6 gy6Var2 = (gy6) kxaVar;
            h(gy6Var2.i);
            w25 w25Var = gy6Var2.g;
            w25Var.b();
            w25Var.e.a(new fy6(gy6Var2, i, this));
        }
        sxa sxaVar2 = this.n;
        if (sxaVar2 != null) {
            sxaVar2.R();
        }
        kxa kxaVar4 = this.m;
        yxaVar.a.clear();
        yxaVar.g();
        yxaVar.f(kxaVar3, true);
        xxa xxaVarC = yxaVar.c();
        if (kxaVar3 != null) {
            xxaVarC.b--;
        }
        if (xxaVarC.b == 0) {
            SparseArray sparseArray = xxaVarC.a;
            for (int i2 = 0; i2 < sparseArray.size(); i2++) {
                wxa wxaVar = (wxa) sparseArray.valueAt(i2);
                Iterator it2 = wxaVar.a.iterator();
                while (it2.hasNext()) {
                    rr7.w(((pr0) it2.next()).a);
                }
                wxaVar.a.clear();
            }
        }
        if (kxaVar4 != null) {
            xxaVarC.b++;
        }
        yxaVar.e();
        this.u0.f = true;
        W(false);
        requestLayout();
    }

    public void setChildDrawingOrderCallback(nxa nxaVar) {
        if (nxaVar == null) {
            return;
        }
        setChildrenDrawingOrderEnabled(false);
    }

    @Override // android.view.ViewGroup
    public void setClipToPadding(boolean z) {
        if (z != this.h) {
            this.K = null;
            this.I = null;
            this.J = null;
            this.H = null;
        }
        this.h = z;
        super.setClipToPadding(z);
        if (this.u) {
            requestLayout();
        }
    }

    public void setEdgeEffectFactory(oxa oxaVar) {
        oxaVar.getClass();
        this.G = oxaVar;
        this.K = null;
        this.I = null;
        this.J = null;
        this.H = null;
    }

    public void setHasFixedSize(boolean z) {
        this.t = z;
    }

    public void setItemAnimator(pxa pxaVar) {
        pxa pxaVar2 = this.L;
        if (pxaVar2 != null) {
            pxaVar2.e();
            this.L.a = null;
        }
        this.L = pxaVar;
        if (pxaVar != null) {
            pxaVar.a = this.z0;
        }
    }

    public void setItemViewCacheSize(int i) {
        yxa yxaVar = this.c;
        yxaVar.e = i;
        yxaVar.n();
    }

    @Deprecated
    public void setLayoutFrozen(boolean z) {
        suppressLayout(z);
    }

    public void setLayoutManager(sxa sxaVar) {
        RecyclerView recyclerView;
        if (sxaVar == this.n) {
            return;
        }
        m0();
        sxa sxaVar2 = this.n;
        yxa yxaVar = this.c;
        if (sxaVar2 != null) {
            pxa pxaVar = this.L;
            if (pxaVar != null) {
                pxaVar.e();
            }
            this.n.k0(yxaVar);
            this.n.l0(yxaVar);
            yxaVar.a.clear();
            yxaVar.g();
            if (this.s) {
                sxa sxaVar3 = this.n;
                sxaVar3.g = false;
                sxaVar3.T(this);
            }
            this.n.x0(null);
            this.n = null;
        } else {
            yxaVar.a.clear();
            yxaVar.g();
        }
        jl1 jl1Var = this.f;
        ((il1) jl1Var.e).i();
        ArrayList arrayList = (ArrayList) jl1Var.b;
        int size = arrayList.size() - 1;
        while (true) {
            recyclerView = ((ixa) jl1Var.d).a;
            if (size < 0) {
                break;
            }
            pr0 pr0VarK = K((View) arrayList.get(size));
            if (pr0VarK != null) {
                int i = pr0VarK.o;
                if (recyclerView.N()) {
                    pr0VarK.p = i;
                    recyclerView.H0.add(pr0VarK);
                } else {
                    pr0VarK.a.setImportantForAccessibility(i);
                }
                pr0VarK.o = 0;
            }
            arrayList.remove(size);
            size--;
        }
        int childCount = recyclerView.getChildCount();
        for (int i2 = 0; i2 < childCount; i2++) {
            View childAt = recyclerView.getChildAt(i2);
            recyclerView.p(childAt);
            childAt.clearAnimation();
        }
        recyclerView.removeAllViews();
        this.n = sxaVar;
        if (sxaVar != null) {
            if (sxaVar.b != null) {
                StringBuilder sb = new StringBuilder("LayoutManager ");
                sb.append(sxaVar);
                ywb.l(sb, " is already attached to a RecyclerView:", sxaVar.b.A());
                return;
            } else {
                sxaVar.x0(this);
                if (this.s) {
                    sxa sxaVar4 = this.n;
                    sxaVar4.g = true;
                    sxaVar4.S(this);
                }
            }
        }
        yxaVar.n();
        requestLayout();
    }

    @Override // android.view.ViewGroup
    @Deprecated
    public void setLayoutTransition(LayoutTransition layoutTransition) {
        if (layoutTransition == null) {
            super.setLayoutTransition(null);
        } else {
            ay0.e("Providing a LayoutTransition into RecyclerView is not supported. Please use setItemAnimator() instead for animating changes to the items in this RecyclerView");
        }
    }

    @Override // android.view.View
    public void setNestedScrollingEnabled(boolean z) {
        nd8 scrollingChildHelper = getScrollingChildHelper();
        if (scrollingChildHelper.d) {
            View view = scrollingChildHelper.c;
            WeakHashMap weakHashMap = ute.a;
            view.stopNestedScroll();
        }
        scrollingChildHelper.d = z;
    }

    public void setOnFlingListener(uxa uxaVar) {
    }

    @Deprecated
    public void setOnScrollListener(vxa vxaVar) {
        this.v0 = vxaVar;
    }

    public void setPreserveFocusAfterLayout(boolean z) {
        this.q0 = z;
    }

    public void setRecycledViewPool(xxa xxaVar) {
        yxa yxaVar = this.c;
        RecyclerView recyclerView = yxaVar.h;
        yxaVar.f(recyclerView.m, false);
        if (yxaVar.g != null) {
            r1.b--;
        }
        yxaVar.g = xxaVar;
        if (xxaVar != null && recyclerView.getAdapter() != null) {
            yxaVar.g.b++;
        }
        yxaVar.e();
    }

    @Deprecated
    public void setRecyclerListener(zxa zxaVar) {
    }

    public void setScrollState(int i) {
        vz6 vz6Var;
        if (i == this.M) {
            return;
        }
        if (Q0) {
            StringBuilder sbC = ev6.C("setting scroll state to ", i, " from ");
            sbC.append(this.M);
            Log.d("RecyclerView", sbC.toString(), new Exception());
        }
        this.M = i;
        if (i != 2) {
            hya hyaVar = this.r0;
            hyaVar.g.removeCallbacks(hyaVar);
            hyaVar.c.abortAnimation();
            sxa sxaVar = this.n;
            if (sxaVar != null && (vz6Var = sxaVar.e) != null) {
                vz6Var.h();
            }
        }
        sxa sxaVar2 = this.n;
        if (sxaVar2 != null) {
            sxaVar2.i0(i);
        }
        ArrayList arrayList = this.w0;
        if (arrayList != null) {
            for (int size = arrayList.size() - 1; size >= 0; size--) {
                ((vxa) this.w0.get(size)).getClass();
            }
        }
    }

    public void setViewCacheExtension(gya gyaVar) {
        this.c.getClass();
    }

    @Override // android.view.View
    public final boolean startNestedScroll(int i) {
        return getScrollingChildHelper().f(i, 0);
    }

    @Override // android.view.View
    public final void stopNestedScroll() {
        getScrollingChildHelper().g(0);
    }

    @Override // android.view.ViewGroup
    public final void suppressLayout(boolean z) {
        if (z != this.x) {
            i("Do not suppressLayout in layout or scroll");
            if (z) {
                long jUptimeMillis = SystemClock.uptimeMillis();
                onTouchEvent(MotionEvent.obtain(jUptimeMillis, jUptimeMillis, 3, 0.0f, 0.0f, 0));
                this.x = true;
                this.y = true;
                m0();
                return;
            }
            this.x = false;
            if (this.w && this.n != null && this.m != null) {
                requestLayout();
            }
            this.w = false;
        }
    }

    public final boolean t(int i, int i2, int[] iArr, int[] iArr2, int i3) {
        return getScrollingChildHelper().c(i, i2, iArr, iArr2, i3);
    }

    public final void u(int i, int i2, int i3, int i4, int[] iArr, int i5, int[] iArr2) {
        getScrollingChildHelper().d(i, i2, i3, i4, iArr, i5, iArr2);
    }

    public final void v(int i, int i2) {
        this.F++;
        int scrollX = getScrollX();
        int scrollY = getScrollY();
        onScrollChanged(scrollX, scrollY, scrollX - i, scrollY - i2);
        vxa vxaVar = this.v0;
        if (vxaVar != null) {
            vxaVar.a(this, i, i2);
        }
        ArrayList arrayList = this.w0;
        if (arrayList != null) {
            for (int size = arrayList.size() - 1; size >= 0; size--) {
                ((vxa) this.w0.get(size)).a(this, i, i2);
            }
        }
        this.F--;
    }

    public final void w() {
        if (this.K != null) {
            return;
        }
        ((fya) this.G).getClass();
        EdgeEffect edgeEffect = new EdgeEffect(getContext());
        this.K = edgeEffect;
        if (this.h) {
            edgeEffect.setSize((getMeasuredWidth() - getPaddingLeft()) - getPaddingRight(), (getMeasuredHeight() - getPaddingTop()) - getPaddingBottom());
        } else {
            edgeEffect.setSize(getMeasuredWidth(), getMeasuredHeight());
        }
    }

    public final void x() {
        if (this.H != null) {
            return;
        }
        ((fya) this.G).getClass();
        EdgeEffect edgeEffect = new EdgeEffect(getContext());
        this.H = edgeEffect;
        if (this.h) {
            edgeEffect.setSize((getMeasuredHeight() - getPaddingTop()) - getPaddingBottom(), (getMeasuredWidth() - getPaddingLeft()) - getPaddingRight());
        } else {
            edgeEffect.setSize(getMeasuredHeight(), getMeasuredWidth());
        }
    }

    public final void y() {
        if (this.J != null) {
            return;
        }
        ((fya) this.G).getClass();
        EdgeEffect edgeEffect = new EdgeEffect(getContext());
        this.J = edgeEffect;
        if (this.h) {
            edgeEffect.setSize((getMeasuredHeight() - getPaddingTop()) - getPaddingBottom(), (getMeasuredWidth() - getPaddingLeft()) - getPaddingRight());
        } else {
            edgeEffect.setSize(getMeasuredHeight(), getMeasuredWidth());
        }
    }

    public final void z() {
        if (this.I != null) {
            return;
        }
        ((fya) this.G).getClass();
        EdgeEffect edgeEffect = new EdgeEffect(getContext());
        this.I = edgeEffect;
        if (this.h) {
            edgeEffect.setSize((getMeasuredWidth() - getPaddingLeft()) - getPaddingRight(), (getMeasuredHeight() - getPaddingTop()) - getPaddingBottom());
        } else {
            edgeEffect.setSize(getMeasuredWidth(), getMeasuredHeight());
        }
    }

    public final void e0(int i) {
        if (this.x) {
            return;
        }
        m0();
        sxa sxaVar = this.n;
        if (sxaVar == null) {
            Log.e("RecyclerView", ezwlgQm.LAsbKus);
        } else {
            sxaVar.r0(i);
            awakenScrollBars();
        }
    }

    public void setScrollingTouchSlop(int i) {
        ViewConfiguration viewConfiguration = ViewConfiguration.get(getContext());
        if (i != 0) {
            if (i != 1) {
                Log.w("RecyclerView", VrhD.NxTs + i + "; using default value");
            } else {
                this.l0 = viewConfiguration.getScaledPagingTouchSlop();
                return;
            }
        }
        this.l0 = viewConfiguration.getScaledTouchSlop();
    }

    @Override // android.view.ViewGroup
    public final ViewGroup.LayoutParams generateLayoutParams(ViewGroup.LayoutParams layoutParams) {
        sxa sxaVar = this.n;
        if (sxaVar != null) {
            return sxaVar.t(layoutParams);
        }
        ygf.f("RecyclerView has no LayoutManager".concat(A()));
        return null;
    }

    public RecyclerView(Context context) {
        this(context, null);
    }
}
