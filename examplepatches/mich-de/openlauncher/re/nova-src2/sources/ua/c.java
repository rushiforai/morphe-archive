package ua;

import ab.k;
import android.content.Context;
import android.graphics.PointF;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.ViewConfiguration;
import java.util.LinkedList;

/* loaded from: classes.dex */
public abstract class c {

    /* renamed from: r, reason: collision with root package name */
    public static final PointF f90733r = new PointF();

    /* renamed from: a, reason: collision with root package name */
    public final float f90734a;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f90737d;

    /* renamed from: e, reason: collision with root package name */
    public final float f90738e;

    /* renamed from: f, reason: collision with root package name */
    public final float f90739f;

    /* renamed from: i, reason: collision with root package name */
    public VelocityTracker f90742i;
    public boolean n;
    public boolean o;

    /* renamed from: p, reason: collision with root package name */
    public final Context f90747p;

    /* renamed from: q, reason: collision with root package name */
    public final float f90748q;

    /* renamed from: b, reason: collision with root package name */
    public final PointF f90735b = new PointF();

    /* renamed from: c, reason: collision with root package name */
    public final PointF f90736c = new PointF();

    /* renamed from: g, reason: collision with root package name */
    public final LinkedList f90740g = new LinkedList();

    /* renamed from: h, reason: collision with root package name */
    public int f90741h = -1;

    /* renamed from: j, reason: collision with root package name */
    public final PointF f90743j = new PointF();

    /* renamed from: k, reason: collision with root package name */
    public final PointF f90744k = new PointF();

    /* renamed from: l, reason: collision with root package name */
    public final PointF f90745l = new PointF();

    /* renamed from: m, reason: collision with root package name */
    public int f90746m = 1;

    public c(Context context, ViewConfiguration viewConfiguration, boolean z11) {
        float scaledTouchSlop = viewConfiguration.getScaledTouchSlop();
        this.f90738e = scaledTouchSlop;
        this.f90739f = viewConfiguration.getScaledMaximumFlingVelocity();
        this.f90737d = z11;
        this.f90747p = context;
        this.f90734a = context.getResources().getDimensionPixelSize(2131165307);
        this.f90748q = scaledTouchSlop * 1.5f;
    }

    public static long a(float f11, float f12) {
        return (long) Math.max(100.0f, (1200.0f / Math.max(2.0f, Math.abs(f11 * 0.5f))) * Math.max(0.2f, f12));
    }

    public final void b() {
        if (this.f90746m == 2) {
            h(3);
        }
        VelocityTracker velocityTracker = this.f90742i;
        if (velocityTracker != null) {
            velocityTracker.recycle();
        }
        this.f90742i = null;
        this.f90743j.set(0.0f, 0.0f);
        this.f90744k.set(0.0f, 0.0f);
        this.f90735b.set(Float.NaN, Float.NaN);
    }

    public final void c() {
        h(1);
    }

    public final boolean d() {
        int i5 = this.f90746m;
        return i5 == 2 || i5 == 3;
    }

    public final boolean e(float f11, float f12) {
        return Math.abs(f11) > this.f90734a && Math.abs(f12) > this.f90748q;
    }

    public final boolean f() {
        return this.f90746m == 1;
    }

    /* JADX WARN: Removed duplicated region for block: B:47:0x00e8  */
    /* JADX WARN: Removed duplicated region for block: B:54:0x00f5  */
    /* JADX WARN: Removed duplicated region for block: B:58:0x0100  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void g(MotionEvent motionEvent) {
        boolean z11;
        VelocityTracker velocityTracker;
        int actionMasked = motionEvent.getActionMasked();
        if (actionMasked == 0 && (velocityTracker = this.f90742i) != null) {
            velocityTracker.clear();
        }
        if (this.f90742i == null) {
            this.f90742i = VelocityTracker.obtain();
        }
        this.f90742i.addMovement(motionEvent);
        PointF pointF = this.f90743j;
        PointF pointF2 = this.f90736c;
        PointF pointF3 = this.f90744k;
        PointF pointF4 = this.f90735b;
        if (actionMasked == 0) {
            this.f90741h = motionEvent.getPointerId(0);
            pointF4.set(motionEvent.getX(), motionEvent.getY());
            pointF2.set(pointF4);
            pointF.set(0.0f, 0.0f);
            pointF3.set(0.0f, 0.0f);
            if (this.f90746m == 3 && this.o) {
                h(2);
                return;
            }
            return;
        }
        if (actionMasked != 1) {
            if (actionMasked == 2) {
                if (Float.isNaN(pointF4.x) || Float.isNaN(pointF4.y)) {
                    pointF4.set(motionEvent.getX(), motionEvent.getY());
                }
                int iFindPointerIndex = motionEvent.findPointerIndex(this.f90741h);
                if (iFindPointerIndex == -1) {
                    return;
                }
                pointF3.set(motionEvent.getX(iFindPointerIndex) - pointF4.x, motionEvent.getY(iFindPointerIndex) - pointF4.y);
                if (this.f90737d) {
                    pointF3.x = -pointF3.x;
                }
                if (this.f90746m != 2) {
                    i iVar = (i) this;
                    float f11 = iVar.f90738e * iVar.f90771v;
                    g gVar = iVar.f90768s;
                    if (Math.abs(gVar.c(pointF3)) >= Math.max(f11, Math.abs(gVar.d(pointF3)))) {
                        float fC = gVar.c(pointF3);
                        if ((iVar.f90770u & 2) > 0) {
                            switch (gVar.f90765a) {
                                case 0:
                                    z11 = fC > 0.0f;
                                    if (z11) {
                                        h(2);
                                        break;
                                    } else if ((iVar.f90770u & 1) > 0 && gVar.e(fC)) {
                                    }
                                    break;
                                default:
                                    if (fC < 0.0f) {
                                    }
                                    if (z11) {
                                    }
                                    break;
                            }
                            if (z11) {
                            }
                        }
                    }
                }
                if (this.f90746m == 2 && pointF3 != pointF) {
                    pointF.set(pointF3);
                    float f12 = pointF3.x;
                    PointF pointF5 = this.f90745l;
                    float f13 = f12 - pointF5.x;
                    float f14 = pointF3.y - pointF5.y;
                    PointF pointF6 = f90733r;
                    pointF6.set(f13, f14);
                    i iVar2 = (i) this;
                    g gVar2 = iVar2.f90768s;
                    float fC2 = gVar2.c(pointF6);
                    gVar2.d(pointF6);
                    iVar2.f90769t.B(fC2);
                }
                pointF2.set(motionEvent.getX(iFindPointerIndex), motionEvent.getY(iFindPointerIndex));
                return;
            }
            if (actionMasked != 3) {
                if (actionMasked != 6) {
                    return;
                }
                int actionIndex = motionEvent.getActionIndex();
                if (motionEvent.getPointerId(actionIndex) == this.f90741h) {
                    int i5 = actionIndex == 0 ? 1 : 0;
                    pointF4.set(motionEvent.getX(i5) - (pointF2.x - pointF4.x), motionEvent.getY(i5) - (pointF2.y - pointF4.y));
                    pointF2.set(motionEvent.getX(i5), motionEvent.getY(i5));
                    this.f90741h = motionEvent.getPointerId(i5);
                    return;
                }
                return;
            }
        }
        if (this.f90746m == 2) {
            h(3);
        }
        this.f90742i.recycle();
        this.f90742i = null;
        pointF.set(0.0f, 0.0f);
        pointF3.set(0.0f, 0.0f);
        pointF4.set(Float.NaN, Float.NaN);
    }

    public final void h(int i5) {
        boolean z11 = this.n;
        LinkedList linkedList = this.f90740g;
        if (z11) {
            linkedList.add(new k(this, i5, 11));
            return;
        }
        this.n = true;
        if (i5 == 2) {
            int i11 = this.f90746m;
            PointF pointF = this.f90745l;
            if (i11 == 3 && this.o) {
                pointF.set(0.0f, 0.0f);
            } else {
                PointF pointF2 = this.f90744k;
                float f11 = pointF2.x;
                float f12 = this.f90738e;
                pointF.x = f11 > 0.0f ? f12 : -f12;
                if (pointF2.y <= 0.0f) {
                    f12 = -f12;
                }
                pointF.y = f12;
            }
            int i12 = this.f90746m;
            if (i12 == 1) {
                i iVar = (i) this;
                iVar.f90769t.m(iVar.f90768s.c(iVar.f90745l), true);
            } else if (i12 == 3) {
                i iVar2 = (i) this;
                iVar2.f90769t.m(iVar2.f90768s.c(iVar2.f90745l), false);
            }
        }
        if (i5 == 3) {
            this.f90742i.computeCurrentVelocity(1000, this.f90739f);
            PointF pointF3 = new PointF(this.f90742i.getXVelocity() / 1000.0f, this.f90742i.getYVelocity() / 1000.0f);
            if (this.f90737d) {
                pointF3.x = -pointF3.x;
            }
            i iVar3 = (i) this;
            g gVar = iVar3.f90768s;
            iVar3.f90769t.d(gVar.c(pointF3), gVar.c(iVar3.f90744k));
        }
        this.f90746m = i5;
        this.n = false;
        if (linkedList.isEmpty()) {
            return;
        }
        ((Runnable) linkedList.remove()).run();
    }
}
