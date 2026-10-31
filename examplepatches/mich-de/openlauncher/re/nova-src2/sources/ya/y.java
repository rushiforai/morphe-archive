package ya;

import android.os.Looper;
import android.os.MessageQueue;

/* loaded from: classes.dex */
public final class y implements MessageQueue.IdleHandler {

    /* renamed from: a, reason: collision with root package name */
    public final fa.e0 f97216a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f97217b = true;

    /* renamed from: c, reason: collision with root package name */
    public final Looper f97218c;

    public y(fa.e0 e0Var, Looper looper) {
        this.f97216a = e0Var;
        this.f97218c = looper;
        looper.getQueue().addIdleHandler(this);
    }

    @Override // android.os.MessageQueue.IdleHandler
    public final boolean queueIdle() {
        synchronized (this.f97216a) {
            this.f97217b = false;
            this.f97216a.notify();
        }
        this.f97218c.getQueue().removeIdleHandler(this);
        return false;
    }
}
