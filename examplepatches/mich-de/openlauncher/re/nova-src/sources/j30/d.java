package j30;

import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: classes4.dex */
public final class d implements ThreadFactory {

    /* renamed from: b, reason: collision with root package name */
    public final AtomicInteger f68884b = new AtomicInteger();

    /* renamed from: c, reason: collision with root package name */
    public final String f68885c = "thread-pool";

    /* renamed from: a, reason: collision with root package name */
    public final int f68883a = 10;

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        return new ib.b(this, runnable, this.f68885c + '-' + this.f68884b.getAndIncrement());
    }
}
