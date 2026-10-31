package w7;

import android.app.Notification;
import android.os.Build;
import androidx.work.impl.foreground.SystemForegroundService;

/* loaded from: classes2.dex */
public final class c implements Runnable {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f93837a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Notification f93838b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f93839c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ SystemForegroundService f93840d;

    public c(SystemForegroundService systemForegroundService, int i5, Notification notification, int i11) {
        this.f93840d = systemForegroundService;
        this.f93837a = i5;
        this.f93838b = notification;
        this.f93839c = i11;
    }

    @Override // java.lang.Runnable
    public final void run() {
        int i5 = Build.VERSION.SDK_INT;
        int i11 = this.f93839c;
        Notification notification = this.f93838b;
        int i12 = this.f93837a;
        SystemForegroundService systemForegroundService = this.f93840d;
        if (i5 >= 31) {
            e.a(systemForegroundService, i12, notification, i11);
        } else if (i5 >= 29) {
            d.a(systemForegroundService, i12, notification, i11);
        } else {
            systemForegroundService.startForeground(i12, notification);
        }
    }
}
