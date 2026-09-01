package defpackage;

import android.app.Application;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Looper;
import android.os.RemoteException;
import android.os.SystemClock;
import android.util.Log;
import android.view.View;
import com.android.billingclient.api.BillingResult;
import com.android.billingclient.api.m;
import com.android.billingclient.api.n;
import com.google.android.gms.cloudmessaging.zzt;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.tasks.RuntimeExecutionException;
import com.google.firebase.auth.FirebaseAuth;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.CancellationException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Executor;
import java.util.concurrent.ScheduledExecutorService;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class p0g implements Runnable {
    public final /* synthetic */ int a;
    public Object b;
    public final Object c;

    public p0g(kvf kvfVar, String str) {
        this.a = 20;
        this.c = kvfVar;
        vp7.n(str);
        this.b = str;
    }

    private final void a() {
        synchronized (((h57) this.c).c) {
            try {
                Object objR = ((h57) this.c).d.r(this.b);
                h57 h57Var = (h57) this.c;
                Object obj = h57Var.a;
                if (obj == null && objR != null) {
                    h57Var.a = objR;
                    h57Var.e.h(objR);
                } else if (obj != null && !obj.equals(objR)) {
                    h57 h57Var2 = (h57) this.c;
                    h57Var2.a = objR;
                    h57Var2.e.h(objR);
                }
            } catch (Throwable th) {
                throw th;
            }
        }
    }

    private final void b() {
        try {
            j();
        } catch (Error e) {
            synchronized (((wzb) this.c).b) {
                ((wzb) this.c).c = vzb.IDLE;
                throw e;
            }
        }
    }

    private final void c() {
        try {
            ((Runnable) this.c).run();
            synchronized (((s10) this.b).d) {
                ((s10) this.b).c();
            }
        } catch (Throwable th) {
            synchronized (((s10) this.b).d) {
                ((s10) this.b).c();
                throw th;
            }
        }
    }

    private final void d() {
        c8f c8fVarC = ((o6d) this.c).a.f.c((String) this.b);
        if (c8fVarC == null || g76.L(e72.j, c8fVarC.j)) {
            return;
        }
        synchronized (((o6d) this.c).c) {
            ((o6d) this.c).f.put(il7.w(c8fVarC), c8fVarC);
            o6d o6dVar = (o6d) this.c;
            ((o6d) this.c).g.put(il7.w(c8fVarC), a7f.a(o6dVar.h, c8fVarC, ((q7f) o6dVar.b).b, o6dVar));
        }
    }

    private final void e() {
        nhg nhgVar = (nhg) this.b;
        IBinder iBinder = (IBinder) this.c;
        synchronized (nhgVar) {
            if (iBinder == null) {
                nhgVar.a("Null service connection");
                return;
            }
            try {
                nhgVar.c = new d2f(iBinder);
                nhgVar.a = 2;
                ((ScheduledExecutorService) nhgVar.f.c).execute(new dag(nhgVar, 0));
            } catch (RemoteException e) {
                nhgVar.a(e.getMessage());
            }
        }
    }

    private final void f() {
        l6g l6gVar = (l6g) this.c;
        synchronized (l6gVar.c) {
            ((xq8) l6gVar.d).N((jrg) this.b);
        }
    }

    private final void g() {
        l6g l6gVar = (l6g) this.c;
        synchronized (l6gVar.c) {
            br8 br8Var = (br8) l6gVar.d;
            Exception excH = ((jrg) this.b).h();
            vp7.p(excH);
            br8Var.onFailure(excH);
        }
    }

    private final void h() {
        l6g l6gVar = (l6g) this.c;
        synchronized (l6gVar.c) {
            ((kr8) l6gVar.d).i(((jrg) this.b).i());
        }
    }

    private final void i() {
        nhg nhgVar = (nhg) this.b;
        int i = ((ojg) this.c).a;
        synchronized (nhgVar) {
            ojg ojgVar = (ojg) nhgVar.e.get(i);
            if (ojgVar != null) {
                Log.w("MessengerIpcClient", "Timing out request: " + i);
                nhgVar.e.remove(i);
                ojgVar.b(new zzt("Timed out waiting for response", null));
                nhgVar.c();
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:18:0x0045, code lost:
    
        if (r1 == false) goto L50;
     */
    /* JADX WARN: Code restructure failed: missing block: B:23:0x004e, code lost:
    
        r1 = r1 | java.lang.Thread.interrupted();
        r2 = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:24:0x0050, code lost:
    
        ((java.lang.Runnable) r9.b).run();
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x005c, code lost:
    
        r0 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:31:0x005e, code lost:
    
        r3 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:32:0x005f, code lost:
    
        defpackage.wzb.f.log(java.util.logging.Level.SEVERE, "Exception while executing runnable " + ((java.lang.Runnable) r9.b), (java.lang.Throwable) r3);
     */
    /* JADX WARN: Code restructure failed: missing block: B:34:0x007c, code lost:
    
        r9.b = null;
     */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x007e, code lost:
    
        throw r0;
     */
    /* JADX WARN: Code restructure failed: missing block: B:50:?, code lost:
    
        return;
     */
    /* JADX WARN: Removed duplicated region for block: B:46:0x003c A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void j() {
        /*
            r9 = this;
            r0 = 0
            r1 = r0
        L2:
            java.lang.Object r2 = r9.c     // Catch: java.lang.Throwable -> L5a
            wzb r2 = (defpackage.wzb) r2     // Catch: java.lang.Throwable -> L5a
            java.util.ArrayDeque r2 = r2.b     // Catch: java.lang.Throwable -> L5a
            monitor-enter(r2)     // Catch: java.lang.Throwable -> L5a
            if (r0 != 0) goto L2c
            java.lang.Object r0 = r9.c     // Catch: java.lang.Throwable -> L20
            wzb r0 = (defpackage.wzb) r0     // Catch: java.lang.Throwable -> L20
            vzb r3 = r0.c     // Catch: java.lang.Throwable -> L20
            vzb r4 = defpackage.vzb.RUNNING     // Catch: java.lang.Throwable -> L20
            if (r3 != r4) goto L22
            monitor-exit(r2)     // Catch: java.lang.Throwable -> L20
            if (r1 == 0) goto L48
        L18:
            java.lang.Thread r9 = java.lang.Thread.currentThread()
            r9.interrupt()
            goto L48
        L20:
            r9 = move-exception
            goto L7f
        L22:
            long r5 = r0.d     // Catch: java.lang.Throwable -> L20
            r7 = 1
            long r5 = r5 + r7
            r0.d = r5     // Catch: java.lang.Throwable -> L20
            r0.c = r4     // Catch: java.lang.Throwable -> L20
            r0 = 1
        L2c:
            java.lang.Object r3 = r9.c     // Catch: java.lang.Throwable -> L20
            wzb r3 = (defpackage.wzb) r3     // Catch: java.lang.Throwable -> L20
            java.util.ArrayDeque r3 = r3.b     // Catch: java.lang.Throwable -> L20
            java.lang.Object r3 = r3.poll()     // Catch: java.lang.Throwable -> L20
            java.lang.Runnable r3 = (java.lang.Runnable) r3     // Catch: java.lang.Throwable -> L20
            r9.b = r3     // Catch: java.lang.Throwable -> L20
            if (r3 != 0) goto L49
            java.lang.Object r9 = r9.c     // Catch: java.lang.Throwable -> L20
            wzb r9 = (defpackage.wzb) r9     // Catch: java.lang.Throwable -> L20
            vzb r0 = defpackage.vzb.IDLE     // Catch: java.lang.Throwable -> L20
            r9.c = r0     // Catch: java.lang.Throwable -> L20
            monitor-exit(r2)     // Catch: java.lang.Throwable -> L20
            if (r1 == 0) goto L48
            goto L18
        L48:
            return
        L49:
            monitor-exit(r2)     // Catch: java.lang.Throwable -> L20
            boolean r2 = java.lang.Thread.interrupted()     // Catch: java.lang.Throwable -> L5a
            r1 = r1 | r2
            r2 = 0
            java.lang.Object r3 = r9.b     // Catch: java.lang.Throwable -> L5c java.lang.RuntimeException -> L5e
            java.lang.Runnable r3 = (java.lang.Runnable) r3     // Catch: java.lang.Throwable -> L5c java.lang.RuntimeException -> L5e
            r3.run()     // Catch: java.lang.Throwable -> L5c java.lang.RuntimeException -> L5e
        L57:
            r9.b = r2     // Catch: java.lang.Throwable -> L5a
            goto L2
        L5a:
            r9 = move-exception
            goto L81
        L5c:
            r0 = move-exception
            goto L7c
        L5e:
            r3 = move-exception
            java.util.logging.Logger r4 = defpackage.wzb.f     // Catch: java.lang.Throwable -> L5c
            java.util.logging.Level r5 = java.util.logging.Level.SEVERE     // Catch: java.lang.Throwable -> L5c
            java.lang.StringBuilder r6 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> L5c
            r6.<init>()     // Catch: java.lang.Throwable -> L5c
            java.lang.String r7 = "Exception while executing runnable "
            r6.append(r7)     // Catch: java.lang.Throwable -> L5c
            java.lang.Object r7 = r9.b     // Catch: java.lang.Throwable -> L5c
            java.lang.Runnable r7 = (java.lang.Runnable) r7     // Catch: java.lang.Throwable -> L5c
            r6.append(r7)     // Catch: java.lang.Throwable -> L5c
            java.lang.String r6 = r6.toString()     // Catch: java.lang.Throwable -> L5c
            r4.log(r5, r6, r3)     // Catch: java.lang.Throwable -> L5c
            goto L57
        L7c:
            r9.b = r2     // Catch: java.lang.Throwable -> L5a
            throw r0     // Catch: java.lang.Throwable -> L5a
        L7f:
            monitor-exit(r2)     // Catch: java.lang.Throwable -> L20
            throw r9     // Catch: java.lang.Throwable -> L5a
        L81:
            if (r1 == 0) goto L8a
            java.lang.Thread r0 = java.lang.Thread.currentThread()
            r0.interrupt()
        L8a:
            throw r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.p0g.j():void");
    }

    @Override // java.lang.Runnable
    public final void run() {
        Throwable thD;
        jx7 jx7Var;
        ut5 ut5Var;
        ut5 dmgVar;
        jrg jrgVarD0;
        int i = 1;
        int i2 = 0;
        switch (this.a) {
            case 0:
                opg opgVar = (opg) this.c;
                x0g x0gVar = (x0g) this.b;
                if ((x0gVar instanceof vzf) && (thD = ((vzf) x0gVar).d()) != null) {
                    opgVar.b(thD);
                    return;
                }
                try {
                    if (!x0gVar.isDone()) {
                        throw new IllegalStateException(mq7.J("Future was expected to be done: %s", x0gVar));
                    }
                    while (true) {
                        try {
                            Object obj = x0gVar.get();
                            if (i2 != 0) {
                                Thread.currentThread().interrupt();
                            }
                            Integer num = (Integer) obj;
                            int iIntValue = num.intValue();
                            m mVar = (m) opgVar.d;
                            if (iIntValue <= 0) {
                                ((Runnable) opgVar.c).run();
                                return;
                            }
                            int i3 = opgVar.a;
                            BillingResult billingResultA = n.a(num.intValue(), "Billing override value was set by a license tester.");
                            mVar.W(i3, billingResultA, cbg.LICENSE_TESTER_BILLING_OVERRIDE);
                            ((t72) opgVar.b).accept(billingResultA);
                            return;
                        } catch (InterruptedException unused) {
                            i2 = 1;
                        } catch (Throwable th) {
                            if (i2 != 0) {
                                Thread.currentThread().interrupt();
                            }
                            throw th;
                        }
                    }
                } catch (ExecutionException e) {
                    opgVar.b(e.getCause());
                    return;
                } catch (Throwable th2) {
                    opgVar.b(th2);
                    return;
                }
                break;
            case 1:
                e6 e6Var = (e6) this.b;
                h6 h6Var = (h6) this.c;
                lx7 lx7Var = h6Var.c;
                if (lx7Var != null && (jx7Var = lx7Var.e) != null) {
                    jx7Var.Y(lx7Var);
                }
                View view = (View) h6Var.h;
                if (view != null && view.getWindowToken() != null) {
                    if (e6Var.b()) {
                        h6Var.s = e6Var;
                    } else if (e6Var.e != null) {
                        e6Var.d(0, 0, false, false);
                        h6Var.s = e6Var;
                    }
                }
                h6Var.u = null;
                return;
            case 2:
                ((a7) this.b).a = this.c;
                return;
            case 3:
                ((Application) this.b).unregisterActivityLifecycleCallbacks((a7) this.c);
                return;
            case 4:
                Object obj2 = this.c;
                Object obj3 = this.b;
                try {
                    Method method = b7.d;
                    if (method != null) {
                        method.invoke(obj3, obj2, Boolean.FALSE, "AppCompat recreation");
                    } else {
                        b7.e.invoke(obj3, obj2, Boolean.FALSE);
                    }
                    return;
                } catch (RuntimeException e2) {
                    if (e2.getClass() == RuntimeException.class && e2.getMessage() != null && e2.getMessage().startsWith("Unable to stop")) {
                        throw e2;
                    }
                    return;
                } catch (Throwable th3) {
                    Log.e("ActivityRecreator", "Exception while invoking performStopActivity", th3);
                    return;
                }
            case 5:
                qlb qlbVar = (qlb) this.b;
                Typeface typeface = (Typeface) this.c;
                h30 h30Var = (h30) qlbVar.a;
                if (h30Var != null) {
                    h30Var.w(typeface);
                    return;
                }
                return;
            case 6:
                d87 d87VarH = d87.h();
                String str = z33.d;
                StringBuilder sb = new StringBuilder("Scheduling work ");
                c8f c8fVar = (c8f) this.b;
                sb.append(c8fVar.a);
                d87VarH.d(str, sb.toString());
                ((z33) this.c).a.e(c8fVar);
                return;
            case 7:
                ((py5) this.c).h((Drawable) this.b);
                return;
            case 8:
                pwd.Q((an6) this.b).resumeWith(br7.n((Throwable) this.c));
                return;
            case 9:
                break;
            case 10:
                a();
                return;
            case 11:
                o90 o90Var = (o90) this.c;
                Object obj4 = this.b;
                boolean z = o90Var.c.get();
                gkf gkfVar = o90Var.e;
                if (z) {
                    if (gkfVar.h == o90Var) {
                        SystemClock.uptimeMillis();
                        gkfVar.h = null;
                        gkfVar.a();
                    }
                } else if (gkfVar.g != o90Var) {
                    if (gkfVar.h == o90Var) {
                        SystemClock.uptimeMillis();
                        gkfVar.h = null;
                        gkfVar.a();
                    }
                } else if (!gkfVar.c) {
                    SystemClock.uptimeMillis();
                    gkfVar.g = null;
                    o57 o57Var = gkfVar.a;
                    if (o57Var != null) {
                        if (Looper.myLooper() == Looper.getMainLooper()) {
                            o57Var.j(obj4);
                        } else {
                            o57Var.h(obj4);
                        }
                    }
                }
                o90Var.b = n28.FINISHED;
                return;
            case 12:
                ((zm8) this.c).c.b0((do6) this.b);
                return;
            case 13:
                ((pz4) this.b).accept(this.c);
                return;
            case 14:
                ((x51) this.c).D((w44) this.b);
                return;
            case 15:
                b();
                return;
            case 16:
                c();
                return;
            case 17:
                d();
                return;
            case 18:
                h42 h42Var = (h42) this.b;
                ft2 ft2Var = (ft2) this.c;
                ee5 ee5Var = (ee5) ft2Var.f;
                wd5 wd5Var = (wd5) ft2Var.c;
                uif uifVar = (uif) ee5Var.j.get((gz) ft2Var.b);
                if (uifVar == null) {
                    return;
                }
                if (h42Var.b != 0) {
                    uifVar.n(h42Var, null);
                    return;
                }
                ft2Var.a = true;
                if (wd5Var.n()) {
                    if (!ft2Var.a || (ut5Var = (ut5) ft2Var.d) == null) {
                        return;
                    }
                    wd5Var.g(ut5Var, (Set) ft2Var.e);
                    return;
                }
                try {
                    wd5Var.g(null, wd5Var.n() ? wd5Var.y : Collections.EMPTY_SET);
                    return;
                } catch (SecurityException e3) {
                    Log.e("GoogleApiManager", "Failed to get service from broker. ", e3);
                    wd5Var.c("Failed to get service from broker.");
                    uifVar.n(new h42(10, null, null), null);
                    return;
                }
            case 19:
                bjf bjfVar = (bjf) this.c;
                sjf sjfVar = (sjf) this.b;
                h42 h42Var2 = sjfVar.b;
                if (h42Var2.b == 0) {
                    yjf yjfVar = sjfVar.c;
                    vp7.p(yjfVar);
                    h42 h42Var3 = yjfVar.c;
                    if (h42Var3.b != 0) {
                        Log.wtf("SignInCoordinator", "Sign-in succeeded with resolve account failure: ".concat(String.valueOf(h42Var3)), new Exception());
                        bjfVar.l.d(h42Var3);
                        bjfVar.k.b();
                        return;
                    }
                    ft2 ft2Var2 = bjfVar.l;
                    IBinder iBinder = yjfVar.b;
                    if (iBinder == null) {
                        dmgVar = null;
                    } else {
                        int i4 = m5.f;
                        IInterface iInterfaceQueryLocalInterface = iBinder.queryLocalInterface("com.google.android.gms.common.internal.IAccountAccessor");
                        dmgVar = iInterfaceQueryLocalInterface instanceof ut5 ? (ut5) iInterfaceQueryLocalInterface : new dmg(iBinder);
                    }
                    Set set = bjfVar.i;
                    ft2Var2.getClass();
                    if (dmgVar == null || set == null) {
                        Log.wtf("GoogleApiManager", "Received null response from onSignInSuccess", new Exception());
                        ft2Var2.d(new h42(4, null, null));
                    } else {
                        ft2Var2.d = dmgVar;
                        ft2Var2.e = set;
                        if (ft2Var2.a) {
                            ((wd5) ft2Var2.c).g(dmgVar, set);
                        }
                    }
                } else {
                    bjfVar.l.d(h42Var2);
                }
                bjfVar.k.b();
                return;
            case 20:
                xj4 xj4VarE = xj4.e((String) this.b);
                ((wmf) xj4VarE.b(wmf.class)).getClass();
                FirebaseAuth firebaseAuth = FirebaseAuth.getInstance(xj4VarE);
                if (firebaseAuth.a() != null) {
                    xmf xmfVar = firebaseAuth.f;
                    if (xmfVar == null) {
                        jrgVarD0 = vp7.w(knf.a(new Status(17495, null, null, null)));
                    } else {
                        zpf zpfVar = xmfVar.a;
                        zpfVar.g();
                        d2f d2fVar = firebaseAuth.e;
                        xj4 xj4Var = firebaseAuth.a;
                        String str2 = zpfVar.a;
                        yj4 yj4Var = new yj4(firebaseAuth, i);
                        d2fVar.getClass();
                        imf imfVar = new imf(str2, 0);
                        imfVar.b(xj4Var);
                        imfVar.d = xmfVar;
                        imfVar.e = yj4Var;
                        imfVar.f = yj4Var;
                        jrgVarD0 = d2fVar.D0(imfVar);
                    }
                    kvf.e.F("Token refreshing started", new Object[0]);
                    jrgVarD0.c(new ujf(11, this));
                    return;
                }
                return;
            case 21:
                jrg jrgVar = (jrg) this.b;
                boolean z2 = jrgVar.d;
                h0g h0gVar = (h0g) this.c;
                if (z2) {
                    h0gVar.d.p();
                    return;
                }
                try {
                    ((h0g) this.c).d.m(h0gVar.c.m0(jrgVar));
                    return;
                } catch (RuntimeExecutionException e4) {
                    boolean z3 = e4.getCause() instanceof Exception;
                    h0g h0gVar2 = (h0g) this.c;
                    if (z3) {
                        h0gVar2.d.o((Exception) e4.getCause());
                        return;
                    } else {
                        h0gVar2.d.o(e4);
                        return;
                    }
                } catch (Exception e5) {
                    ((h0g) this.c).d.o(e5);
                    return;
                }
            case 22:
                h0g h0gVar3 = (h0g) this.c;
                jrg jrgVar2 = h0gVar3.d;
                try {
                    jrg jrgVar3 = (jrg) h0gVar3.c.m0((jrg) this.b);
                    if (jrgVar3 == null) {
                        h0gVar3.onFailure(new NullPointerException("Continuation returned null"));
                        return;
                    }
                    bf3 bf3Var = yfd.b;
                    jrgVar3.e(bf3Var, h0gVar3);
                    jrgVar3.d(bf3Var, h0gVar3);
                    jrgVar3.b.h(new l6g((Executor) bf3Var, (kq8) h0gVar3));
                    jrgVar3.r();
                    return;
                } catch (RuntimeExecutionException e6) {
                    if (e6.getCause() instanceof Exception) {
                        jrgVar2.o((Exception) e6.getCause());
                        return;
                    } else {
                        jrgVar2.o(e6);
                        return;
                    }
                } catch (Exception e7) {
                    jrgVar2.o(e7);
                    return;
                }
            case 23:
                f();
                return;
            case 24:
                e();
                return;
            case 25:
                g();
                return;
            case 26:
                h();
                return;
            case 27:
                i();
                return;
            case 28:
                l6g l6gVar = (l6g) this.c;
                jrg jrgVar4 = (jrg) l6gVar.d;
                try {
                    jrg jrgVarZ = ((v0d) l6gVar.c).z(((jrg) this.b).i());
                    bf3 bf3Var2 = yfd.b;
                    jrgVarZ.e(bf3Var2, l6gVar);
                    jrgVarZ.d(bf3Var2, l6gVar);
                    jrgVarZ.b.h(new l6g((Executor) bf3Var2, (kq8) l6gVar));
                    jrgVarZ.r();
                    return;
                } catch (RuntimeExecutionException e8) {
                    if (e8.getCause() instanceof Exception) {
                        l6gVar.onFailure((Exception) e8.getCause());
                        return;
                    } else {
                        jrgVar4.o(e8);
                        return;
                    }
                } catch (CancellationException unused2) {
                    l6gVar.a();
                    return;
                } catch (Exception e9) {
                    jrgVar4.o(e9);
                    return;
                }
            default:
                jrg jrgVar5 = (jrg) this.b;
                try {
                    jrgVar5.m(((Callable) this.c).call());
                    return;
                } catch (Exception e10) {
                    jrgVar5.o(e10);
                    return;
                } catch (Throwable th4) {
                    jrgVar5.o(new RuntimeException(th4));
                    return;
                }
        }
        while (true) {
            try {
                ((Runnable) this.b).run();
            } catch (Throwable th5) {
                kyd.Y(zx3.a, th5);
            }
            Runnable runnableI0 = ((az6) this.c).I0();
            if (runnableI0 == null) {
                return;
            }
            try {
                this.b = runnableI0;
                i2++;
                if (i2 >= 16) {
                    az6 az6Var = (az6) this.c;
                    if (op8.m0(az6Var.d, az6Var)) {
                        az6 az6Var2 = (az6) this.c;
                        op8.l0(az6Var2.d, az6Var2, this);
                        return;
                    }
                }
            } catch (Throwable th6) {
                az6 az6Var3 = (az6) this.c;
                synchronized (az6Var3.g) {
                    az6.h.decrementAndGet(az6Var3);
                    throw th6;
                }
            }
        }
    }

    public String toString() {
        int i = this.a;
        Object obj = this.c;
        switch (i) {
            case 0:
                vwa vwaVar = new vwa(p0g.class.getSimpleName(), 23);
                zjf zjfVar = new zjf(5);
                ((zjf) vwaVar.d).c = zjfVar;
                vwaVar.d = zjfVar;
                zjfVar.b = (opg) obj;
                return vwaVar.toString();
            case 15:
                Runnable runnable = (Runnable) this.b;
                if (runnable != null) {
                    return "SequentialExecutorWorker{running=" + runnable + "}";
                }
                return "SequentialExecutorWorker{state=" + ((wzb) obj).c + "}";
            default:
                return super.toString();
        }
    }

    public /* synthetic */ p0g(Object obj, Object obj2, boolean z, int i) {
        this.a = i;
        this.c = obj;
        this.b = obj2;
    }

    public /* synthetic */ p0g(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    public p0g(wzb wzbVar) {
        this.a = 15;
        this.c = wzbVar;
    }
}
