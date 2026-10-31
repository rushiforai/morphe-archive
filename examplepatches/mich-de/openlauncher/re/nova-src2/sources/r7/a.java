package r7;

import android.app.AlarmManager;
import android.app.PendingIntent;

/* loaded from: classes2.dex */
public abstract class a {
    public static void a(AlarmManager alarmManager, int i5, long j11, PendingIntent pendingIntent) {
        alarmManager.setExact(i5, j11, pendingIntent);
    }
}
