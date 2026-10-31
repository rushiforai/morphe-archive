package kb0;

import android.os.Handler;
import android.os.Message;
import ib0.g;
import ib0.i;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import xb0.e;

/* loaded from: classes5.dex */
public final class b extends g {

    /* renamed from: a, reason: collision with root package name */
    public final Handler f71316a;

    /* renamed from: b, reason: collision with root package name */
    public final jb0.b f71317b;

    /* renamed from: c, reason: collision with root package name */
    public volatile boolean f71318c;

    public b(Handler handler) {
        this.f71316a = handler;
        AtomicReference atomicReference = jb0.a.f69426b.f69427a;
        if (atomicReference.get() == null) {
            while (!atomicReference.compareAndSet(null, jb0.b.f69428a) && atomicReference.get() == null) {
            }
        }
        this.f71317b = (jb0.b) atomicReference.get();
    }

    @Override // ib0.i
    public final boolean a() {
        return this.f71318c;
    }

    @Override // ib0.i
    public final void b() {
        this.f71318c = true;
        this.f71316a.removeCallbacksAndMessages(this);
    }

    @Override // ib0.g
    public final i c(mb0.a aVar) {
        TimeUnit timeUnit = TimeUnit.MILLISECONDS;
        xb0.d dVar = e.f95758a;
        if (this.f71318c) {
            return dVar;
        }
        this.f71317b.getClass();
        Handler handler = this.f71316a;
        c cVar = new c(aVar, handler);
        Message messageObtain = Message.obtain(handler, cVar);
        messageObtain.obj = this;
        this.f71316a.sendMessageDelayed(messageObtain, timeUnit.toMillis(0L));
        if (!this.f71318c) {
            return cVar;
        }
        this.f71316a.removeCallbacks(cVar);
        return dVar;
    }
}
