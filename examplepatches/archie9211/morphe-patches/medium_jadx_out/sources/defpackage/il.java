package defpackage;

import android.os.Handler;
import android.os.Looper;
import android.view.ActionMode;
import android.view.View;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class il extends p4d implements x45 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ Object d;
    public Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ il(Object obj, Object obj2, n92 n92Var, int i) {
        super(1, n92Var);
        this.b = i;
        this.e = obj;
        this.d = obj2;
    }

    @Override // defpackage.kn0
    public final n92 create(n92 n92Var) {
        int i = this.b;
        Object obj = this.d;
        switch (i) {
            case 0:
                return new il((sl) this.e, (c55) obj, n92Var, 0);
            case 1:
                return new il((tl) this.e, (c55) obj, n92Var, 1);
            case 2:
                return new il((ul) this.e, (c55) obj, n92Var, 2);
            case 3:
                return new il((ts) this.e, (ygd) obj, n92Var, 3);
            case 4:
                return new il((uo0) this.e, (to0) obj, n92Var, 4);
            case 5:
                return new il((mu2) obj, n92Var);
            case 6:
                return new il((do4) this.e, (rya) obj, n92Var, 6);
            default:
                return new il((xbg) this.e, (e4g) obj, n92Var, 7);
        }
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        n92 n92Var = (n92) obj;
        switch (i) {
        }
        return ((il) create(n92Var)).invokeSuspend(c1eVar);
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        Handler handler;
        qs qsVar;
        Throwable th;
        rpc ctaVar;
        int i = this.b;
        int i2 = 6;
        int i3 = 5;
        int i4 = 2;
        c1e c1eVar = c1e.a;
        Object obj2 = this.d;
        int i5 = 1;
        n92 n92Var = null;
        switch (i) {
            case 0:
                tb2 tb2Var = tb2.COROUTINE_SUSPENDED;
                int i6 = this.c;
                if (i6 != 0) {
                    if (i6 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                sl slVar = (sl) this.e;
                dl dlVar = new dl(slVar, i4);
                l0 l0Var = new l0((c55) obj2, slVar, n92Var, 4);
                this.c = 1;
                return sgg.X(dlVar, l0Var, this) == tb2Var ? tb2Var : c1eVar;
            case 1:
                tb2 tb2Var2 = tb2.COROUTINE_SUSPENDED;
                int i7 = this.c;
                if (i7 != 0) {
                    if (i7 == 1) {
                        br7.v(obj);
                        return c1eVar;
                    }
                    ygf.f("call to 'resume' before 'invoke' with coroutine");
                    return null;
                }
                br7.v(obj);
                tl tlVar = (tl) this.e;
                el elVar = new el(tlVar, i4);
                l0 l0Var2 = new l0((c55) obj2, tlVar, n92Var, i3);
                this.c = 1;
                return rx0.U(elVar, l0Var2, this) == tb2Var2 ? tb2Var2 : c1eVar;
            case 2:
                ul ulVar = (ul) this.e;
                tb2 tb2Var3 = tb2.COROUTINE_SUSPENDED;
                int i8 = this.c;
                if (i8 == 0) {
                    br7.v(obj);
                    fl flVar = new fl(ulVar, i5);
                    l0 l0Var3 = new l0((c55) obj2, ulVar, n92Var, i2);
                    this.c = 1;
                    if (vx0.l0(flVar, l0Var3, this) == tb2Var3) {
                        return tb2Var3;
                    }
                } else {
                    if (i8 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                ry2 ry2VarB = ulVar.b();
                g49 g49Var = ulVar.f;
                Object objA = ry2VarB.a(g49Var.g());
                if (objA == null) {
                    return c1eVar;
                }
                if (Math.abs(g49Var.g() - ulVar.b().c(objA)) >= 0.5f) {
                    return c1eVar;
                }
                ulVar.d.setValue(objA);
                ulVar.c.setValue(objA);
                return c1eVar;
            case 3:
                ts tsVar = (ts) this.e;
                gjc gjcVar = tsVar.e;
                View view = tsVar.a;
                tb2 tb2Var4 = tb2.COROUTINE_SUSPENDED;
                int i9 = this.c;
                try {
                    if (i9 == 0) {
                        br7.v(obj);
                        rs rsVar = new rs();
                        ygd ygdVar = (ygd) obj2;
                        int i10 = 0;
                        qs qsVar2 = new qs(rsVar, new os(tsVar, ygdVar, 0), new os(tsVar, ygdVar, 1), view);
                        x45 x45Var = tsVar.b;
                        if (x45Var != null && (qsVar = (qs) x45Var.invoke(qsVar2)) != null) {
                            qsVar2 = qsVar;
                        }
                        Looper looperMyLooper = Looper.myLooper();
                        Handler handler2 = view.getHandler();
                        if (looperMyLooper != (handler2 != null ? handler2.getLooper() : null)) {
                            ss ssVar = tsVar.i;
                            if (ssVar == null) {
                                ssVar = new ss(tsVar, qsVar2, rsVar, i10);
                                tsVar.i = ssVar;
                            }
                            view.post(ssVar);
                        } else {
                            ActionMode actionModeStartActionMode = view.startActionMode(new yn4(qsVar2), 1);
                            if (actionModeStartActionMode == null) {
                                return c1eVar;
                            }
                            tsVar.h = actionModeStartActionMode;
                        }
                        this.c = 1;
                        Object objQ = rsVar.a.q(this);
                        if (objQ != tb2Var4) {
                            objQ = c1eVar;
                        }
                        if (objQ == tb2Var4) {
                            return tb2Var4;
                        }
                    } else {
                        if (i9 != 1) {
                            ygf.f("call to 'resume' before 'invoke' with coroutine");
                            return null;
                        }
                        br7.v(obj);
                    }
                    if (Looper.myLooper() != (handler != null ? handler.getLooper() : null)) {
                        Runnable v0Var = tsVar.j;
                        if (v0Var == null) {
                            v0Var = new v0(i3, tsVar);
                            tsVar.j = v0Var;
                        }
                        view.post(v0Var);
                    } else {
                        ActionMode actionMode = tsVar.h;
                        if (actionMode != null) {
                            actionMode.finish();
                        }
                    }
                    ss ssVar2 = tsVar.i;
                    if (ssVar2 != null) {
                        view.removeCallbacks(ssVar2);
                    }
                    tsVar.h = null;
                    return c1eVar;
                } finally {
                    gjcVar.a();
                    Looper looperMyLooper2 = Looper.myLooper();
                    handler = view.getHandler();
                    if (looperMyLooper2 != (handler != null ? handler.getLooper() : null)) {
                        Runnable v0Var2 = tsVar.j;
                        if (v0Var2 == null) {
                            v0Var2 = new v0(i3, tsVar);
                            tsVar.j = v0Var2;
                        }
                        view.post(v0Var2);
                    } else {
                        ActionMode actionMode2 = tsVar.h;
                        if (actionMode2 != null) {
                            actionMode2.finish();
                        }
                    }
                    ss ssVar3 = tsVar.i;
                    if (ssVar3 != null) {
                        view.removeCallbacks(ssVar3);
                    }
                    tsVar.h = null;
                }
            case 4:
                to0 to0Var = (to0) obj2;
                k49 k49Var = ((uo0) this.e).c;
                tb2 tb2Var5 = tb2.COROUTINE_SUSPENDED;
                int i11 = this.c;
                try {
                    if (i11 == 0) {
                        br7.v(obj);
                        k49Var.setValue(to0Var);
                        this.c = 1;
                        Object objQ2 = to0Var.b.q(this);
                        if (objQ2 != tb2Var5) {
                            objQ2 = c1eVar;
                        }
                        if (objQ2 == tb2Var5) {
                            return tb2Var5;
                        }
                    } else {
                        if (i11 != 1) {
                            ygf.f("call to 'resume' before 'invoke' with coroutine");
                            return null;
                        }
                        br7.v(obj);
                    }
                    return c1eVar;
                } finally {
                    k49Var.setValue(null);
                }
            case 5:
                mu2 mu2Var = (mu2) obj2;
                tb2 tb2Var6 = tb2.COROUTINE_SUSPENDED;
                int i12 = this.c;
                try {
                } catch (Throwable th2) {
                    b56 b56VarC = mu2Var.c();
                    this.e = th2;
                    this.c = 2;
                    Object objB = b56VarC.b(this);
                    if (objB != tb2Var6) {
                        obj = objB;
                        th = th2;
                    }
                    return tb2Var6;
                }
                if (i12 == 0) {
                    br7.v(obj);
                    this.c = 1;
                    obj = mu2Var.h(true, this);
                    if (obj == tb2Var6) {
                        return tb2Var6;
                    }
                } else {
                    if (i12 != 1) {
                        if (i12 != 2) {
                            ygf.f("call to 'resume' before 'invoke' with coroutine");
                            return null;
                        }
                        th = (Throwable) this.e;
                        br7.v(obj);
                        ctaVar = new cta(((Number) obj).intValue(), th);
                        return new f09(ctaVar, Boolean.TRUE);
                    }
                    br7.v(obj);
                }
                ctaVar = (rpc) obj;
                return new f09(ctaVar, Boolean.TRUE);
            case 6:
                rya ryaVar = (rya) obj2;
                tb2 tb2Var7 = tb2.COROUTINE_SUSPENDED;
                int i13 = this.c;
                if (i13 == 0) {
                    br7.v(obj);
                    do4 do4Var = (do4) this.e;
                    d1g d1gVar = flb.i;
                    Object obj3 = ryaVar.a;
                    if (obj3 == d1gVar) {
                        obj3 = null;
                    }
                    this.c = 1;
                    if (do4Var.a(obj3, this) == tb2Var7) {
                        return tb2Var7;
                    }
                } else {
                    if (i13 != 1) {
                        ygf.f("call to 'resume' before 'invoke' with coroutine");
                        return null;
                    }
                    br7.v(obj);
                }
                ryaVar.a = null;
                return c1eVar;
            default:
                tb2 tb2Var8 = tb2.COROUTINE_SUSPENDED;
                int i14 = this.c;
                br7.v(obj);
                if (i14 != 0) {
                    return obj;
                }
                xbg xbgVar = (xbg) this.e;
                kaf kafVar = new kaf((e4g) obj2, n92Var, i2);
                this.c = 1;
                xbgVar.getClass();
                Object objA2 = new wcg(54, kafVar, null).a(xbgVar.a, this);
                return objA2 == tb2Var8 ? tb2Var8 : objA2;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public il(mu2 mu2Var, n92 n92Var) {
        super(1, n92Var);
        this.b = 5;
        this.d = mu2Var;
    }
}
