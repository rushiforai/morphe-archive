package i30;

import android.graphics.Rect;
import android.view.MotionEvent;
import java.util.ArrayList;

/* loaded from: classes4.dex */
public abstract class n {

    /* renamed from: a, reason: collision with root package name */
    public final Rect f61319a = new Rect();

    /* renamed from: b, reason: collision with root package name */
    public l f61320b;

    /* renamed from: c, reason: collision with root package name */
    public n f61321c;

    /* renamed from: d, reason: collision with root package name */
    public ArrayList f61322d;

    /* renamed from: e, reason: collision with root package name */
    public n f61323e;

    /* renamed from: f, reason: collision with root package name */
    public int f61324f;

    public n() {
        new Rect();
        this.f61324f = 0;
    }

    public static boolean c(MotionEvent motionEvent, int i5, int i11, n nVar, boolean z11) {
        Rect rect = nVar.f61319a;
        int i12 = rect.left;
        int i13 = rect.top;
        if (z11 && !rect.contains(i5, i11)) {
            return false;
        }
        motionEvent.offsetLocation(-i12, -i13);
        if (nVar.b(motionEvent)) {
            motionEvent.offsetLocation(i12, i13);
            return true;
        }
        motionEvent.offsetLocation(i12, i13);
        return false;
    }

    public final void a(n nVar) {
        if (nVar.f61321c != null) {
            throw new IllegalStateException();
        }
        if (this.f61322d == null) {
            this.f61322d = new ArrayList();
        }
        this.f61322d.add(nVar);
        nVar.f61321c = this;
        l lVar = this.f61320b;
        if (lVar != null) {
            nVar.j(lVar);
        }
    }

    public final boolean b(MotionEvent motionEvent) {
        int x11 = (int) motionEvent.getX();
        int y11 = (int) motionEvent.getY();
        int action = motionEvent.getAction();
        n nVar = this.f61323e;
        if (nVar != null) {
            if (action != 0) {
                c(motionEvent, x11, y11, nVar, false);
                if (action != 3 && action != 1) {
                    return true;
                }
                this.f61323e = null;
                return true;
            }
            MotionEvent motionEventObtain = MotionEvent.obtain(motionEvent);
            motionEventObtain.setAction(3);
            c(motionEventObtain, x11, y11, this.f61323e, false);
            this.f61323e = null;
        }
        if (action == 0) {
            ArrayList arrayList = this.f61322d;
            for (int size = (arrayList != null ? arrayList.size() : 0) - 1; size >= 0; size--) {
                n nVarD = d(size);
                if (nVarD.f() == 0 && c(motionEvent, x11, y11, nVarD, true)) {
                    this.f61323e = nVarD;
                    return true;
                }
            }
        }
        return m(motionEvent);
    }

    public final n d(int i5) {
        ArrayList arrayList = this.f61322d;
        if (arrayList != null) {
            return (n) arrayList.get(i5);
        }
        throw new ArrayIndexOutOfBoundsException(i5);
    }

    public final int e() {
        Rect rect = this.f61319a;
        return rect.bottom - rect.top;
    }

    public final int f() {
        return (this.f61324f & 1) == 0 ? 0 : 1;
    }

    public final int g() {
        Rect rect = this.f61319a;
        return rect.right - rect.left;
    }

    public final void h() {
        l lVar = this.f61320b;
        if (lVar != null) {
            lVar.requestRender();
        }
    }

    public final void i(int i5, int i11) {
        Rect rect = this.f61319a;
        boolean z11 = (i5 == rect.right - rect.left && i11 == rect.bottom - rect.top) ? false : true;
        rect.set(0, 0, i5, i11);
        this.f61324f &= -5;
        l(i5, i11, z11);
    }

    public final void j(l lVar) {
        this.f61320b = lVar;
        ArrayList arrayList = this.f61322d;
        int size = arrayList == null ? 0 : arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            d(i5).j(lVar);
        }
    }

    public final void k() {
        ArrayList arrayList = this.f61322d;
        int size = arrayList == null ? 0 : arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            d(i5).k();
        }
        this.f61320b = null;
    }

    public void l(int i5, int i11, boolean z11) {
    }

    public boolean m(MotionEvent motionEvent) {
        return false;
    }

    public final void n() {
        ArrayList arrayList = this.f61322d;
        int size = arrayList == null ? 0 : arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            n nVarD = d(i5);
            if (nVarD.f() == 0) {
                nVarD.n();
            }
        }
    }

    public void o(i iVar) {
        p(iVar);
        ArrayList arrayList = this.f61322d;
        int size = arrayList == null ? 0 : arrayList.size();
        for (int i5 = 0; i5 < size; i5++) {
            n nVarD = d(i5);
            if (nVarD.f() == 0) {
                Rect rect = nVarD.f61319a;
                iVar.k(rect.left, rect.top);
                nVarD.o(iVar);
                iVar.k(-r4, -r3);
            }
        }
    }

    public void p(i iVar) {
    }

    public final void q(int i5) {
        if (i5 == f()) {
            return;
        }
        if (i5 == 0) {
            this.f61324f &= -2;
        } else {
            this.f61324f |= 1;
        }
        n();
        h();
    }
}
