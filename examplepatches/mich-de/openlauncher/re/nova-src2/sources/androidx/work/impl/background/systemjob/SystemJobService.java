package androidx.work.impl.background.systemjob;

import android.app.Application;
import android.app.job.JobParameters;
import android.app.job.JobService;
import android.os.Build;
import android.os.PersistableBundle;
import java.util.Arrays;
import java.util.HashMap;
import nx.l;
import o7.r;
import p7.c;
import p7.h;
import p7.m;
import p7.s;
import s7.d;
import s7.e;
import x7.i;
import x7.u;

/* loaded from: classes.dex */
public class SystemJobService extends JobService implements c {

    /* renamed from: e, reason: collision with root package name */
    public static final String f15341e = r.e("SystemJobService");

    /* renamed from: a, reason: collision with root package name */
    public s f15342a;

    /* renamed from: b, reason: collision with root package name */
    public final HashMap f15343b = new HashMap();

    /* renamed from: c, reason: collision with root package name */
    public final x7.c f15344c = new x7.c(6);

    /* renamed from: d, reason: collision with root package name */
    public l f15345d;

    public static i a(JobParameters jobParameters) {
        try {
            PersistableBundle extras = jobParameters.getExtras();
            if (extras == null || !extras.containsKey("EXTRA_WORK_SPEC_ID")) {
                return null;
            }
            return new i(extras.getString("EXTRA_WORK_SPEC_ID"), extras.getInt("EXTRA_WORK_SPEC_GENERATION"));
        } catch (NullPointerException unused) {
            return null;
        }
    }

    @Override // p7.c
    public final void c(i iVar, boolean z11) {
        JobParameters jobParameters;
        r.c().getClass();
        synchronized (this.f15343b) {
            jobParameters = (JobParameters) this.f15343b.remove(iVar);
        }
        this.f15344c.k(iVar);
        if (jobParameters != null) {
            jobFinished(jobParameters, z11);
        }
    }

    @Override // android.app.Service
    public final void onCreate() {
        super.onCreate();
        try {
            s sVarC = s.c(getApplicationContext());
            this.f15342a = sVarC;
            h hVar = sVarC.f82377f;
            this.f15345d = new l(hVar, sVarC.f82375d);
            hVar.a(this);
        } catch (IllegalStateException e3) {
            if (!Application.class.equals(getApplication().getClass())) {
                throw new IllegalStateException("WorkManager needs to be initialized via a ContentProvider#onCreate() or an Application#onCreate().", e3);
            }
            r.c().f(f15341e, "Could not find WorkManager instance; this may be because an auto-backup is in progress. Ignoring JobScheduler commands for now. Please make sure that you are initializing WorkManager if you have manually disabled WorkManagerInitializer.");
        }
    }

    @Override // android.app.Service
    public final void onDestroy() {
        super.onDestroy();
        s sVar = this.f15342a;
        if (sVar != null) {
            sVar.f82377f.f(this);
        }
    }

    @Override // android.app.job.JobService
    public final boolean onStartJob(JobParameters jobParameters) {
        if (this.f15342a == null) {
            r.c().getClass();
            jobFinished(jobParameters, true);
            return false;
        }
        i iVarA = a(jobParameters);
        if (iVarA == null) {
            r.c().a(f15341e, "WorkSpec id not found!");
            return false;
        }
        synchronized (this.f15343b) {
            try {
                if (this.f15343b.containsKey(iVarA)) {
                    r rVarC = r.c();
                    iVarA.toString();
                    rVarC.getClass();
                    return false;
                }
                r rVarC2 = r.c();
                iVarA.toString();
                rVarC2.getClass();
                this.f15343b.put(iVarA, jobParameters);
                int i5 = Build.VERSION.SDK_INT;
                u uVar = new u(6);
                if (s7.c.b(jobParameters) != null) {
                    uVar.f95209b = Arrays.asList(s7.c.b(jobParameters));
                }
                if (s7.c.a(jobParameters) != null) {
                    uVar.f95208a = Arrays.asList(s7.c.a(jobParameters));
                }
                if (i5 >= 28) {
                    uVar.f95210c = d.a(jobParameters);
                }
                this.f15345d.m(this.f15344c.l(iVarA), uVar);
                return true;
            } catch (Throwable th2) {
                throw th2;
            }
        }
    }

    @Override // android.app.job.JobService
    public final boolean onStopJob(JobParameters jobParameters) {
        boolean zContains;
        if (this.f15342a == null) {
            r.c().getClass();
            return true;
        }
        i iVarA = a(jobParameters);
        if (iVarA == null) {
            r.c().a(f15341e, "WorkSpec id not found!");
            return false;
        }
        r rVarC = r.c();
        iVarA.toString();
        rVarC.getClass();
        synchronized (this.f15343b) {
            this.f15343b.remove(iVarA);
        }
        m mVarK = this.f15344c.k(iVarA);
        if (mVarK != null) {
            this.f15345d.p(mVarK, Build.VERSION.SDK_INT >= 31 ? e.a(jobParameters) : -512);
        }
        h hVar = this.f15342a.f82377f;
        String str = iVarA.f95141a;
        synchronized (hVar.f82346k) {
            zContains = hVar.f82344i.contains(str);
        }
        return !zContains;
    }
}
