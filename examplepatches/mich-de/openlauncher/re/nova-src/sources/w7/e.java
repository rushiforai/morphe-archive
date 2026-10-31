package w7;

import android.app.ForegroundServiceStartNotAllowedException;
import android.app.Notification;
import android.app.Service;
import android.util.Log;
import androidx.work.impl.foreground.SystemForegroundService;
import o7.r;

/* loaded from: classes2.dex */
public abstract class e {
    public static void a(Service service, int i5, Notification notification, int i11) {
        try {
            service.startForeground(i5, notification, i11);
        } catch (ForegroundServiceStartNotAllowedException e3) {
            r rVarC = r.c();
            String str = SystemForegroundService.f15347f;
            if (rVarC.f79681a <= 5) {
                Log.w(str, "Unable to start foreground service", e3);
            }
        }
    }
}
