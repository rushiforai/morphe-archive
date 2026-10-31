package x9;

import android.animation.Animator;
import android.animation.ValueAnimator;
import android.graphics.Point;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.view.MotionEvent;
import android.view.VelocityTracker;
import android.view.View;
import android.view.ViewConfiguration;
import com.android.launcher3.Workspace;
import com.android.launcher3.dragndrop.DragLayer;
import e10.y2;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Objects;
import mx.j0;
import o7.g0;
import o9.d4;
import o9.g3;
import o9.j4;
import o9.l0;
import o9.l2;
import o9.m0;
import o9.n1;
import s90.s0;
import ya.k0;

/* loaded from: classes.dex */
public final class t implements k0 {

    /* renamed from: a, reason: collision with root package name */
    public final n1 f95705a;

    /* renamed from: e, reason: collision with root package name */
    public i f95709e;

    /* renamed from: i, reason: collision with root package name */
    public l0 f95713i;

    /* renamed from: l, reason: collision with root package name */
    public m0 f95716l;

    /* renamed from: m, reason: collision with root package name */
    public int f95717m;
    public boolean o;

    /* renamed from: q, reason: collision with root package name */
    public final x7.u f95719q;

    /* renamed from: b, reason: collision with root package name */
    public final Rect f95706b = new Rect();

    /* renamed from: c, reason: collision with root package name */
    public final int[] f95707c = new int[2];

    /* renamed from: d, reason: collision with root package name */
    public c3.b f95708d = null;

    /* renamed from: f, reason: collision with root package name */
    public final Point f95710f = new Point();

    /* renamed from: g, reason: collision with root package name */
    public final Point f95711g = new Point();

    /* renamed from: h, reason: collision with root package name */
    public final Point f95712h = new Point();

    /* renamed from: j, reason: collision with root package name */
    public final ArrayList f95714j = new ArrayList();

    /* renamed from: k, reason: collision with root package name */
    public final ArrayList f95715k = new ArrayList();
    public int n = 0;

    /* renamed from: p, reason: collision with root package name */
    public final a90.d f95718p = new a90.d(this, 7);

    public t(n1 n1Var) {
        this.f95705a = n1Var;
        x7.u uVar = new x7.u();
        uVar.f95208a = n1Var;
        this.f95719q = uVar;
    }

    public final void a(c cVar) {
        this.f95715k.add(cVar);
    }

    public final void b() {
        h hVar;
        if (this.o && (hVar = this.f95709e.f95651d) != null) {
            hVar.f(this.f95713i, false);
        }
        this.o = false;
        this.f95709e = null;
        Iterator it = new ArrayList(this.f95715k).iterator();
        while (it.hasNext()) {
            ((c) it.next()).o();
        }
    }

    public final void c() {
        h hVar = this.f95709e.f95651d;
        if (hVar != null) {
            hVar.f(this.f95713i, true);
        }
        this.o = false;
        this.f95713i.f79954f.f95681m.j();
        Iterator it = new ArrayList(this.f95715k).iterator();
        while (it.hasNext()) {
            ((c) it.next()).E(this.f95713i, this.f95709e);
        }
    }

    public final void d() {
        if (o()) {
            m0 m0Var = this.f95716l;
            if (m0Var != null) {
                m0Var.x(this.f95713i);
            }
            l0 l0Var = this.f95713i;
            l0Var.f79959k = false;
            l0Var.f79958j = true;
            l0Var.f79953e = true;
            if (!this.o) {
                f(null, false);
            }
        }
        h();
    }

    public final void e(m0 m0Var) {
        if (m0Var != null) {
            m0 m0Var2 = this.f95716l;
            if (m0Var2 != m0Var) {
                if (m0Var2 != null) {
                    m0Var2.x(this.f95713i);
                }
                m0Var.u(this.f95713i);
            }
            m0Var.z(this.f95713i);
        } else {
            m0 m0Var3 = this.f95716l;
            if (m0Var3 != null) {
                m0Var3.x(this.f95713i);
            }
        }
        this.f95716l = m0Var;
    }

    public final void f(View view, boolean z11) {
        if (!z11) {
            this.f95705a.M.g(l2.f79974m);
            this.f95713i.f79959k = false;
        }
        l0 l0Var = this.f95713i;
        l0Var.f79957i.i(view, l0Var, z11);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final void g(m0 m0Var, ya.m mVar) {
        l0 l0Var = this.f95713i;
        int[] iArr = this.f95707c;
        boolean z11 = false;
        l0Var.f79949a = iArr[0];
        l0Var.f79950b = iArr[1];
        m0 m0Var2 = this.f95716l;
        if (m0Var != m0Var2) {
            if (m0Var2 != null) {
                m0Var2.x(l0Var);
            }
            this.f95716l = m0Var;
            if (m0Var != 0) {
                m0Var.u(this.f95713i);
            }
        }
        l0 l0Var2 = this.f95713i;
        l0Var2.f79953e = true;
        if (this.o) {
            if (m0Var != 0) {
                m0Var.x(l0Var2);
                return;
            }
            return;
        }
        if (m0Var != 0) {
            m0Var.x(l0Var2);
            if (m0Var.y(this.f95713i)) {
                if (mVar != null) {
                    mVar.run();
                } else {
                    m0Var.v(this.f95713i, this.f95709e);
                }
                z11 = true;
            }
        }
        f(m0Var instanceof View ? (View) m0Var : null, z11);
    }

    public final void h() {
        boolean z11;
        if (o()) {
            this.f95708d = null;
            u uVar = this.f95713i.f79954f;
            if (uVar != null) {
                Handler handler = uVar.getHandler();
                if (handler != null) {
                    handler.removeCallbacks(this.f95718p);
                }
                l0 l0Var = this.f95713i;
                z11 = l0Var.f79959k;
                if (!z11) {
                    u uVar2 = l0Var.f79954f;
                    if (uVar2.getParent() != null) {
                        uVar2.f95682p.removeView(uVar2);
                    }
                } else if (this.o && l0Var.f79954f.getAlpha() > 0.0f) {
                    j4 j4Var = new j4(null, null, 1);
                    u uVar3 = this.f95713i.f79954f;
                    Point point = this.f95710f;
                    uVar3.e(point.x, point.y, j4Var, -1);
                    this.f95713i.f79954f.c(true);
                }
                this.f95713i.f79954f = null;
            } else {
                z11 = false;
            }
            if (!z11) {
                b();
            }
        }
        x7.u uVar4 = this.f95719q;
        VelocityTracker velocityTracker = (VelocityTracker) uVar4.f95210c;
        if (velocityTracker != null) {
            velocityTracker.recycle();
            uVar4.f95210c = null;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final m0 i(int i5, int i11, int[] iArr) {
        l0 l0Var = this.f95713i;
        l0Var.f79949a = i5;
        l0Var.f79950b = i11;
        ArrayList arrayList = this.f95714j;
        int size = arrayList.size() - 1;
        while (true) {
            n1 n1Var = this.f95705a;
            if (size < 0) {
                iArr[0] = i5;
                iArr[1] = i11;
                DragLayer dragLayer = n1Var.P;
                Workspace workspace = n1Var.O;
                float[] fArr = dragLayer.f98435b;
                fArr[0] = i5;
                fArr[1] = i11;
                g3.q(workspace, dragLayer, fArr);
                g3.s(fArr, iArr);
                return n1Var.O;
            }
            m0 m0Var = (m0) arrayList.get(size);
            if (m0Var.w()) {
                Rect rect = this.f95706b;
                m0Var.a(rect);
                if (rect.contains(i5, i11)) {
                    iArr[0] = i5;
                    iArr[1] = i11;
                    DragLayer dragLayer2 = n1Var.P;
                    float[] fArr2 = dragLayer2.f98435b;
                    fArr2[0] = i5;
                    fArr2[1] = i11;
                    g3.q((View) m0Var, dragLayer2, fArr2);
                    g3.s(fArr2, iArr);
                    return m0Var;
                }
            }
            size--;
        }
    }

    public final Point j(float f11, float f12) {
        this.f95705a.P.getLocalVisibleRect(this.f95706b);
        int iMax = (int) Math.max(r1.left, Math.min(f11, r1.right - 1));
        Point point = this.f95712h;
        point.x = iMax;
        point.y = (int) Math.max(r1.top, Math.min(f12, r1.bottom - 1));
        return point;
    }

    @Override // ya.k0
    public final boolean k(MotionEvent motionEvent) {
        c3.b bVar = this.f95708d;
        return bVar != null && bVar.x(motionEvent);
    }

    @Override // ya.k0
    public final boolean l(MotionEvent motionEvent) {
        i iVar = this.f95709e;
        if (iVar != null && iVar.f95648a) {
            return false;
        }
        Point pointJ = j(motionEvent.getX(), motionEvent.getY());
        this.f95711g.set(pointJ.x, pointJ.y);
        if (motionEvent.getAction() == 0) {
            this.f95710f.set(pointJ.x, pointJ.y);
        }
        if (g3.f79851f) {
            this.f95717m = motionEvent.getClassification();
        }
        c3.b bVar = this.f95708d;
        return bVar != null && bVar.w(motionEvent);
    }

    public final void m(int i5, int i11) {
        h hVar;
        this.f95713i.f79954f.d(i5, i11);
        int[] iArr = this.f95707c;
        m0 m0VarI = i(i5, i11, iArr);
        l0 l0Var = this.f95713i;
        l0Var.f79949a = iArr[0];
        l0Var.f79950b = iArr[1];
        if (!this.o) {
            e(m0VarI);
        }
        double d5 = this.n;
        Point point = this.f95711g;
        this.n = (int) (Math.hypot(point.x - i5, point.y - i11) + d5);
        point.set(i5, i11);
        int i12 = this.n;
        if (g3.f79851f && this.f95717m == 2) {
            i12 /= 3;
        }
        if (this.o && (hVar = this.f95709e.f95651d) != null && hVar.g(i12)) {
            c();
        }
    }

    public final boolean o() {
        if (this.f95708d != null) {
            return true;
        }
        i iVar = this.f95709e;
        return iVar != null && iVar.f95648a;
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x00b4  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x00b6  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x00bd  */
    /* JADX WARN: Removed duplicated region for block: B:36:0x00cc  */
    /* JADX WARN: Removed duplicated region for block: B:37:0x00d4  */
    /* JADX WARN: Removed duplicated region for block: B:8:0x0019  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void p(float f11, float f12) {
        PointF pointF;
        boolean z11;
        ya.m mVar;
        l0 l0Var = this.f95713i;
        i iVar = this.f95709e;
        x7.u uVar = this.f95719q;
        if (iVar != null) {
            n1 n1Var = (n1) uVar.f95208a;
            if (((VelocityTracker) uVar.f95210c) != null) {
                if (((o9.p) uVar.f95209b) == null) {
                    uVar.f95209b = (o9.p) n1Var.L.findViewById(2131427847);
                }
                o9.p pVar = (o9.p) uVar.f95209b;
                if (pVar == null || !pVar.w()) {
                    pointF = null;
                    z11 = pointF == null;
                    iVar.f95652e = z11;
                    if (!z11) {
                        mVar = new ya.m(l0Var, pointF, (o9.p) uVar.f95209b, (n1) uVar.f95208a, iVar);
                    }
                } else {
                    ((VelocityTracker) uVar.f95210c).computeCurrentVelocity(1000, ViewConfiguration.get(n1Var).getScaledMaximumFlingVelocity());
                    pointF = new PointF(((VelocityTracker) uVar.f95210c).getXVelocity(), ((VelocityTracker) uVar.f95210c).getYVelocity());
                    j0 j0Var = n1Var.f79934x;
                    if ((((VelocityTracker) uVar.f95210c).getYVelocity() < ((float) j0Var.f77168t0) ? x7.u.i(pointF, new PointF(0.0f, -1.0f)) : (!n1Var.f79934x.o() || ((VelocityTracker) uVar.f95210c).getXVelocity() >= ((float) j0Var.f77168t0)) ? 36.0f : x7.u.i(pointF, new PointF(-1.0f, 0.0f))) > Math.toRadians(35.0d)) {
                    }
                    if (pointF == null) {
                    }
                    iVar.f95652e = z11;
                    if (!z11) {
                    }
                }
            }
            if (mVar == null) {
                g((o9.p) uVar.f95209b, mVar);
            } else {
                g(i((int) f11, (int) f12, this.f95707c), null);
            }
            h();
        }
        uVar.getClass();
        mVar = null;
        if (mVar == null) {
        }
        h();
    }

    public final void q() {
        DragLayer dragLayer = this.f95705a.P;
        Animator animator = dragLayer.f21082q;
        dragLayer.f21082q = null;
        if (animator != null) {
            animator.cancel();
        }
    }

    public final void r(c cVar) {
        this.f95715k.remove(cVar);
    }

    public final void s(m0 m0Var) {
        this.f95714j.remove(m0Var);
    }

    public final u t(Drawable drawable, View view, int i5, int i11, o9.k0 k0Var, ga.e eVar, Point point, Rect rect, float f11, float f12, i iVar) {
        l0 l0Var;
        u uVar;
        Point point2;
        Point point3;
        n1 n1Var = this.f95705a;
        n1Var.h();
        o9.a.M(n1Var, false, 64);
        this.f95709e = iVar;
        Point point4 = iVar.f95650c;
        Point point5 = this.f95710f;
        Point point6 = this.f95711g;
        if (point4 != null) {
            int i12 = point4.x;
            point5.x = i12;
            point6.x = i12;
            int i13 = point4.y;
            point5.y = i13;
            point6.y = i13;
        }
        int i14 = point5.x - i5;
        int i15 = point5.y - i11;
        int i16 = rect == null ? 0 : rect.left;
        int i17 = rect == null ? 0 : rect.top;
        this.f95716l = null;
        this.f95713i = new l0(n1Var.getApplicationContext());
        h hVar = this.f95709e.f95651d;
        this.o = (hVar == null || hVar.g(0.0d)) ? false : true;
        float dimensionPixelSize = this.o ? n1Var.getResources().getDimensionPixelSize(2131166361) : 0.0f;
        l0 l0Var2 = this.f95713i;
        if (drawable != null) {
            l0Var = l0Var2;
            uVar = new u(n1Var, drawable, i14, i15, f11, f12, dimensionPixelSize);
            point2 = point5;
            point3 = point6;
        } else {
            l0Var = l0Var2;
            point2 = point5;
            point3 = point6;
            uVar = new u(n1Var, view, view.getMeasuredWidth(), view.getMeasuredHeight(), i14, i15, f11, f12, dimensionPixelSize);
        }
        l0Var.f79954f = uVar;
        int i18 = eVar.f57290b;
        if (i18 == 0 || i18 == 7 || i18 == 6 || i18 == 2) {
            y2.f51877a.getClass();
            if (((Boolean) y2.f().l()).booleanValue() && g3.a()) {
                ya.j.f97149d.f97215a.postAtFrontOfQueue(new s0(8, uVar, eVar));
            }
        }
        l0 l0Var3 = this.f95713i;
        l0Var3.f79953e = false;
        l0Var3.f79951c = point2.x - (i5 + i16);
        l0Var3.f79952d = point2.y - (i11 + i17);
        i iVar2 = this.f95709e;
        x7.u uVar2 = this.f95719q;
        Objects.requireNonNull(uVar2);
        this.f95708d = c3.b.i(this, iVar2, new aa.w(uVar2, 9));
        if (!this.f95709e.f95648a) {
            this.f95713i.f79960l = g0.d(uVar);
        }
        l0 l0Var4 = this.f95713i;
        l0Var4.f79957i = k0Var;
        l0Var4.f79955g = eVar;
        l0Var4.f79956h = eVar.p();
        if (point != null) {
            new Point(point);
        }
        if (rect != null) {
            uVar.n = new Rect(rect);
        }
        n1Var.P.performHapticFeedback(0);
        Point point7 = point3;
        int i19 = point7.x;
        int i21 = point7.y;
        uVar.f95682p.addView(uVar);
        za.h hVar2 = new za.h(uVar.f95673e, uVar.f95674f);
        hVar2.f98433d = true;
        uVar.setLayoutParams(hVar2);
        View view2 = uVar.f95669a;
        if (view2 != null) {
            view2.setVisibility(0);
        }
        uVar.d(i19, i21);
        ValueAnimator valueAnimator = uVar.f95684r;
        Objects.requireNonNull(valueAnimator);
        uVar.post(new d4(valueAnimator, 16));
        this.n = 0;
        if (this.o) {
            h hVar3 = this.f95709e.f95651d;
            if (hVar3 != null) {
                hVar3.b(this.f95713i);
            }
        } else {
            c();
        }
        m(point7.x, point7.y);
        if (!n1Var.f80018s0 && iVar.f95650c == null) {
            ya.j.f97147b.submit(new d4(this, 17));
        }
        return uVar;
    }
}
