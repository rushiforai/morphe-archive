package rb0;

import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicLong;

/* loaded from: classes5.dex */
public final class e extends AtomicLong implements ThreadFactory {

    /* renamed from: b, reason: collision with root package name */
    public static final o80.c f85781b = new o80.c(1);

    /* renamed from: a, reason: collision with root package name */
    public final String f85782a;

    public e(String str) {
        this.f85782a = str;
    }

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        Thread thread = new Thread(runnable, this.f85782a + incrementAndGet());
        thread.setDaemon(true);
        return thread;
    }
}
