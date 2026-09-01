package defpackage;

import android.os.Handler;
import android.os.Looper;
import java.util.concurrent.atomic.AtomicBoolean;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o90 implements Runnable {
    public static Handler f;
    public final /* synthetic */ gkf e;
    public volatile n28 b = n28.PENDING;
    public final AtomicBoolean c = new AtomicBoolean();
    public final AtomicBoolean d = new AtomicBoolean();
    public final wc7 a = new wc7(this, new wf3(1, this));

    public o90(gkf gkfVar) {
        this.e = gkfVar;
    }

    public final void a(Object obj) {
        Handler handler;
        synchronized (o90.class) {
            try {
                handler = f;
                if (handler == null) {
                    handler = new Handler(Looper.getMainLooper());
                    f = handler;
                }
            } catch (Throwable th) {
                throw th;
            }
        }
        handler.post(new p0g(this, obj, false, 11));
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.e.a();
    }
}
