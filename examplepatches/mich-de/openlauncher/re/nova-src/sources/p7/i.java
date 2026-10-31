package p7;

import android.content.Context;
import android.content.SharedPreferences;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;

/* loaded from: classes.dex */
public final class i extends y6.a {

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f82347c = 1;

    /* renamed from: d, reason: collision with root package name */
    public final Context f82348d;

    public i(Context context, int i5, int i11) {
        super(i5, i11);
        this.f82348d = context;
    }

    @Override // y6.a
    public final void a(e7.d dVar) throws SQLException {
        switch (this.f82347c) {
            case 0:
                if (this.f96733b >= 10) {
                    dVar.f52218a.execSQL("INSERT OR REPLACE INTO `Preference` (`key`, `long_value`) VALUES (@key, @long_value)", new Object[]{"reschedule_needed", 1});
                    return;
                } else {
                    this.f82348d.getSharedPreferences("androidx.work.util.preferences", 0).edit().putBoolean("reschedule_needed", true).apply();
                    return;
                }
            default:
                SQLiteDatabase sQLiteDatabase = dVar.f52218a;
                dVar.execSQL("CREATE TABLE IF NOT EXISTS `Preference` (`key` TEXT NOT NULL, `long_value` INTEGER, PRIMARY KEY(`key`))");
                Context context = this.f82348d;
                SharedPreferences sharedPreferences = context.getSharedPreferences("androidx.work.util.preferences", 0);
                if (sharedPreferences.contains("reschedule_needed") || sharedPreferences.contains("last_cancel_all_time_ms")) {
                    long j11 = sharedPreferences.getLong("last_cancel_all_time_ms", 0L);
                    long j12 = sharedPreferences.getBoolean("reschedule_needed", false) ? 1L : 0L;
                    dVar.beginTransaction();
                    try {
                        sQLiteDatabase.execSQL("INSERT OR REPLACE INTO `Preference` (`key`, `long_value`) VALUES (@key, @long_value)", new Object[]{"last_cancel_all_time_ms", Long.valueOf(j11)});
                        sQLiteDatabase.execSQL("INSERT OR REPLACE INTO `Preference` (`key`, `long_value`) VALUES (@key, @long_value)", new Object[]{"reschedule_needed", Long.valueOf(j12)});
                        sharedPreferences.edit().clear().apply();
                        dVar.setTransactionSuccessful();
                    } finally {
                    }
                }
                SharedPreferences sharedPreferences2 = context.getSharedPreferences("androidx.work.util.id", 0);
                if (sharedPreferences2.contains("next_job_scheduler_id") || sharedPreferences2.contains("next_job_scheduler_id")) {
                    int i5 = sharedPreferences2.getInt("next_job_scheduler_id", 0);
                    int i11 = sharedPreferences2.getInt("next_alarm_manager_id", 0);
                    dVar.beginTransaction();
                    try {
                        sQLiteDatabase.execSQL("INSERT OR REPLACE INTO `Preference` (`key`, `long_value`) VALUES (@key, @long_value)", new Object[]{"next_job_scheduler_id", Integer.valueOf(i5)});
                        sQLiteDatabase.execSQL("INSERT OR REPLACE INTO `Preference` (`key`, `long_value`) VALUES (@key, @long_value)", new Object[]{"next_alarm_manager_id", Integer.valueOf(i11)});
                        sharedPreferences2.edit().clear().apply();
                        dVar.setTransactionSuccessful();
                        return;
                    } finally {
                    }
                }
                return;
        }
    }

    public i(Context context) {
        super(9, 10);
        this.f82348d = context;
    }
}
