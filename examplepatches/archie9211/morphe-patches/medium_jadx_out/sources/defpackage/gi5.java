package defpackage;

import android.os.Handler;
import android.os.Message;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class gi5 extends nqb {
    public final Handler a;
    public volatile boolean b;

    public gi5(Handler handler) {
        this.a = handler;
    }

    @Override // defpackage.nqb
    public final sh3 a(Runnable runnable, long j, TimeUnit timeUnit) {
        if (timeUnit == null) {
            z72.c("unit == null");
            return null;
        }
        if (this.b) {
            return ay3.INSTANCE;
        }
        Handler handler = this.a;
        hi5 hi5Var = new hi5(handler, runnable);
        Message messageObtain = Message.obtain(handler, hi5Var);
        messageObtain.obj = this;
        this.a.sendMessageDelayed(messageObtain, timeUnit.toMillis(j));
        if (!this.b) {
            return hi5Var;
        }
        this.a.removeCallbacks(hi5Var);
        return ay3.INSTANCE;
    }

    @Override // defpackage.sh3
    public final void dispose() {
        this.b = true;
        this.a.removeCallbacksAndMessages(this);
    }
}
