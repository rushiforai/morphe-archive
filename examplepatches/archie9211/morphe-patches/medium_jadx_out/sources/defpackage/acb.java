package defpackage;

import android.content.Context;
import android.content.SharedPreferences;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class acb extends p08 {
    public final /* synthetic */ int c = 1;
    public final Context d;

    public acb(Context context) {
        super(9, 10);
        this.d = context;
    }

    @Override // defpackage.p08
    public final void a(z25 z25Var) {
        int i = this.c;
        Context context = this.d;
        z25Var.getClass();
        switch (i) {
            case 0:
                if (this.b >= 10) {
                    z25Var.I(new Object[]{"reschedule_needed", 1});
                    return;
                } else {
                    context.getSharedPreferences("androidx.work.util.preferences", 0).edit().putBoolean("reschedule_needed", true).apply();
                    return;
                }
            default:
                z25Var.D("CREATE TABLE IF NOT EXISTS `Preference` (`key` TEXT NOT NULL, `long_value` INTEGER, PRIMARY KEY(`key`))");
                SharedPreferences sharedPreferences = context.getSharedPreferences("androidx.work.util.preferences", 0);
                if (sharedPreferences.contains("reschedule_needed") || sharedPreferences.contains("last_cancel_all_time_ms")) {
                    long j = sharedPreferences.getLong("last_cancel_all_time_ms", 0L);
                    long j2 = sharedPreferences.getBoolean("reschedule_needed", false) ? 1L : 0L;
                    z25Var.f();
                    try {
                        z25Var.I(new Object[]{"last_cancel_all_time_ms", Long.valueOf(j)});
                        z25Var.I(new Object[]{"reschedule_needed", Long.valueOf(j2)});
                        sharedPreferences.edit().clear().apply();
                        z25Var.L();
                    } finally {
                    }
                }
                SharedPreferences sharedPreferences2 = context.getSharedPreferences("androidx.work.util.id", 0);
                if (sharedPreferences2.contains("next_job_scheduler_id") || sharedPreferences2.contains("next_job_scheduler_id")) {
                    int i2 = sharedPreferences2.getInt("next_job_scheduler_id", 0);
                    int i3 = sharedPreferences2.getInt("next_alarm_manager_id", 0);
                    z25Var.f();
                    try {
                        z25Var.I(new Object[]{"next_job_scheduler_id", Integer.valueOf(i2)});
                        z25Var.I(new Object[]{"next_alarm_manager_id", Integer.valueOf(i3)});
                        sharedPreferences2.edit().clear().apply();
                        z25Var.L();
                        return;
                    } finally {
                    }
                }
                return;
        }
    }

    public acb(Context context, int i, int i2) {
        super(i, i2);
        this.d = context;
    }
}
