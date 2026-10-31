package c4;

import android.graphics.Rect;
import android.os.Build;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManager;
import b00.z0;
import c3.c1;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import h6.y0;
import java.util.UUID;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.Ref;
import p1.e1;
import p1.i0;
import p1.s2;
import p1.t1;

/* loaded from: classes2.dex */
public final class d0 extends c3.a {

    /* renamed from: a, reason: collision with root package name */
    public Function0 f19575a;

    /* renamed from: b, reason: collision with root package name */
    public g0 f19576b;

    /* renamed from: c, reason: collision with root package name */
    public final View f19577c;

    /* renamed from: d, reason: collision with root package name */
    public final b50.d f19578d;

    /* renamed from: e, reason: collision with root package name */
    public final WindowManager f19579e;

    /* renamed from: f, reason: collision with root package name */
    public final WindowManager.LayoutParams f19580f;

    /* renamed from: g, reason: collision with root package name */
    public f0 f19581g;

    /* renamed from: h, reason: collision with root package name */
    public y3.n f19582h;

    /* renamed from: i, reason: collision with root package name */
    public final e1 f19583i;

    /* renamed from: j, reason: collision with root package name */
    public final e1 f19584j;

    /* renamed from: k, reason: collision with root package name */
    public y3.l f19585k;

    /* renamed from: l, reason: collision with root package name */
    public final i0 f19586l;

    /* renamed from: m, reason: collision with root package name */
    public final Rect f19587m;
    public final z1.v n;
    public s o;

    /* renamed from: p, reason: collision with root package name */
    public final e1 f19588p;

    /* renamed from: q, reason: collision with root package name */
    public boolean f19589q;

    /* renamed from: r, reason: collision with root package name */
    public final int[] f19590r;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d0(Function0 function0, g0 g0Var, View view, y3.c cVar, f0 f0Var, UUID uuid) {
        super(view.getContext());
        b50.d e0Var = Build.VERSION.SDK_INT >= 29 ? new e0() : new b50.d();
        this.f19575a = function0;
        this.f19576b = g0Var;
        this.f19577c = view;
        this.f19578d = e0Var;
        Object systemService = view.getContext().getSystemService("window");
        Intrinsics.e(systemService, "null cannot be cast to non-null type android.view.WindowManager");
        this.f19579e = (WindowManager) systemService;
        WindowManager.LayoutParams layoutParams = new WindowManager.LayoutParams();
        layoutParams.gravity = 8388659;
        g0 g0Var2 = this.f19576b;
        boolean zB = p.b(view);
        boolean z11 = g0Var2.f19599b;
        int i5 = g0Var2.f19598a;
        if (z11 && zB) {
            i5 |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
        } else if (z11 && !zB) {
            i5 &= -8193;
        }
        layoutParams.flags = i5;
        layoutParams.type = 1002;
        layoutParams.token = view.getApplicationWindowToken();
        layoutParams.width = -2;
        layoutParams.height = -2;
        layoutParams.format = -3;
        layoutParams.setTitle(view.getContext().getResources().getString(2132017716));
        this.f19580f = layoutParams;
        this.f19581g = f0Var;
        this.f19582h = y3.n.f96612a;
        this.f19583i = androidx.compose.runtime.d.k(null);
        this.f19584j = androidx.compose.runtime.d.k(null);
        this.f19586l = androidx.compose.runtime.d.d(new c1(this, 9));
        this.f19587m = new Rect();
        this.n = new z1.v(new l(this, 2));
        setId(16908290);
        y0.f(this, y0.c(view));
        y0.g(this, y0.d(view));
        u90.b.a0(this, u90.b.G(view));
        setTag(2131427723, "Popup:" + uuid);
        setClipChildren(false);
        setElevation(cVar.mo102toPx0680j_4((float) 8));
        setOutlineProvider(new a0(1));
        this.f19588p = androidx.compose.runtime.d.k(v.f19634a);
        this.f19590r = new int[2];
    }

    @Override // c3.a
    public final void Content(p1.o oVar, int i5) {
        p1.t tVar = (p1.t) oVar;
        tVar.d0(-857613600);
        int i11 = (tVar.h(this) ? 4 : 2) | i5;
        if (tVar.S(i11 & 1, (i11 & 3) != 2)) {
            ((Function2) ((s2) this.f19588p).getValue()).invoke(tVar, 0);
        } else {
            tVar.V();
        }
        t1 t1VarU = tVar.u();
        if (t1VarU != null) {
            t1VarU.f81583d = new b0.g(this, i5, 2);
        }
    }

    public final void d(p1.w wVar, Function2 function2) {
        setParentCompositionContext(wVar);
        ((s2) this.f19588p).setValue(function2);
        this.f19589q = true;
    }

    @Override // android.view.ViewGroup, android.view.View
    public final boolean dispatchKeyEvent(KeyEvent keyEvent) {
        if (!this.f19576b.f19600c) {
            return super.dispatchKeyEvent(keyEvent);
        }
        if (keyEvent.getKeyCode() == 4 || keyEvent.getKeyCode() == 111) {
            KeyEvent.DispatcherState keyDispatcherState = getKeyDispatcherState();
            if (keyDispatcherState == null) {
                return super.dispatchKeyEvent(keyEvent);
            }
            if (keyEvent.getAction() == 0 && keyEvent.getRepeatCount() == 0) {
                keyDispatcherState.startTracking(keyEvent, this);
                return true;
            }
            if (keyEvent.getAction() == 1 && keyDispatcherState.isTracking(keyEvent) && !keyEvent.isCanceled()) {
                Function0 function0 = this.f19575a;
                if (function0 != null) {
                    function0.invoke();
                }
                return true;
            }
        }
        return super.dispatchKeyEvent(keyEvent);
    }

    public final void e(Function0 function0, g0 g0Var, y3.n nVar) {
        int i5;
        this.f19575a = function0;
        if (!Intrinsics.b(this.f19576b, g0Var)) {
            g0Var.getClass();
            this.f19576b = g0Var;
            boolean zB = p.b(this.f19577c);
            boolean z11 = g0Var.f19599b;
            int i11 = g0Var.f19598a;
            if (z11 && zB) {
                i11 |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
            } else if (z11 && !zB) {
                i11 &= -8193;
            }
            WindowManager.LayoutParams layoutParams = this.f19580f;
            layoutParams.flags = i11;
            this.f19578d.getClass();
            this.f19579e.updateViewLayout(this, layoutParams);
        }
        int iOrdinal = nVar.ordinal();
        if (iOrdinal != 0) {
            i5 = 1;
            if (iOrdinal != 1) {
                throw new NoWhenBranchMatchedException();
            }
        } else {
            i5 = 0;
        }
        super.setLayoutDirection(i5);
    }

    public final void f() {
        z2.y yVar = (z2.y) ((s2) this.f19584j).getValue();
        if (yVar != null) {
            if (!yVar.isAttached()) {
                yVar = null;
            }
            if (yVar == null) {
                return;
            }
            long jG = yVar.g();
            long jX = yVar.x(0L);
            y3.l lVarA = p6.j.a((Math.round(Float.intBitsToFloat((int) (jX >> 32))) << 32) | (4294967295L & Math.round(Float.intBitsToFloat((int) (jX & 4294967295L)))), jG);
            if (lVarA.equals(this.f19585k)) {
                return;
            }
            this.f19585k = lVarA;
            g();
        }
    }

    public final void g() {
        y3.m mVar;
        y3.l lVar = this.f19585k;
        if (lVar == null || (mVar = (y3.m) ((s2) this.f19583i).getValue()) == null) {
            return;
        }
        long j11 = mVar.f96611a;
        b50.d dVar = this.f19578d;
        dVar.getClass();
        this.f19577c.getWindowVisibleDisplayFrame(this.f19587m);
        long j12 = ((r1.right - r1.left) << 32) | ((r1.bottom - r1.top) & 4294967295L);
        Ref.LongRef longRef = new Ref.LongRef();
        longRef.f71862a = 0L;
        this.n.d(this, d.f19573p, new c0(longRef, this, lVar, j12, j11));
        long j13 = longRef.f71862a;
        WindowManager.LayoutParams layoutParams = this.f19580f;
        layoutParams.x = (int) (j13 >> 32);
        layoutParams.y = (int) (j13 & 4294967295L);
        if (this.f19576b.f19602e) {
            dVar.p(this, (int) (j12 >> 32), (int) (j12 & 4294967295L));
        }
        dVar.getClass();
        this.f19579e.updateViewLayout(this, layoutParams);
    }

    @Override // c3.a
    public final boolean getShouldCreateCompositionOnAttachedToWindow() {
        return this.f19589q;
    }

    @Override // c3.a
    public final void internalOnLayout$ui_release(boolean z11, int i5, int i11, int i12, int i13) {
        super.internalOnLayout$ui_release(z11, i5, i11, i12, i13);
        this.f19576b.getClass();
        View childAt = getChildAt(0);
        if (childAt == null) {
            return;
        }
        int measuredWidth = childAt.getMeasuredWidth();
        WindowManager.LayoutParams layoutParams = this.f19580f;
        layoutParams.width = measuredWidth;
        layoutParams.height = childAt.getMeasuredHeight();
        this.f19578d.getClass();
        this.f19579e.updateViewLayout(this, layoutParams);
    }

    @Override // c3.a
    public final void internalOnMeasure$ui_release(int i5, int i11) {
        this.f19576b.getClass();
        this.f19578d.getClass();
        View view = this.f19577c;
        Rect rect = this.f19587m;
        view.getWindowVisibleDisplayFrame(rect);
        int i12 = rect.left;
        int i13 = rect.top;
        super.internalOnMeasure$ui_release(View.MeasureSpec.makeMeasureSpec(rect.right - i12, Integer.MIN_VALUE), View.MeasureSpec.makeMeasureSpec(rect.bottom - i13, Integer.MIN_VALUE));
    }

    @Override // c3.a, android.view.ViewGroup, android.view.View
    public final void onAttachedToWindow() {
        super.onAttachedToWindow();
        this.n.e();
        if (!this.f19576b.f19600c || Build.VERSION.SDK_INT < 33) {
            return;
        }
        if (this.o == null) {
            this.o = new s(this.f19575a, 0);
        }
        b5.e.d(this, this.o);
    }

    @Override // android.view.ViewGroup, android.view.View
    public final void onDetachedFromWindow() {
        super.onDetachedFromWindow();
        z1.v vVar = this.n;
        z0 z0Var = vVar.f97982h;
        if (z0Var != null) {
            z0Var.g();
        }
        vVar.a();
        if (Build.VERSION.SDK_INT >= 33) {
            b5.e.e(this, this.o);
        }
        this.o = null;
    }

    @Override // android.view.View
    public final boolean onTouchEvent(MotionEvent motionEvent) {
        if (!this.f19576b.f19601d) {
            return super.onTouchEvent(motionEvent);
        }
        if (motionEvent != null && motionEvent.getAction() == 0 && (motionEvent.getX() < 0.0f || motionEvent.getX() >= getWidth() || motionEvent.getY() < 0.0f || motionEvent.getY() >= getHeight())) {
            Function0 function0 = this.f19575a;
            if (function0 != null) {
                function0.invoke();
                return true;
            }
        } else {
            if (motionEvent == null || motionEvent.getAction() != 4) {
                return super.onTouchEvent(motionEvent);
            }
            Function0 function02 = this.f19575a;
            if (function02 != null) {
                function02.invoke();
            }
        }
        return true;
    }

    @Override // android.view.View
    public final void setLayoutDirection(int i5) {
    }
}
