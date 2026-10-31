package r;

import android.os.SystemClock;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;

/* loaded from: classes.dex */
public abstract class i1 implements View.OnTouchListener, View.OnAttachStateChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final float f84746a;

    /* renamed from: b, reason: collision with root package name */
    public final int f84747b;

    /* renamed from: c, reason: collision with root package name */
    public final int f84748c;

    /* renamed from: d, reason: collision with root package name */
    public final View f84749d;

    /* renamed from: e, reason: collision with root package name */
    public h1 f84750e;

    /* renamed from: f, reason: collision with root package name */
    public h1 f84751f;

    /* renamed from: g, reason: collision with root package name */
    public boolean f84752g;

    /* renamed from: h, reason: collision with root package name */
    public int f84753h;

    /* renamed from: i, reason: collision with root package name */
    public final int[] f84754i = new int[2];

    public i1(View view) {
        this.f84749d = view;
        view.setLongClickable(true);
        view.addOnAttachStateChangeListener(this);
        this.f84746a = ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
        int tapTimeout = ViewConfiguration.getTapTimeout();
        this.f84747b = tapTimeout;
        this.f84748c = (ViewConfiguration.getLongPressTimeout() + tapTimeout) / 2;
    }

    public final void a() {
        h1 h1Var = this.f84751f;
        View view = this.f84749d;
        if (h1Var != null) {
            view.removeCallbacks(h1Var);
        }
        h1 h1Var2 = this.f84750e;
        if (h1Var2 != null) {
            view.removeCallbacks(h1Var2);
        }
    }

    public abstract q.a0 b();

    public boolean c() {
        q.a0 a0VarB = b();
        if (a0VarB == null || a0VarB.isShowing()) {
            return true;
        }
        a0VarB.show();
        return true;
    }

    public boolean d() {
        q.a0 a0VarB = b();
        if (a0VarB == null || !a0VarB.isShowing()) {
            return true;
        }
        a0VarB.dismiss();
        return true;
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x005c  */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0062  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00cb  */
    /* JADX WARN: Removed duplicated region for block: B:60:0x0100  */
    @Override // android.view.View.OnTouchListener
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean onTouch(View view, MotionEvent motionEvent) throws IllegalAccessException, IllegalArgumentException {
        boolean z11;
        g1 g1VarK;
        boolean z12 = this.f84752g;
        View view2 = this.f84749d;
        if (z12) {
            q.a0 a0VarB = b();
            if (a0VarB == null || !a0VarB.isShowing() || (g1VarK = a0VarB.k()) == null || !g1VarK.isShown()) {
                z11 = !d();
            } else {
                MotionEvent motionEventObtainNoHistory = MotionEvent.obtainNoHistory(motionEvent);
                int[] iArr = this.f84754i;
                view2.getLocationOnScreen(iArr);
                motionEventObtainNoHistory.offsetLocation(iArr[0], iArr[1]);
                g1VarK.getLocationOnScreen(iArr);
                motionEventObtainNoHistory.offsetLocation(-iArr[0], -iArr[1]);
                boolean zB = g1VarK.b(motionEventObtainNoHistory, this.f84753h);
                motionEventObtainNoHistory.recycle();
                int actionMasked = motionEvent.getActionMasked();
                boolean z13 = (actionMasked == 1 || actionMasked == 3) ? false : true;
                if (!zB || !z13) {
                }
            }
        } else if (view2.isEnabled()) {
            int actionMasked2 = motionEvent.getActionMasked();
            if (actionMasked2 == 0) {
                this.f84753h = motionEvent.getPointerId(0);
                if (this.f84750e == null) {
                    this.f84750e = new h1(this, 0);
                }
                view2.postDelayed(this.f84750e, this.f84747b);
                if (this.f84751f == null) {
                    this.f84751f = new h1(this, 1);
                }
                view2.postDelayed(this.f84751f, this.f84748c);
            } else if (actionMasked2 == 1) {
                a();
            } else if (actionMasked2 == 2) {
                int iFindPointerIndex = motionEvent.findPointerIndex(this.f84753h);
                if (iFindPointerIndex >= 0) {
                    float x11 = motionEvent.getX(iFindPointerIndex);
                    float y11 = motionEvent.getY(iFindPointerIndex);
                    float f11 = this.f84746a;
                    float f12 = -f11;
                    if (x11 < f12 || y11 < f12 || x11 >= (view2.getRight() - view2.getLeft()) + f11 || y11 >= (view2.getBottom() - view2.getTop()) + f11) {
                        a();
                        view2.getParent().requestDisallowInterceptTouchEvent(true);
                        if (c()) {
                            z11 = true;
                        }
                        if (z11) {
                            long jUptimeMillis = SystemClock.uptimeMillis();
                            MotionEvent motionEventObtain = MotionEvent.obtain(jUptimeMillis, jUptimeMillis, 3, 0.0f, 0.0f, 0);
                            view2.onTouchEvent(motionEventObtain);
                            motionEventObtain.recycle();
                        }
                    }
                }
            } else if (actionMasked2 == 3) {
            }
            z11 = false;
            if (z11) {
            }
        } else {
            z11 = false;
            if (z11) {
            }
        }
        this.f84752g = z11;
        return z11 || z12;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewAttachedToWindow(View view) {
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public final void onViewDetachedFromWindow(View view) {
        this.f84752g = false;
        this.f84753h = -1;
        h1 h1Var = this.f84750e;
        if (h1Var != null) {
            this.f84749d.removeCallbacks(h1Var);
        }
    }
}
