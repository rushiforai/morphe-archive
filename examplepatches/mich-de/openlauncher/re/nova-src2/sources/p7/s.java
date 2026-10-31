package p7;

import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.BroadcastReceiver;
import android.content.Context;
import androidx.work.impl.WorkDatabase;
import androidx.work.impl.WorkDatabase_Impl;
import com.google.android.gms.internal.measurement.v6;
import com.teslacoilsw.launcher.NovaApplication;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import kl.q0;
import o7.d0;

/* loaded from: classes.dex */
public final class s extends d0 {

    /* renamed from: k, reason: collision with root package name */
    public static s f82369k;

    /* renamed from: l, reason: collision with root package name */
    public static s f82370l;

    /* renamed from: m, reason: collision with root package name */
    public static final Object f82371m;

    /* renamed from: a, reason: collision with root package name */
    public final Context f82372a;

    /* renamed from: b, reason: collision with root package name */
    public final o7.c f82373b;

    /* renamed from: c, reason: collision with root package name */
    public final WorkDatabase f82374c;

    /* renamed from: d, reason: collision with root package name */
    public final a8.a f82375d;

    /* renamed from: e, reason: collision with root package name */
    public final List f82376e;

    /* renamed from: f, reason: collision with root package name */
    public final h f82377f;

    /* renamed from: g, reason: collision with root package name */
    public final v6 f82378g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f82379h = false;

    /* renamed from: i, reason: collision with root package name */
    public BroadcastReceiver.PendingResult f82380i;

    /* renamed from: j, reason: collision with root package name */
    public final v7.j f82381j;

    static {
        o7.r.e("WorkManagerImpl");
        f82369k = null;
        f82370l = null;
        f82371m = new Object();
    }

    public s(Context context, final o7.c cVar, a8.a aVar, final WorkDatabase workDatabase, final List list, h hVar, v7.j jVar) {
        Context applicationContext = context.getApplicationContext();
        if (r.a(applicationContext)) {
            throw new IllegalStateException("Cannot initialize WorkManager in direct boot mode");
        }
        o7.r rVar = new o7.r(cVar.f79628g);
        synchronized (o7.r.f79679b) {
            o7.r.f79680c = rVar;
        }
        this.f82372a = applicationContext;
        this.f82375d = aVar;
        this.f82374c = workDatabase;
        this.f82377f = hVar;
        this.f82381j = jVar;
        this.f82373b = cVar;
        this.f82376e = list;
        this.f82378g = new v6(workDatabase, 25);
        final androidx.room.x xVar = ((a8.c) aVar).f458a;
        int i5 = l.f82353a;
        hVar.a(new c() { // from class: p7.k
            @Override // p7.c
            public final void c(x7.i iVar, boolean z11) {
                xVar.execute(new c40.e(list, iVar, cVar, workDatabase, 5));
            }
        });
        aVar.a(new y7.g(applicationContext, this));
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static s c(Context context) {
        s sVarC;
        Object obj = f82371m;
        synchronized (obj) {
            try {
                synchronized (obj) {
                    sVarC = f82369k;
                    if (sVarC == null) {
                        sVarC = f82370l;
                    }
                }
                return sVarC;
            } catch (Throwable th2) {
                throw th2;
            } finally {
            }
        }
        if (sVarC == null) {
            Context applicationContext = context.getApplicationContext();
            if (!(applicationContext instanceof o7.b)) {
                throw new IllegalStateException("WorkManager is not initialized properly.  You have explicitly disabled WorkManagerInitializer in your manifest, have not manually called WorkManager#initialize at this point, and your Application does not implement Configuration.Provider.");
            }
            ((NovaApplication) ((o7.b) applicationContext)).getClass();
            d(applicationContext, new o7.c(new o7.a(0)));
            sVarC = c(applicationContext);
        }
        return sVarC;
    }

    public static void d(Context context, o7.c cVar) {
        synchronized (f82371m) {
            try {
                s sVar = f82369k;
                if (sVar != null && f82370l != null) {
                    throw new IllegalStateException("WorkManager is already initialized.  Did you try to initialize it manually without disabling WorkManagerInitializer? See WorkManager#initialize(Context, Configuration) or the class level Javadoc for more information.");
                }
                if (sVar == null) {
                    Context applicationContext = context.getApplicationContext();
                    if (f82370l == null) {
                        f82370l = u.L(applicationContext, cVar);
                    }
                    f82369k = f82370l;
                }
            } finally {
            }
        }
    }

    public final q0 b(String str) {
        y7.c cVarB = y7.d.b(str, this, true);
        this.f82375d.a(cVarB);
        return cVarB.d();
    }

    public final void e() {
        synchronized (f82371m) {
            try {
                this.f82379h = true;
                BroadcastReceiver.PendingResult pendingResult = this.f82380i;
                if (pendingResult != null) {
                    pendingResult.finish();
                    this.f82380i = null;
                }
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    public final void f() {
        ArrayList arrayListC;
        String str = s7.b.f86700f;
        Context context = this.f82372a;
        JobScheduler jobScheduler = (JobScheduler) context.getSystemService("jobscheduler");
        if (jobScheduler != null && (arrayListC = s7.b.c(context, jobScheduler)) != null && !arrayListC.isEmpty()) {
            Iterator it = arrayListC.iterator();
            while (it.hasNext()) {
                s7.b.a(jobScheduler, ((JobInfo) it.next()).getId());
            }
        }
        WorkDatabase workDatabase = this.f82374c;
        x7.s sVarI = workDatabase.i();
        WorkDatabase_Impl workDatabase_Impl = sVarI.f95193a;
        workDatabase_Impl.assertNotSuspendingTransaction();
        x7.r rVar = sVarI.n;
        d7.g gVarAcquire = rVar.acquire();
        workDatabase_Impl.beginTransaction();
        try {
            gVarAcquire.executeUpdateDelete();
            workDatabase_Impl.setTransactionSuccessful();
            workDatabase_Impl.endTransaction();
            rVar.release(gVarAcquire);
            l.b(this.f82373b, workDatabase, this.f82376e);
        } catch (Throwable th2) {
            workDatabase_Impl.endTransaction();
            rVar.release(gVarAcquire);
            throw th2;
        }
    }
}
