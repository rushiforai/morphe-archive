package defpackage;

import android.app.AlarmManager;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.database.sqlite.SQLiteAccessPermException;
import android.database.sqlite.SQLiteCantOpenDatabaseException;
import android.database.sqlite.SQLiteConstraintException;
import android.database.sqlite.SQLiteDatabaseCorruptException;
import android.database.sqlite.SQLiteDatabaseLockedException;
import android.database.sqlite.SQLiteDiskIOException;
import android.database.sqlite.SQLiteException;
import android.database.sqlite.SQLiteFullException;
import android.database.sqlite.SQLiteTableLockedException;
import android.os.Build;
import android.text.TextUtils;
import androidx.work.impl.utils.ForceStopRunnable$BroadcastReceiver;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class j05 implements Runnable {
    public static final String e = d87.k("ForceStopRunnable");
    public static final long f = 315360000000L;
    public final Context a;
    public final m7f b;
    public final my6 c;
    public int d = 0;

    public j05(Context context, m7f m7fVar) {
        this.a = context.getApplicationContext();
        this.b = m7fVar;
        this.c = m7fVar.g;
    }

    public static void c(Context context) {
        AlarmManager alarmManager = (AlarmManager) context.getSystemService("alarm");
        int i = Build.VERSION.SDK_INT >= 31 ? 167772160 : 134217728;
        Intent intent = new Intent();
        intent.setComponent(new ComponentName(context, (Class<?>) ForceStopRunnable$BroadcastReceiver.class));
        intent.setAction("ACTION_FORCE_STOP_RESCHEDULE");
        PendingIntent broadcast = PendingIntent.getBroadcast(context, -1, intent, i);
        long jCurrentTimeMillis = System.currentTimeMillis() + f;
        if (alarmManager != null) {
            alarmManager.setExact(0, jCurrentTimeMillis, broadcast);
        }
    }

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Removed duplicated region for block: B:101:0x020a  */
    /* JADX WARN: Removed duplicated region for block: B:126:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:97:0x01f2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void a() {
        /*
            Method dump skipped, instruction units count: 582
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.j05.a():void");
    }

    public final boolean b() {
        r32 r32Var = this.b.b;
        r32Var.getClass();
        boolean zIsEmpty = TextUtils.isEmpty(null);
        String str = e;
        if (zIsEmpty) {
            d87.h().d(str, "The default process name was not specified.");
            return true;
        }
        boolean zA = h2a.a(this.a, r32Var);
        d87.h().d(str, "Is default app process = " + zA);
        return zA;
    }

    @Override // java.lang.Runnable
    public final void run() {
        Context context = this.a;
        String str = e;
        m7f m7fVar = this.b;
        r32 r32Var = m7fVar.b;
        try {
            if (!b()) {
                return;
            }
            while (true) {
                try {
                    ok7.G(context);
                    d87.h().d(str, "Performing cleanup operations.");
                    try {
                        a();
                        return;
                    } catch (SQLiteAccessPermException | SQLiteCantOpenDatabaseException | SQLiteConstraintException | SQLiteDatabaseCorruptException | SQLiteDatabaseLockedException | SQLiteDiskIOException | SQLiteFullException | SQLiteTableLockedException e2) {
                        int i = this.d + 1;
                        this.d = i;
                        if (i >= 3) {
                            String str2 = hk7.A(context) ? "The file system on the device is in a bad state. WorkManager cannot access the app's internal data store." : "WorkManager can't be accessed from direct boot, because credential encrypted storage isn't accessible.\nDon't access or initialise WorkManager from directAware components. See https://developer.android.com/training/articles/direct-boot";
                            d87.h().g(str, str2, e2);
                            IllegalStateException illegalStateException = new IllegalStateException(str2, e2);
                            r32Var.getClass();
                            throw illegalStateException;
                        }
                        d87.h().e(str, "Retrying after " + (((long) i) * 300), e2);
                        try {
                            Thread.sleep(((long) this.d) * 300);
                        } catch (InterruptedException unused) {
                        }
                    }
                } catch (SQLiteException e3) {
                    d87.h().f(str, "Unexpected SQLite exception during migrations");
                    IllegalStateException illegalStateException2 = new IllegalStateException("Unexpected SQLite exception during migrations", e3);
                    r32Var.getClass();
                    throw illegalStateException2;
                }
            }
        } finally {
            m7fVar.i();
        }
    }
}
