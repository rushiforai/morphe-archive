package defpackage;

import android.app.Notification;
import android.content.Context;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.os.Bundle;
import android.os.Process;
import android.os.Trace;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.TextView;
import androidx.core.graphics.drawable.IconCompat;
import com.drew.imaging.riff.pvS.uuLAxLN;
import it.sephiroth.android.library.imagezoom.ImageViewTouch;
import j$.time.Duration;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.Socket;
import java.nio.ByteBuffer;
import java.util.ArrayDeque;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.TreeMap;
import java.util.concurrent.Executor;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import org.chromium.net.impl.CronetExceptionImpl;
import org.chromium.net.impl.ImplVersion;
import sprig.b.VPIE.dpBiLjNeNsiASg;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class n0c implements gn6, en6, fn6, z5e, xjc, qx5, bn1 {
    public static n0c f;
    public final /* synthetic */ int a;
    public Object b;
    public Object c;
    public Object d;
    public Object e;

    public static synchronized n0c N() {
        n0c n0cVar;
        n0cVar = f;
        if (n0cVar == null) {
            n0cVar = new n0c(0);
            f = n0cVar;
        }
        return n0cVar;
    }

    private final void Y() {
    }

    private final void Z() {
    }

    public static o81 a0(rg1 rg1Var, boolean z) {
        rg1Var.getClass();
        return z ? p81.t : new b81(rg1Var);
    }

    public static void b0(n0c n0cVar, zua zuaVar, cva cvaVar, zua zuaVar2, int i) {
        ug3 ug3Var;
        zua zuaVarF;
        if ((i & 1) != 0) {
            zuaVar = null;
        }
        if ((i & 2) != 0) {
            cvaVar = null;
        }
        if ((i & 4) != 0) {
            zuaVar2 = null;
        }
        n0cVar.getClass();
        TimeZone timeZone = ggf.a;
        boolean zIsShutdown = n0cVar.C().isShutdown();
        synchronized (n0cVar) {
            if (cvaVar != null) {
                try {
                    if (!((ArrayDeque) n0cVar.d).remove(cvaVar)) {
                        throw new IllegalStateException("Call wasn't in-flight!");
                    }
                } catch (Throwable th) {
                    throw th;
                }
            }
            if (zuaVar2 != null) {
                zuaVar2.b.decrementAndGet();
                if (!((ArrayDeque) n0cVar.c).remove(zuaVar2)) {
                    throw new IllegalStateException("Call wasn't in-flight!");
                }
            }
            if (zuaVar != null) {
                ((ArrayDeque) n0cVar.e).add(zuaVar);
                cva cvaVar2 = zuaVar.c;
                if (!cvaVar2.c && (zuaVarF = n0cVar.F(cvaVar2.b.a.d)) != null) {
                    zuaVar.b = zuaVarF.b;
                }
            }
            if ((cvaVar != null || zuaVar2 != null) && (zIsShutdown || ((ArrayDeque) n0cVar.c).isEmpty())) {
                ((ArrayDeque) n0cVar.d).isEmpty();
            }
            if (zIsShutdown) {
                List listM1 = bu1.m1((ArrayDeque) n0cVar.e);
                ((ArrayDeque) n0cVar.e).clear();
                ug3Var = new ug3(listM1);
            } else {
                ArrayList arrayList = new ArrayList();
                Iterator it2 = ((ArrayDeque) n0cVar.e).iterator();
                it2.getClass();
                while (it2.hasNext()) {
                    zua zuaVar3 = (zua) it2.next();
                    if (((ArrayDeque) n0cVar.c).size() >= 64) {
                        break;
                    }
                    if (zuaVar3.b.get() < 5) {
                        it2.remove();
                        zuaVar3.b.incrementAndGet();
                        arrayList.add(zuaVar3);
                        ((ArrayDeque) n0cVar.c).add(zuaVar3);
                    }
                }
                ug3Var = new ug3((List) arrayList);
            }
        }
        int size = ug3Var.a.size();
        for (int i2 = 0; i2 < size; i2++) {
            zua zuaVar4 = (zua) ug3Var.a.get(i2);
            if (zuaVar4 != zuaVar) {
                cva cvaVar3 = zuaVar4.c;
            }
            if (zIsShutdown) {
                zuaVar4.getClass();
                InterruptedIOException interruptedIOException = new InterruptedIOException("executor rejected");
                interruptedIOException.initCause(null);
                cva cvaVar4 = zuaVar4.c;
                cvaVar4.i(interruptedIOException);
                zuaVar4.a.w(cvaVar4, interruptedIOException);
            } else {
                ExecutorService executorServiceC = n0cVar.C();
                zuaVar4.getClass();
                cva cvaVar5 = zuaVar4.c;
                cvaVar5.a.a.getClass();
                try {
                    try {
                        executorServiceC.execute(zuaVar4);
                    } catch (RejectedExecutionException e) {
                        InterruptedIOException interruptedIOException2 = new InterruptedIOException("executor rejected");
                        interruptedIOException2.initCause(e);
                        cva cvaVar6 = zuaVar4.c;
                        cvaVar6.i(interruptedIOException2);
                        zuaVar4.a.w(cvaVar6, interruptedIOException2);
                        n0c n0cVar2 = cvaVar5.a.a;
                        n0cVar2.getClass();
                        b0(n0cVar2, null, null, zuaVar4, 3);
                    }
                } catch (Throwable th2) {
                    n0c n0cVar3 = cvaVar5.a.a;
                    n0cVar3.getClass();
                    b0(n0cVar3, null, null, zuaVar4, 3);
                    throw th2;
                }
            }
        }
    }

    public static s71 v(String str, String str2, boolean z) {
        str.getClass();
        return z ? t71.t : new u71(str, str2);
    }

    public static s71 z(rg1 rg1Var, boolean z) {
        rg1Var.getClass();
        return z ? w71.t : new v71(rg1Var);
    }

    public void A(oa6 oa6Var, String str) {
        na6 na6Var = (na6) this.e;
        try {
            B(new ha6(na6Var, oa6Var, 1), str);
        } catch (RejectedExecutionException e) {
            na6Var.e0(new CronetExceptionImpl("Exception posting task to executor", e));
        }
    }

    public void B(Runnable runnable, String str) {
        grb.f("Cronet JavaUrlRequest.AsyncUrlRequestCallback#executeOnUserExecutor ".concat(str));
        try {
            ((Executor) this.c).execute(new ja6(1, runnable, str));
            Trace.endSection();
        } catch (Throwable th) {
            try {
                Trace.endSection();
            } catch (Throwable th2) {
                th.addSuppressed(th2);
            }
            throw th;
        }
    }

    public synchronized ExecutorService C() {
        ThreadPoolExecutor threadPoolExecutor;
        threadPoolExecutor = (ThreadPoolExecutor) this.b;
        if (threadPoolExecutor == null) {
            ThreadPoolExecutor threadPoolExecutor2 = new ThreadPoolExecutor(0, Integer.MAX_VALUE, 60L, TimeUnit.SECONDS, new SynchronousQueue(), new fgf(ggf.b + " Dispatcher", false));
            this.b = threadPoolExecutor2;
            threadPoolExecutor = threadPoolExecutor2;
        }
        return threadPoolExecutor;
    }

    public Object D(n92 n92Var) {
        Object objA = ((r6c) this.e).a(rz8.a, n92Var);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : c1e.a;
    }

    public j15 E(String str) {
        s25 s25Var = (s25) ((HashMap) this.c).get(str);
        if (s25Var != null) {
            return s25Var.c;
        }
        return null;
    }

    public zua F(String str) {
        Iterator it2 = ((ArrayDeque) this.c).iterator();
        it2.getClass();
        while (it2.hasNext()) {
            zua zuaVar = (zua) it2.next();
            if (g76.L(zuaVar.c.b.a.d, str)) {
                return zuaVar;
            }
        }
        Iterator it3 = ((ArrayDeque) this.e).iterator();
        it3.getClass();
        while (it3.hasNext()) {
            zua zuaVar2 = (zua) it3.next();
            if (g76.L(zuaVar2.c.b.a.d, str)) {
                return zuaVar2;
            }
        }
        return null;
    }

    public j15 G(String str) {
        for (s25 s25Var : ((HashMap) this.c).values()) {
            if (s25Var != null) {
                j15 j15VarG = s25Var.c;
                if (!str.equals(j15VarG.e)) {
                    j15VarG = j15VarG.u.c.G(str);
                }
                if (j15VarG != null) {
                    return j15VarG;
                }
            }
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object H(defpackage.p92 r5, java.lang.String r6, java.lang.String r7, java.lang.String r8, java.lang.String r9, boolean r10) {
        /*
            r4 = this;
            boolean r0 = r5 instanceof defpackage.vd1
            if (r0 == 0) goto L13
            r0 = r5
            vd1 r0 = (defpackage.vd1) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            vd1 r0 = new vd1
            r0.<init>(r4, r5)
        L18:
            java.lang.Object r5 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 1
            if (r2 == 0) goto L36
            if (r2 != r3) goto L2f
            java.lang.String r8 = r0.c
            java.lang.String r6 = r0.b
            defpackage.br7.v(r5)
            bjb r5 = (defpackage.bjb) r5
            java.lang.Object r4 = r5.a
            goto L56
        L2f:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L36:
            defpackage.br7.v(r5)
            if (r10 == 0) goto L3e
            y71 r4 = defpackage.y71.t
            return r4
        L3e:
            java.lang.Object r4 = r4.b
            ws4 r4 = (defpackage.ws4) r4
            r0.b = r6
            r0.c = r8
            r0.f = r3
            r5 = r6
            r6 = r7
            r7 = r8
            r8 = r9
            r9 = r0
            java.lang.Object r4 = r4.b(r5, r6, r7, r8, r9)
            if (r4 != r1) goto L54
            return r1
        L54:
            r6 = r5
            r8 = r7
        L56:
            java.lang.Throwable r5 = defpackage.bjb.b(r4)
            if (r5 != 0) goto L64
            c1e r4 = (defpackage.c1e) r4
            a81 r4 = new a81
            r4.<init>(r6, r8)
            return r4
        L64:
            z71 r4 = new z71
            r4.<init>(r6, r8, r5)
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n0c.H(p92, java.lang.String, java.lang.String, java.lang.String, java.lang.String, boolean):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object I(defpackage.n92 r5, gen.model.SourceParameter r6, java.lang.String r7, java.lang.String r8, java.lang.String r9) {
        /*
            r4 = this;
            boolean r0 = r5 instanceof defpackage.ur1
            if (r0 == 0) goto L13
            r0 = r5
            ur1 r0 = (defpackage.ur1) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            ur1 r0 = new ur1
            r0.<init>(r4, r5)
        L18:
            java.lang.Object r5 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 1
            if (r2 == 0) goto L36
            if (r2 != r3) goto L2f
            gen.model.SourceParameter r6 = r0.c
            java.lang.String r7 = r0.b
            defpackage.br7.v(r5)
            bjb r5 = (defpackage.bjb) r5
            java.lang.Object r4 = r5.a
            goto L51
        L2f:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L36:
            defpackage.br7.v(r5)
            java.lang.Object r4 = r4.b
            jz1 r4 = (defpackage.jz1) r4
            r0.b = r7
            r0.c = r6
            r0.f = r3
            r5 = r7
            r7 = r6
            r6 = r8
            r8 = r9
            r9 = r0
            java.lang.Object r4 = r4.w(r5, r6, r7, r8, r9)
            if (r4 != r1) goto L4f
            return r1
        L4f:
            r6 = r7
            r7 = r5
        L51:
            java.lang.Throwable r5 = defpackage.bjb.b(r4)
            if (r5 != 0) goto L5f
            com.medium.android.graphql.fragment.CollectionFollowData r4 = (com.medium.android.graphql.fragment.CollectionFollowData) r4
            qq1 r4 = new qq1
            r4.<init>(r7, r6)
            return r4
        L5f:
            pq1 r4 = new pq1
            r4.<init>(r6, r7, r5)
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n0c.I(n92, gen.model.SourceParameter, java.lang.String, java.lang.String, java.lang.String):java.lang.Object");
    }

    public ArrayList J() {
        ArrayList arrayList = new ArrayList();
        for (s25 s25Var : ((HashMap) this.c).values()) {
            if (s25Var != null) {
                arrayList.add(s25Var);
            }
        }
        return arrayList;
    }

    public ArrayList K() {
        ArrayList arrayList = new ArrayList();
        for (s25 s25Var : ((HashMap) this.c).values()) {
            if (s25Var != null) {
                arrayList.add(s25Var.c);
            } else {
                arrayList.add(null);
            }
        }
        return arrayList;
    }

    public y28 L(mn1 mn1Var, List list) {
        mn1Var.getClass();
        return (y28) ((r67) this.e).invoke(new ci8(mn1Var, list));
    }

    public List M() {
        ArrayList arrayList;
        if (((ArrayList) this.b).isEmpty()) {
            return Collections.EMPTY_LIST;
        }
        synchronized (((ArrayList) this.b)) {
            arrayList = new ArrayList((ArrayList) this.b);
        }
        return arrayList;
    }

    public boolean O(Context context) {
        if (((Boolean) this.d) == null) {
            this.d = Boolean.valueOf(context.checkCallingOrSelfPermission("android.permission.ACCESS_NETWORK_STATE") == 0);
        }
        if (!((Boolean) this.c).booleanValue() && Log.isLoggable("FirebaseMessaging", 3)) {
            Log.d("FirebaseMessaging", "Missing Permission: android.permission.ACCESS_NETWORK_STATE this should normally be included by the manifest merger, but may needed to be manually added to your manifest");
        }
        return ((Boolean) this.d).booleanValue();
    }

    public boolean P(Context context) {
        Boolean boolValueOf = (Boolean) this.c;
        if (boolValueOf == null) {
            boolValueOf = Boolean.valueOf(context.checkCallingOrSelfPermission("android.permission.WAKE_LOCK") == 0);
            this.c = boolValueOf;
        }
        if (!boolValueOf.booleanValue() && Log.isLoggable("FirebaseMessaging", 3)) {
            Log.d("FirebaseMessaging", "Missing Permission: android.permission.WAKE_LOCK this should normally be included by the manifest merger, but may needed to be manually added to your manifest");
        }
        return ((Boolean) this.c).booleanValue();
    }

    public to4 Q(d55 d55Var) {
        n92 n92Var = null;
        int i = 2;
        return new to4(new a74(i, i, n92Var), new u50(12, new uc0(this, d55Var, n92Var, 5)));
    }

    /* JADX WARN: Code restructure failed: missing block: B:38:0x017b, code lost:
    
        if (r1 == r4) goto L39;
     */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0187  */
    /* JADX WARN: Removed duplicated region for block: B:47:0x01db  */
    /* JADX WARN: Removed duplicated region for block: B:50:0x01e2  */
    /* JADX WARN: Removed duplicated region for block: B:7:0x001b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object R(java.lang.String r20, java.lang.String r21, java.lang.String r22, long r23, gen.model.MediumMembershipType r25, com.medium.android.core.membership.UpsellInfo r26, java.lang.String r27, java.lang.String r28, java.lang.String r29, java.lang.String r30, defpackage.p92 r31) {
        /*
            Method dump skipped, instruction units count: 553
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n0c.R(java.lang.String, java.lang.String, java.lang.String, long, gen.model.MediumMembershipType, com.medium.android.core.membership.UpsellInfo, java.lang.String, java.lang.String, java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    public void S(s25 s25Var) {
        j15 j15Var = s25Var.c;
        String str = j15Var.e;
        HashMap map = (HashMap) this.c;
        if (map.get(str) != null) {
            return;
        }
        map.put(j15Var.e, s25Var);
        if (j15Var.C) {
            boolean z = j15Var.B;
            i25 i25Var = (i25) this.e;
            if (z) {
                i25Var.e(j15Var);
            } else {
                i25Var.i(j15Var);
            }
            j15Var.C = false;
        }
        if (f25.I(2)) {
            Log.v("FragmentManager", "Added fragment to active set " + j15Var);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object T(defpackage.rg1 r11, boolean r12, java.lang.String r13, java.lang.String r14, defpackage.p92 r15) {
        /*
            r10 = this;
            boolean r0 = r15 instanceof defpackage.wd1
            if (r0 == 0) goto L14
            r0 = r15
            wd1 r0 = (defpackage.wd1) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.e = r1
        L12:
            r8 = r0
            goto L1a
        L14:
            wd1 r0 = new wd1
            r0.<init>(r10, r15)
            goto L12
        L1a:
            java.lang.Object r15 = r8.c
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r8.e
            r2 = 1
            r9 = 0
            if (r1 == 0) goto L32
            if (r1 != r2) goto L2c
            rg1 r11 = r8.b
            defpackage.br7.v(r15)
            goto L55
        L2c:
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            return r9
        L32:
            defpackage.br7.v(r15)
            if (r12 == 0) goto L3a
            p81 r10 = defpackage.p81.t
            return r10
        L3a:
            java.lang.Object r10 = r10.d
            r1 = r10
            j5e r1 = (defpackage.j5e) r1
            r10 = r2
            java.lang.String r2 = r11.a
            com.medium.android.graphql.type.CatalogType r3 = r11.e
            com.medium.android.graphql.type.CatalogVisibility r4 = com.medium.android.graphql.type.CatalogVisibility.PRIVATE
            java.lang.String r6 = r11.n
            r8.b = r11
            r8.e = r10
            r5 = r13
            r7 = r14
            java.lang.Object r15 = r1.a(r2, r3, r4, r5, r6, r7, r8)
            if (r15 != r0) goto L55
            return r0
        L55:
            n4e r15 = (defpackage.n4e) r15
            boolean r10 = r15 instanceof defpackage.m4e
            if (r10 == 0) goto L67
            d81 r10 = new d81
            java.lang.String r12 = r11.a
            com.medium.android.core.models.CatalogName r13 = r11.f
            java.lang.String r11 = r11.n
            r10.<init>(r12, r13, r11)
            return r10
        L67:
            boolean r10 = r15 instanceof defpackage.j4e
            if (r10 == 0) goto L79
            c81 r10 = new c81
            java.lang.String r12 = r11.a
            java.lang.String r11 = r11.n
            j4e r15 = (defpackage.j4e) r15
            java.lang.Throwable r13 = r15.a
            r10.<init>(r12, r11, r13)
            return r10
        L79:
            c81 r10 = new c81
            java.lang.String r12 = r11.a
            java.lang.String r11 = r11.n
            r10.<init>(r12, r11, r9)
            return r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n0c.T(rg1, boolean, java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object U(defpackage.rg1 r11, boolean r12, java.lang.String r13, java.lang.String r14, defpackage.p92 r15) {
        /*
            r10 = this;
            boolean r0 = r15 instanceof defpackage.xd1
            if (r0 == 0) goto L14
            r0 = r15
            xd1 r0 = (defpackage.xd1) r0
            int r1 = r0.e
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.e = r1
        L12:
            r8 = r0
            goto L1a
        L14:
            xd1 r0 = new xd1
            r0.<init>(r10, r15)
            goto L12
        L1a:
            java.lang.Object r15 = r8.c
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r8.e
            r2 = 1
            r9 = 0
            if (r1 == 0) goto L32
            if (r1 != r2) goto L2c
            rg1 r11 = r8.b
            defpackage.br7.v(r15)
            goto L55
        L2c:
            java.lang.String r10 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r10)
            return r9
        L32:
            defpackage.br7.v(r15)
            if (r12 == 0) goto L3a
            p81 r10 = defpackage.p81.t
            return r10
        L3a:
            java.lang.Object r10 = r10.d
            r1 = r10
            j5e r1 = (defpackage.j5e) r1
            r10 = r2
            java.lang.String r2 = r11.a
            com.medium.android.graphql.type.CatalogType r3 = r11.e
            com.medium.android.graphql.type.CatalogVisibility r4 = com.medium.android.graphql.type.CatalogVisibility.PUBLIC
            java.lang.String r6 = r11.n
            r8.b = r11
            r8.e = r10
            r5 = r13
            r7 = r14
            java.lang.Object r15 = r1.a(r2, r3, r4, r5, r6, r7, r8)
            if (r15 != r0) goto L55
            return r0
        L55:
            n4e r15 = (defpackage.n4e) r15
            boolean r10 = r15 instanceof defpackage.m4e
            if (r10 == 0) goto L67
            f81 r10 = new f81
            java.lang.String r12 = r11.a
            com.medium.android.core.models.CatalogName r13 = r11.f
            java.lang.String r11 = r11.n
            r10.<init>(r12, r13, r11)
            return r10
        L67:
            boolean r10 = r15 instanceof defpackage.j4e
            if (r10 == 0) goto L79
            e81 r10 = new e81
            java.lang.String r12 = r11.a
            java.lang.String r11 = r11.n
            j4e r15 = (defpackage.j4e) r15
            java.lang.Throwable r13 = r15.a
            r10.<init>(r12, r11, r13)
            return r10
        L79:
            e81 r10 = new e81
            java.lang.String r12 = r11.a
            java.lang.String r11 = r11.n
            r10.<init>(r12, r11, r9)
            return r10
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n0c.U(rg1, boolean, java.lang.String, java.lang.String, p92):java.lang.Object");
    }

    public void V(s25 s25Var) {
        HashMap map = (HashMap) this.c;
        j15 j15Var = s25Var.c;
        if (j15Var.B) {
            ((i25) this.e).i(j15Var);
        }
        if (map.get(j15Var.e) == s25Var && ((s25) map.put(j15Var.e, null)) != null && f25.I(2)) {
            Log.v("FragmentManager", "Removed fragment from active set " + j15Var);
        }
    }

    public void W() {
        if (Build.VERSION.SDK_INT < 26) {
            return;
        }
        ((na6) this.e).f0(new ka6(this), "maybeReportMetrics");
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object X(java.lang.String r9, java.lang.String r10, gen.model.SourceParameter r11, java.lang.String r12, defpackage.p92 r13) {
        /*
            r8 = this;
            boolean r0 = r13 instanceof defpackage.vr1
            if (r0 == 0) goto L14
            r0 = r13
            vr1 r0 = (defpackage.vr1) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.f = r1
        L12:
            r2 = r0
            goto L1a
        L14:
            vr1 r0 = new vr1
            r0.<init>(r8, r13)
            goto L12
        L1a:
            java.lang.Object r13 = r2.d
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r2.f
            r3 = 1
            if (r1 == 0) goto L38
            if (r1 != r3) goto L31
            gen.model.SourceParameter r11 = r2.c
            java.lang.String r9 = r2.b
            defpackage.br7.v(r13)
            bjb r13 = (defpackage.bjb) r13
            java.lang.Object r8 = r13.a
            goto L54
        L31:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            r8 = 0
            return r8
        L38:
            defpackage.br7.v(r13)
            java.lang.Object r8 = r8.d
            r1 = r8
            gg5 r1 = (defpackage.gg5) r1
            r2.b = r9
            r2.c = r11
            r2.f = r3
            r5 = 0
            r4 = r9
            r6 = r10
            r3 = r11
            r7 = r12
            java.lang.Object r8 = r1.I(r2, r3, r4, r5, r6, r7)
            if (r8 != r0) goto L52
            return r0
        L52:
            r11 = r3
            r9 = r4
        L54:
            java.lang.Throwable r10 = defpackage.bjb.b(r8)
            if (r10 != 0) goto L62
            com.medium.android.graphql.fragment.CollectionProfileData r8 = (com.medium.android.graphql.fragment.CollectionProfileData) r8
            tq1 r8 = new tq1
            r8.<init>(r9, r11)
            return r8
        L62:
            sq1 r8 = new sq1
            r8.<init>(r11, r9, r10)
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n0c.X(java.lang.String, java.lang.String, gen.model.SourceParameter, java.lang.String, p92):java.lang.Object");
    }

    @Override // defpackage.qx5
    public void a() {
        switch (this.a) {
            case 18:
                ((ImageViewTouch) this.b).setVisibility(8);
                TextView textView = (TextView) this.c;
                textView.getClass();
                textView.setVisibility(0);
                break;
            default:
                ((l78) this.b).setValue(Boolean.FALSE);
                ((l78) this.c).setValue(Boolean.TRUE);
                break;
        }
    }

    @Override // defpackage.en6
    public void b() {
        switch (this.a) {
            case 1:
                ArrayList arrayList = (ArrayList) this.c;
                if (!arrayList.isEmpty()) {
                    ((HashMap) ((lig) this.d).c).put((gv7) this.b, arrayList);
                }
                break;
            case 5:
                ((jz1) this.c).b();
                ((ArrayList) ((n0c) this.d).b).add(new jy((yx) bu1.a1((ArrayList) this.e)));
                break;
            default:
                jz1 jz1Var = (jz1) this.e;
                n98 n98Var = (n98) this.d;
                ArrayList arrayList2 = (ArrayList) this.b;
                lqe lqeVarG = gx1.G(n98Var, (y28) jz1Var.e);
                if (lqeVarG != null) {
                    HashMap map = (HashMap) jz1Var.b;
                    List listG = xz5.G(arrayList2);
                    mn6 type = lqeVarG.getType();
                    type.getClass();
                    map.put(n98Var, new rxd(listG, type));
                    break;
                } else if (((nig) jz1Var.d).p((mn1) jz1Var.f) && g76.L(n98Var.b(), "value")) {
                    ArrayList arrayList3 = new ArrayList();
                    for (Object obj : arrayList2) {
                        if (obj instanceof jy) {
                            arrayList3.add(obj);
                        }
                    }
                    List list = (List) jz1Var.g;
                    Iterator it2 = arrayList3.iterator();
                    while (it2.hasNext()) {
                        list.add((yx) ((jy) it2.next()).a);
                    }
                    break;
                }
                break;
        }
    }

    @Override // defpackage.fn6
    public en6 c(mn1 mn1Var) {
        ArrayList arrayList = new ArrayList();
        return new n0c(((nig) this.c).q(mn1Var, jkc.g0, arrayList), this, arrayList);
    }

    public Object c0(n92 n92Var) {
        Object objA = ((r6c) this.e).a(sz8.a, n92Var);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : c1e.a;
    }

    @Override // defpackage.xjc
    public void cancel() throws IOException {
        ((Socket) this.b).close();
    }

    @Override // defpackage.xjc
    public ikc d() {
        return (b23) this.d;
    }

    public Object d0(x45 x45Var, n92 n92Var) {
        Object objA = ((r6c) this.e).a(new tz8(x45Var), n92Var);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : c1e.a;
    }

    @Override // defpackage.fn6
    public void e(Object obj) {
        ArrayList arrayList = (ArrayList) this.b;
        nig nigVar = (nig) this.c;
        n98 n98Var = (n98) this.d;
        Object objK = cd7.k((c38) nigVar.c, obj);
        if (objK == null) {
            objK = new m24("Unsupported annotation argument: " + n98Var);
        }
        arrayList.add(objK);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object e0(java.lang.String r5, boolean r6, defpackage.p92 r7) {
        /*
            r4 = this;
            boolean r0 = r7 instanceof defpackage.yd1
            if (r0 == 0) goto L13
            r0 = r7
            yd1 r0 = (defpackage.yd1) r0
            int r1 = r0.d
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.d = r1
            goto L18
        L13:
            yd1 r0 = new yd1
            r0.<init>(r4, r7)
        L18:
            java.lang.Object r7 = r0.b
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.d
            r3 = 1
            if (r2 == 0) goto L32
            if (r2 != r3) goto L2b
            defpackage.br7.v(r7)
            bjb r7 = (defpackage.bjb) r7
            java.lang.Object r4 = r7.a
            goto L47
        L2b:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L32:
            defpackage.br7.v(r7)
            if (r6 == 0) goto L3a
            h81 r4 = defpackage.h81.t
            return r4
        L3a:
            java.lang.Object r4 = r4.e
            hha r4 = (defpackage.hha) r4
            r0.d = r3
            java.lang.Object r4 = r4.s(r5, r0)
            if (r4 != r1) goto L47
            return r1
        L47:
            java.lang.Throwable r5 = defpackage.bjb.b(r4)
            if (r5 != 0) goto L52
            c1e r4 = (defpackage.c1e) r4
            j81 r4 = defpackage.j81.t
            return r4
        L52:
            i81 r4 = new i81
            r4.<init>(r5)
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n0c.e0(java.lang.String, boolean, p92):java.lang.Object");
    }

    @Override // defpackage.fn6
    public void f(mn1 mn1Var, n98 n98Var) {
        ((ArrayList) this.b).add(new r04(mn1Var, n98Var));
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object f0(defpackage.p92 r9) throws java.lang.Throwable {
        /*
            r8 = this;
            boolean r0 = r9 instanceof defpackage.umb
            if (r0 == 0) goto L13
            r0 = r9
            umb r0 = (defpackage.umb) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            umb r0 = new umb
            r0.<init>(r8, r9)
        L18:
            java.lang.Object r9 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 2
            r4 = 1
            c1e r5 = defpackage.c1e.a
            r6 = 0
            if (r2 == 0) goto L43
            if (r2 == r4) goto L39
            if (r2 != r3) goto L33
            y88 r8 = r0.c
            n0c r0 = r0.b
            defpackage.br7.v(r9)     // Catch: java.lang.Throwable -> L31
            goto L7f
        L31:
            r9 = move-exception
            goto L8e
        L33:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            return r6
        L39:
            y88 r8 = r0.c
            n0c r2 = r0.b
            defpackage.br7.v(r9)
            r9 = r8
            r8 = r2
            goto L62
        L43:
            defpackage.br7.v(r9)
            java.lang.Object r9 = r8.c
            vx1 r9 = (defpackage.vx1) r9
            boolean r9 = r9.P()
            if (r9 == 0) goto L51
            return r5
        L51:
            java.lang.Object r9 = r8.b
            a98 r9 = (defpackage.a98) r9
            r0.b = r8
            r0.c = r9
            r0.f = r4
            java.lang.Object r2 = r9.m(r0, r6)
            if (r2 != r1) goto L62
            goto L7c
        L62:
            java.lang.Object r2 = r8.c     // Catch: java.lang.Throwable -> L8a
            vx1 r2 = (defpackage.vx1) r2     // Catch: java.lang.Throwable -> L8a
            boolean r2 = r2.P()     // Catch: java.lang.Throwable -> L8a
            if (r2 == 0) goto L70
            r9.f(r6)
            return r5
        L70:
            r0.b = r8     // Catch: java.lang.Throwable -> L8a
            r0.c = r9     // Catch: java.lang.Throwable -> L8a
            r0.f = r3     // Catch: java.lang.Throwable -> L8a
            java.lang.Object r0 = r8.y(r0)     // Catch: java.lang.Throwable -> L8a
            if (r0 != r1) goto L7d
        L7c:
            return r1
        L7d:
            r0 = r8
            r8 = r9
        L7f:
            java.lang.Object r9 = r0.c     // Catch: java.lang.Throwable -> L31
            vx1 r9 = (defpackage.vx1) r9     // Catch: java.lang.Throwable -> L31
            r9.V(r5)     // Catch: java.lang.Throwable -> L31
            r8.f(r6)
            return r5
        L8a:
            r8 = move-exception
            r7 = r9
            r9 = r8
            r8 = r7
        L8e:
            r8.f(r6)
            throw r9
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n0c.f0(p92):java.lang.Object");
    }

    @Override // defpackage.en6
    public void g(n98 n98Var, Object obj) {
        ((jz1) this.b).g(n98Var, obj);
    }

    public Bundle g0(String str, Bundle bundle) {
        HashMap map = (HashMap) this.d;
        return bundle != null ? (Bundle) map.put(str, bundle) : (Bundle) map.remove(str);
    }

    @Override // defpackage.z5e
    public void h() {
        r40.C((ScheduledThreadPoolExecutor) this.c, ((String) this.b).concat(": data upload"), (f66) this.d, (pu2) this.e);
    }

    public void h0(lb9 lb9Var) {
        if (((wb9) this.c) == wb9.Dispatching) {
            eh8 eh8Var = (eh8) this.b;
            if (eh8Var == null) {
                ygf.f("layoutCoordinates not set");
                return;
            }
            er7.I(lb9Var, eh8Var.I(0L), new xb9((yb9) this.e, 1), true);
        }
        this.c = wb9.NotDispatching;
    }

    @Override // defpackage.gn6
    public en6 i(mn1 mn1Var, d0b d0bVar) {
        return ((nig) ((lig) this.d).b).s(mn1Var, d0bVar, (ArrayList) this.c);
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object i0(java.lang.String r9, java.lang.String r10, gen.model.SourceParameter r11, java.lang.String r12, defpackage.p92 r13) {
        /*
            r8 = this;
            boolean r0 = r13 instanceof defpackage.wr1
            if (r0 == 0) goto L14
            r0 = r13
            wr1 r0 = (defpackage.wr1) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.f = r1
        L12:
            r2 = r0
            goto L1a
        L14:
            wr1 r0 = new wr1
            r0.<init>(r8, r13)
            goto L12
        L1a:
            java.lang.Object r13 = r2.d
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r2.f
            r3 = 1
            if (r1 == 0) goto L38
            if (r1 != r3) goto L31
            gen.model.SourceParameter r11 = r2.c
            java.lang.String r9 = r2.b
            defpackage.br7.v(r13)
            bjb r13 = (defpackage.bjb) r13
            java.lang.Object r8 = r13.a
            goto L54
        L31:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            r8 = 0
            return r8
        L38:
            defpackage.br7.v(r13)
            java.lang.Object r8 = r8.e
            r1 = r8
            a1a r1 = (defpackage.a1a) r1
            r2.b = r9
            r2.c = r11
            r2.f = r3
            r5 = 0
            r4 = r9
            r6 = r10
            r3 = r11
            r7 = r12
            java.lang.Object r8 = r1.F(r2, r3, r4, r5, r6, r7)
            if (r8 != r0) goto L52
            return r0
        L52:
            r11 = r3
            r9 = r4
        L54:
            java.lang.Throwable r10 = defpackage.bjb.b(r8)
            if (r10 != 0) goto L62
            com.medium.android.graphql.fragment.CollectionProfileData r8 = (com.medium.android.graphql.fragment.CollectionProfileData) r8
            wq1 r8 = new wq1
            r8.<init>(r9, r11)
            return r8
        L62:
            vq1 r8 = new vq1
            r8.<init>(r11, r9, r10)
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n0c.i0(java.lang.String, java.lang.String, gen.model.SourceParameter, java.lang.String, p92):java.lang.Object");
    }

    @Override // defpackage.en6
    public void j(n98 n98Var, rn1 rn1Var) {
        ((jz1) this.b).j(n98Var, rn1Var);
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object j0(defpackage.p92 r5, java.lang.String r6, java.lang.String r7, java.lang.String r8, java.lang.String r9, boolean r10) {
        /*
            r4 = this;
            boolean r0 = r5 instanceof defpackage.zd1
            if (r0 == 0) goto L13
            r0 = r5
            zd1 r0 = (defpackage.zd1) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L13
            int r1 = r1 - r2
            r0.f = r1
            goto L18
        L13:
            zd1 r0 = new zd1
            r0.<init>(r4, r5)
        L18:
            java.lang.Object r5 = r0.d
            tb2 r1 = defpackage.tb2.COROUTINE_SUSPENDED
            int r2 = r0.f
            r3 = 1
            if (r2 == 0) goto L36
            if (r2 != r3) goto L2f
            java.lang.String r8 = r0.c
            java.lang.String r6 = r0.b
            defpackage.br7.v(r5)
            bjb r5 = (defpackage.bjb) r5
            java.lang.Object r4 = r5.a
            goto L56
        L2f:
            java.lang.String r4 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r4)
            r4 = 0
            return r4
        L36:
            defpackage.br7.v(r5)
            if (r10 == 0) goto L3e
            l81 r4 = defpackage.l81.t
            return r4
        L3e:
            java.lang.Object r4 = r4.c
            a1a r4 = (defpackage.a1a) r4
            r0.b = r6
            r0.c = r8
            r0.f = r3
            r5 = r6
            r6 = r7
            r7 = r8
            r8 = r9
            r9 = r0
            java.lang.Object r4 = r4.I(r5, r6, r7, r8, r9)
            if (r4 != r1) goto L54
            return r1
        L54:
            r6 = r5
            r8 = r7
        L56:
            java.lang.Throwable r5 = defpackage.bjb.b(r4)
            if (r5 != 0) goto L64
            c1e r4 = (defpackage.c1e) r4
            n81 r4 = new n81
            r4.<init>(r6, r8)
            return r4
        L64:
            m81 r4 = new m81
            r4.<init>(r6, r8, r5)
            return r4
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n0c.j0(p92, java.lang.String, java.lang.String, java.lang.String, java.lang.String, boolean):java.lang.Object");
    }

    @Override // defpackage.qx5
    public void k() {
        switch (this.a) {
            case 18:
                ((ImageViewTouch) this.d).setVisibility(0);
                TextView textView = (TextView) this.e;
                textView.getClass();
                textView.setVisibility(8);
                break;
            default:
                l78 l78Var = (l78) this.d;
                Boolean bool = Boolean.FALSE;
                l78Var.setValue(bool);
                ((l78) this.e).setValue(bool);
                break;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:8:0x0014  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object k0(java.lang.String r9, java.lang.String r10, gen.model.SourceParameter r11, java.lang.String r12, defpackage.p92 r13) {
        /*
            r8 = this;
            boolean r0 = r13 instanceof defpackage.xr1
            if (r0 == 0) goto L14
            r0 = r13
            xr1 r0 = (defpackage.xr1) r0
            int r1 = r0.f
            r2 = -2147483648(0xffffffff80000000, float:-0.0)
            r3 = r1 & r2
            if (r3 == 0) goto L14
            int r1 = r1 - r2
            r0.f = r1
        L12:
            r7 = r0
            goto L1a
        L14:
            xr1 r0 = new xr1
            r0.<init>(r8, r13)
            goto L12
        L1a:
            java.lang.Object r13 = r7.d
            tb2 r0 = defpackage.tb2.COROUTINE_SUSPENDED
            int r1 = r7.f
            r2 = 1
            if (r1 == 0) goto L38
            if (r1 != r2) goto L31
            gen.model.SourceParameter r11 = r7.c
            java.lang.String r9 = r7.b
            defpackage.br7.v(r13)
            bjb r13 = (defpackage.bjb) r13
            java.lang.Object r8 = r13.a
            goto L54
        L31:
            java.lang.String r8 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r8)
            r8 = 0
            return r8
        L38:
            defpackage.br7.v(r13)
            java.lang.Object r8 = r8.c
            r1 = r8
            o2b r1 = (defpackage.o2b) r1
            r7.b = r9
            r7.c = r11
            r7.f = r2
            r6 = 0
            r2 = r9
            r3 = r10
            r4 = r11
            r5 = r12
            java.lang.Object r8 = r1.w(r2, r3, r4, r5, r6, r7)
            if (r8 != r0) goto L52
            return r0
        L52:
            r9 = r2
            r11 = r4
        L54:
            java.lang.Throwable r10 = defpackage.bjb.b(r8)
            if (r10 != 0) goto L62
            com.medium.android.graphql.fragment.CollectionFollowData r8 = (com.medium.android.graphql.fragment.CollectionFollowData) r8
            zq1 r8 = new zq1
            r8.<init>(r9, r11)
            return r8
        L62:
            yq1 r8 = new yq1
            r8.<init>(r11, r9, r10)
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n0c.k0(java.lang.String, java.lang.String, gen.model.SourceParameter, java.lang.String, p92):java.lang.Object");
    }

    @Override // defpackage.bn1
    public an1 l(mn1 mn1Var) {
        mn1Var.getClass();
        k5a k5aVar = (k5a) ((LinkedHashMap) this.e).get(mn1Var);
        if (k5aVar == null) {
            return null;
        }
        return new an1((r98) this.b, k5aVar, (s01) this.c, (jkc) ((zkc) this.d).invoke(mn1Var));
    }

    public Object l0(x45 x45Var, n92 n92Var) {
        Object objA = ((r6c) this.e).a(new uz8(x45Var), n92Var);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : c1e.a;
    }

    @Override // defpackage.en6
    public fn6 m(n98 n98Var) {
        return ((jz1) this.b).m(n98Var);
    }

    public jz1 m0(int i, mn1 mn1Var, d0b d0bVar) {
        gv7 gv7Var = new gv7(((gv7) this.b).a + '@' + i);
        lig ligVar = (lig) this.e;
        HashMap map = (HashMap) ligVar.c;
        List arrayList = (List) map.get(gv7Var);
        if (arrayList == null) {
            arrayList = new ArrayList();
            map.put(gv7Var, arrayList);
        }
        return ((nig) ligVar.b).s(mn1Var, d0bVar, arrayList);
    }

    @Override // defpackage.en6
    public void n(n98 n98Var, mn1 mn1Var, n98 n98Var2) {
        ((jz1) this.b).n(n98Var, mn1Var, n98Var2);
    }

    @Override // defpackage.z5e
    public void o() {
        ((ScheduledThreadPoolExecutor) this.c).remove((pu2) this.e);
    }

    @Override // defpackage.qx5
    public void onCancel() {
        int i = this.a;
    }

    @Override // defpackage.en6
    public en6 p(mn1 mn1Var, n98 n98Var) {
        return ((jz1) this.b).p(mn1Var, n98Var);
    }

    @Override // defpackage.xjc
    public bfc q() {
        return (a23) this.e;
    }

    @Override // defpackage.fn6
    public void r(rn1 rn1Var) {
        ((ArrayList) this.b).add(new hh6(new fh6(rn1Var)));
    }

    public void s(j15 j15Var) {
        if (((ArrayList) this.b).contains(j15Var)) {
            ik4.o("Fragment already added: ", j15Var);
            return;
        }
        synchronized (((ArrayList) this.b)) {
            ((ArrayList) this.b).add(j15Var);
        }
        j15Var.k = true;
    }

    public kva t() {
        Context context;
        gz1 gz1Var;
        Context context2 = (Context) this.b;
        ox5 ox5Var = (ox5) this.c;
        ox5 ox5Var2 = new ox5(ox5Var.a, ox5Var.b, ox5Var.c, ox5Var.d, ox5Var.e, ox5Var.f, ox5Var.g, ox5Var.h, ox5Var.i, ox5Var.j, ox5Var.k, ox5Var.l, ox5Var.m, new r84(nk7.A0(((p84) this.e).a)));
        w5d w5dVar = new w5d(new e73(16));
        w5d w5dVar2 = new w5d(new em4(9, this));
        w5d w5dVar3 = new w5d(new e73(17));
        gz1 gz1Var2 = (gz1) this.d;
        if (gz1Var2 == null) {
            ey3 ey3Var = ey3.a;
            context = context2;
            gz1Var = new gz1(ey3Var, ey3Var, ey3Var, ey3Var, ey3Var);
        } else {
            context = context2;
            gz1Var = gz1Var2;
        }
        return new kva(new hva(context, ox5Var2, w5dVar, w5dVar2, w5dVar3, gz1Var));
    }

    public String toString() {
        switch (this.a) {
            case 12:
                String string = ((Socket) this.b).toString();
                string.getClass();
                return string;
            default:
                return super.toString();
        }
    }

    public wi2 u() {
        Map mapL;
        String str;
        int i;
        long length;
        long length2;
        long j;
        vi2 vi2Var;
        na6 na6Var = (na6) this.e;
        i7e i7eVar = na6Var.D;
        if (i7eVar != null) {
            mapL = i7eVar.L();
            i7e i7eVar2 = na6Var.D;
            str = i7eVar2.i;
            i = i7eVar2.g;
        } else {
            mapL = Collections.EMPTY_MAP;
            str = "";
            i = 0;
        }
        String str2 = str;
        TreeMap treeMap = na6Var.u;
        if (treeMap == null) {
            length = 0;
        } else {
            length = 0;
            for (Map.Entry entry : treeMap.entrySet()) {
                String str3 = (String) entry.getKey();
                if (str3 != null) {
                    length += (long) str3.length();
                }
                String str4 = (String) entry.getValue();
                if (str4 != null) {
                    length += (long) str4.length();
                }
            }
        }
        if (mapL == null) {
            length2 = 0;
        } else {
            length2 = 0;
            for (Map.Entry entry2 : mapL.entrySet()) {
                String str5 = (String) entry2.getKey();
                if (str5 != null) {
                    length2 += (long) str5.length();
                }
                if (entry2.getValue() != null) {
                    for (String str6 : (List) entry2.getValue()) {
                        if (str6 != null) {
                            length2 += (long) str6.length();
                        }
                    }
                }
            }
        }
        if (mapL.containsKey("Content-Length")) {
            try {
                j = Long.parseLong((String) ((List) mapL.get("Content-Length")).get(0));
            } catch (NumberFormatException unused) {
                j = 0;
            }
        } else {
            j = -1;
        }
        Duration durationOfSeconds = Duration.ofSeconds(0L);
        Duration durationOfSeconds2 = Duration.ofSeconds(0L);
        int i2 = na6Var.w.get();
        if (i2 == 6) {
            vi2Var = vi2.ERROR;
        } else if (i2 == 7) {
            vi2Var = vi2.SUCCEEDED;
        } else {
            if (i2 != 8) {
                ygf.f(ev6.w("Internal Cronet error: attempted to report metrics but current state (", i2, ") is not a done state!"));
                return null;
            }
            vi2Var = vi2.CANCELLED;
        }
        vi2 vi2Var2 = vi2Var;
        int i3 = na6Var.M;
        int i4 = na6Var.L;
        la6 la6Var = na6Var.G;
        return new wi2(length, -1L, length2, j, i, durationOfSeconds, durationOfSeconds2, str2, vi2Var2, i3, i4, la6Var != null ? la6Var.k : 0, na6Var.N, Process.myUid(), ui2.UNKNOWN, ImplVersion.getCronetVersion(), ti2.CRONET_SOURCE_FALLBACK);
    }

    public void w(Object obj, ArrayList arrayList, HashSet hashSet) {
        if (arrayList.contains(obj)) {
            return;
        }
        if (hashSet.contains(obj)) {
            ygf.i("This graph contains cyclic dependencies");
            return;
        }
        hashSet.add(obj);
        ArrayList arrayList2 = (ArrayList) ((aec) this.c).get(obj);
        if (arrayList2 != null) {
            int size = arrayList2.size();
            for (int i = 0; i < size; i++) {
                w(arrayList2.get(i), arrayList, hashSet);
            }
        }
        hashSet.remove(obj);
        arrayList.add(obj);
    }

    public void x(lb9 lb9Var, boolean z) {
        yb9 yb9Var = (yb9) this.e;
        List list = lb9Var.a;
        int size = list.size();
        for (int i = 0; i < size; i++) {
            if (((rb9) list.get(i)).b()) {
                h0(lb9Var);
                return;
            }
        }
        eh8 eh8Var = (eh8) this.b;
        if (eh8Var == null) {
            ygf.f("layoutCoordinates not set");
            return;
        }
        er7.I(lb9Var, eh8Var.I(0L), new jr(this, 12, yb9Var), false);
        if (((wb9) this.c) == wb9.Dispatching) {
            if (z) {
                int size2 = list.size();
                for (int i2 = 0; i2 < size2; i2++) {
                    ((rb9) list.get(i2)).a();
                }
            }
            o72 o72Var = lb9Var.b;
            if (o72Var != null) {
                o72Var.b = !yb9Var.d;
            }
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:22:0x005e, code lost:
    
        if (r8 == r2) goto L27;
     */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x006d, code lost:
    
        if (r8 == r2) goto L27;
     */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0017  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object y(defpackage.p92 r8) {
        /*
            r7 = this;
            java.lang.Object r0 = r7.e
            mu2 r0 = (defpackage.mu2) r0
            boolean r1 = r8 instanceof defpackage.ut2
            if (r1 == 0) goto L17
            r1 = r8
            ut2 r1 = (defpackage.ut2) r1
            int r2 = r1.e
            r3 = -2147483648(0xffffffff80000000, float:-0.0)
            r4 = r2 & r3
            if (r4 == 0) goto L17
            int r2 = r2 - r3
            r1.e = r2
            goto L1c
        L17:
            ut2 r1 = new ut2
            r1.<init>(r7, r8)
        L1c:
            java.lang.Object r8 = r1.c
            tb2 r2 = defpackage.tb2.COROUTINE_SUSPENDED
            int r3 = r1.e
            r4 = 0
            r5 = 2
            r6 = 1
            if (r3 == 0) goto L3d
            if (r3 == r6) goto L37
            if (r3 != r5) goto L31
            n0c r7 = r1.b
            defpackage.br7.v(r8)
            goto L61
        L31:
            java.lang.String r7 = "call to 'resume' before 'invoke' with coroutine"
            defpackage.ygf.f(r7)
            return r4
        L37:
            n0c r7 = r1.b
            defpackage.br7.v(r8)
            goto L70
        L3d:
            defpackage.br7.v(r8)
            java.lang.Object r8 = r7.d
            java.util.List r8 = (java.util.List) r8
            if (r8 == 0) goto L64
            boolean r8 = r8.isEmpty()
            if (r8 == 0) goto L4d
            goto L64
        L4d:
            b56 r8 = r0.c()
            xt2 r3 = new xt2
            r3.<init>(r0, r7, r4)
            r1.b = r7
            r1.e = r5
            java.lang.Object r8 = r8.a(r3, r1)
            if (r8 != r2) goto L61
            goto L6f
        L61:
            et2 r8 = (defpackage.et2) r8
            goto L72
        L64:
            r1.b = r7
            r1.e = r6
            r8 = 0
            java.lang.Object r8 = r0.h(r8, r1)
            if (r8 != r2) goto L70
        L6f:
            return r2
        L70:
            et2 r8 = (defpackage.et2) r8
        L72:
            java.lang.Object r7 = r7.e
            mu2 r7 = (defpackage.mu2) r7
            olb r7 = r7.h
            r7.y(r8)
            c1e r7 = defpackage.c1e.a
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.n0c.y(p92):java.lang.Object");
    }

    /* JADX WARN: Multi-variable type inference failed */
    public n0c(ti8 ti8Var) {
        Notification.Builder builder;
        int i;
        ArrayList arrayList;
        int i2;
        this.a = 26;
        this.e = new Bundle();
        this.d = ti8Var;
        Context context = ti8Var.a;
        ArrayList arrayList2 = ti8Var.t;
        ArrayList arrayList3 = ti8Var.c;
        ArrayList arrayList4 = ti8Var.d;
        this.b = context;
        if (Build.VERSION.SDK_INT >= 26) {
            builder = u36.h(context, ti8Var.q);
            this.c = builder;
        } else {
            builder = new Notification.Builder(context);
            this.c = builder;
        }
        Notification notification = ti8Var.s;
        Context context2 = null;
        builder.setWhen(notification.when).setSmallIcon(notification.icon, notification.iconLevel).setContent(notification.contentView).setTicker(notification.tickerText, null).setVibrate(notification.vibrate).setLights(notification.ledARGB, notification.ledOnMS, notification.ledOffMS).setOngoing((notification.flags & 2) != 0).setOnlyAlertOnce((notification.flags & 8) != 0).setAutoCancel((notification.flags & 16) != 0).setDefaults(notification.defaults).setContentTitle(ti8Var.e).setContentText(ti8Var.f).setContentInfo(null).setContentIntent(ti8Var.g).setDeleteIntent(notification.deleteIntent).setFullScreenIntent(null, (notification.flags & 128) != 0).setNumber(ti8Var.i).setProgress(0, 0, false);
        IconCompat iconCompat = ti8Var.h;
        builder.setLargeIcon(iconCompat == null ? null : gsa.q0(iconCompat, context));
        builder.setSubText(null).setUsesChronometer(false).setPriority(ti8Var.j);
        for (ni8 ni8Var : ti8Var.b) {
            IconCompat iconCompatB = ni8Var.b;
            if (iconCompatB == null && (i2 = ni8Var.d) != 0) {
                iconCompatB = IconCompat.b(i2);
                ni8Var.b = iconCompatB;
            }
            Bundle bundle = ni8Var.a;
            Notification.Action.Builder builder2 = new Notification.Action.Builder(iconCompatB != null ? gsa.q0(iconCompatB, context2) : context2, ni8Var.e, ni8Var.f);
            Bundle bundle2 = new Bundle(bundle);
            bundle2.putBoolean("android.support.allowGeneratedReplies", true);
            int i3 = Build.VERSION.SDK_INT;
            if (i3 >= 24) {
                o6.r(builder2);
            }
            bundle2.putInt("android.support.action.semanticAction", 0);
            if (i3 >= 28) {
                uy.K(builder2);
            }
            if (i3 >= 29) {
                nm.F(builder2);
            }
            if (i3 >= 31) {
                io.p(builder2);
            }
            bundle2.putBoolean(uuLAxLN.ubqEw, ni8Var.c);
            builder2.addExtras(bundle2);
            ((Notification.Builder) this.c).addAction(builder2.build());
            context2 = null;
        }
        Bundle bundle3 = ti8Var.n;
        if (bundle3 != null) {
            ((Bundle) this.e).putAll(bundle3);
        }
        ((Notification.Builder) this.c).setShowWhen(ti8Var.k);
        ((Notification.Builder) this.c).setLocalOnly(ti8Var.m);
        ((Notification.Builder) this.c).setGroup(null);
        ((Notification.Builder) this.c).setSortKey(null);
        ((Notification.Builder) this.c).setGroupSummary(false);
        ((Notification.Builder) this.c).setCategory(null);
        ((Notification.Builder) this.c).setColor(ti8Var.o);
        ((Notification.Builder) this.c).setVisibility(ti8Var.p);
        ((Notification.Builder) this.c).setPublicVersion(null);
        ((Notification.Builder) this.c).setSound(notification.sound, notification.audioAttributes);
        if (Build.VERSION.SDK_INT < 28) {
            if (arrayList3 == null) {
                arrayList = null;
            } else {
                arrayList = new ArrayList(arrayList3.size());
                Iterator it2 = arrayList3.iterator();
                if (it2.hasNext()) {
                    throw ev6.q(it2);
                }
            }
            if (arrayList != null) {
                if (arrayList2 == null) {
                    arrayList2 = arrayList;
                } else {
                    d80 d80Var = new d80(arrayList2.size() + arrayList.size());
                    d80Var.addAll(arrayList);
                    d80Var.addAll(arrayList2);
                    arrayList2 = new ArrayList(d80Var);
                }
            }
        }
        if (arrayList2 != null && !arrayList2.isEmpty()) {
            Iterator it3 = arrayList2.iterator();
            while (it3.hasNext()) {
                ((Notification.Builder) this.c).addPerson((String) it3.next());
            }
        }
        if (arrayList4.size() > 0) {
            Bundle bundle4 = ti8Var.n;
            if (bundle4 == null) {
                bundle4 = new Bundle();
                ti8Var.n = bundle4;
            }
            Bundle bundle5 = bundle4.getBundle("android.car.EXTENSIONS");
            bundle5 = bundle5 == null ? new Bundle() : bundle5;
            Bundle bundle6 = new Bundle(bundle5);
            Bundle bundle7 = new Bundle();
            for (int i4 = 0; i4 < arrayList4.size(); i4++) {
                String string = Integer.toString(i4);
                ni8 ni8Var2 = (ni8) arrayList4.get(i4);
                Bundle bundle8 = new Bundle();
                IconCompat iconCompatB2 = ni8Var2.b;
                if (iconCompatB2 == null && (i = ni8Var2.d) != 0) {
                    iconCompatB2 = IconCompat.b(i);
                    ni8Var2.b = iconCompatB2;
                }
                Bundle bundle9 = ni8Var2.a;
                bundle8.putInt("icon", iconCompatB2 != null ? iconCompatB2.c() : 0);
                bundle8.putCharSequence("title", ni8Var2.e);
                bundle8.putParcelable("actionIntent", ni8Var2.f);
                Bundle bundle10 = new Bundle(bundle9);
                bundle10.putBoolean("android.support.allowGeneratedReplies", true);
                bundle8.putBundle("extras", bundle10);
                bundle8.putParcelableArray("remoteInputs", null);
                bundle8.putBoolean("showsUserInterface", ni8Var2.c);
                bundle8.putInt("semanticAction", 0);
                bundle7.putBundle(string, bundle8);
            }
            bundle5.putBundle("invisible_actions", bundle7);
            bundle6.putBundle("invisible_actions", bundle7);
            Bundle bundle11 = ti8Var.n;
            if (bundle11 == null) {
                bundle11 = new Bundle();
                ti8Var.n = bundle11;
            }
            bundle11.putBundle("android.car.EXTENSIONS", bundle5);
            ((Bundle) this.e).putBundle("android.car.EXTENSIONS", bundle6);
        }
        int i5 = Build.VERSION.SDK_INT;
        if (i5 >= 24) {
            ((Notification.Builder) this.c).setExtras(ti8Var.n);
            o6.t((Notification.Builder) this.c);
        }
        if (i5 >= 26) {
            u36.t((Notification.Builder) this.c);
            u36.v((Notification.Builder) this.c);
            u36.w((Notification.Builder) this.c);
            u36.x((Notification.Builder) this.c);
            u36.u((Notification.Builder) this.c);
            if (!TextUtils.isEmpty(ti8Var.q)) {
                ((Notification.Builder) this.c).setSound(null).setDefaults(0).setLights(0, 0, 0).setVibrate(null);
            }
        }
        if (i5 >= 28) {
            Iterator it4 = arrayList3.iterator();
            if (it4.hasNext()) {
                throw ev6.q(it4);
            }
        }
        if (i5 >= 29) {
            nm.B((Notification.Builder) this.c, ti8Var.r);
            nm.E((Notification.Builder) this.c);
        }
        if (i5 >= 36) {
            w4.h((Notification.Builder) this.c);
        }
    }

    public n0c(int i, j92 j92Var, pt2 pt2Var, f66 f66Var, ge8 ge8Var, asc ascVar, u6d u6dVar, String str, ScheduledThreadPoolExecutor scheduledThreadPoolExecutor, lig ligVar) {
        this.a = 11;
        str.getClass();
        j92Var.getClass();
        ge8Var.getClass();
        u6dVar.getClass();
        f66Var.getClass();
        this.b = str;
        this.c = scheduledThreadPoolExecutor;
        this.d = f66Var;
        this.e = new pu2(i, j92Var, pt2Var, f66Var, ge8Var, ascVar, u6dVar, str, scheduledThreadPoolExecutor, ligVar);
    }

    public n0c(i79 i79Var, da5 da5Var, yx2 yx2Var, dm4 dm4Var) {
        this.a = 2;
        dm4Var.getClass();
        this.b = i79Var;
        this.c = da5Var;
        this.d = yx2Var;
        this.e = dm4Var;
    }

    public n0c(x67 x67Var, b38 b38Var) {
        this.a = 25;
        b38Var.getClass();
        this.b = x67Var;
        this.c = b38Var;
        this.d = x67Var.b(new bi8(this, 0));
        this.e = x67Var.b(new bi8(this, 1));
    }

    public n0c(g6a g6aVar, r98 r98Var, s01 s01Var, zkc zkcVar) {
        this.a = 29;
        this.b = r98Var;
        this.c = s01Var;
        this.d = zkcVar;
        List list = g6aVar.g;
        list.getClass();
        int iP = ei7.P(cu1.k0(list, 10));
        LinkedHashMap linkedHashMap = new LinkedHashMap(iP < 16 ? 16 : iP);
        for (Object obj : list) {
            linkedHashMap.put(vn7.z((r98) this.b, ((k5a) obj).e), obj);
        }
        this.e = linkedHashMap;
    }

    public n0c(yd4 yd4Var, Object obj, int i) {
        this.a = 27;
        yd4Var = (i & 1) != 0 ? yd4.CacheFirst : yd4Var;
        yd4 yd4Var2 = yd4.NetworkOnly;
        obj = (i & 4) != 0 ? null : obj;
        yd4Var.getClass();
        yd4Var2.getClass();
        this.b = yd4Var;
        this.c = yd4Var2;
        this.d = obj;
        this.e = k40.x(0, 7, null);
    }

    public n0c(Drawable.Callback callback) {
        this.a = 16;
        this.b = new ma3();
        this.c = new HashMap();
        this.d = new HashMap();
        if (!(callback instanceof View)) {
            h87.a("LottieDrawable must be inside of a view for images to work.");
            this.e = null;
        } else {
            this.e = ((View) callback).getContext().getAssets();
        }
    }

    public n0c(Socket socket) {
        this.a = 12;
        this.b = socket;
        this.c = new AtomicInteger();
        this.d = new b23(this);
        this.e = new a23(this);
    }

    public n0c(yb9 yb9Var) {
        this.a = 28;
        this.e = yb9Var;
        this.c = wb9.Unknown;
    }

    public /* synthetic */ n0c(Object obj, Object obj2, Object obj3, Object obj4, int i) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
        this.d = obj3;
        this.e = obj4;
    }

    public n0c(Typeface typeface, vz7 vz7Var) {
        int i;
        int i2;
        int i3;
        int i4;
        this.a = 23;
        this.e = typeface;
        this.b = vz7Var;
        this.d = new xz7(1024);
        int iA = vz7Var.a(6);
        if (iA != 0) {
            int i5 = iA + vz7Var.a;
            i = ((ByteBuffer) vz7Var.d).getInt(((ByteBuffer) vz7Var.d).getInt(i5) + i5);
        } else {
            i = 0;
        }
        this.c = new char[i * 2];
        int iA2 = vz7Var.a(6);
        if (iA2 != 0) {
            int i6 = iA2 + vz7Var.a;
            i2 = ((ByteBuffer) vz7Var.d).getInt(((ByteBuffer) vz7Var.d).getInt(i6) + i6);
        } else {
            i2 = 0;
        }
        for (int i7 = 0; i7 < i2; i7++) {
            byd bydVar = new byd(this, i7);
            uz7 uz7VarB = bydVar.b();
            int iA3 = uz7VarB.a(4);
            Character.toChars(iA3 != 0 ? ((ByteBuffer) uz7VarB.d).getInt(iA3 + uz7VarB.a) : 0, (char[]) this.c, i7 * 2);
            uz7 uz7VarB2 = bydVar.b();
            int iA4 = uz7VarB2.a(16);
            if (iA4 != 0) {
                int i8 = iA4 + uz7VarB2.a;
                i3 = ((ByteBuffer) uz7VarB2.d).getInt(((ByteBuffer) uz7VarB2.d).getInt(i8) + i8);
            } else {
                i3 = 0;
            }
            if (!(i3 > 0)) {
                ay0.e(dpBiLjNeNsiASg.LQJTsCvCg);
                throw null;
            }
            xz7 xz7Var = (xz7) this.d;
            uz7 uz7VarB3 = bydVar.b();
            int iA5 = uz7VarB3.a(16);
            if (iA5 != 0) {
                int i9 = iA5 + uz7VarB3.a;
                i4 = ((ByteBuffer) uz7VarB3.d).getInt(((ByteBuffer) uz7VarB3.d).getInt(i9) + i9);
            } else {
                i4 = 0;
            }
            xz7Var.a(bydVar, 0, i4 - 1);
        }
    }

    public n0c(Context context) {
        this.a = 19;
        this.b = context.getApplicationContext();
        this.c = ox5.o;
        this.d = null;
        this.e = new p84();
    }

    public n0c(lig ligVar, gv7 gv7Var) {
        this.a = 1;
        this.e = ligVar;
        this.a = 1;
        this.d = ligVar;
        this.b = gv7Var;
        this.c = new ArrayList();
    }

    public n0c(k96 k96Var, vwd vwdVar, vq6 vq6Var) {
        this.a = 22;
        vwdVar.getClass();
        this.b = k96Var;
        this.c = vwdVar;
        this.d = vq6Var;
        this.e = new ku3(this, vwdVar);
    }

    public n0c(int i) {
        this.a = i;
        switch (i) {
            case 8:
                break;
            case 14:
                this.b = new wc9(10);
                this.c = new aec(0);
                this.d = new ArrayList();
                this.e = new HashSet();
                break;
            case 15:
                this.e = new ArrayDeque();
                this.c = new ArrayDeque();
                this.d = new ArrayDeque();
                break;
            case 17:
                this.b = new ArrayList();
                this.c = new HashMap();
                this.d = new HashMap();
                break;
            default:
                this.b = null;
                this.c = null;
                this.d = null;
                this.e = new ArrayDeque();
                break;
        }
    }

    public n0c(nig nigVar, n98 n98Var, jz1 jz1Var) {
        this.a = 6;
        this.c = nigVar;
        this.d = n98Var;
        this.e = jz1Var;
        this.b = new ArrayList();
    }

    public n0c(jz1 jz1Var, n0c n0cVar, ArrayList arrayList) {
        this.a = 5;
        this.c = jz1Var;
        this.d = n0cVar;
        this.e = arrayList;
        this.b = jz1Var;
    }

    public n0c(s93 s93Var) {
        this.a = 13;
        this.e = s93Var;
        List list = s93Var.e.t;
        list.getClass();
        int iP = ei7.P(cu1.k0(list, 10));
        LinkedHashMap linkedHashMap = new LinkedHashMap(iP < 16 ? 16 : iP);
        for (Object obj : list) {
            linkedHashMap.put(vn7.C((p98) s93Var.l.b, ((v5a) obj).d), obj);
        }
        this.b = linkedHashMap;
        s93 s93Var2 = (s93) this.e;
        this.c = ((i93) s93Var2.l.a).a.c(new s2(this, 17, s93Var2));
        x67 x67Var = ((i93) ((s93) this.e).l.a).a;
        v2 v2Var = new v2(8, this);
        x67Var.getClass();
        this.d = new u67(x67Var, v2Var);
    }

    public n0c(mu2 mu2Var, List list) {
        this.a = 10;
        this.e = mu2Var;
        this.b = new a98();
        this.c = new vx1();
        this.d = bu1.m1(list);
    }

    public n0c(na6 na6Var, ceg cegVar, Executor executor) {
        this.a = 21;
        this.e = na6Var;
        this.b = new mse(cegVar);
        this.c = new qa6(executor, 0);
        this.d = executor;
    }
}
