package defpackage;

import android.content.Context;
import android.content.res.Configuration;
import android.graphics.Canvas;
import android.graphics.Point;
import android.graphics.Rect;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.os.StrictMode;
import android.os.Trace;
import android.util.LongSparseArray;
import android.util.SparseArray;
import android.view.FocusFinder;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.PointerIcon;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.ViewStructure;
import android.view.ViewTreeObserver;
import android.view.accessibility.AccessibilityNodeInfo;
import android.view.animation.AnimationUtils;
import android.view.autofill.AutofillManager;
import com.drew.metadata.exif.makernotes.CanonMakernoteDirectory;
import com.drew.metadata.exif.makernotes.NikonType2MakernoteDirectory;
import com.drew.metadata.photoshop.PhotoshopDirectory;
import com.medium.reader.R;
import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicReference;
import java.util.function.Consumer;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mn extends ViewGroup implements mx8, mlb, rk7, f03, kw8, ViewTreeObserver.OnGlobalLayoutListener, ViewTreeObserver.OnScrollChangedListener, ViewTreeObserver.OnTouchModeChangeListener, kr4 {
    public static Class c1;
    public static Method d1;
    public static Method e1;
    public static final x68 f1 = new x68();
    public static e g1;
    public static Method h1;
    public mo A;
    public cjd A0;
    public final bm B;
    public zid B0;
    public final qp C;
    public final AtomicReference C0;
    public final uk0 D;
    public n43 D0;
    public final x68 E;
    public final uy4 E0;
    public x68 F;
    public final l78 F0;
    public boolean G;
    public final k49 G0;
    public boolean H;
    public final li5 H0;
    public final d48 I;
    public final w26 I0;
    public final ms J;
    public final s28 J0;
    public final k49 K;
    public final zs K0;
    public final j83 L;
    public MotionEvent L0;
    public final hm M;
    public long M0;
    public final lm N;
    public final mya N0;
    public boolean O;
    public final x68 O0;
    public final um P;
    public float P0;
    public final tm Q;
    public float Q0;
    public final px8 R;
    public final jn R0;
    public boolean S;
    public final vm S0;
    public boolean T0;
    public final wv0 U0;
    public final bn V0;
    public final r31 W0;
    public boolean X0;
    public boolean Y0;
    public final l82 Z0;
    public final k49 a;
    public View a1;
    public long b;
    public final hn b1;
    public final boolean c;
    public x06 d;
    public final cq6 e;
    public ny6 f;
    public oy6 g;
    public ijb h;
    public final m70 i;
    public final vm j;
    public final k49 k;
    public final View l;
    public gu l0;
    public final or4 m;
    public f72 m0;
    public ib2 n;
    public boolean n0;
    public final ap o;
    public final w73 o0;
    public final ax6 p;
    public long p0;
    public final k49 q;
    public final int[] q0;
    public final j83 r;
    public final float[] r0;
    public final h61 s;
    public final float[] s0;
    public final rt t;
    public final float[] t0;
    public final f36 u;
    public long u0;
    public final aq6 v;
    public boolean v0;
    public final k68 w;
    public long w0;
    public final cxa x;
    public final k49 x0;
    public final cyb y;
    public final j83 y0;
    public final sn z;
    public x45 z0;

    public mn(Context context, u12 u12Var) {
        lm lmVar;
        super(context);
        this.a = qo7.u(u12Var);
        this.b = 9205357640488583168L;
        int i = 1;
        this.c = true;
        this.e = u12Var.r;
        this.h = no3.d;
        this.i = new m70();
        int i2 = 0;
        this.j = new vm(this, i2);
        this.k = new k49(k40.g(context), uob.g);
        this.m = new or4(this, this);
        this.n = u12Var.b.j();
        this.o = new ap();
        this.p = new ax6();
        this.q = qo7.u(Boolean.FALSE);
        this.r = bjc.b(new bn(this, i2));
        this.s = u12Var.t;
        this.t = u12Var.q;
        this.u = new f36();
        int i3 = 3;
        aq6 aq6Var = new aq6(3);
        aq6Var.c0(nlb.c);
        aq6Var.Z(getDensity());
        aq6Var.e0(getViewConfiguration());
        aq6Var.d0(ev6.i(new kn(this), ((or4) getFocusOwner()).e).b(m134getDragAndDropManager().c));
        this.v = aq6Var;
        k68 k68Var = j46.a;
        this.w = new k68();
        getLayoutNodes();
        this.x = new cxa(this);
        this.y = new cyb(getRoot(), new ly3(), getLayoutNodes());
        sn snVar = new sn(this);
        this.z = snVar;
        this.A = new mo(this, new vf(0, this, bo.class, "getContentCaptureSessionCompat", "getContentCaptureSessionCompat(Landroid/view/View;)Landroidx/compose/ui/contentcapture/ContentCaptureSessionWrapper;", 1, 26));
        this.B = u12Var.j;
        this.C = new qp(this);
        this.D = new uk0();
        this.E = new x68();
        this.I = new d48();
        aq6 root = getRoot();
        ms msVar = new ms();
        msVar.b = root;
        msVar.c = new vn5((l26) root.F.d);
        msVar.d = new my6(16, false);
        msVar.e = new yn5();
        this.J = msVar;
        this.K = qo7.u(new Configuration(context.getResources().getConfiguration()));
        this.L = bjc.b(new bn(this, i));
        this.M = g() ? new hm(this, getAutofillTree()) : null;
        if (g()) {
            AutofillManager autofillManagerE = mm.e(context.getSystemService(mm.f()));
            if (autofillManagerE == null) {
                throw lv8.v("Autofill service could not be located.");
            }
            lmVar = new lm(new sk0(autofillManagerE), getSemanticsOwner(), this, getRectManager(), context.getPackageName());
        } else {
            lmVar = null;
        }
        this.N = lmVar;
        this.P = u12Var.l;
        this.Q = u12Var.m;
        this.R = new px8(new gn(this, i));
        this.o0 = new w73(getRoot());
        this.p0 = 9223372034707292159L;
        this.q0 = new int[]{0, 0};
        float[] fArrA = pk7.a();
        this.r0 = fArrA;
        this.s0 = pk7.a();
        this.t0 = pk7.a();
        this.u0 = -1L;
        this.w0 = 9187343241974906880L;
        this.x0 = qo7.u(null);
        this.y0 = bjc.b(new bn(this, i3));
        this.C0 = new AtomicReference(null);
        this.E0 = u12Var.n;
        this.F0 = u12Var.o;
        int layoutDirection = context.getResources().getConfiguration().getLayoutDirection();
        int[] iArr = ir4.a;
        ip6 ip6Var = layoutDirection != 0 ? layoutDirection != 1 ? null : ip6.Rtl : ip6.Ltr;
        this.G0 = qo7.u(ip6Var == null ? ip6.Ltr : ip6Var);
        this.H0 = u12Var.p;
        int i4 = 2;
        this.I0 = new w26(isInTouchMode() ? 1 : 2);
        s28 s28Var = new s28();
        new o78(new vm0[16]);
        new o78(new br7[16]);
        new o78(new aq6[16]);
        new o78(new br7[16]);
        this.J0 = s28Var;
        zs zsVar = new zs();
        new wz7(new ir(i, zsVar));
        this.K0 = zsVar;
        this.N0 = new mya(25);
        this.O0 = new x68();
        this.R0 = new jn(i2, this);
        this.S0 = new vm(this, i);
        this.U0 = new wv0(context, new gn(this, i2));
        this.V0 = new bn(this, i4);
        int i5 = Build.VERSION.SDK_INT;
        this.W0 = i5 < 29 ? new s31(fArrA) : new t31();
        addOnAttachStateChangeListener(this.A);
        setWillNotDraw(false);
        setFocusable(true);
        if (i5 >= 26) {
            ao.a.a(this, 1, false);
        }
        setFocusableInTouchMode(true);
        setClipChildren(false);
        ute.o(this, snVar);
        setOnDragListener(m134getDragAndDropManager());
        getRoot().d(this);
        if (i5 >= 29) {
            vn.a.a(this);
        }
        if (p()) {
            View view = new View(context);
            view.setLayoutParams(new ViewGroup.LayoutParams(1, 1));
            view.setTag(R.id.hide_in_inspector_tag, Boolean.TRUE);
            this.l = view;
            addView(view, -1);
        }
        this.Z0 = i5 >= 31 ? new l82() : null;
        this.b1 = new hn(this);
    }

    public static boolean g() {
        return Build.VERSION.SDK_INT >= 26;
    }

    private final boolean getDerivedIsAttached() {
        return ((Boolean) this.r.getValue()).booleanValue();
    }

    private final cjd getLegacyTextInputServiceAndroid() {
        cjd cjdVar = this.A0;
        if (cjdVar != null) {
            return cjdVar;
        }
        cjd cjdVar2 = new cjd(getView(), this);
        this.A0 = cjdVar2;
        return cjdVar2;
    }

    private final u12 get_composeViewContext() {
        return (u12) this.a.getValue();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final zm get_viewTreeOwners() {
        lv8.z(this.x0.getValue());
        return null;
    }

    public static void h(ViewGroup viewGroup) {
        int childCount = viewGroup.getChildCount();
        for (int i = 0; i < childCount; i++) {
            View childAt = viewGroup.getChildAt(i);
            if (childAt instanceof mn) {
                ((mn) childAt).y();
            } else if (childAt instanceof ViewGroup) {
                h((ViewGroup) childAt);
            }
        }
    }

    public static long i(int i) {
        int mode = View.MeasureSpec.getMode(i);
        int size = View.MeasureSpec.getSize(i);
        if (mode == Integer.MIN_VALUE) {
            return size;
        }
        if (mode == 0) {
            return 2147483647L;
        }
        if (mode == 1073741824) {
            long j = size;
            return j | (j << 32);
        }
        lg8.d();
        return 0L;
    }

    public static View k(View view, int i) throws NoSuchMethodException {
        if (Build.VERSION.SDK_INT < 29) {
            Method declaredMethod = View.class.getDeclaredMethod("getAccessibilityViewId", null);
            declaredMethod.setAccessible(true);
            if (g76.L(declaredMethod.invoke(view, null), Integer.valueOf(i))) {
                return view;
            }
            if (view instanceof ViewGroup) {
                ViewGroup viewGroup = (ViewGroup) view;
                int childCount = viewGroup.getChildCount();
                for (int i2 = 0; i2 < childCount; i2++) {
                    View viewK = k(viewGroup.getChildAt(i2), i);
                    if (viewK != null) {
                        return viewK;
                    }
                }
            }
        }
        return null;
    }

    public static void n(aq6 aq6Var) {
        aq6Var.D();
        o78 o78VarZ = aq6Var.z();
        Object[] objArr = o78VarZ.a;
        int i = o78VarZ.c;
        for (int i2 = 0; i2 < i; i2++) {
            n((aq6) objArr[i2]);
        }
    }

    public static boolean p() {
        return Build.VERSION.SDK_INT >= 35;
    }

    public static boolean q(MotionEvent motionEvent) {
        boolean z = (Float.floatToRawIntBits(motionEvent.getX()) & Integer.MAX_VALUE) >= 2139095040 || (Float.floatToRawIntBits(motionEvent.getY()) & Integer.MAX_VALUE) >= 2139095040 || (Float.floatToRawIntBits(motionEvent.getRawX()) & Integer.MAX_VALUE) >= 2139095040 || (Float.floatToRawIntBits(motionEvent.getRawY()) & Integer.MAX_VALUE) >= 2139095040;
        if (!z) {
            int pointerCount = motionEvent.getPointerCount();
            for (int i = 1; i < pointerCount; i++) {
                z = (Float.floatToRawIntBits(motionEvent.getX(i)) & Integer.MAX_VALUE) >= 2139095040 || (Float.floatToRawIntBits(motionEvent.getY(i)) & Integer.MAX_VALUE) >= 2139095040 || (Build.VERSION.SDK_INT >= 29 && !e48.a.a(motionEvent, i));
                if (z) {
                    break;
                }
            }
        }
        return z;
    }

    private final void setAttached(boolean z) {
        this.q.setValue(Boolean.valueOf(z));
    }

    private void setDensity(m73 m73Var) {
        this.k.setValue(m73Var);
    }

    private void setFontFamilyResolver(yy4 yy4Var) {
        this.F0.setValue(yy4Var);
    }

    private void setLayoutDirection(ip6 ip6Var) {
        this.G0.setValue(ip6Var);
    }

    private final void set_composeViewContext(u12 u12Var) {
        this.a.setValue(u12Var);
    }

    private final void set_viewTreeOwners(zm zmVar) {
        this.x0.setValue(zmVar);
    }

    public final void A(aq6 aq6Var, boolean z, boolean z2, boolean z3) {
        aq6 aq6VarV;
        aq6 aq6VarV2;
        w73 w73Var = this.o0;
        if (!z) {
            if (w73Var.D(aq6Var, z2) && z3) {
                G(aq6Var);
                return;
            }
            return;
        }
        m50 m50Var = (m50) w73Var.e;
        aq6 aq6Var2 = aq6Var.h;
        eq6 eq6Var = aq6Var.G;
        if (aq6Var2 == null) {
            b26.b("Error: requestLookaheadRemeasure cannot be called on a node outside LookaheadScope");
        }
        int i = vk7.a[eq6Var.d.ordinal()];
        if (i != 1) {
            if (i == 2 || i == 3 || i == 4) {
                ((o78) w73Var.h).b(new uk7(aq6Var, true, z2));
                return;
            }
            if (i != 5) {
                ygf.a();
                return;
            }
            if (!eq6Var.e || z2) {
                eq6Var.e = true;
                eq6Var.p.v = true;
                if (aq6Var.Q) {
                    return;
                }
                if ((g76.L(aq6Var.J(), Boolean.TRUE) || w73.o(aq6Var)) && ((aq6VarV = aq6Var.v()) == null || !aq6VarV.G.e)) {
                    m50Var.e(aq6Var, q76.LookaheadMeasurement);
                } else if ((aq6Var.I() || w73.p(aq6Var)) && ((aq6VarV2 = aq6Var.v()) == null || !aq6VarV2.q())) {
                    m50Var.e(aq6Var, q76.Measurement);
                }
                if (w73Var.c || !z3) {
                    return;
                }
                G(aq6Var);
            }
        }
    }

    public final void B(aq6 aq6Var, boolean z, boolean z2) {
        eq6 eq6Var = aq6Var.G;
        w73 w73Var = this.o0;
        if (!z) {
            w73Var.getClass();
            int i = vk7.a[eq6Var.d.ordinal()];
            if (i == 1 || i == 2 || i == 3 || i == 4) {
                return;
            }
            if (i != 5) {
                ygf.a();
                return;
            }
            aq6 aq6VarV = aq6Var.v();
            boolean z3 = aq6VarV == null || aq6VarV.I();
            if (!z2) {
                if (aq6Var.q()) {
                    return;
                }
                if (aq6Var.p() && aq6Var.I() == z3 && aq6Var.I() == eq6Var.p.u) {
                    return;
                }
            }
            yk7 yk7Var = eq6Var.p;
            yk7Var.w = true;
            yk7Var.x = true;
            if (!aq6Var.Q && yk7Var.u && z3) {
                if ((aq6VarV == null || !aq6VarV.p()) && (aq6VarV == null || !aq6VarV.q())) {
                    ((m50) w73Var.e).e(aq6Var, q76.Placement);
                }
                if (w73Var.c) {
                    return;
                }
                G(null);
                return;
            }
            return;
        }
        m50 m50Var = (m50) w73Var.e;
        int i2 = vk7.a[eq6Var.d.ordinal()];
        if (i2 != 1) {
            if (i2 != 2) {
                if (i2 == 3) {
                    return;
                }
                if (i2 != 4 && i2 != 5) {
                    ygf.a();
                    return;
                }
            }
            if ((eq6Var.e || eq6Var.f) && !z2) {
                return;
            }
            eq6Var.f = true;
            eq6Var.g = true;
            yk7 yk7Var2 = eq6Var.p;
            yk7Var2.w = true;
            yk7Var2.x = true;
            if (aq6Var.Q) {
                return;
            }
            aq6 aq6VarV2 = aq6Var.v();
            if (g76.L(aq6Var.J(), Boolean.TRUE) && ((aq6VarV2 == null || !aq6VarV2.G.e) && (aq6VarV2 == null || !aq6VarV2.G.f))) {
                m50Var.e(aq6Var, q76.LookaheadPlacement);
            } else if (aq6Var.I() && ((aq6VarV2 == null || !aq6VarV2.p()) && (aq6VarV2 == null || !aq6VarV2.q()))) {
                m50Var.e(aq6Var, q76.Placement);
            }
            if (w73Var.c) {
                return;
            }
            G(null);
        }
    }

    public final void C() {
        sn snVar = this.z;
        snVar.x = true;
        Handler handler = snVar.d.getHandler();
        if (snVar.v() && !snVar.I && handler != null) {
            snVar.I = true;
            handler.post(snVar.K);
        }
        mo moVar = this.A;
        moVar.f = true;
        Handler handler2 = moVar.a.getHandler();
        if (!moVar.e() || moVar.l || handler2 == null) {
            return;
        }
        moVar.l = true;
        handler2.post(moVar.m);
    }

    public final void D() {
        if (this.v0) {
            return;
        }
        long jCurrentAnimationTimeMillis = AnimationUtils.currentAnimationTimeMillis();
        if (jCurrentAnimationTimeMillis != this.u0) {
            this.u0 = jCurrentAnimationTimeMillis;
            r31 r31Var = this.W0;
            float[] fArr = this.s0;
            r31Var.a(this, fArr);
            kyd.Z(fArr, this.t0);
            ViewParent parent = getParent();
            View view = this;
            while (parent instanceof ViewGroup) {
                view = (View) parent;
                parent = ((ViewGroup) view).getParent();
            }
            int[] iArr = this.q0;
            view.getLocationOnScreen(iArr);
            float f = iArr[0];
            float f2 = iArr[1];
            view.getLocationInWindow(iArr);
            this.w0 = (((long) Float.floatToRawIntBits(f - iArr[0])) << 32) | (((long) Float.floatToRawIntBits(f2 - iArr[1])) & 4294967295L);
        }
    }

    public final void E(MotionEvent motionEvent) {
        this.u0 = AnimationUtils.currentAnimationTimeMillis();
        r31 r31Var = this.W0;
        float[] fArr = this.s0;
        r31Var.a(this, fArr);
        kyd.Z(fArr, this.t0);
        float x = motionEvent.getX();
        float y = motionEvent.getY();
        long jB = pk7.b((((long) Float.floatToRawIntBits(x)) << 32) | (((long) Float.floatToRawIntBits(y)) & 4294967295L), fArr);
        float rawX = motionEvent.getRawX() - Float.intBitsToFloat((int) (jB >> 32));
        float rawY = motionEvent.getRawY() - Float.intBitsToFloat((int) (jB & 4294967295L));
        this.w0 = (((long) Float.floatToRawIntBits(rawX)) << 32) | (((long) Float.floatToRawIntBits(rawY)) & 4294967295L);
    }

    public final boolean F() {
        if (isFocused()) {
            return true;
        }
        return super.requestFocus(NikonType2MakernoteDirectory.TAG_ADAPTER, null);
    }

    public final void G(aq6 aq6Var) {
        if (isLayoutRequested() || !isAttachedToWindow()) {
            return;
        }
        if (aq6Var != null) {
            while (aq6Var != null && aq6Var.r() == yp6.InMeasureBlock) {
                if (!this.n0) {
                    aq6 aq6VarV = aq6Var.v();
                    if (aq6VarV == null) {
                        break;
                    }
                    long j = ((l26) aq6VarV.F.d).d;
                    if (f72.f(j) && f72.e(j)) {
                        break;
                    }
                }
                aq6Var = aq6Var.v();
            }
            if (aq6Var == getRoot()) {
                requestLayout();
                return;
            }
        }
        if (getWidth() == 0 || getHeight() == 0) {
            requestLayout();
        } else {
            invalidate();
        }
    }

    public final long H(long j) {
        D();
        float fIntBitsToFloat = Float.intBitsToFloat((int) (j >> 32)) - Float.intBitsToFloat((int) (this.w0 >> 32));
        return pk7.b((((long) Float.floatToRawIntBits(Float.intBitsToFloat((int) (j & 4294967295L)) - Float.intBitsToFloat((int) (this.w0 & 4294967295L)))) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat) << 32), this.t0);
    }

    public final int I(MotionEvent motionEvent) {
        Object obj;
        if (this.X0) {
            this.X0 = false;
            ax6 ax6Var = getComposeViewContext().s;
            x3f.a.setValue(new zb9(motionEvent.getMetaState()));
        }
        d48 d48Var = this.I;
        gg5 gg5VarC = d48Var.c(this, motionEvent);
        int actionMasked = motionEvent.getActionMasked();
        ms msVar = this.J;
        if (gg5VarC == null) {
            if (!msVar.a) {
                ((ab7) ((my6) msVar.d).a).b();
                ((vn5) msVar.c).c();
            }
            return 0;
        }
        ArrayList arrayList = (ArrayList) gg5VarC.b;
        int size = arrayList.size() - 1;
        if (size >= 0) {
            while (true) {
                int i = size - 1;
                obj = arrayList.get(size);
                if (((tb9) obj).e && (actionMasked == 0 || actionMasked == 5)) {
                    break;
                }
                if (i < 0) {
                    break;
                }
                size = i;
            }
            obj = null;
        } else {
            obj = null;
        }
        tb9 tb9Var = (tb9) obj;
        if (tb9Var != null) {
            this.b = tb9Var.d;
        }
        int iD = msVar.d(gg5VarC, this, r(motionEvent));
        gg5VarC.c = null;
        if ((actionMasked != 0 && actionMasked != 5) || (iD & 1) != 0) {
            return iD;
        }
        int pointerId = motionEvent.getPointerId(motionEvent.getActionIndex());
        d48Var.c.delete(pointerId);
        d48Var.b.delete(pointerId);
        return iD;
    }

    public final void J(MotionEvent motionEvent, int i, long j, boolean z) {
        int actionMasked = motionEvent.getActionMasked();
        int actionIndex = -1;
        if (actionMasked != 1) {
            if (actionMasked == 6) {
                actionIndex = motionEvent.getActionIndex();
            }
        } else if (i != 9 && i != 10) {
            actionIndex = 0;
        }
        int pointerCount = motionEvent.getPointerCount() - (actionIndex >= 0 ? 1 : 0);
        if (pointerCount == 0) {
            return;
        }
        MotionEvent.PointerProperties[] pointerPropertiesArr = new MotionEvent.PointerProperties[pointerCount];
        for (int i2 = 0; i2 < pointerCount; i2++) {
            pointerPropertiesArr[i2] = new MotionEvent.PointerProperties();
        }
        MotionEvent.PointerCoords[] pointerCoordsArr = new MotionEvent.PointerCoords[pointerCount];
        for (int i3 = 0; i3 < pointerCount; i3++) {
            pointerCoordsArr[i3] = new MotionEvent.PointerCoords();
        }
        int i4 = 0;
        while (i4 < pointerCount) {
            int i5 = ((actionIndex < 0 || i4 < actionIndex) ? 0 : 1) + i4;
            motionEvent.getPointerProperties(i5, pointerPropertiesArr[i4]);
            MotionEvent.PointerCoords pointerCoords = pointerCoordsArr[i4];
            motionEvent.getPointerCoords(i5, pointerCoords);
            float f = pointerCoords.x;
            long jU = u((((long) Float.floatToRawIntBits(pointerCoords.y)) & 4294967295L) | (((long) Float.floatToRawIntBits(f)) << 32));
            pointerCoords.x = Float.intBitsToFloat((int) (jU >> 32));
            pointerCoords.y = Float.intBitsToFloat((int) (jU & 4294967295L));
            i4++;
        }
        MotionEvent motionEventObtain = MotionEvent.obtain(motionEvent.getDownTime() == motionEvent.getEventTime() ? j : motionEvent.getDownTime(), j, i, pointerCount, pointerPropertiesArr, pointerCoordsArr, motionEvent.getMetaState(), z ? 0 : motionEvent.getButtonState(), motionEvent.getXPrecision(), motionEvent.getYPrecision(), motionEvent.getDeviceId(), motionEvent.getEdgeFlags(), motionEvent.getSource(), motionEvent.getFlags());
        gg5 gg5VarC = this.I.c(this, motionEventObtain);
        gg5VarC.getClass();
        this.J.d(gg5VarC, this, true);
        motionEventObtain.recycle();
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.tb2 K(defpackage.b55 r11, defpackage.p92 r12) {
        /*
            r10 = this;
            boolean r0 = r12 instanceof defpackage.ln
            if (r0 == 0) goto L13
            r0 = r12
            ln r0 = (defpackage.ln) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            ln r0 = new ln
            r0.<init>(r10, r12)
        L18:
            java.lang.Object r12 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 0
            r4 = 1
            if (r2 == 0) goto L2e
            if (r2 == r4) goto L2a
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            return r3
        L2a:
            defpackage.br7.v(r12)
            goto L4b
        L2e:
            defpackage.br7.v(r12)
            gn r5 = new gn
            r12 = 2
            r5.<init>(r10, r12)
            r0.d = r4
            rna r4 = new rna
            r8 = 0
            r9 = 14
            java.util.concurrent.atomic.AtomicReference r6 = r10.C0
            r7 = r11
            r4.<init>(r5, r6, r7, r8, r9)
            java.lang.Object r10 = defpackage.o7f.s(r4, r0)
            if (r10 != r1) goto L4b
            return r1
        L4b:
            defpackage.z72.b()
            return r3
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mn.K(b55, p92):tb2");
    }

    public final void L(Configuration configuration) {
        k49 k49Var;
        Configuration configuration2 = getConfiguration();
        if (g76.L(configuration2, configuration)) {
            return;
        }
        setConfiguration(new Configuration(configuration));
        if (configuration2.fontScale != configuration.fontScale || configuration2.densityDpi != configuration.densityDpi) {
            setDensity(k40.g(getContext()));
        }
        if ((configuration2.diff(configuration) & (-1342235264)) == 0 || (k49Var = this.p.b) == null) {
            return;
        }
        k49Var.setValue(vv2.v(this));
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0056  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void M() {
        /*
            Method dump skipped, instruction units count: 275
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mn.M():void");
    }

    public final void N(float f) {
        if (p()) {
            if (f > 0.0f) {
                if (Float.isNaN(this.P0) || f > this.P0) {
                    this.P0 = f;
                    return;
                }
                return;
            }
            if (f < 0.0f) {
                if (Float.isNaN(this.Q0) || f < this.Q0) {
                    this.Q0 = f;
                }
            }
        }
    }

    @Override // defpackage.kr4
    public final void a(es4 es4Var, es4 es4Var2) {
        hj0 hj0Var;
        boolean z;
        hj0 hj0Var2;
        boolean z2;
        if (es4Var != null) {
            if (!es4Var.a.n) {
                b26.b("visitAncestors called on an unattached node");
            }
            q28 q28Var = es4Var.a;
            aq6 aq6VarV0 = flb.v0(es4Var);
            g78 g78Var = null;
            ArrayList arrayList = null;
            while (aq6VarV0 != null) {
                if ((((q28) aq6VarV0.F.g).d & 2097152) != 0) {
                    while (q28Var != null) {
                        if ((q28Var.c & 2097152) != 0) {
                            q28 q28VarQ0 = q28Var;
                            o78 o78Var = null;
                            while (q28VarQ0 != null) {
                                if (q28VarQ0 instanceof g16) {
                                    if (arrayList == null) {
                                        arrayList = new ArrayList();
                                    }
                                    arrayList.add(q28VarQ0);
                                    z2 = false;
                                } else {
                                    z2 = true;
                                }
                                if (z2 && (q28VarQ0.c & 2097152) != 0 && (q28VarQ0 instanceof b43)) {
                                    int i = 0;
                                    for (q28 q28Var2 = ((b43) q28VarQ0).p; q28Var2 != null; q28Var2 = q28Var2.f) {
                                        if ((q28Var2.c & 2097152) != 0) {
                                            i++;
                                            if (i == 1) {
                                                q28VarQ0 = q28Var2;
                                            } else {
                                                if (o78Var == null) {
                                                    o78Var = new o78(new q28[16]);
                                                }
                                                if (q28VarQ0 != null) {
                                                    o78Var.b(q28VarQ0);
                                                    q28VarQ0 = null;
                                                }
                                                o78Var.b(q28Var2);
                                            }
                                        }
                                    }
                                    if (i == 1) {
                                    }
                                }
                                q28VarQ0 = flb.q0(o78Var);
                            }
                        }
                        q28Var = q28Var.e;
                    }
                }
                aq6VarV0 = aq6VarV0.v();
                q28Var = (aq6VarV0 == null || (hj0Var2 = aq6VarV0.F) == null) ? null : (ffd) hj0Var2.f;
            }
            if (arrayList == null) {
                return;
            }
            if (es4Var2 != null) {
                if (!es4Var2.a.n) {
                    b26.b("visitAncestors called on an unattached node");
                }
                q28 q28Var3 = es4Var2.a;
                aq6 aq6VarV02 = flb.v0(es4Var2);
                g78 g78Var2 = null;
                while (aq6VarV02 != null) {
                    if ((((q28) aq6VarV02.F.g).d & 2097152) != 0) {
                        while (q28Var3 != null) {
                            if ((q28Var3.c & 2097152) != 0) {
                                q28 q28VarQ02 = q28Var3;
                                o78 o78Var2 = null;
                                while (q28VarQ02 != null) {
                                    if (q28VarQ02 instanceof g16) {
                                        if (g78Var2 == null) {
                                            g78 g78Var3 = iqb.a;
                                            g78Var2 = new g78();
                                        }
                                        g78Var2.a(q28VarQ02);
                                        z = false;
                                    } else {
                                        z = true;
                                    }
                                    if (z && (q28VarQ02.c & 2097152) != 0 && (q28VarQ02 instanceof b43)) {
                                        int i2 = 0;
                                        for (q28 q28Var4 = ((b43) q28VarQ02).p; q28Var4 != null; q28Var4 = q28Var4.f) {
                                            if ((q28Var4.c & 2097152) != 0) {
                                                i2++;
                                                if (i2 == 1) {
                                                    q28VarQ02 = q28Var4;
                                                } else {
                                                    if (o78Var2 == null) {
                                                        o78Var2 = new o78(new q28[16]);
                                                    }
                                                    if (q28VarQ02 != null) {
                                                        o78Var2.b(q28VarQ02);
                                                        q28VarQ02 = null;
                                                    }
                                                    o78Var2.b(q28Var4);
                                                }
                                            }
                                        }
                                        if (i2 == 1) {
                                        }
                                    }
                                    q28VarQ02 = flb.q0(o78Var2);
                                }
                            }
                            q28Var3 = q28Var3.e;
                        }
                    }
                    aq6VarV02 = aq6VarV02.v();
                    q28Var3 = (aq6VarV02 == null || (hj0Var = aq6VarV02.F) == null) ? null : (ffd) hj0Var.f;
                }
                g78Var = g78Var2;
            }
            int size = arrayList.size();
            for (int i3 = 0; i3 < size; i3++) {
                g16 g16Var = (g16) arrayList.get(i3);
                if (!(g78Var != null ? g78Var.c(g16Var) : false)) {
                    g16Var.a0();
                }
            }
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void addFocusables(ArrayList arrayList, int i, int i2) {
        es4 es4Var = ((or4) getFocusOwner()).c;
        if (!es4Var.n) {
            return;
        }
        if (!es4Var.a.n) {
            b26.b("visitSubtreeIf called on an unattached node");
        }
        o78 o78Var = new o78(new q28[16]);
        q28 q28Var = es4Var.a;
        q28 q28Var2 = q28Var.f;
        if (q28Var2 == null) {
            flb.X(o78Var, q28Var);
        } else {
            o78Var.b(q28Var2);
        }
        while (true) {
            int i3 = o78Var.c;
            if (i3 == 0) {
                return;
            }
            q28 q28Var3 = (q28) o78Var.m(i3 - 1);
            if ((q28Var3.d & 1024) != 0) {
                for (q28 q28Var4 = q28Var3; q28Var4 != null && q28Var4.n; q28Var4 = q28Var4.f) {
                    if ((q28Var4.c & 1024) != 0) {
                        q28 q28VarQ0 = q28Var4;
                        o78 o78Var2 = null;
                        while (q28VarQ0 != null) {
                            int i4 = 0;
                            if (q28VarQ0 instanceof es4) {
                                es4 es4Var2 = (es4) q28VarQ0;
                                if (es4Var2.n && es4Var2.K0().a) {
                                    super.addFocusables(arrayList, i, i2);
                                    es4 es4Var3 = ((or4) getFocusOwner()).c;
                                    if (es4Var3.n) {
                                        if (!es4Var3.a.n) {
                                            b26.b("visitSubtreeIf called on an unattached node");
                                        }
                                        o78 o78Var3 = new o78(new q28[16]);
                                        q28 q28Var5 = es4Var3.a;
                                        q28 q28Var6 = q28Var5.f;
                                        if (q28Var6 == null) {
                                            flb.X(o78Var3, q28Var5);
                                        } else {
                                            o78Var3.b(q28Var6);
                                        }
                                        while (true) {
                                            int i5 = o78Var3.c;
                                            if (i5 == 0) {
                                                break;
                                            }
                                            q28 q28Var7 = (q28) o78Var3.m(i5 - 1);
                                            if ((q28Var7.d & 1024) != 0) {
                                                for (q28 q28Var8 = q28Var7; q28Var8 != null && q28Var8.n; q28Var8 = q28Var8.f) {
                                                    if ((q28Var8.c & 1024) != 0) {
                                                        q28 q28VarQ02 = q28Var8;
                                                        o78 o78Var4 = null;
                                                        while (q28VarQ02 != null) {
                                                            if (q28VarQ02 instanceof es4) {
                                                                es4 es4Var4 = (es4) q28VarQ02;
                                                                if (es4Var4.n) {
                                                                    qr4 qr4VarK0 = es4Var4.K0();
                                                                    if (es4Var4.n && !es4Var4.o && qr4VarK0.a) {
                                                                        return;
                                                                    }
                                                                }
                                                            } else if ((q28VarQ02.c & 1024) != 0 && (q28VarQ02 instanceof b43)) {
                                                                int i6 = 0;
                                                                for (q28 q28Var9 = ((b43) q28VarQ02).p; q28Var9 != null; q28Var9 = q28Var9.f) {
                                                                    if ((q28Var9.c & 1024) != 0) {
                                                                        i6++;
                                                                        if (i6 == 1) {
                                                                            q28VarQ02 = q28Var9;
                                                                        } else {
                                                                            if (o78Var4 == null) {
                                                                                o78Var4 = new o78(new q28[16]);
                                                                            }
                                                                            if (q28VarQ02 != null) {
                                                                                o78Var4.b(q28VarQ02);
                                                                                q28VarQ02 = null;
                                                                            }
                                                                            o78Var4.b(q28Var9);
                                                                        }
                                                                    }
                                                                }
                                                                if (i6 == 1) {
                                                                }
                                                            }
                                                            q28VarQ02 = flb.q0(o78Var4);
                                                        }
                                                    }
                                                }
                                            }
                                            flb.X(o78Var3, q28Var7);
                                        }
                                    }
                                    if (arrayList != null) {
                                        arrayList.remove(this);
                                        return;
                                    }
                                    return;
                                }
                            } else if ((q28VarQ0.c & 1024) != 0 && (q28VarQ0 instanceof b43)) {
                                for (q28 q28Var10 = ((b43) q28VarQ0).p; q28Var10 != null; q28Var10 = q28Var10.f) {
                                    if ((q28Var10.c & 1024) != 0) {
                                        i4++;
                                        if (i4 == 1) {
                                            q28VarQ0 = q28Var10;
                                        } else {
                                            if (o78Var2 == null) {
                                                o78Var2 = new o78(new q28[16]);
                                            }
                                            if (q28VarQ0 != null) {
                                                o78Var2.b(q28VarQ0);
                                                q28VarQ0 = null;
                                            }
                                            o78Var2.b(q28Var10);
                                        }
                                    }
                                }
                                if (i4 == 1) {
                                }
                            }
                            q28VarQ0 = flb.q0(o78Var2);
                        }
                    }
                }
            }
            flb.X(o78Var, q28Var3);
        }
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i) {
        view.getClass();
        ViewGroup.LayoutParams layoutParams = view.getLayoutParams();
        if (layoutParams == null) {
            layoutParams = generateDefaultLayoutParams();
        }
        addViewInLayout(view, i, layoutParams, true);
    }

    @Override // android.view.View
    public final void autofill(SparseArray sparseArray) {
        if (g()) {
            lm lmVar = this.N;
            if (lmVar != null) {
                lmVar.b(sparseArray);
            }
            hm hmVar = this.M;
            if (hmVar != null) {
                epe.Q(hmVar, sparseArray);
            }
        }
    }

    @Override // android.view.View
    public final boolean canScrollHorizontally(int i) {
        return this.z.m(i, this.b, false);
    }

    @Override // android.view.View
    public final boolean canScrollVertically(int i) {
        return this.z.m(i, this.b, true);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchDraw(Canvas canvas) {
        x68 x68Var = this.E;
        if (!isAttachedToWindow()) {
            n(getRoot());
        }
        v(true);
        uic.h().m();
        this.G = true;
        Trace.beginSection("AndroidOwner:draw");
        try {
            h61 h61Var = this.s;
            pm pmVar = h61Var.a;
            Canvas canvas2 = pmVar.a;
            pmVar.a = canvas;
            getRoot().i(pmVar, null);
            h61Var.a.a = canvas2;
            if (x68Var.i()) {
                int i = x68Var.b;
                for (int i2 = 0; i2 < i; i2++) {
                    ((rf5) ((lx8) x68Var.f(i2))).g();
                }
            }
            int i3 = nue.a;
            x68Var.d();
            this.G = false;
            Trace.endSection();
            x68 x68Var2 = this.F;
            if (x68Var2 != null) {
                x68Var.b(x68Var2);
                x68Var2.d();
            }
            if (p()) {
                az.a(this, this.P0);
                View view = this.l;
                if (view != null) {
                    az.a(view, this.Q0);
                    if (!Float.isNaN(this.Q0)) {
                        view.invalidate();
                        drawChild(canvas, view, getDrawingTime());
                    }
                }
                this.P0 = Float.NaN;
                this.Q0 = Float.NaN;
            }
        } catch (Throwable th) {
            Trace.endSection();
            throw th;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:329:0x04fb A[PHI: r5
      0x04fb: PHI (r5v66 ??) = (r5v87 ??), (r5v88 ??), (r5v89 ??) binds: [B:310:0x04bd, B:312:0x04c1, B:327:0x04f4] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:464:0x06df A[PHI: r4
      0x06df: PHI (r4v28 ??) = (r4v67 ??), (r4v68 ??), (r4v69 ??) binds: [B:445:0x06a5, B:447:0x06a9, B:462:0x06da] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Type inference failed for: r32v0 */
    /* JADX WARN: Type inference failed for: r32v1, types: [boolean] */
    /* JADX WARN: Type inference failed for: r32v2 */
    /* JADX WARN: Type inference failed for: r38v0 */
    /* JADX WARN: Type inference failed for: r38v1, types: [boolean] */
    /* JADX WARN: Type inference failed for: r38v2 */
    /* JADX WARN: Type inference failed for: r3v30 */
    /* JADX WARN: Type inference failed for: r3v31 */
    /* JADX WARN: Type inference failed for: r3v40 */
    /* JADX WARN: Type inference failed for: r3v41, types: [q28] */
    /* JADX WARN: Type inference failed for: r3v42, types: [q28] */
    /* JADX WARN: Type inference failed for: r3v43 */
    /* JADX WARN: Type inference failed for: r3v44, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r3v45 */
    /* JADX WARN: Type inference failed for: r3v46 */
    /* JADX WARN: Type inference failed for: r3v47 */
    /* JADX WARN: Type inference failed for: r3v48 */
    /* JADX WARN: Type inference failed for: r3v57 */
    /* JADX WARN: Type inference failed for: r3v58 */
    /* JADX WARN: Type inference failed for: r3v59 */
    /* JADX WARN: Type inference failed for: r4v26 */
    /* JADX WARN: Type inference failed for: r4v27 */
    /* JADX WARN: Type inference failed for: r4v28, types: [o78] */
    /* JADX WARN: Type inference failed for: r4v29 */
    /* JADX WARN: Type inference failed for: r4v30 */
    /* JADX WARN: Type inference failed for: r4v31 */
    /* JADX WARN: Type inference failed for: r4v32, types: [o78] */
    /* JADX WARN: Type inference failed for: r4v39 */
    /* JADX WARN: Type inference failed for: r4v40 */
    /* JADX WARN: Type inference failed for: r4v49 */
    /* JADX WARN: Type inference failed for: r4v50, types: [q28] */
    /* JADX WARN: Type inference failed for: r4v51, types: [q28] */
    /* JADX WARN: Type inference failed for: r4v52 */
    /* JADX WARN: Type inference failed for: r4v53, types: [java.lang.Object] */
    /* JADX WARN: Type inference failed for: r4v54 */
    /* JADX WARN: Type inference failed for: r4v55 */
    /* JADX WARN: Type inference failed for: r4v56 */
    /* JADX WARN: Type inference failed for: r4v57 */
    /* JADX WARN: Type inference failed for: r4v59 */
    /* JADX WARN: Type inference failed for: r4v60 */
    /* JADX WARN: Type inference failed for: r4v61 */
    /* JADX WARN: Type inference failed for: r4v62 */
    /* JADX WARN: Type inference failed for: r4v63 */
    /* JADX WARN: Type inference failed for: r4v64 */
    /* JADX WARN: Type inference failed for: r4v65 */
    /* JADX WARN: Type inference failed for: r4v66 */
    /* JADX WARN: Type inference failed for: r4v67 */
    /* JADX WARN: Type inference failed for: r4v68 */
    /* JADX WARN: Type inference failed for: r4v69 */
    /* JADX WARN: Type inference failed for: r5v47 */
    /* JADX WARN: Type inference failed for: r5v64 */
    /* JADX WARN: Type inference failed for: r5v65 */
    /* JADX WARN: Type inference failed for: r5v66, types: [o78] */
    /* JADX WARN: Type inference failed for: r5v67 */
    /* JADX WARN: Type inference failed for: r5v68 */
    /* JADX WARN: Type inference failed for: r5v69 */
    /* JADX WARN: Type inference failed for: r5v70, types: [o78] */
    /* JADX WARN: Type inference failed for: r5v82 */
    /* JADX WARN: Type inference failed for: r5v83 */
    /* JADX WARN: Type inference failed for: r5v84 */
    /* JADX WARN: Type inference failed for: r5v85 */
    /* JADX WARN: Type inference failed for: r5v86 */
    /* JADX WARN: Type inference failed for: r5v87 */
    /* JADX WARN: Type inference failed for: r5v88 */
    /* JADX WARN: Type inference failed for: r5v89 */
    /* JADX WARN: Type inference failed for: r6v47 */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean dispatchGenericMotionEvent(android.view.MotionEvent r43) {
        /*
            Method dump skipped, instruction units count: 2016
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mn.dispatchGenericMotionEvent(android.view.MotionEvent):boolean");
    }

    /* JADX WARN: Removed duplicated region for block: B:66:0x0159  */
    @Override // android.view.ViewGroup, android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final boolean dispatchHoverEvent(android.view.MotionEvent r24) {
        /*
            Method dump skipped, instruction units count: 354
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mn.dispatchHoverEvent(android.view.MotionEvent):boolean");
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        int i = 0;
        if (!isFocused()) {
            return ((or4) getFocusOwner()).d(keyEvent, new cn(this, i, keyEvent));
        }
        ax6 ax6Var = getComposeViewContext().s;
        x3f.a.setValue(new zb9(keyEvent.getMetaState()));
        return ((or4) getFocusOwner()).d(keyEvent, ot2.x) || super.dispatchKeyEvent(keyEvent);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean dispatchKeyEventPreIme(KeyEvent keyEvent) {
        hj0 hj0Var;
        if (isFocused()) {
            or4 or4Var = (or4) getFocusOwner();
            if (or4Var.d.e) {
                System.out.println((Object) "FocusRelatedWarning: Dispatching intercepted soft keyboard event while the focus system is invalidated.");
            } else {
                es4 es4VarM = rx0.M(or4Var.c);
                if (es4VarM != null) {
                    if (!es4VarM.a.n) {
                        b26.b("visitAncestors called on an unattached node");
                    }
                    q28 q28Var = es4VarM.a;
                    aq6 aq6VarV0 = flb.v0(es4VarM);
                    while (aq6VarV0 != null) {
                        if ((((q28) aq6VarV0.F.g).d & 131072) != 0) {
                            while (q28Var != null) {
                                if ((q28Var.c & 131072) != 0) {
                                    q28 q28VarQ0 = q28Var;
                                    o78 o78Var = null;
                                    while (q28VarQ0 != null) {
                                        if ((q28VarQ0.c & 131072) != 0 && (q28VarQ0 instanceof b43)) {
                                            int i = 0;
                                            for (q28 q28Var2 = ((b43) q28VarQ0).p; q28Var2 != null; q28Var2 = q28Var2.f) {
                                                if ((q28Var2.c & 131072) != 0) {
                                                    i++;
                                                    if (i == 1) {
                                                        q28VarQ0 = q28Var2;
                                                    } else {
                                                        if (o78Var == null) {
                                                            o78Var = new o78(new q28[16]);
                                                        }
                                                        if (q28VarQ0 != null) {
                                                            o78Var.b(q28VarQ0);
                                                            q28VarQ0 = null;
                                                        }
                                                        o78Var.b(q28Var2);
                                                    }
                                                }
                                            }
                                            if (i == 1) {
                                            }
                                        }
                                        q28VarQ0 = flb.q0(o78Var);
                                    }
                                }
                                q28Var = q28Var.e;
                            }
                        }
                        aq6VarV0 = aq6VarV0.v();
                        q28Var = (aq6VarV0 == null || (hj0Var = aq6VarV0.F) == null) ? null : (ffd) hj0Var.f;
                    }
                }
            }
        }
        return super.dispatchKeyEventPreIme(keyEvent);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void dispatchProvideStructure(ViewStructure viewStructure) {
        if (Build.VERSION.SDK_INT < 28) {
            un.a.a(viewStructure, getView());
        } else {
            super.dispatchProvideStructure(viewStructure);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean dispatchTouchEvent(MotionEvent motionEvent) {
        Object tf0Var;
        es4 es4VarF;
        if (this.T0) {
            vm vmVar = this.S0;
            removeCallbacks(vmVar);
            MotionEvent motionEvent2 = this.L0;
            motionEvent2.getClass();
            if (motionEvent.getActionMasked() == 0 && motionEvent2.getSource() == motionEvent.getSource() && motionEvent2.getToolType(0) == motionEvent.getToolType(0)) {
                this.T0 = false;
            } else {
                vmVar.run();
            }
        }
        if (!q(motionEvent) && isAttachedToWindow() && (motionEvent.getActionMasked() != 2 || s(motionEvent))) {
            int iM = m(motionEvent);
            int i = 1;
            if ((iM & 2) != 0) {
                getParent().requestDisallowInterceptTouchEvent(true);
            }
            boolean z = motionEvent.getActionMasked() == 0 || motionEvent.getActionMasked() == 5;
            boolean z2 = motionEvent.isFromSource(8194) || motionEvent.isFromSource(1048584);
            if (z && z2) {
                Object parent = getParent();
                View view = parent instanceof View ? (View) parent : null;
                if (view == null || (tf0Var = view.getTag(R.id.auto_clear_focus_behavior_tag)) == null) {
                    tf0Var = new tf0(i);
                }
                if (tf0Var.equals(new tf0(i)) && (es4VarF = ((or4) getFocusOwner()).f()) != null) {
                    eh8 eh8VarU0 = flb.u0(es4VarF);
                    if (!sgg.K(eh8VarU0).H(eh8VarU0, true).a((((long) Float.floatToRawIntBits(motionEvent.getX())) << 32) | (((long) Float.floatToRawIntBits(motionEvent.getY())) & 4294967295L))) {
                        km4.m(getFocusOwner());
                    }
                }
            }
            if ((iM & 1) != 0) {
                return true;
            }
        }
        return false;
    }

    public final void e(int i, AccessibilityNodeInfo accessibilityNodeInfo, String str) {
        int iD;
        sn snVar = this.z;
        if (g76.L(str, snVar.D)) {
            int iD2 = snVar.B.d(i);
            if (iD2 != -1) {
                accessibilityNodeInfo.getExtras().putInt(str, iD2);
                return;
            }
            return;
        }
        if (!g76.L(str, snVar.E) || (iD = snVar.C.d(i)) == -1) {
            return;
        }
        accessibilityNodeInfo.getExtras().putInt(str, iD);
    }

    public final View findViewByAccessibilityIdTraversal(int i) throws IllegalAccessException, InvocationTargetException {
        try {
            if (Build.VERSION.SDK_INT < 29) {
                return k(this, i);
            }
            Method declaredMethod = View.class.getDeclaredMethod("findViewByAccessibilityIdTraversal", Integer.TYPE);
            declaredMethod.setAccessible(true);
            Object objInvoke = declaredMethod.invoke(this, Integer.valueOf(i));
            if (objInvoke instanceof View) {
                return (View) objInvoke;
            }
            return null;
        } catch (NoSuchMethodException unused) {
            return null;
        }
    }

    @Override // android.view.ViewGroup, android.view.ViewParent
    public final View focusSearch(View view, int i) {
        zwa zwaVarA;
        if (view == null || this.o0.b) {
            return super.focusSearch(view, i);
        }
        View rootView = getRootView();
        rootView.getClass();
        View viewFindNextFocus = FocusFinder.getInstance().findNextFocus((ViewGroup) rootView, view, i);
        if (viewFindNextFocus == null || !bo.I(this, viewFindNextFocus)) {
            viewFindNextFocus = null;
        }
        if (view == this) {
            es4 es4VarM = rx0.M(((or4) getFocusOwner()).c);
            zwaVarA = es4VarM != null ? rx0.N(es4VarM) : null;
            if (zwaVarA == null) {
                zwaVarA = ir4.a(view, this);
            }
        } else {
            zwaVarA = ir4.a(view, this);
        }
        br4 br4VarD = ir4.d(i);
        int i2 = br4VarD != null ? br4VarD.a : 6;
        rya ryaVar = new rya();
        if (((or4) getFocusOwner()).e(i2, zwaVarA, new en(ryaVar, 0)) == null) {
            return view;
        }
        Object obj = ryaVar.a;
        if (obj == null) {
            if (viewFindNextFocus == null) {
                return super.focusSearch(view, i);
            }
        } else if (viewFindNextFocus == null || i2 == 1 || i2 == 2 || gr7.q(rx0.N((es4) obj), ir4.a(viewFindNextFocus, this), zwaVarA, i2)) {
            return this;
        }
        return viewFindNextFocus;
    }

    public final gu getAndroidViewsHandler$ui() {
        if (this.l0 == null) {
            gu guVar = new gu(getContext());
            this.l0 = guVar;
            addView(guVar, -1);
            requestLayout();
        }
        gu guVar2 = this.l0;
        guVar2.getClass();
        return guVar2;
    }

    public lk0 getAutofill() {
        return this.M;
    }

    public tk0 getAutofillManager() {
        return this.N;
    }

    public uk0 getAutofillTree() {
        return this.D;
    }

    public final u12 getComposeViewContext() {
        return get_composeViewContext();
    }

    public final boolean getComposeViewContextIncrementedDuringInit$ui() {
        return this.Y0;
    }

    public final Configuration getConfiguration() {
        return (Configuration) this.K.getValue();
    }

    public final mo getContentCaptureManager$ui() {
        return this.A;
    }

    public ib2 getCoroutineContext() {
        return this.n;
    }

    public m73 getDensity() {
        return (m73) this.k.getValue();
    }

    public zwa getEmbeddedViewFocusRect() {
        if (isFocused()) {
            es4 es4VarM = rx0.M(((or4) getFocusOwner()).c);
            if (es4VarM != null) {
                return rx0.N(es4VarM);
            }
            return null;
        }
        View viewFindFocus = findFocus();
        if (viewFindFocus != null) {
            return ir4.a(viewFindFocus, this);
        }
        return null;
    }

    public lr4 getFocusOwner() {
        return this.m;
    }

    @Override // android.view.View
    public final void getFocusedRect(Rect rect) {
        zwa embeddedViewFocusRect = getEmbeddedViewFocusRect();
        if (embeddedViewFocusRect != null) {
            rect.left = Math.round(embeddedViewFocusRect.a);
            rect.top = Math.round(embeddedViewFocusRect.b);
            rect.right = Math.round(embeddedViewFocusRect.c);
            rect.bottom = Math.round(embeddedViewFocusRect.d);
            return;
        }
        if (g76.L(((or4) getFocusOwner()).e(6, null, fn.b), Boolean.TRUE)) {
            super.getFocusedRect(rect);
        } else {
            rect.set(Integer.MIN_VALUE, Integer.MIN_VALUE, Integer.MIN_VALUE, Integer.MIN_VALUE);
        }
    }

    public yy4 getFontFamilyResolver() {
        return (yy4) this.F0.getValue();
    }

    public uy4 getFontLoader() {
        return this.E0;
    }

    public final ny6 getFrameEndScheduler$ui() {
        return this.f;
    }

    public lf5 getGraphicsContext() {
        return this.C;
    }

    public li5 getHapticFeedBack() {
        return this.H0;
    }

    public boolean getHasPendingMeasureOrLayout() {
        return ((m50) this.o0.e).G() || !this.i.isEmpty();
    }

    @Override // android.view.View
    public int getImportantForAutofill() {
        return 1;
    }

    public v26 getInputModeManager() {
        return this.I0;
    }

    public final f36 getInsetsListener() {
        return this.u;
    }

    public final long getLastMatrixRecalculationAnimationTime$ui() {
        return this.u0;
    }

    @Override // android.view.View, android.view.ViewParent
    public ip6 getLayoutDirection() {
        return (ip6) this.G0.getValue();
    }

    public h67 getLocaleList() {
        return (h67) this.L.getValue();
    }

    public long getMeasureIteration() {
        if (this.o0.b) {
            return 1L;
        }
        b26.a("measureIteration should be only used during the measure/layout pass");
        return 1L;
    }

    public s28 getModifierLocalManager() {
        return this.J0;
    }

    public mn getOutOfFrameExecutor() {
        if (isAttachedToWindow()) {
            return this;
        }
        return null;
    }

    public s99 getPlacementScope() {
        int i = u99.b;
        return new gb7(1, this);
    }

    public qb9 getPointerIconService() {
        return this.b1;
    }

    /* JADX INFO: renamed from: getPrimaryDirectionalMotionAxisOverride-dqNNBbU$ui, reason: not valid java name */
    public final x06 m129getPrimaryDirectionalMotionAxisOverridedqNNBbU$ui() {
        return this.d;
    }

    public cxa getRectManager() {
        return this.x;
    }

    public ijb getRetainedValuesStore() {
        return this.h;
    }

    public aq6 getRoot() {
        return this.v;
    }

    public final boolean getScrollCaptureInProgress$ui() {
        l82 l82Var;
        if (Build.VERSION.SDK_INT < 31 || (l82Var = this.Z0) == null) {
            return false;
        }
        return ((Boolean) ((k49) l82Var.b).getValue()).booleanValue();
    }

    public cyb getSemanticsOwner() {
        return this.y;
    }

    public cq6 getSharedDrawScope() {
        return this.e;
    }

    public boolean getShowLayoutBounds() {
        return Build.VERSION.SDK_INT >= 30 ? wy.a.a(this) : this.S;
    }

    public px8 getSnapshotObserver() {
        return this.R;
    }

    public akc getSoftwareKeyboardController() {
        n43 n43Var = this.D0;
        if (n43Var != null) {
            return n43Var;
        }
        n43 n43Var2 = new n43(getTextInputService());
        this.D0 = n43Var2;
        return n43Var2;
    }

    public zid getTextInputService() {
        zid zidVar = this.B0;
        if (zidVar != null) {
            return zidVar;
        }
        zid zidVar2 = new zid(getLegacyTextInputServiceAndroid());
        this.B0 = zidVar2;
        return zidVar2;
    }

    public okd getTextToolbar() {
        return this.K0;
    }

    public final llb getUncaughtExceptionHandler$ui() {
        return null;
    }

    public zte getViewConfiguration() {
        return this.t;
    }

    public final zm getViewTreeOwners() {
        lv8.z(this.y0.getValue());
        return null;
    }

    public w3f getWindowInfo() {
        return getComposeViewContext().s;
    }

    public final lm get_autofillManager$ui() {
        return this.N;
    }

    public final lx8 j(b55 b55Var, bh8 bh8Var, of5 of5Var) {
        o78 o78Var;
        Reference referencePoll;
        Object obj;
        if (of5Var != null) {
            return new rf5(of5Var, null, this, b55Var, bh8Var);
        }
        do {
            mya myaVar = this.N0;
            ReferenceQueue referenceQueue = (ReferenceQueue) myaVar.c;
            o78Var = (o78) myaVar.b;
            referencePoll = referenceQueue.poll();
            if (referencePoll != null) {
                o78Var.l(referencePoll);
            }
        } while (referencePoll != null);
        while (true) {
            int i = o78Var.c;
            if (i == 0) {
                obj = null;
                break;
            }
            obj = ((Reference) o78Var.m(i - 1)).get();
            if (obj != null) {
                break;
            }
        }
        lx8 lx8Var = (lx8) obj;
        if (lx8Var == null) {
            return new rf5(getGraphicsContext().b(), getGraphicsContext(), this, b55Var, bh8Var);
        }
        rf5 rf5Var = (rf5) lx8Var;
        lf5 lf5Var = rf5Var.b;
        if (lf5Var == null) {
            throw lv8.v("currently reuse is only supported when we manage the layer lifecycle");
        }
        if (!rf5Var.a.s) {
            b26.a("layer should have been released before reuse");
        }
        rf5Var.a = lf5Var.b();
        rf5Var.g = false;
        rf5Var.d = b55Var;
        rf5Var.e = bh8Var;
        rf5Var.q = false;
        rf5Var.r = false;
        rf5Var.s = true;
        pk7.d(rf5Var.h);
        float[] fArr = rf5Var.i;
        if (fArr != null) {
            pk7.d(fArr);
        }
        rf5Var.o = nrd.b;
        rf5Var.t = false;
        rf5Var.f = 9223372034707292159L;
        rf5Var.p = null;
        rf5Var.n = 0;
        return lx8Var;
    }

    public final void l(aq6 aq6Var, boolean z) {
        this.o0.m(aq6Var, z);
    }

    /* JADX WARN: Removed duplicated region for block: B:37:0x007b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final int m(android.view.MotionEvent r17) {
        /*
            Method dump skipped, instruction units count: 373
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mn.m(android.view.MotionEvent):int");
    }

    public final void o(aq6 aq6Var) {
        this.o0.D(aq6Var, false);
        o78 o78VarZ = aq6Var.z();
        Object[] objArr = o78VarZ.a;
        int i = o78VarZ.c;
        for (int i2 = 0; i2 < i; i2++) {
            o((aq6) objArr[i2]);
        }
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        ijb ijbVar;
        Object obj;
        hm hmVar;
        super.onAttachedToWindow();
        setAttached(true);
        int i = Build.VERSION.SDK_INT;
        if (i < 30) {
            setShowLayoutBounds(gx1.J());
        }
        this.u.onViewAttachedToWindow(this);
        int i2 = 0;
        if (i > 28) {
            if (g1 == null) {
                e eVar = new e(5);
                g1 = eVar;
                StrictMode.VmPolicy vmPolicy = StrictMode.getVmPolicy();
                try {
                    if (c1 == null) {
                        c1 = Class.forName("android.os.SystemProperties");
                    }
                    Method declaredMethod = e1;
                    if (declaredMethod == null) {
                        StrictMode.setVmPolicy(StrictMode.VmPolicy.LAX);
                        Class cls = c1;
                        declaredMethod = cls != null ? cls.getDeclaredMethod("addChangeCallback", Runnable.class) : null;
                        e1 = declaredMethod;
                    }
                    if (declaredMethod != null) {
                        declaredMethod.invoke(null, eVar);
                    }
                } catch (Throwable unused) {
                }
                StrictMode.setVmPolicy(vmPolicy);
            }
            x68 x68Var = f1;
            synchronized (x68Var) {
                x68Var.a(this);
            }
        }
        if (!this.Y0) {
            getComposeViewContext().c();
        }
        this.Y0 = false;
        o(getRoot());
        n(getRoot());
        getSnapshotObserver().a.e();
        if (g() && (hmVar = this.M) != null) {
            pk0.a.a(hmVar);
        }
        iy6 iy6Var = getComposeViewContext().c;
        wue wueVar = getComposeViewContext().e;
        ny6 ny6Var = this.f;
        if (iy6Var == null || wueVar == null || ny6Var == null) {
            ijbVar = null;
        } else {
            vue viewModelStore = wueVar.getViewModelStore();
            i33 i33Var = new i33(4);
            og2 og2Var = og2.b;
            viewModelStore.getClass();
            og2Var.getClass();
            o2b o2bVar = new o2b(viewModelStore, i33Var, og2Var);
            wg6 wg6VarB = n1b.a.b(py6.class);
            String strD = wg6VarB.d();
            if (strD == null) {
                ay0.e("Local and anonymous classes can not be ViewModels");
                return;
            }
            py6 py6Var = (py6) o2bVar.o(wg6VarB, "androidx.lifecycle.ViewModelProvider.DefaultKey:".concat(strD));
            Object parent = getParent();
            parent.getClass();
            int id = ((View) parent).getId();
            k68 k68Var = py6Var.b;
            Object objB = k68Var.b(id);
            if (objB == null) {
                objB = new x68(1);
                k68Var.i(id, objB);
            }
            x68 x68Var2 = (x68) objB;
            Object[] objArr = x68Var2.a;
            int i3 = x68Var2.b;
            while (true) {
                if (i2 >= i3) {
                    obj = null;
                    break;
                }
                obj = objArr[i2];
                if (!((oy6) obj).c) {
                    break;
                } else {
                    i2++;
                }
            }
            oy6 oy6Var = (oy6) obj;
            if (oy6Var == null) {
                oy6Var = new oy6();
                x68Var2.a(oy6Var);
            }
            oy6Var.c = true;
            this.g = oy6Var;
            ijbVar = oy6Var.b;
        }
        if (ijbVar == null) {
            ijbVar = no3.d;
        }
        this.h = ijbVar;
        x45 x45Var = this.z0;
        if (x45Var != null) {
            x45Var.invoke(getComposeViewContext());
            this.z0 = null;
        }
        wx6 lifecycle = getComposeViewContext().c.getLifecycle();
        lifecycle.a(this);
        lifecycle.a(this.A);
        this.I0.a.setValue(new u26(isInTouchMode() ? 1 : 2));
        getViewTreeObserver().addOnGlobalLayoutListener(this);
        getViewTreeObserver().addOnScrollChangedListener(this);
        getViewTreeObserver().addOnTouchModeChangeListener(this);
        if (Build.VERSION.SDK_INT >= 31) {
            yn.a.b(this);
        }
        lm lmVar = this.N;
        if (lmVar != null) {
            ((or4) getFocusOwner()).g.a(lmVar);
            getSemanticsOwner().d.a(lmVar);
        }
        ((or4) getFocusOwner()).g.a(this);
    }

    @Override // android.view.View
    public final boolean onCheckIsTextEditor() {
        i1c i1cVar = (i1c) this.C0.get();
        kr krVar = (kr) (i1cVar != null ? i1cVar.b : null);
        if (krVar == null) {
            return getLegacyTextInputServiceAndroid().d;
        }
        i1c i1cVar2 = (i1c) krVar.d.get();
        t26 t26Var = (t26) (i1cVar2 != null ? i1cVar2.b : null);
        return t26Var != null && (t26Var.e ^ true);
    }

    @Override // android.view.View
    public final void onConfigurationChanged(Configuration configuration) {
        super.onConfigurationChanged(configuration);
        L(configuration);
    }

    /* JADX WARN: Removed duplicated region for block: B:58:0x00a3  */
    /* JADX WARN: Removed duplicated region for block: B:61:0x00ac  */
    /* JADX WARN: Removed duplicated region for block: B:74:0x00f5  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final android.view.inputmethod.InputConnection onCreateInputConnection(android.view.inputmethod.EditorInfo r15) {
        /*
            Method dump skipped, instruction units count: 382
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mn.onCreateInputConnection(android.view.inputmethod.EditorInfo):android.view.inputmethod.InputConnection");
    }

    @Override // android.view.View
    public final void onCreateVirtualViewTranslationRequests(long[] jArr, int[] iArr, Consumer consumer) {
        mo moVar = this.A;
        moVar.getClass();
        io.n(moVar, jArr, consumer);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        hm hmVar;
        super.onDetachedFromWindow();
        setAttached(false);
        this.u.onViewDetachedFromWindow(this);
        View view = this.l;
        if (p() && view != null) {
            removeView(view);
        }
        int i = Build.VERSION.SDK_INT;
        if (i > 28) {
            x68 x68Var = f1;
            synchronized (x68Var) {
                x68Var.j(this);
            }
        }
        getComposeViewContext().b();
        gjc gjcVar = getSnapshotObserver().a;
        o19 o19Var = gjcVar.h;
        if (o19Var != null) {
            o19Var.b();
        }
        gjcVar.a();
        wx6 lifecycle = getComposeViewContext().c.getLifecycle();
        lifecycle.b(this.A);
        lifecycle.b(this);
        if (g() && (hmVar = this.M) != null) {
            pk0.a.b(hmVar);
        }
        getViewTreeObserver().removeOnGlobalLayoutListener(this);
        getViewTreeObserver().removeOnScrollChangedListener(this);
        getViewTreeObserver().removeOnTouchModeChangeListener(this);
        oy6 oy6Var = this.g;
        if (oy6Var != null) {
            oy6Var.c = false;
        }
        this.g = null;
        if (i >= 31) {
            yn.a.a(this);
        }
        lm lmVar = this.N;
        if (lmVar != null) {
            getSemanticsOwner().d.j(lmVar);
            ((or4) getFocusOwner()).g.j(lmVar);
        }
        cxa rectManager = getRectManager();
        rectManager.f = rectManager.c.b(0L, 0L, null, 0, 0);
        getRectManager().a();
        cxa rectManager2 = getRectManager();
        wm wmVar = rectManager2.h;
        if (wmVar != null) {
            mn mnVar = rectManager2.a;
            if (!y30.C(wmVar)) {
                wmVar = null;
            }
            if (wmVar != null) {
                mnVar.removeCallbacks(wmVar);
            }
            rectManager2.h = null;
        }
        ((or4) getFocusOwner()).g.j(this);
    }

    @Override // android.view.View
    public final void onFocusChanged(boolean z, int i, Rect rect) {
        super.onFocusChanged(z, i, rect);
        if (z || hasFocus()) {
            return;
        }
        or4 or4Var = (or4) getFocusOwner();
        k50.W(or4Var.c, true);
        if (or4Var.f() != null) {
            es4 es4VarF = or4Var.f();
            or4Var.i(null);
            if (es4VarF != null) {
                es4VarF.J0(zr4.Active, zr4.Inactive);
            }
        }
    }

    @Override // android.view.ViewTreeObserver.OnGlobalLayoutListener
    public final void onGlobalLayout() {
        this.u0 = 0L;
        M();
        int i = Build.VERSION.SDK_INT;
        if (32 > i || i >= 34) {
            return;
        }
        L(getResources().getConfiguration());
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onLayout(boolean z, int i, int i2, int i3, int i4) {
        Trace.beginSection("AndroidOwner:onLayout");
        try {
            this.u0 = 0L;
            this.o0.s(this.V0);
            this.m0 = null;
            M();
            if (this.l0 != null) {
                Trace.beginSection("AndroidOwner:viewLayout");
                getAndroidViewsHandler$ui().layout(0, 0, i3 - i, i4 - i2);
                Trace.endSection();
            }
        } catch (Throwable th) {
            throw th;
        } finally {
            Trace.endSection();
        }
    }

    @Override // android.view.View
    public final void onMeasure(int i, int i2) {
        w73 w73Var = this.o0;
        Trace.beginSection("AndroidOwner:onMeasure");
        try {
            if (!isAttachedToWindow()) {
                o(getRoot());
            }
            long jI = i(i);
            long jI2 = i(i2);
            long jP = g01.P((int) (jI >>> 32), (int) (jI & 4294967295L), (int) (jI2 >>> 32), (int) (4294967295L & jI2));
            f72 f72Var = this.m0;
            if (f72Var == null) {
                this.m0 = new f72(jP);
                this.n0 = false;
            } else if (!f72.b(f72Var.a, jP)) {
                this.n0 = true;
            }
            w73Var.F(jP);
            w73Var.u();
            setMeasuredDimension(getRoot().G.p.a, getRoot().G.p.b);
            if (this.l0 != null) {
                Trace.beginSection("AndroidOwner:androidViewMeasure");
                getAndroidViewsHandler$ui().measure(View.MeasureSpec.makeMeasureSpec(getRoot().G.p.a, 1073741824), View.MeasureSpec.makeMeasureSpec(getRoot().G.p.b, 1073741824));
                Trace.endSection();
            }
        } catch (Throwable th) {
            throw th;
        } finally {
            Trace.endSection();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:30:0x00a8  */
    @Override // android.view.View
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void onProvideAutofillVirtualStructure(android.view.ViewStructure r12, int r13) {
        /*
            Method dump skipped, instruction units count: 271
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.mn.onProvideAutofillVirtualStructure(android.view.ViewStructure, int):void");
    }

    @Override // android.view.ViewGroup, android.view.View
    public final PointerIcon onResolvePointerIcon(MotionEvent motionEvent, int i) {
        pb9 pb9Var;
        int toolType = motionEvent.getToolType(i);
        if (motionEvent.isFromSource(8194) || !motionEvent.isFromSource(CanonMakernoteDirectory.TAG_CRW_PARAM) || (!(toolType == 2 || toolType == 4) || (pb9Var = ((hn) getPointerIconService()).a) == null)) {
            return super.onResolvePointerIcon(motionEvent, i);
        }
        Context context = getContext();
        return pb9Var instanceof lr ? PointerIcon.getSystemIcon(context, ((lr) pb9Var).b) : PointerIcon.getSystemIcon(context, PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE);
    }

    @Override // defpackage.f03
    public final void onResume(iy6 iy6Var) {
        y51 y51VarS;
        if (Build.VERSION.SDK_INT < 30) {
            setShowLayoutBounds(gx1.J());
        }
        oy6 oy6Var = this.g;
        if (oy6Var != null) {
            ny6 ny6Var = this.f;
            ny6Var.getClass();
            vg7 vg7Var = (vg7) oy6Var.a.a;
            if (!vg7Var.a || vg7Var.c) {
                return;
            }
            try {
                y51VarS = ((c9f) ny6Var).a.s(new ir(21, oy6Var));
            } catch (CancellationException unused) {
                if (!vg7Var.b) {
                    if (vg7Var.c) {
                        yx9.a("ManagedValuesStore tried to enter composition twice. Did you attempt to install the same store multiple times or into two compositions?");
                    }
                    vg7Var.a();
                    vg7Var.c = true;
                }
                y51VarS = null;
            }
            y51 y51Var = oy6Var.d;
            if (y51Var != null) {
                y51Var.cancel();
            }
            oy6Var.d = y51VarS;
        }
    }

    @Override // android.view.View
    public final void onRtlPropertiesChanged(int i) {
        if (this.c) {
            int[] iArr = ir4.a;
            ip6 ip6Var = i != 0 ? i != 1 ? null : ip6.Rtl : ip6.Ltr;
            if (ip6Var == null) {
                ip6Var = ip6.Ltr;
            }
            setLayoutDirection(ip6Var);
        }
    }

    @Override // android.view.View
    public final void onScrollCaptureSearch(Rect rect, Point point, Consumer consumer) {
        l82 l82Var;
        if (Build.VERSION.SDK_INT < 31 || (l82Var = this.Z0) == null) {
            return;
        }
        l82Var.f(this, getSemanticsOwner(), getCoroutineContext(), consumer);
    }

    @Override // android.view.ViewTreeObserver.OnScrollChangedListener
    public final void onScrollChanged() {
        M();
    }

    @Override // defpackage.f03
    public final void onStop(iy6 iy6Var) {
        oy6 oy6Var = this.g;
        if (oy6Var != null) {
            vg7 vg7Var = (vg7) oy6Var.a.a;
            if (vg7Var.a && !vg7Var.c) {
                y51 y51Var = oy6Var.d;
                if (y51Var != null) {
                    y51Var.cancel();
                }
                oy6Var.d = null;
                return;
            }
            if (vg7Var.b) {
                return;
            }
            if (!vg7Var.c) {
                yx9.a("ManagedValuesStore tried to leave composition twice. Is the store installed in multiple places?");
            }
            if (!vg7Var.d.i()) {
                yx9.a("Attempted to start retaining exited values with pending exited values");
            }
            vg7Var.c = false;
        }
    }

    @Override // android.view.ViewTreeObserver.OnTouchModeChangeListener
    public final void onTouchModeChanged(boolean z) {
        this.I0.a.setValue(new u26(z ? 1 : 2));
    }

    @Override // android.view.View
    public final void onVirtualViewTranslationResponses(LongSparseArray longSparseArray) {
        mo moVar = this.A;
        moVar.getClass();
        if (Build.VERSION.SDK_INT < 31) {
            return;
        }
        if (g76.L(Looper.getMainLooper().getThread(), Thread.currentThread())) {
            io.d(moVar, longSparseArray);
        } else {
            moVar.a.post(new ho(moVar, 0, longSparseArray));
        }
    }

    @Override // android.view.View
    public final void onWindowFocusChanged(boolean z) {
        boolean zJ;
        this.X0 = true;
        super.onWindowFocusChanged(z);
        if (!z || Build.VERSION.SDK_INT >= 30 || getShowLayoutBounds() == (zJ = gx1.J())) {
            return;
        }
        setShowLayoutBounds(zJ);
        n(getRoot());
    }

    public final boolean r(MotionEvent motionEvent) {
        float x = motionEvent.getX();
        float y = motionEvent.getY();
        return 0.0f <= x && x <= ((float) getWidth()) && 0.0f <= y && y <= ((float) getHeight());
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean requestFocus(int i, Rect rect) {
        if (!isFocused()) {
            br4 br4VarD = ir4.d(i);
            int i2 = br4VarD != null ? br4VarD.a : 7;
            Boolean boolE = ((or4) getFocusOwner()).e(i2, rect != null ? new zwa(rect.left, rect.top, rect.right, rect.bottom) : null, new in(i2, 0));
            Boolean bool = Boolean.TRUE;
            if (!g76.L(boolE, bool)) {
                if (!g76.L(((or4) getFocusOwner()).e(i2, null, new in(i2, 1)), bool)) {
                    if (hasFocus() && (i2 == 1 || i2 == 2)) {
                        return ((or4) getFocusOwner()).h(i2);
                    }
                    return false;
                }
            }
        }
        return true;
    }

    public final boolean s(MotionEvent motionEvent) {
        MotionEvent motionEvent2;
        return (motionEvent.getPointerCount() == 1 && (motionEvent2 = this.L0) != null && motionEvent2.getPointerCount() == motionEvent.getPointerCount() && motionEvent.getRawX() == motionEvent2.getRawX() && motionEvent.getRawY() == motionEvent2.getRawY()) ? false : true;
    }

    public void setAccessibilityEventBatchIntervalMillis(long j) {
        this.z.h = j;
    }

    public final void setComposeViewContext(u12 u12Var) {
        if (getCoroutineContext() != u12Var.b.j() && !((v68) getRoot().n()).isEmpty()) {
            b26.a("Changing ComposeViewContext cannot change the coroutine context without disposing of the composition first.");
        }
        oic oicVarA = vn7.A();
        x45 x45VarE = oicVarA != null ? oicVarA.e() : null;
        oic oicVarG = vn7.G(oicVarA);
        try {
            u12 u12Var2 = get_composeViewContext();
            if (u12Var != u12Var2) {
                if (isAttachedToWindow()) {
                    u12Var2.b();
                    u12Var.c();
                }
                set_composeViewContext(u12Var);
                setCoroutineContext(u12Var.b.j());
            }
        } finally {
            vn7.T(oicVarA, oicVarG, x45VarE);
        }
    }

    public final void setComposeViewContextIncrementedDuringInit$ui(boolean z) {
        this.Y0 = z;
    }

    public final void setConfiguration(Configuration configuration) {
        this.K.setValue(configuration);
    }

    public final void setContentCaptureManager$ui(mo moVar) {
        this.A = moVar;
    }

    public void setCoroutineContext(ib2 ib2Var) {
        this.n = ib2Var;
    }

    public final void setFrameEndScheduler$ui(ny6 ny6Var) {
        this.f = ny6Var;
    }

    public final void setLastMatrixRecalculationAnimationTime$ui(long j) {
        this.u0 = j;
    }

    public final void setOnReadyForComposition(x45 x45Var) {
        getDerivedIsAttached();
        if (isAttachedToWindow() || this.Y0) {
            x45Var.invoke(getComposeViewContext());
        } else {
            this.z0 = x45Var;
        }
    }

    /* JADX INFO: renamed from: setPrimaryDirectionalMotionAxisOverride-r2epLt8$ui, reason: not valid java name */
    public final void m130setPrimaryDirectionalMotionAxisOverrider2epLt8$ui(x06 x06Var) {
        this.d = x06Var;
    }

    public void setShowLayoutBounds(boolean z) {
        this.S = z;
    }

    public void setUncaughtExceptionHandler(llb llbVar) {
        this.o0.getClass();
    }

    @Override // android.view.ViewGroup
    public final boolean shouldDelayChildPressedState() {
        return false;
    }

    public final void t(float[] fArr) {
        D();
        pk7.g(fArr, this.s0);
        float fIntBitsToFloat = Float.intBitsToFloat((int) (this.w0 >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (this.w0 & 4294967295L));
        float[] fArr2 = this.r0;
        pk7.d(fArr2);
        pk7.h(fArr2, fIntBitsToFloat, fIntBitsToFloat2);
        bo.b0(fArr, fArr2);
    }

    public final long u(long j) {
        D();
        long jB = pk7.b(j, this.s0);
        float fIntBitsToFloat = Float.intBitsToFloat((int) (this.w0 >> 32)) + Float.intBitsToFloat((int) (jB >> 32));
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (this.w0 & 4294967295L)) + Float.intBitsToFloat((int) (jB & 4294967295L));
        return (((long) Float.floatToRawIntBits(fIntBitsToFloat)) << 32) | (((long) Float.floatToRawIntBits(fIntBitsToFloat2)) & 4294967295L);
    }

    public final void v(boolean z) {
        bn bnVar;
        w73 w73Var = this.o0;
        if (((m50) w73Var.e).G() || ((o78) ((gg5) w73Var.f).b).c != 0) {
            Trace.beginSection("AndroidOwner:measureAndLayout");
            if (z) {
                try {
                    bnVar = this.V0;
                } finally {
                    Trace.endSection();
                }
            } else {
                bnVar = null;
            }
            if (w73Var.s(bnVar)) {
                requestLayout();
            }
            w73Var.g(false);
            getRectManager().a();
            if (this.H) {
                getViewTreeObserver().dispatchOnGlobalLayout();
                this.H = false;
            }
        }
    }

    public final void w(aq6 aq6Var, long j) {
        w73 w73Var = this.o0;
        Trace.beginSection("AndroidOwner:measureAndLayout");
        try {
            w73Var.t(aq6Var, j);
            if (!((m50) w73Var.e).G()) {
                w73Var.g(false);
                getRectManager().a();
                if (this.H) {
                    getViewTreeObserver().dispatchOnGlobalLayout();
                    this.H = false;
                }
            }
        } finally {
            Trace.endSection();
        }
    }

    public final boolean x(int i) {
        if (i != 7 && i != 8) {
            Integer numC = ir4.c(i);
            if (numC == null) {
                throw lv8.v("Invalid focus direction");
            }
            int iIntValue = numC.intValue();
            es4 es4VarF = ((or4) getFocusOwner()).f();
            if (es4VarF == null) {
                ygf.f("findNextViewInEmbeddedView called when owner does not have anything focused.");
                return false;
            }
            Integer numC2 = ir4.c(i);
            if (numC2 == null) {
                throw lv8.v("Invalid focus direction");
            }
            int iIntValue2 = numC2.intValue();
            due dueVar = flb.v0(es4VarF).o;
            View interopView = dueVar != null ? dueVar.getInteropView() : null;
            View viewFindFocus = findFocus();
            FocusFinder focusFinder = FocusFinder.getInstance();
            View rootView = getRootView();
            rootView.getClass();
            View viewFindNextFocus = focusFinder.findNextFocus((ViewGroup) rootView, viewFindFocus, iIntValue2);
            if (viewFindNextFocus == null || interopView == null || !bo.I(interopView, viewFindNextFocus)) {
                viewFindNextFocus = null;
            }
            if (viewFindNextFocus != null) {
                return ir4.b(viewFindNextFocus, Integer.valueOf(iIntValue), null);
            }
        }
        return false;
    }

    public final void y() {
        x68 x68Var;
        lm lmVar;
        Object[] objArr;
        if (this.O) {
            gjc gjcVar = getSnapshotObserver().a;
            synchronized (gjcVar.g) {
                try {
                    o78 o78Var = gjcVar.f;
                    int i = o78Var.c;
                    int i2 = 0;
                    int i3 = 0;
                    while (true) {
                        objArr = o78Var.a;
                        if (i2 >= i) {
                            break;
                        }
                        fjc fjcVar = (fjc) objArr[i2];
                        fjcVar.d();
                        if (!fjcVar.f.j()) {
                            i3++;
                        } else if (i3 > 0) {
                            Object[] objArr2 = o78Var.a;
                            objArr2[i2 - i3] = objArr2[i2];
                        }
                        i2++;
                    }
                    int i4 = i - i3;
                    Arrays.fill(objArr, i4, i, (Object) null);
                    o78Var.c = i4;
                } catch (Throwable th) {
                    throw th;
                }
            }
            this.O = false;
        }
        gu guVar = this.l0;
        if (guVar != null) {
            h(guVar);
        }
        if (g() && (lmVar = this.N) != null) {
            l68 l68Var = lmVar.h;
            if (l68Var.d == 0 && lmVar.i) {
                lmVar.a.a();
                lmVar.i = false;
            }
            if (l68Var.d != 0) {
                lmVar.i = true;
            }
        }
        while (this.O0.i() && this.O0.f(0) != null) {
            int i5 = this.O0.b;
            int i6 = 0;
            while (true) {
                x68Var = this.O0;
                if (i6 < i5) {
                    m45 m45Var = (m45) x68Var.f(i6);
                    this.O0.n(i6, null);
                    if (m45Var != null) {
                        m45Var.invoke();
                    }
                    i6++;
                }
            }
            x68Var.l(0, i5);
        }
    }

    public final void z(aq6 aq6Var) {
        sn snVar = this.z;
        snVar.x = true;
        if (snVar.v()) {
            snVar.w(aq6Var);
        }
        mo moVar = this.A;
        moVar.f = true;
        if (moVar.e()) {
            moVar.g.e(c1e.a);
        }
    }

    /* JADX INFO: renamed from: getAccessibilityManager, reason: merged with bridge method [inline-methods] */
    public bm m131getAccessibilityManager() {
        return this.B;
    }

    public tm getClipboard() {
        return this.Q;
    }

    public um getClipboardManager() {
        return this.P;
    }

    /* JADX INFO: renamed from: getDragAndDropManager, reason: merged with bridge method [inline-methods] */
    public ap m134getDragAndDropManager() {
        return this.o;
    }

    public k68 getLayoutNodes() {
        return this.w;
    }

    @Override // android.view.ViewGroup
    public final void addView(View view) {
        addView(view, -1);
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i, int i2) {
        ViewGroup.LayoutParams layoutParamsGenerateDefaultLayoutParams = generateDefaultLayoutParams();
        layoutParamsGenerateDefaultLayoutParams.width = i;
        layoutParamsGenerateDefaultLayoutParams.height = i2;
        addViewInLayout(view, -1, layoutParamsGenerateDefaultLayoutParams, true);
    }

    @z73
    public static /* synthetic */ void getFontLoader$annotations() {
    }

    public static /* synthetic */ void getLastMatrixRecalculationAnimationTime$ui$annotations() {
    }

    /* JADX INFO: renamed from: getPrimaryDirectionalMotionAxisOverride-dqNNBbU$ui$annotations, reason: not valid java name */
    public static /* synthetic */ void m128getPrimaryDirectionalMotionAxisOverridedqNNBbU$ui$annotations() {
    }

    public static /* synthetic */ void getRoot$annotations() {
    }

    public static /* synthetic */ void getShowLayoutBounds$annotations() {
    }

    @z73
    public static /* synthetic */ void getTextInputService$annotations() {
    }

    public static /* synthetic */ void getWindowInfo$annotations() {
    }

    public mlb getRootForTest() {
        return this;
    }

    public View getView() {
        return this;
    }

    @Override // android.view.ViewGroup
    public final void addView(View view, int i, ViewGroup.LayoutParams layoutParams) {
        addViewInLayout(view, i, layoutParams, true);
    }

    @Override // android.view.ViewGroup, android.view.ViewManager
    public final void addView(View view, ViewGroup.LayoutParams layoutParams) {
        addViewInLayout(view, -1, layoutParams, true);
    }

    @Override // defpackage.f03
    public final void onCreate(iy6 iy6Var) {
    }

    @Override // defpackage.f03
    public final void onDestroy(iy6 iy6Var) {
    }

    @Override // android.view.View
    public final void onDraw(Canvas canvas) {
    }

    @Override // defpackage.f03
    public final void onPause(iy6 iy6Var) {
    }

    @Override // defpackage.f03
    public final void onStart(iy6 iy6Var) {
    }

    public final void setUncaughtExceptionHandler$ui(llb llbVar) {
    }
}
