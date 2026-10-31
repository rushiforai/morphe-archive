package ic;

import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes2.dex */
public final class a implements ThreadFactory {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f61513a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f61514b;

    public a(int i5) {
        this.f61513a = i5;
        switch (i5) {
            case 1:
                this.f61514b = new AtomicInteger(1);
                break;
            default:
                this.f61514b = new AtomicInteger(0);
                break;
        }
    }

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        switch (this.f61513a) {
            case 0:
                return new Thread(null, runnable, "ALOG_SA_" + ((AtomicInteger) this.f61514b).getAndIncrement());
            case 1:
                return new Thread(runnable, "ConcurrencyUtil#" + ((AtomicInteger) this.f61514b).getAndIncrement());
            default:
                Thread threadNewThread = ((ThreadFactory) this.f61514b).newThread(runnable);
                threadNewThread.setName(threadNewThread.getName() + " (Evictor)");
                return threadNewThread;
        }
    }

    public a(ThreadFactory threadFactory) {
        this.f61513a = 2;
        this.f61514b = threadFactory;
    }
}
