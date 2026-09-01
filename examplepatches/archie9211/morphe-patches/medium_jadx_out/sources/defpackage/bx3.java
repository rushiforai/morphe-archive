package defpackage;

import android.os.Trace;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.concurrent.ScheduledThreadPoolExecutor;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bx3 implements Runnable {
    public final /* synthetic */ int a;

    public /* synthetic */ bx3(int i) {
        this.a = i;
    }

    @Override // java.lang.Runnable
    public final void run() {
        switch (this.a) {
            case 0:
                try {
                    Method method = lqd.b;
                    Trace.beginSection("EmojiCompat.EmojiCompatInitializer.run");
                    if (yw3.d()) {
                        yw3.a().e();
                        break;
                    }
                    Trace.endSection();
                    return;
                } catch (Throwable th) {
                    Method method2 = lqd.b;
                    Trace.endSection();
                    throw th;
                }
            case 1:
            case 2:
                return;
            default:
                for (ScheduledThreadPoolExecutor scheduledThreadPoolExecutor : new ArrayList(rqb.d.keySet())) {
                    if (scheduledThreadPoolExecutor.isShutdown()) {
                        rqb.d.remove(scheduledThreadPoolExecutor);
                    } else {
                        scheduledThreadPoolExecutor.purge();
                    }
                }
                return;
        }
    }

    public String toString() {
        switch (this.a) {
            case 1:
                return "EmptyRunnable";
            default:
                return super.toString();
        }
    }

    private final void a() {
    }

    private final void b() {
    }
}
