package dj;

import a5.a1;
import ab.y;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.OverScroller;
import androidx.compose.ui.node.LayoutNode;
import androidx.coordinatorlayout.widget.CoordinatorLayout;
import com.google.android.material.appbar.AppBarLayout;
import java.lang.ref.WeakReference;
import java.util.WeakHashMap;

/* loaded from: classes3.dex */
public abstract class e extends g {

    /* renamed from: c, reason: collision with root package name */
    public y f49248c;

    /* renamed from: d, reason: collision with root package name */
    public OverScroller f49249d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f49250e;

    /* renamed from: f, reason: collision with root package name */
    public int f49251f;

    /* renamed from: g, reason: collision with root package name */
    public int f49252g;

    /* renamed from: h, reason: collision with root package name */
    public int f49253h;

    /* renamed from: i, reason: collision with root package name */
    public VelocityTracker f49254i;

    public final void A(CoordinatorLayout coordinatorLayout, View view, int i5) {
        z(coordinatorLayout, view, i5, Integer.MIN_VALUE, LayoutNode.NotPlacedPlaceOrder);
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x0048  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x00a5  */
    @Override // l4.b
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean k(CoordinatorLayout coordinatorLayout, View view, MotionEvent motionEvent) {
        VelocityTracker velocityTracker;
        View view2;
        int iFindPointerIndex;
        if (this.f49253h < 0) {
            this.f49253h = ViewConfiguration.get(coordinatorLayout.getContext()).getScaledTouchSlop();
        }
        if (motionEvent.getActionMasked() == 2 && this.f49250e) {
            int i5 = this.f49251f;
            if (i5 != -1 && (iFindPointerIndex = motionEvent.findPointerIndex(i5)) != -1) {
                int y11 = (int) motionEvent.getY(iFindPointerIndex);
                if (Math.abs(y11 - this.f49252g) > this.f49253h) {
                    this.f49252g = y11;
                    return true;
                }
                if (motionEvent.getActionMasked() == 0) {
                }
                velocityTracker = this.f49254i;
                if (velocityTracker != null) {
                }
            }
        } else {
            if (motionEvent.getActionMasked() == 0) {
                this.f49251f = -1;
                int x11 = (int) motionEvent.getX();
                int y12 = (int) motionEvent.getY();
                WeakReference weakReference = ((AppBarLayout.BaseBehavior) this).n;
                boolean z11 = (weakReference == null || !((view2 = (View) weakReference.get()) == null || !view2.isShown() || view2.canScrollVertically(-1))) && coordinatorLayout.p(view, x11, y12);
                this.f49250e = z11;
                if (z11) {
                    this.f49252g = y12;
                    this.f49251f = motionEvent.getPointerId(0);
                    if (this.f49254i == null) {
                        this.f49254i = VelocityTracker.obtain();
                    }
                    OverScroller overScroller = this.f49249d;
                    if (overScroller != null && !overScroller.isFinished()) {
                        this.f49249d.abortAnimation();
                        return true;
                    }
                }
            }
            velocityTracker = this.f49254i;
            if (velocityTracker != null) {
                velocityTracker.addMovement(motionEvent);
            }
        }
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x00ee  */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00f7  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x00fe A[ADDED_TO_REGION] */
    @Override // l4.b
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final boolean v(CoordinatorLayout coordinatorLayout, View view, MotionEvent motionEvent) {
        boolean z11;
        VelocityTracker velocityTracker;
        VelocityTracker velocityTracker2;
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked != 1) {
            if (actionMasked == 2) {
                int iFindPointerIndex = motionEvent.findPointerIndex(this.f49251f);
                if (iFindPointerIndex != -1) {
                    int y11 = (int) motionEvent.getY(iFindPointerIndex);
                    int i5 = this.f49252g - y11;
                    this.f49252g = y11;
                    AppBarLayout appBarLayout = (AppBarLayout) view;
                    z(coordinatorLayout, view, y() - i5, appBarLayout.f() + (-appBarLayout.e()), 0);
                }
            }
            if (actionMasked != 3) {
                if (actionMasked == 6) {
                    int i11 = motionEvent.getActionIndex() == 0 ? 1 : 0;
                    this.f49251f = motionEvent.getPointerId(i11);
                    this.f49252g = (int) (motionEvent.getY(i11) + 0.5f);
                }
            }
            z11 = false;
            velocityTracker2 = this.f49254i;
            if (velocityTracker2 != null) {
                velocityTracker2.addMovement(motionEvent);
            }
            return !this.f49250e || z11;
        }
        VelocityTracker velocityTracker3 = this.f49254i;
        if (velocityTracker3 != null) {
            velocityTracker3.addMovement(motionEvent);
            this.f49254i.computeCurrentVelocity(1000);
            float yVelocity = this.f49254i.getYVelocity(this.f49251f);
            AppBarLayout appBarLayout2 = (AppBarLayout) view;
            int i12 = -appBarLayout2.g();
            Runnable runnable = this.f49248c;
            if (runnable != null) {
                view.removeCallbacks(runnable);
                this.f49248c = null;
            }
            if (this.f49249d == null) {
                this.f49249d = new OverScroller(view.getContext());
            }
            this.f49249d.fling(0, w(), 0, Math.round(yVelocity), 0, 0, i12, 0);
            if (this.f49249d.computeScrollOffset()) {
                y yVar = new y(14, this, coordinatorLayout, view);
                this.f49248c = yVar;
                WeakHashMap weakHashMap = a1.f250a;
                view.postOnAnimation(yVar);
            } else {
                ((AppBarLayout.BaseBehavior) this).G(coordinatorLayout, appBarLayout2);
                if (appBarLayout2.f34014k) {
                    appBarLayout2.k(appBarLayout2.l(AppBarLayout.BaseBehavior.D(coordinatorLayout)));
                }
            }
            z11 = true;
        }
        this.f49250e = false;
        this.f49251f = -1;
        velocityTracker = this.f49254i;
        if (velocityTracker != null) {
            velocityTracker.recycle();
            this.f49254i = null;
        }
        velocityTracker2 = this.f49254i;
        if (velocityTracker2 != null) {
        }
        if (this.f49250e) {
        }
        z11 = false;
        this.f49250e = false;
        this.f49251f = -1;
        velocityTracker = this.f49254i;
        if (velocityTracker != null) {
        }
        velocityTracker2 = this.f49254i;
        if (velocityTracker2 != null) {
        }
        if (this.f49250e) {
        }
    }

    public abstract int y();

    public abstract int z(CoordinatorLayout coordinatorLayout, View view, int i5, int i11, int i12);
}
