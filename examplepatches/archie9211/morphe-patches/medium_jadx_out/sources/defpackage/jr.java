package defpackage;

import android.os.Looper;
import android.view.Choreographer;
import android.view.MotionEvent;
import android.view.View;
import java.io.File;
import java.util.concurrent.CancellationException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jr extends co6 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ jr(Object obj, int i, Object obj2) {
        super(1);
        this.a = i;
        this.c = obj;
        this.b = obj2;
    }

    private final Object a(Object obj) {
        dt dtVar = (dt) this.c;
        et etVar = (et) this.b;
        synchronized (dtVar.e) {
            dtVar.g.remove(etVar);
        }
        return c1e.a;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        xwa xwaVar;
        c1e c1eVar;
        n92 n92Var = null;
        int i = 0;
        switch (this.a) {
            case 0:
                return new t26((lx6) this.c, new ir(i, (kr) this.b));
            case 1:
                t26 t26Var = (t26) this.c;
                synchronized (t26Var.c) {
                    try {
                        t26Var.e = true;
                        o78 o78Var = t26Var.d;
                        Object[] objArr = o78Var.a;
                        int i2 = o78Var.c;
                        while (i < i2) {
                            yl8 yl8Var = (yl8) ((e1f) objArr[i]).get();
                            if (yl8Var != null && (xwaVar = yl8Var.b) != null) {
                                yl8Var.a(xwaVar);
                                yl8Var.b = null;
                            }
                            i++;
                        }
                        t26Var.d.i();
                    } catch (Throwable th) {
                        throw th;
                    }
                }
                zid zidVar = ((kr) this.b).b;
                zidVar.b.set(null);
                zidVar.a.e();
                return c1e.a;
            case 2:
                dd9 dd9Var = (dd9) this.c;
                dd9Var.setPositionProvider((gd9) this.b);
                dd9Var.q();
                return new or(0);
            case 3:
                return a(obj);
            case 4:
                ((Choreographer) ((ft) this.c).b).removeFrameCallback((et) this.b);
                return c1e.a;
            case 5:
                ((aq6) this.c).d0(((r28) obj).b((r28) this.b));
                return c1e.a;
            case 6:
                ((s99) obj).g((t99) this.c, 0, 0, ((x82) this.b).c.g());
                return c1e.a;
            case 7:
                s99.p((s99) obj, (t99) this.c, 0, 0, ((gs0) this.b).o, 4);
                return c1e.a;
            case 8:
                a34 a34Var = (a34) obj;
                a34Var.getClass();
                ((ru2) ((iq1) this.c).e).m(a34Var, (u77) this.b, u34.DEFAULT);
                return c1e.a;
            case 9:
                c7 c7Var = (c7) obj;
                c7Var.getClass();
                int i3 = c7Var.a;
                if (i3 == -1) {
                    ((v97) this.c).Y().i(n41.Login.toRequestCode(), i3, c7Var.b);
                } else {
                    ((m15) this.b).finish();
                }
                return c1e.a;
            case 10:
                a34 a34Var2 = (a34) obj;
                a34Var2.getClass();
                ((ha7) this.c).c.m(a34Var2, (u77) this.b, u34.DEFAULT);
                return c1e.a;
            case 11:
                c1e c1eVar2 = c1e.a;
                if (g76.L((String) obj, ((File) this.c).getName())) {
                    l2a l2aVar = (l2a) this.b;
                    Object objE = l2aVar.d.e(c1eVar2);
                    if (objE instanceof jk1) {
                        Object obj2 = ((kk1) g01.U(zx3.a, new r91(l2aVar, n92Var, 7))).a;
                    }
                }
                return c1eVar2;
            case 12:
                MotionEvent motionEvent = (MotionEvent) obj;
                yb9 yb9Var = (yb9) this.b;
                if (motionEvent.getActionMasked() == 0) {
                    n0c n0cVar = (n0c) this.c;
                    x45 x45Var = yb9Var.b;
                    if (x45Var == null) {
                        g76.g0("onTouchEvent");
                        throw null;
                    }
                    n0cVar.c = ((Boolean) x45Var.invoke(motionEvent)).booleanValue() ? wb9.Dispatching : wb9.NotDispatching;
                } else {
                    x45 x45Var2 = yb9Var.b;
                    if (x45Var2 == null) {
                        g76.g0("onTouchEvent");
                        throw null;
                    }
                    x45Var2.invoke(motionEvent);
                }
                return c1e.a;
            case 13:
                c1e c1eVar3 = c1e.a;
                Throwable th2 = (Throwable) obj;
                ((ce) this.c).invoke(th2);
                uz0 uz0Var = (uz0) ((o2b) this.b).d;
                uz0Var.f(th2, false);
                do {
                    Object objA = kk1.a(uz0Var.o());
                    if (objA != null) {
                        ((vy7) objA).b.i0(th2 == null ? new CancellationException("DataStore scope was cancelled before updateData could complete") : th2);
                        c1eVar = c1eVar3;
                    } else {
                        c1eVar = null;
                    }
                } while (c1eVar != null);
                return c1eVar3;
            case 14:
                s99.p((s99) obj, (t99) this.c, 0, 0, ((cec) this.b).B, 4);
                return c1e.a;
            case 15:
                u12 u12Var = (u12) obj;
                mz1 mz1Var = (mz1) this.b;
                a9f a9fVar = (a9f) this.c;
                if (!a9fVar.c) {
                    iy6 iy6Var = u12Var.c;
                    View view = u12Var.a;
                    wx6 lifecycle = iy6Var.getLifecycle();
                    a9fVar.e = mz1Var;
                    if (a9fVar.d == null) {
                        if (g76.L(Looper.myLooper(), view.getHandler().getLooper())) {
                            a9fVar.d = lifecycle;
                            lifecycle.a(a9fVar);
                        } else {
                            view.post(new fi2(a9fVar, 29, lifecycle));
                        }
                    } else if (((ky6) lifecycle).d.isAtLeast(vx6.CREATED)) {
                        a9fVar.b.A(new mz1(new y22(a9fVar, u12Var, mz1Var, 3), true, -1723985096));
                    }
                }
                return c1e.a;
            default:
                ((s99) obj).g((t99) this.c, 0, 0, ((wff) this.b).o);
                return c1e.a;
        }
    }
}
