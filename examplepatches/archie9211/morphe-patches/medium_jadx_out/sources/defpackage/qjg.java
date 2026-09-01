package defpackage;

import android.content.Context;
import android.util.LogPrinter;
import com.google.android.gms.internal.gtm.zzau;
import java.lang.Thread;
import java.util.concurrent.CopyOnWriteArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qjg {
    public static volatile qjg e;
    public final Context a;
    public final ifg b;
    public volatile zzau c;
    public Thread.UncaughtExceptionHandler d;

    public qjg(Context context) {
        Context applicationContext = context.getApplicationContext();
        vp7.p(applicationContext);
        this.a = applicationContext;
        this.b = new ifg(this);
        new CopyOnWriteArrayList();
        new LogPrinter(4, "GA/LogCatTransport");
    }

    public static void a() {
        if (Thread.currentThread() instanceof qhg) {
            return;
        }
        ygf.f("Call expected from worker thread");
    }
}
