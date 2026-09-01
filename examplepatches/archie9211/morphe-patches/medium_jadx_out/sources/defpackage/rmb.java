package defpackage;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Looper;
import android.os.Messenger;
import android.util.Log;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rmb {
    public static int h;
    public static PendingIntent i;
    public static final Pattern j = Pattern.compile("\\|ID\\|([^|]+)\\|:?+(.*)");
    public final Context b;
    public final u11 c;
    public final ScheduledThreadPoolExecutor d;
    public Messenger f;
    public i0g g;
    public final aec a = new aec(0);
    public final Messenger e = new Messenger(new nnf(this, Looper.getMainLooper()));

    public rmb(Context context) {
        this.b = context;
        this.c = new u11(context);
        ScheduledThreadPoolExecutor scheduledThreadPoolExecutor = new ScheduledThreadPoolExecutor(1);
        scheduledThreadPoolExecutor.setKeepAliveTime(60L, TimeUnit.SECONDS);
        scheduledThreadPoolExecutor.allowCoreThreadTimeOut(true);
        this.d = scheduledThreadPoolExecutor;
    }

    public static synchronized String b() {
        int i2;
        i2 = h;
        h = i2 + 1;
        return Integer.toString(i2);
    }

    public static synchronized void c(Context context, Intent intent) {
        try {
            PendingIntent broadcast = i;
            if (broadcast == null) {
                Intent intent2 = new Intent();
                intent2.setPackage("com.google.example.invalidpackage");
                broadcast = PendingIntent.getBroadcast(context, 0, intent2, zkf.a);
                i = broadcast;
            }
            intent.putExtra("app", broadcast);
        } catch (Throwable th) {
            throw th;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:28:0x00aa  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00ae  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final defpackage.jrg a(android.os.Bundle r8) {
        /*
            Method dump skipped, instruction units count: 214
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rmb.a(android.os.Bundle):jrg");
    }

    public final void d(String str, Bundle bundle) {
        synchronized (this.a) {
            try {
                wfd wfdVar = (wfd) this.a.remove(str);
                if (wfdVar != null) {
                    wfdVar.b(bundle);
                    return;
                }
                Log.w("Rpc", "Missing callback for " + str);
            } catch (Throwable th) {
                throw th;
            }
        }
    }
}
