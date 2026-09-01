package androidx.work.impl.foreground;

import android.app.NotificationManager;
import android.content.Intent;
import android.os.Build;
import android.text.TextUtils;
import com.drew.imaging.riff.pvS.uuLAxLN;
import com.drew.lang.RandomAccessStreamReader;
import defpackage.d87;
import defpackage.m7f;
import defpackage.n;
import defpackage.o6d;
import defpackage.p0g;
import defpackage.q7f;
import defpackage.qy6;
import defpackage.s10;
import defpackage.tp7;
import defpackage.z46;
import java.util.UUID;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public class SystemForegroundService extends qy6 {
    public static final String e = d87.k("SystemFgService");
    public boolean b;
    public o6d c;
    public NotificationManager d;

    @Override // defpackage.qy6, android.app.Service
    public final void onCreate() {
        super.onCreate();
        a();
    }

    @Override // defpackage.qy6, android.app.Service
    public final void onDestroy() {
        super.onDestroy();
        this.c.e();
    }

    @Override // android.app.Service
    public final int onStartCommand(Intent intent, int i, int i2) {
        super.onStartCommand(intent, i, i2);
        boolean z = this.b;
        boolean z2 = false;
        String str = e;
        if (z) {
            d87.h().j(str, "Re-initializing SystemForegroundService after a request to shut-down.");
            this.c.e();
            a();
            this.b = false;
        }
        if (intent == null) {
            return 3;
        }
        o6d o6dVar = this.c;
        o6dVar.getClass();
        String str2 = o6d.j;
        String action = intent.getAction();
        if ("ACTION_START_FOREGROUND".equals(action)) {
            d87.h().j(str2, "Started foreground service " + intent);
            ((q7f) o6dVar.b).a(new p0g(o6dVar, intent.getStringExtra("KEY_WORKSPEC_ID"), z2, 17));
            o6dVar.d(intent);
            return 3;
        }
        if ("ACTION_NOTIFY".equals(action)) {
            o6dVar.d(intent);
            return 3;
        }
        if (!"ACTION_CANCEL_WORK".equals(action)) {
            if (!"ACTION_STOP_FOREGROUND".equals(action)) {
                return 3;
            }
            d87.h().j(str2, "Stopping foreground service");
            SystemForegroundService systemForegroundService = o6dVar.i;
            if (systemForegroundService == null) {
                return 3;
            }
            systemForegroundService.b = true;
            d87.h().d(str, "Shutting down.");
            if (Build.VERSION.SDK_INT >= 26) {
                systemForegroundService.stopForeground(true);
            }
            systemForegroundService.stopSelf(i2);
            return 3;
        }
        d87.h().j(str2, "Stopping foreground work for " + intent);
        String stringExtra = intent.getStringExtra("KEY_WORKSPEC_ID");
        if (stringExtra == null || TextUtils.isEmpty(stringExtra)) {
            return 3;
        }
        m7f m7fVar = o6dVar.a;
        UUID uuidFromString = UUID.fromString(stringExtra);
        m7fVar.getClass();
        uuidFromString.getClass();
        z46 z46Var = m7fVar.b.h;
        s10 s10Var = ((q7f) m7fVar.d).a;
        s10Var.getClass();
        tp7.x(z46Var, "CancelWorkById", s10Var, new n(m7fVar, 22, uuidFromString));
        return 3;
    }

    @Override // android.app.Service
    public final void onTimeout(int i) {
        if (Build.VERSION.SDK_INT >= 35) {
            return;
        }
        this.c.f(i, RandomAccessStreamReader.DEFAULT_CHUNK_LENGTH);
    }

    public final void a() {
        this.d = (NotificationManager) getApplicationContext().getSystemService("notification");
        o6d o6dVar = new o6d(getApplicationContext());
        this.c = o6dVar;
        if (o6dVar.i != null) {
            d87.h().f(o6d.j, uuLAxLN.aVZc);
        } else {
            o6dVar.i = this;
        }
    }

    public final void onTimeout(int i, int i2) {
        this.c.f(i, i2);
    }
}
