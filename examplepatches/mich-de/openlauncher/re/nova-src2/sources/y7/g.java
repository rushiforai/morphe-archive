package y7;

import android.app.ActivityManager;
import android.app.AlarmManager;
import android.app.ApplicationExitInfo;
import android.app.PendingIntent;
import android.app.job.JobInfo;
import android.app.job.JobScheduler;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.database.sqlite.SQLiteAccessPermException;
import android.database.sqlite.SQLiteCantOpenDatabaseException;
import android.database.sqlite.SQLiteConstraintException;
import android.database.sqlite.SQLiteDatabaseCorruptException;
import android.database.sqlite.SQLiteDatabaseLockedException;
import android.database.sqlite.SQLiteDiskIOException;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteTableLockedException;
import android.os.Build;
import android.text.TextUtils;
import android.util.Log;
import androidx.work.impl.WorkDatabase;
import androidx.work.impl.WorkDatabase_Impl;
import androidx.work.impl.utils.ForceStopRunnable$BroadcastReceiver;
import com.google.android.gms.internal.measurement.v6;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.TimeUnit;

/* loaded from: classes.dex */
public final class g implements Runnable {

    /* renamed from: e, reason: collision with root package name */
    public static final String f96745e = o7.r.e("ForceStopRunnable");

    /* renamed from: f, reason: collision with root package name */
    public static final long f96746f = TimeUnit.DAYS.toMillis(3650);

    /* renamed from: a, reason: collision with root package name */
    public final Context f96747a;

    /* renamed from: b, reason: collision with root package name */
    public final p7.s f96748b;

    /* renamed from: c, reason: collision with root package name */
    public final v6 f96749c;

    /* renamed from: d, reason: collision with root package name */
    public int f96750d = 0;

    public g(Context context, p7.s sVar) {
        this.f96747a = context.getApplicationContext();
        this.f96748b = sVar;
        this.f96749c = sVar.f82378g;
    }

    public static void b(Context context) {
        AlarmManager alarmManager = (AlarmManager) context.getSystemService("alarm");
        int i5 = Build.VERSION.SDK_INT >= 31 ? 167772160 : 134217728;
        Intent intent = new Intent();
        intent.setComponent(new ComponentName(context, (Class<?>) ForceStopRunnable$BroadcastReceiver.class));
        intent.setAction("ACTION_FORCE_STOP_RESCHEDULE");
        PendingIntent broadcast = PendingIntent.getBroadcast(context, -1, intent, i5);
        long jCurrentTimeMillis = System.currentTimeMillis() + f96746f;
        if (alarmManager != null) {
            alarmManager.setExact(0, jCurrentTimeMillis, broadcast);
        }
    }

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Removed duplicated region for block: B:104:0x0213  */
    /* JADX WARN: Removed duplicated region for block: B:108:0x0229  */
    /* JADX WARN: Removed duplicated region for block: B:144:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void a() throws IOException {
        boolean z11;
        boolean z12;
        int i5;
        PendingIntent broadcast;
        v6 v6Var = this.f96749c;
        p7.s sVar = this.f96748b;
        WorkDatabase workDatabase = sVar.f82374c;
        o7.c cVar = sVar.f82373b;
        v6 v6Var2 = sVar.f82378g;
        workDatabase = sVar.f82374c;
        String str = s7.b.f86700f;
        Context context = this.f96747a;
        JobScheduler jobScheduler = (JobScheduler) context.getSystemService("jobscheduler");
        ArrayList arrayListC = s7.b.c(context, jobScheduler);
        x7.h hVarF = workDatabase.f();
        hVarF.getClass();
        androidx.room.t tVarC = androidx.room.t.c(0, "SELECT DISTINCT work_spec_id FROM SystemIdInfo");
        WorkDatabase_Impl workDatabase_Impl = (WorkDatabase_Impl) hVarF.f95137b;
        workDatabase_Impl.assertNotSuspendingTransaction();
        Cursor cursorL = vm.d.l(workDatabase_Impl, tVarC, false);
        try {
            ArrayList arrayList = new ArrayList(cursorL.getCount());
            while (cursorL.moveToNext()) {
                arrayList.add(cursorL.isNull(0) ? null : cursorL.getString(0));
            }
            HashSet hashSet = new HashSet(arrayListC != null ? arrayListC.size() : 0);
            if (arrayListC != null && !arrayListC.isEmpty()) {
                Iterator it = arrayListC.iterator();
                while (it.hasNext()) {
                    JobInfo jobInfo = (JobInfo) it.next();
                    x7.i iVarF = s7.b.f(jobInfo);
                    if (iVarF != null) {
                        hashSet.add(iVarF.f95141a);
                    } else {
                        s7.b.a(jobScheduler, jobInfo.getId());
                    }
                }
            }
            Iterator it2 = arrayList.iterator();
            while (true) {
                z11 = true;
                if (it2.hasNext()) {
                    if (!hashSet.contains((String) it2.next())) {
                        o7.r.c().getClass();
                        z12 = true;
                        break;
                    }
                } else {
                    z12 = false;
                    break;
                }
            }
            if (z12) {
                workDatabase.beginTransaction();
                try {
                    x7.s sVarI = workDatabase.i();
                    Iterator it3 = arrayList.iterator();
                    while (it3.hasNext()) {
                        sVarI.n(-1L, (String) it3.next());
                    }
                    workDatabase.setTransactionSuccessful();
                    workDatabase.endTransaction();
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            x7.s sVarI2 = workDatabase.i();
            x7.n nVarH = workDatabase.h();
            workDatabase.beginTransaction();
            try {
                ArrayList arrayListG = sVarI2.g();
                boolean zIsEmpty = arrayListG.isEmpty();
                if (!zIsEmpty) {
                    for (Iterator it4 = arrayListG.iterator(); it4.hasNext(); it4 = it4) {
                        String str2 = ((x7.q) it4.next()).f95171a;
                        sVarI2.r(1, str2);
                        sVarI2.s(-512, str2);
                        sVarI2.n(-1L, str2);
                    }
                }
                WorkDatabase_Impl workDatabase_Impl2 = (WorkDatabase_Impl) nVarH.f95149a;
                workDatabase_Impl2.assertNotSuspendingTransaction();
                qp.h hVar = (qp.h) nVarH.f95152d;
                d7.g gVarAcquire = hVar.acquire();
                workDatabase_Impl2.beginTransaction();
                try {
                    gVarAcquire.executeUpdateDelete();
                    workDatabase_Impl2.setTransactionSuccessful();
                    workDatabase_Impl2.endTransaction();
                    hVar.release(gVarAcquire);
                    workDatabase.setTransactionSuccessful();
                    workDatabase.endTransaction();
                    if (zIsEmpty && !z12) {
                        z11 = false;
                    }
                    Long lV = ((WorkDatabase) v6Var2.f33136b).e().v("reschedule_needed");
                    if (lV != null && lV.longValue() == 1) {
                        o7.r.c().getClass();
                        sVar.f();
                        v6Var2.getClass();
                        ((WorkDatabase) v6Var2.f33136b).e().x(new x7.d("reschedule_needed", 0L));
                        return;
                    }
                    try {
                        i5 = Build.VERSION.SDK_INT;
                        int i11 = i5 >= 31 ? 570425344 : SQLiteDatabase.ENABLE_WRITE_AHEAD_LOGGING;
                        Intent intent = new Intent();
                        intent.setComponent(new ComponentName(context, (Class<?>) ForceStopRunnable$BroadcastReceiver.class));
                        intent.setAction("ACTION_FORCE_STOP_RESCHEDULE");
                        broadcast = PendingIntent.getBroadcast(context, -1, intent, i11);
                    } catch (IllegalArgumentException e3) {
                        e = e3;
                        if (o7.r.c().f79681a <= 5) {
                            Log.w(f96745e, "Ignoring exception", e);
                        }
                        o7.r.c().getClass();
                        sVar.f();
                        cVar.f79624c.getClass();
                        long jR = br.a.r();
                        v6Var.getClass();
                        ((WorkDatabase) v6Var.f33136b).e().x(new x7.d("last_force_stop_ms", Long.valueOf(jR)));
                        return;
                    } catch (SecurityException e11) {
                        e = e11;
                        if (o7.r.c().f79681a <= 5) {
                        }
                        o7.r.c().getClass();
                        sVar.f();
                        cVar.f79624c.getClass();
                        long jR2 = br.a.r();
                        v6Var.getClass();
                        ((WorkDatabase) v6Var.f33136b).e().x(new x7.d("last_force_stop_ms", Long.valueOf(jR2)));
                        return;
                    }
                    if (i5 >= 30) {
                        if (broadcast != null) {
                            broadcast.cancel();
                        }
                        List historicalProcessExitReasons = ((ActivityManager) context.getSystemService("activity")).getHistoricalProcessExitReasons(null, 0, 0);
                        if (historicalProcessExitReasons != null && !historicalProcessExitReasons.isEmpty()) {
                            Long lV2 = ((WorkDatabase) v6Var.f33136b).e().v("last_force_stop_ms");
                            long jLongValue = lV2 != null ? lV2.longValue() : 0L;
                            for (int i12 = 0; i12 < historicalProcessExitReasons.size(); i12++) {
                                ApplicationExitInfo applicationExitInfoC = b.s.c(historicalProcessExitReasons.get(i12));
                                if (applicationExitInfoC.getReason() == 10 && applicationExitInfoC.getTimestamp() >= jLongValue) {
                                    o7.r.c().getClass();
                                    sVar.f();
                                    cVar.f79624c.getClass();
                                    long jR22 = br.a.r();
                                    v6Var.getClass();
                                    ((WorkDatabase) v6Var.f33136b).e().x(new x7.d("last_force_stop_ms", Long.valueOf(jR22)));
                                    return;
                                }
                            }
                        }
                        if (z11) {
                            return;
                        }
                        o7.r.c().getClass();
                        p7.l.b(cVar, workDatabase, sVar.f82376e);
                        return;
                    }
                    if (broadcast == null) {
                        b(context);
                        o7.r.c().getClass();
                        sVar.f();
                        cVar.f79624c.getClass();
                        long jR222 = br.a.r();
                        v6Var.getClass();
                        ((WorkDatabase) v6Var.f33136b).e().x(new x7.d("last_force_stop_ms", Long.valueOf(jR222)));
                        return;
                    }
                    if (z11) {
                    }
                } catch (Throwable th3) {
                    workDatabase_Impl2.endTransaction();
                    hVar.release(gVarAcquire);
                    throw th3;
                }
            } finally {
                workDatabase.endTransaction();
            }
        } finally {
            cursorL.close();
            tVarC.d();
        }
    }

    @Override // java.lang.Runnable
    public final void run() {
        boolean zA;
        String str = f96745e;
        p7.s sVar = this.f96748b;
        try {
            o7.c cVar = sVar.f82373b;
            cVar.getClass();
            boolean zIsEmpty = TextUtils.isEmpty(null);
            Context context = this.f96747a;
            if (zIsEmpty) {
                o7.r.c().getClass();
                zA = true;
            } else {
                zA = m.a(context, cVar);
                o7.r.c().getClass();
            }
            if (!zA) {
                return;
            }
            while (true) {
                try {
                    u90.b.T(context);
                    o7.r.c().getClass();
                    try {
                        a();
                        return;
                    } catch (SQLiteAccessPermException | SQLiteCantOpenDatabaseException | SQLiteConstraintException | SQLiteDatabaseCorruptException | SQLiteDatabaseLockedException | SQLiteDiskIOException | SQLiteTableLockedException e3) {
                        int i5 = this.f96750d + 1;
                        this.f96750d = i5;
                        if (i5 >= 3) {
                            String str2 = w20.h.l(context) ? "The file system on the device is in a bad state. WorkManager cannot access the app's internal data store." : "WorkManager can't be accessed from direct boot, because credential encrypted storage isn't accessible.\nDon't access or initialise WorkManager from directAware components. See https://developer.android.com/training/articles/direct-boot";
                            o7.r.c().b(str, str2, e3);
                            IllegalStateException illegalStateException = new IllegalStateException(str2, e3);
                            sVar.f82373b.getClass();
                            throw illegalStateException;
                        }
                        o7.r.c().getClass();
                        try {
                            Thread.sleep(this.f96750d * 300);
                        } catch (InterruptedException unused) {
                        }
                    }
                } catch (SQLiteException e11) {
                    o7.r.c().a(str, "Unexpected SQLite exception during migrations");
                    IllegalStateException illegalStateException2 = new IllegalStateException("Unexpected SQLite exception during migrations", e11);
                    sVar.f82373b.getClass();
                    throw illegalStateException2;
                }
            }
        } finally {
            sVar.e();
        }
    }
}
