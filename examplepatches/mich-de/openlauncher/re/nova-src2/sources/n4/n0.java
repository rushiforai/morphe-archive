package n4;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.ComponentName;
import android.content.Context;
import android.media.AudioAttributes;
import android.net.Uri;
import android.os.Bundle;
import android.provider.Settings;
import java.util.HashSet;
import java.util.Set;

/* loaded from: classes2.dex */
public final class n0 {

    /* renamed from: d, reason: collision with root package name */
    public static String f77836d;

    /* renamed from: g, reason: collision with root package name */
    public static m0 f77839g;

    /* renamed from: a, reason: collision with root package name */
    public final Context f77840a;

    /* renamed from: b, reason: collision with root package name */
    public final NotificationManager f77841b;

    /* renamed from: c, reason: collision with root package name */
    public static final Object f77835c = new Object();

    /* renamed from: e, reason: collision with root package name */
    public static HashSet f77837e = new HashSet();

    /* renamed from: f, reason: collision with root package name */
    public static final Object f77838f = new Object();

    public n0(Context context) {
        this.f77840a = context;
        this.f77841b = (NotificationManager) context.getSystemService("notification");
    }

    public static n0 c(Context context) {
        return new n0(context);
    }

    public static Set d(Context context) {
        HashSet hashSet;
        String string = Settings.Secure.getString(context.getContentResolver(), "enabled_notification_listeners");
        synchronized (f77835c) {
            if (string != null) {
                try {
                    if (!string.equals(f77836d)) {
                        String[] strArrSplit = string.split(":", -1);
                        HashSet hashSet2 = new HashSet(strArrSplit.length);
                        for (String str : strArrSplit) {
                            ComponentName componentNameUnflattenFromString = ComponentName.unflattenFromString(str);
                            if (componentNameUnflattenFromString != null) {
                                hashSet2.add(componentNameUnflattenFromString.getPackageName());
                            }
                        }
                        f77837e = hashSet2;
                        f77836d = string;
                    }
                } catch (Throwable th2) {
                    throw th2;
                }
            }
            hashSet = f77837e;
        }
        return hashSet;
    }

    public final boolean a() {
        return this.f77841b.areNotificationsEnabled();
    }

    public final void b(cw.r rVar) {
        NotificationChannel notificationChannel = new NotificationChannel((String) rVar.f48278b, (CharSequence) rVar.f48282f, rVar.f48279c);
        notificationChannel.setDescription(null);
        notificationChannel.setGroup(null);
        notificationChannel.setShowBadge(true);
        notificationChannel.setSound((Uri) rVar.f48280d, (AudioAttributes) rVar.f48281e);
        notificationChannel.enableLights(false);
        notificationChannel.setLightColor(0);
        notificationChannel.setVibrationPattern(null);
        notificationChannel.enableVibration(false);
        this.f77841b.createNotificationChannel(notificationChannel);
    }

    public final void e(int i5, Notification notification) {
        Bundle bundle = notification.extras;
        if (bundle == null || !bundle.getBoolean("android.support.useSideChannel")) {
            this.f77841b.notify(null, i5, notification);
            return;
        }
        j0 j0Var = new j0(this.f77840a.getPackageName(), i5, notification);
        synchronized (f77838f) {
            try {
                if (f77839g == null) {
                    f77839g = new m0(this.f77840a.getApplicationContext());
                }
                f77839g.f77832b.obtainMessage(0, j0Var).sendToTarget();
            } catch (Throwable th2) {
                throw th2;
            }
        }
        this.f77841b.cancel(null, i5);
    }
}
