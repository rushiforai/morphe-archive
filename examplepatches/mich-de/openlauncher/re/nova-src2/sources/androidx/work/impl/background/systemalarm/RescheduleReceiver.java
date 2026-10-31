package androidx.work.impl.background.systemalarm;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import java.util.Objects;
import o7.r;
import p7.s;

/* loaded from: classes.dex */
public class RescheduleReceiver extends BroadcastReceiver {

    /* renamed from: a, reason: collision with root package name */
    public static final String f15337a = r.e("RescheduleReceiver");

    @Override // android.content.BroadcastReceiver
    public final void onReceive(Context context, Intent intent) {
        r rVarC = r.c();
        Objects.toString(intent);
        rVarC.getClass();
        try {
            s sVarC = s.c(context);
            BroadcastReceiver.PendingResult pendingResultGoAsync = goAsync();
            sVarC.getClass();
            synchronized (s.f82371m) {
                try {
                    BroadcastReceiver.PendingResult pendingResult = sVarC.f82380i;
                    if (pendingResult != null) {
                        pendingResult.finish();
                    }
                    sVarC.f82380i = pendingResultGoAsync;
                    if (sVarC.f82379h) {
                        pendingResultGoAsync.finish();
                        sVarC.f82380i = null;
                    }
                } finally {
                }
            }
        } catch (IllegalStateException e3) {
            r.c().b(f15337a, "Cannot reschedule jobs. WorkManager needs to be initialized via a ContentProvider#onCreate() or an Application#onCreate().", e3);
        }
    }
}
