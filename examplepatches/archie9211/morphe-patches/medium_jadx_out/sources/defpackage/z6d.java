package defpackage;

import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.ComponentName;
import android.content.Context;
import android.os.Build;
import android.os.PersistableBundle;
import androidx.work.impl.WorkDatabase;
import androidx.work.impl.background.systemjob.SystemJobService;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class z6d implements pqb {
    public static final String f = d87.k("SystemJobScheduler");
    public final Context a;
    public final JobScheduler b;
    public final y6d c;
    public final WorkDatabase d;
    public final r32 e;

    public z6d(Context context, WorkDatabase workDatabase, r32 r32Var) {
        JobScheduler jobSchedulerA = ya6.a(context);
        y6d y6dVar = new y6d(context, r32Var.d);
        this.a = context;
        this.b = jobSchedulerA;
        this.c = y6dVar;
        this.d = workDatabase;
        this.e = r32Var;
    }

    public static void a(JobScheduler jobScheduler, int i) {
        try {
            jobScheduler.cancel(i);
        } catch (Throwable th) {
            d87.h().g(f, String.format(Locale.getDefault(), "Exception while trying to cancel job (%d)", Integer.valueOf(i)), th);
        }
    }

    public static ArrayList b(Context context, JobScheduler jobScheduler, String str) {
        ArrayList<JobInfo> arrayListF = f(context, jobScheduler);
        if (arrayListF == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList(2);
        for (JobInfo jobInfo : arrayListF) {
            h7f h7fVarG = g(jobInfo);
            if (h7fVarG != null && str.equals(h7fVarG.a)) {
                arrayList.add(Integer.valueOf(jobInfo.getId()));
            }
        }
        return arrayList;
    }

    public static ArrayList f(Context context, JobScheduler jobScheduler) {
        List<JobInfo> allPendingJobs;
        String str = ya6.a;
        jobScheduler.getClass();
        try {
            allPendingJobs = jobScheduler.getAllPendingJobs();
            allPendingJobs.getClass();
        } catch (Throwable th) {
            d87.h().g(ya6.a, "getAllPendingJobs() is not reliable on this device.", th);
            allPendingJobs = null;
        }
        if (allPendingJobs == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList(allPendingJobs.size());
        ComponentName componentName = new ComponentName(context, (Class<?>) SystemJobService.class);
        for (JobInfo jobInfo : allPendingJobs) {
            if (componentName.equals(jobInfo.getService())) {
                arrayList.add(jobInfo);
            }
        }
        return arrayList;
    }

    public static h7f g(JobInfo jobInfo) {
        PersistableBundle extras = jobInfo.getExtras();
        if (extras == null) {
            return null;
        }
        try {
            if (!extras.containsKey("EXTRA_WORK_SPEC_ID")) {
                return null;
            }
            return new h7f(extras.getString("EXTRA_WORK_SPEC_ID"), extras.getInt("EXTRA_WORK_SPEC_GENERATION", 0));
        } catch (NullPointerException unused) {
            return null;
        }
    }

    @Override // defpackage.pqb
    public final boolean c() {
        return true;
    }

    @Override // defpackage.pqb
    public final void d(String str) {
        Context context = this.a;
        JobScheduler jobScheduler = this.b;
        ArrayList arrayListB = b(context, jobScheduler, str);
        if (arrayListB == null || arrayListB.isEmpty()) {
            return;
        }
        Iterator it2 = arrayListB.iterator();
        while (it2.hasNext()) {
            a(jobScheduler, ((Integer) it2.next()).intValue());
        }
        q6d q6dVarU = this.d.u();
        q6dVarU.getClass();
        str.getClass();
        n01.c0(q6dVarU.a, false, true, new nmc(str, 4));
    }

    @Override // defpackage.pqb
    public final void e(c8f... c8fVarArr) {
        int iIntValue;
        boolean z;
        ArrayList arrayListB;
        int iIntValue2;
        WorkDatabase workDatabase = this.d;
        pkf pkfVar = new pkf(workDatabase);
        WorkDatabase workDatabase2 = (WorkDatabase) pkfVar.a;
        int length = c8fVarArr.length;
        boolean z2 = false;
        int i = 0;
        while (i < length) {
            c8f c8fVar = c8fVarArr[i];
            workDatabase.b();
            try {
                g8f g8fVarX = workDatabase.x();
                String str = c8fVar.a;
                c8f c8fVarE = g8fVarX.e(str);
                String str2 = f;
                if (c8fVarE == null) {
                    d87.h().l(str2, "Skipping scheduling " + str + " because it's no longer in the DB");
                    workDatabase.q();
                } else if (c8fVarE.b != j7f.ENQUEUED) {
                    d87.h().l(str2, "Skipping scheduling " + str + " because it is no longer enqueued");
                    workDatabase.q();
                } else {
                    h7f h7fVarW = il7.w(c8fVar);
                    int i2 = h7fVarW.b;
                    String str3 = h7fVarW.a;
                    q6d q6dVarU = workDatabase.u();
                    q6dVarU.getClass();
                    str3.getClass();
                    int i3 = 1;
                    p6d p6dVar = (p6d) n01.c0(q6dVarU.a, true, z2, new ne(str3, i2, 5));
                    if (p6dVar != null) {
                        iIntValue = p6dVar.c;
                    } else {
                        Object objP = workDatabase2.p(new i5b(9, new lc2(i3, pkfVar)));
                        objP.getClass();
                        iIntValue = ((Number) objP).intValue();
                    }
                    if (p6dVar == null) {
                        p6d p6dVar2 = new p6d(str3, i2, iIntValue);
                        q6d q6dVarU2 = workDatabase.u();
                        q6dVarU2.getClass();
                        n01.c0(q6dVarU2.a, false, true, new pda(q6dVarU2, 19, p6dVar2));
                    }
                    h(c8fVar, iIntValue);
                    if (Build.VERSION.SDK_INT != 23 || (arrayListB = b(this.a, this.b, str)) == null) {
                        z = false;
                    } else {
                        int iIndexOf = arrayListB.indexOf(Integer.valueOf(iIntValue));
                        if (iIndexOf >= 0) {
                            arrayListB.remove(iIndexOf);
                        }
                        if (arrayListB.isEmpty()) {
                            z = false;
                            Object objP2 = workDatabase2.p(new i5b(9, new lc2(i3, pkfVar)));
                            objP2.getClass();
                            iIntValue2 = ((Number) objP2).intValue();
                        } else {
                            z = false;
                            iIntValue2 = ((Integer) arrayListB.get(0)).intValue();
                        }
                        h(c8fVar, iIntValue2);
                    }
                    workDatabase.q();
                    i++;
                    z2 = z;
                }
                workDatabase.m();
                z = z2;
                i++;
                z2 = z;
            } finally {
                workDatabase.m();
            }
        }
    }

    public final void h(c8f c8fVar, int i) throws IOException {
        List<JobInfo> allPendingJobs;
        String str;
        JobInfo jobInfoA = this.c.a(c8fVar, i);
        d87 d87VarH = d87.h();
        StringBuilder sb = new StringBuilder("Scheduling work ID ");
        String str2 = c8fVar.a;
        sb.append(str2);
        sb.append("Job ID ");
        sb.append(i);
        String string = sb.toString();
        String str3 = f;
        d87VarH.d(str3, string);
        try {
            if (this.b.schedule(jobInfoA) == 0) {
                d87.h().l(str3, "Unable to schedule work ID " + str2);
                if (c8fVar.q && c8fVar.r == lw8.RUN_AS_NON_EXPEDITED_WORK_REQUEST) {
                    c8fVar.q = false;
                    d87.h().d(str3, "Scheduling a non-expedited job (work ID " + str2 + ")");
                    h(c8fVar, i);
                }
            }
        } catch (IllegalStateException e) {
            String str4 = ya6.a;
            int i2 = Build.VERSION.SDK_INT;
            int i3 = i2 >= 31 ? 150 : 100;
            int size = ((List) n01.c0(this.d.x().a, true, false, new sqe(26))).size();
            Context context = this.a;
            String strF0 = "<faulty JobScheduler failed to getPendingJobs>";
            if (i2 >= 34) {
                JobScheduler jobSchedulerA = ya6.a(context);
                String str5 = null;
                try {
                    allPendingJobs = jobSchedulerA.getAllPendingJobs();
                    allPendingJobs.getClass();
                } catch (Throwable th) {
                    d87.h().g(ya6.a, "getAllPendingJobs() is not reliable on this device.", th);
                    allPendingJobs = null;
                }
                if (allPendingJobs != null) {
                    ArrayList arrayListF = f(context, jobSchedulerA);
                    int size2 = arrayListF != null ? allPendingJobs.size() - arrayListF.size() : 0;
                    if (size2 == 0) {
                        str = null;
                    } else {
                        str = size2 + " of which are not owned by WorkManager";
                    }
                    Object systemService = context.getSystemService("jobscheduler");
                    systemService.getClass();
                    ArrayList arrayListF2 = f(context, (JobScheduler) systemService);
                    int size3 = arrayListF2 != null ? arrayListF2.size() : 0;
                    if (size3 != 0) {
                        str5 = size3 + " from WorkManager in the default namespace";
                    }
                    strF0 = bu1.F0(k80.s0(new String[]{allPendingJobs.size() + " jobs in \"androidx.work.systemjobscheduler\" namespace", str, str5}), ",\n", null, null, null, 62);
                }
            } else {
                ArrayList arrayListF3 = f(context, ya6.a(context));
                if (arrayListF3 != null) {
                    strF0 = arrayListF3.size() + " jobs from WorkManager";
                }
            }
            StringBuilder sb2 = new StringBuilder("JobScheduler ");
            sb2.append(i3);
            sb2.append(" job limit exceeded.\nIn JobScheduler there are ");
            sb2.append(strF0);
            sb2.append(".\nThere are ");
            sb2.append(size);
            sb2.append(" jobs tracked by WorkManager's database;\nthe Configuration limit is ");
            String strA = km4.A(sb2, this.e.g, '.');
            d87.h().f(str3, strA);
            throw new IllegalStateException(strA, e);
        } catch (Throwable th2) {
            d87.h().g(str3, "Unable to schedule " + c8fVar, th2);
        }
    }
}
