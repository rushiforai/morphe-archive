package defpackage;

import android.os.Handler;
import android.os.Looper;
import com.medium.android.data.notification.YMl.DtuT;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class gq implements Executor {
    public final /* synthetic */ int a;
    public final Handler b;

    public gq() {
        this.a = 0;
        this.b = new Handler(Looper.getMainLooper());
    }

    @Override // java.util.concurrent.Executor
    public final void execute(Runnable runnable) {
        int i = this.a;
        Handler handler = this.b;
        switch (i) {
            case 0:
                handler.post(runnable);
                return;
            case 1:
                runnable.getClass();
                if (handler.post(runnable)) {
                    return;
                }
                throw new RejectedExecutionException(handler + DtuT.Cfk);
            default:
                handler.post(runnable);
                return;
        }
    }

    public /* synthetic */ gq(Handler handler, int i) {
        this.a = i;
        this.b = handler;
    }
}
