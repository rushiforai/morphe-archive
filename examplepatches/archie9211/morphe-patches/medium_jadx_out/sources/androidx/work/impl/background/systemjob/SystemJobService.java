package androidx.work.impl.background.systemjob;

import android.app.Application;
import android.app.job.JobParameters;
import android.app.job.JobService;
import android.os.Build;
import android.os.Looper;
import android.os.PersistableBundle;
import androidx.emoji2.text.flatbuffer.aI.aJzfoQ;
import defpackage.ct2;
import defpackage.d87;
import defpackage.ev6;
import defpackage.h7f;
import defpackage.i2a;
import defpackage.io;
import defpackage.m7f;
import defpackage.mya;
import defpackage.o6;
import defpackage.t44;
import defpackage.unc;
import defpackage.uy;
import defpackage.vwa;
import defpackage.ygf;
import java.util.Arrays;
import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class SystemJobService extends JobService implements t44 {
    public static final String e = d87.k("SystemJobService");
    public m7f a;
    public final HashMap b = new HashMap();
    public final ct2 c = new ct2(5, false);
    public mya d;

    public static void a(String str) {
        if (Looper.getMainLooper().getThread() == Thread.currentThread()) {
            return;
        }
        ygf.f(ev6.x("Cannot invoke ", str, " on a background thread"));
    }

    public static h7f c(JobParameters jobParameters) {
        try {
            PersistableBundle extras = jobParameters.getExtras();
            if (extras == null || !extras.containsKey("EXTRA_WORK_SPEC_ID")) {
                return null;
            }
            return new h7f(extras.getString("EXTRA_WORK_SPEC_ID"), extras.getInt("EXTRA_WORK_SPEC_GENERATION"));
        } catch (NullPointerException unused) {
            return null;
        }
    }

    @Override // defpackage.t44
    public final void b(h7f h7fVar, boolean z) {
        a("onExecuted");
        d87.h().d(e, h7fVar.a + " executed on JobScheduler");
        JobParameters jobParameters = (JobParameters) this.b.remove(h7fVar);
        this.c.f(h7fVar);
        if (jobParameters != null) {
            jobFinished(jobParameters, z);
        }
    }

    @Override // android.app.Service
    public final void onDestroy() {
        super.onDestroy();
        m7f m7fVar = this.a;
        if (m7fVar != null) {
            m7fVar.f.g(this);
        }
    }

    @Override // android.app.job.JobService
    public final boolean onStartJob(JobParameters jobParameters) {
        vwa vwaVar;
        a("onStartJob");
        m7f m7fVar = this.a;
        String str = e;
        if (m7fVar == null) {
            d87.h().d(str, "WorkManager is not initialized; requesting retry.");
            jobFinished(jobParameters, true);
            return false;
        }
        h7f h7fVarC = c(jobParameters);
        if (h7fVarC == null) {
            d87.h().f(str, "WorkSpec id not found!");
            return false;
        }
        HashMap map = this.b;
        if (map.containsKey(h7fVarC)) {
            d87.h().d(str, "Job is already being executed by SystemJobService: " + h7fVarC);
            return false;
        }
        d87.h().d(str, "onStartJob for " + h7fVarC);
        map.put(h7fVarC, jobParameters);
        int i = Build.VERSION.SDK_INT;
        if (i >= 24) {
            vwaVar = new vwa(15);
            if (o6.l(jobParameters) != null) {
                vwaVar.c = Arrays.asList(o6.l(jobParameters));
            }
            if (o6.k(jobParameters) != null) {
                vwaVar.b = Arrays.asList(o6.k(jobParameters));
            }
            if (i >= 28) {
                vwaVar.d = uy.n(jobParameters);
            }
        } else {
            vwaVar = null;
        }
        this.d.H(this.c.h(h7fVarC), vwaVar);
        return true;
    }

    @Override // android.app.job.JobService
    public final boolean onStopJob(JobParameters jobParameters) {
        boolean zContains;
        a("onStopJob");
        if (this.a == null) {
            d87.h().d(e, "WorkManager is not initialized; requesting retry.");
            return true;
        }
        h7f h7fVarC = c(jobParameters);
        if (h7fVarC == null) {
            d87.h().f(e, "WorkSpec id not found!");
            return false;
        }
        d87.h().d(e, "onStopJob for " + h7fVarC);
        this.b.remove(h7fVarC);
        unc uncVarF = this.c.f(h7fVarC);
        if (uncVarF != null) {
            int iM = Build.VERSION.SDK_INT >= 31 ? io.m(jobParameters) : -512;
            mya myaVar = this.d;
            myaVar.getClass();
            myaVar.I(uncVarF, iM);
        }
        i2a i2aVar = this.a.f;
        String str = h7fVarC.a;
        synchronized (i2aVar.k) {
            zContains = i2aVar.i.contains(str);
        }
        return !zContains;
    }

    @Override // android.app.Service
    public final void onCreate() {
        super.onCreate();
        try {
            m7f m7fVarF = m7f.f(getApplicationContext());
            this.a = m7fVarF;
            i2a i2aVar = m7fVarF.f;
            this.d = new mya(i2aVar, m7fVarF.d);
            i2aVar.a(this);
        } catch (IllegalStateException e2) {
            if (Application.class.equals(getApplication().getClass())) {
                d87.h().l(e, aJzfoQ.FgOrr);
                return;
            }
            throw new IllegalStateException("WorkManager needs to be initialized via a ContentProvider#onCreate() or an Application#onCreate().", e2);
        }
    }
}
