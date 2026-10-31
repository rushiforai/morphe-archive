package androidx.work.impl.foreground;

import android.app.NotificationManager;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.text.TextUtils;
import h6.d0;
import java.util.UUID;
import mk.w;
import o7.r;
import p7.s;
import w7.b;

/* loaded from: classes2.dex */
public class SystemForegroundService extends d0 {

    /* renamed from: f, reason: collision with root package name */
    public static final String f15347f = r.e("SystemFgService");

    /* renamed from: b, reason: collision with root package name */
    public Handler f15348b;

    /* renamed from: c, reason: collision with root package name */
    public boolean f15349c;

    /* renamed from: d, reason: collision with root package name */
    public b f15350d;

    /* renamed from: e, reason: collision with root package name */
    public NotificationManager f15351e;

    public final void a() {
        this.f15348b = new Handler(Looper.getMainLooper());
        this.f15351e = (NotificationManager) getApplicationContext().getSystemService("notification");
        b bVar = new b(getApplicationContext());
        this.f15350d = bVar;
        if (bVar.f93836j != null) {
            r.c().a(b.f93826k, "A callback already exists.");
        } else {
            bVar.f93836j = this;
        }
    }

    @Override // h6.d0, android.app.Service
    public final void onCreate() {
        super.onCreate();
        a();
    }

    @Override // h6.d0, android.app.Service
    public final void onDestroy() {
        super.onDestroy();
        this.f15350d.g();
    }

    @Override // android.app.Service
    public final int onStartCommand(Intent intent, int i5, int i11) {
        super.onStartCommand(intent, i5, i11);
        if (this.f15349c) {
            r.c().d(f15347f, "Re-initializing SystemForegroundService after a request to shut-down.");
            this.f15350d.g();
            a();
            this.f15349c = false;
        }
        if (intent == null) {
            return 3;
        }
        b bVar = this.f15350d;
        bVar.getClass();
        String str = b.f93826k;
        String action = intent.getAction();
        if ("ACTION_START_FOREGROUND".equals(action)) {
            r.c().d(str, "Started foreground service " + intent);
            bVar.f93829c.a(new w((Object) bVar, (Object) intent.getStringExtra("KEY_WORKSPEC_ID"), false, 25));
            bVar.f(intent);
            return 3;
        }
        if ("ACTION_NOTIFY".equals(action)) {
            bVar.f(intent);
            return 3;
        }
        if (!"ACTION_CANCEL_WORK".equals(action)) {
            if (!"ACTION_STOP_FOREGROUND".equals(action)) {
                return 3;
            }
            r.c().d(str, "Stopping foreground service");
            SystemForegroundService systemForegroundService = bVar.f93836j;
            if (systemForegroundService == null) {
                return 3;
            }
            systemForegroundService.f15349c = true;
            r.c().getClass();
            systemForegroundService.stopForeground(true);
            systemForegroundService.stopSelf();
            return 3;
        }
        r.c().d(str, "Stopping foreground work for " + intent);
        String stringExtra = intent.getStringExtra("KEY_WORKSPEC_ID");
        if (stringExtra == null || TextUtils.isEmpty(stringExtra)) {
            return 3;
        }
        s sVar = bVar.f93828b;
        UUID uuidFromString = UUID.fromString(stringExtra);
        sVar.getClass();
        sVar.f82375d.a(new y7.b(sVar, uuidFromString, 0));
        return 3;
    }
}
