package defpackage;

import android.os.Handler;
import android.os.Message;
import java.util.concurrent.TimeUnit;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ii5 extends oqb {
    public final Handler a;

    public ii5(Handler handler) {
        this.a = handler;
    }

    @Override // defpackage.oqb
    public final nqb a() {
        return new gi5(this.a);
    }

    @Override // defpackage.oqb
    public final sh3 b(p0g p0gVar) {
        if (TimeUnit.NANOSECONDS == null) {
            z72.c("unit == null");
            return null;
        }
        Handler handler = this.a;
        hi5 hi5Var = new hi5(handler, p0gVar);
        handler.sendMessageDelayed(Message.obtain(handler, hi5Var), 0L);
        return hi5Var;
    }
}
