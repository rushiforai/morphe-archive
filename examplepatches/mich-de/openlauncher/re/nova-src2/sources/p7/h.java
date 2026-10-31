package p7;

import android.content.Context;
import android.os.PowerManager;
import androidx.work.impl.WorkDatabase;
import com.google.android.gms.internal.consent_sdk.e0;
import com.google.android.gms.internal.consent_sdk.n7;
import com.google.common.util.concurrent.ListenableFuture;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Objects;
import java.util.Set;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;

/* loaded from: classes.dex */
public final class h implements w7.a {

    /* renamed from: l, reason: collision with root package name */
    public static final String f82335l = o7.r.e("Processor");

    /* renamed from: b, reason: collision with root package name */
    public final Context f82337b;

    /* renamed from: c, reason: collision with root package name */
    public final o7.c f82338c;

    /* renamed from: d, reason: collision with root package name */
    public final a8.c f82339d;

    /* renamed from: e, reason: collision with root package name */
    public final WorkDatabase f82340e;

    /* renamed from: g, reason: collision with root package name */
    public final HashMap f82342g = new HashMap();

    /* renamed from: f, reason: collision with root package name */
    public final HashMap f82341f = new HashMap();

    /* renamed from: i, reason: collision with root package name */
    public final HashSet f82344i = new HashSet();

    /* renamed from: j, reason: collision with root package name */
    public final ArrayList f82345j = new ArrayList();

    /* renamed from: a, reason: collision with root package name */
    public PowerManager.WakeLock f82336a = null;

    /* renamed from: k, reason: collision with root package name */
    public final Object f82346k = new Object();

    /* renamed from: h, reason: collision with root package name */
    public final HashMap f82343h = new HashMap();

    public h(Context context, o7.c cVar, a8.c cVar2, WorkDatabase workDatabase) {
        this.f82337b = context;
        this.f82338c = cVar;
        this.f82339d = cVar2;
        this.f82340e = workDatabase;
    }

    public static boolean d(x xVar, int i5) {
        if (xVar == null) {
            o7.r.c().getClass();
            return false;
        }
        xVar.f82409r = i5;
        xVar.h();
        xVar.f82408q.cancel(true);
        if (xVar.f82398e == null || !(xVar.f82408q.f98296a instanceof z7.a)) {
            Objects.toString(xVar.f82397d);
            o7.r.c().getClass();
        } else {
            xVar.f82398e.stop(i5);
        }
        o7.r.c().getClass();
        return true;
    }

    public final void a(c cVar) {
        synchronized (this.f82346k) {
            this.f82345j.add(cVar);
        }
    }

    public final x b(String str) {
        x xVar = (x) this.f82341f.remove(str);
        boolean z11 = xVar != null;
        if (!z11) {
            xVar = (x) this.f82342g.remove(str);
        }
        this.f82343h.remove(str);
        if (z11) {
            synchronized (this.f82346k) {
                try {
                    if (this.f82341f.isEmpty()) {
                        try {
                            this.f82337b.startService(w7.b.e(this.f82337b));
                        } catch (Throwable th2) {
                            o7.r.c().b(f82335l, "Unable to stop foreground service", th2);
                        }
                        PowerManager.WakeLock wakeLock = this.f82336a;
                        if (wakeLock != null) {
                            wakeLock.release();
                            this.f82336a = null;
                        }
                    }
                } finally {
                }
            }
        }
        return xVar;
    }

    public final x c(String str) {
        x xVar = (x) this.f82341f.get(str);
        return xVar == null ? (x) this.f82342g.get(str) : xVar;
    }

    public final boolean e(String str) {
        boolean z11;
        synchronized (this.f82346k) {
            z11 = c(str) != null;
        }
        return z11;
    }

    public final void f(c cVar) {
        synchronized (this.f82346k) {
            this.f82345j.remove(cVar);
        }
    }

    public final void g(x7.i iVar) {
        this.f82339d.f461d.execute(new kz.c(19, this, iVar));
    }

    public final void h(String str, o7.i iVar) {
        synchronized (this.f82346k) {
            try {
                o7.r.c().d(f82335l, "Moving WorkSpec (" + str + ") to the foreground");
                x xVar = (x) this.f82342g.remove(str);
                if (xVar != null) {
                    if (this.f82336a == null) {
                        PowerManager.WakeLock wakeLockA = y7.p.a(this.f82337b, "ProcessorForegroundLck");
                        this.f82336a = wakeLockA;
                        wakeLockA.acquire();
                    }
                    this.f82341f.put(str, xVar);
                    e0.h0(this.f82337b, w7.b.d(this.f82337b, w.b.j(xVar.f82397d), iVar));
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final boolean i(m mVar, x7.u uVar) throws Throwable {
        Throwable th2;
        x7.i iVar = mVar.f82354a;
        final String str = iVar.f95141a;
        final ArrayList arrayList = new ArrayList();
        x7.q qVar = (x7.q) this.f82340e.runInTransaction(new Callable() { // from class: p7.f
            @Override // java.util.concurrent.Callable
            public final Object call() throws IOException {
                WorkDatabase workDatabase = this.f82329a.f82340e;
                x7.u uVarJ = workDatabase.j();
                String str2 = str;
                arrayList.addAll(uVarJ.o(str2));
                return workDatabase.i().l(str2);
            }
        });
        if (qVar == null) {
            o7.r.c().f(f82335l, "Didn't find WorkSpec for id " + iVar);
            g(iVar);
            return false;
        }
        synchronized (this.f82346k) {
            try {
                try {
                    try {
                        if (e(str)) {
                            Set set = (Set) this.f82343h.get(str);
                            if (((m) set.iterator().next()).f82354a.f95142b == iVar.f95142b) {
                                set.add(mVar);
                                o7.r rVarC = o7.r.c();
                                iVar.toString();
                                rVarC.getClass();
                            } else {
                                g(iVar);
                            }
                            return false;
                        }
                        if (qVar.f95188t != iVar.f95142b) {
                            g(iVar);
                            return false;
                        }
                        n7 n7Var = new n7(this.f82337b, this.f82338c, this.f82339d, this, this.f82340e, qVar, arrayList);
                        if (uVar != null) {
                            n7Var.f32171h = uVar;
                        }
                        final x xVar = new x(n7Var);
                        final z7.j jVar = xVar.f82407p;
                        jVar.b(new Runnable() { // from class: p7.g
                            @Override // java.lang.Runnable
                            public final void run() {
                                boolean zBooleanValue;
                                h hVar = this.f82332a;
                                ListenableFuture listenableFuture = jVar;
                                x xVar2 = xVar;
                                try {
                                    zBooleanValue = ((Boolean) listenableFuture.get()).booleanValue();
                                } catch (InterruptedException | ExecutionException unused) {
                                    zBooleanValue = true;
                                }
                                synchronized (hVar.f82346k) {
                                    try {
                                        x7.i iVarJ = w.b.j(xVar2.f82397d);
                                        String str2 = iVarJ.f95141a;
                                        if (hVar.c(str2) == xVar2) {
                                            hVar.b(str2);
                                        }
                                        o7.r.c().getClass();
                                        Iterator it = hVar.f82345j.iterator();
                                        while (it.hasNext()) {
                                            ((c) it.next()).c(iVarJ, zBooleanValue);
                                        }
                                    } catch (Throwable th3) {
                                        throw th3;
                                    }
                                }
                            }
                        }, this.f82339d.f461d);
                        this.f82342g.put(str, xVar);
                        HashSet hashSet = new HashSet();
                        hashSet.add(mVar);
                        this.f82343h.put(str, hashSet);
                        this.f82339d.f458a.execute(xVar);
                        o7.r rVarC2 = o7.r.c();
                        iVar.toString();
                        rVarC2.getClass();
                        return true;
                    } catch (Throwable th3) {
                        th2 = th3;
                        throw th2;
                    }
                } catch (Throwable th4) {
                    th = th4;
                    th2 = th;
                    throw th2;
                }
            } catch (Throwable th5) {
                th = th5;
            }
        }
    }
}
