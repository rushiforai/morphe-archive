package com.google.android.datatransport.runtime.scheduling.jobscheduling;

import android.app.job.JobParameters;
import android.app.job.JobService;
import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.util.Base64;
import com.google.android.datatransport.runtime.synchronization.SynchronizationException;
import defpackage.c1a;
import defpackage.fi2;
import defpackage.kk0;
import defpackage.m50;
import defpackage.psd;
import defpackage.sj0;
import j$.util.Objects;
import java.util.concurrent.Executor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class JobInfoSchedulerService extends JobService {
    public static final /* synthetic */ int a = 0;

    @Override // android.app.job.JobService
    public final boolean onStartJob(JobParameters jobParameters) {
        String string = jobParameters.getExtras().getString("backendName");
        String string2 = jobParameters.getExtras().getString("extras");
        int i = jobParameters.getExtras().getInt("priority");
        final int i2 = jobParameters.getExtras().getInt("attemptNumber");
        psd.b(getApplicationContext());
        m50 m50VarA = kk0.a();
        m50VarA.L(string);
        m50VarA.d = c1a.b(i);
        if (string2 != null) {
            m50VarA.c = Base64.decode(string2, 0);
        }
        final sj0 sj0Var = psd.a().d;
        final kk0 kk0VarK = m50VarA.k();
        final fi2 fi2Var = new fi2(this, 16, jobParameters);
        ((Executor) sj0Var.e).execute(new Runnable() { // from class: o6e
            @Override // java.lang.Runnable
            public final void run() {
                final kk0 kk0Var = kk0VarK;
                final int i3 = i2;
                Runnable runnable = fi2Var;
                final sj0 sj0Var2 = sj0Var;
                fnb fnbVar = (fnb) sj0Var2.f;
                int i4 = 1;
                try {
                    try {
                        fnb fnbVar2 = (fnb) sj0Var2.c;
                        Objects.requireNonNull(fnbVar2);
                        fnbVar.I(new p6e(fnbVar2, i4));
                        NetworkInfo activeNetworkInfo = ((ConnectivityManager) ((Context) sj0Var2.a).getSystemService("connectivity")).getActiveNetworkInfo();
                        if (activeNetworkInfo == null || !activeNetworkInfo.isConnected()) {
                            fnbVar.I(new v5d() { // from class: q6e
                                @Override // defpackage.v5d
                                public final Object c() {
                                    ((ku3) sj0Var2.d).I(kk0Var, i3 + 1, false);
                                    return null;
                                }
                            });
                        } else {
                            sj0Var2.c(kk0Var, i3);
                        }
                        runnable.run();
                    } catch (SynchronizationException unused) {
                        ((ku3) sj0Var2.d).I(kk0Var, i3 + 1, false);
                        runnable.run();
                    }
                } catch (Throwable th) {
                    runnable.run();
                    throw th;
                }
            }
        });
        return true;
    }

    @Override // android.app.job.JobService
    public final boolean onStopJob(JobParameters jobParameters) {
        return true;
    }
}
