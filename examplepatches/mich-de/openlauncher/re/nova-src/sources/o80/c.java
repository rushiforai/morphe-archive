package o80;

import cl.k1;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;

/* loaded from: classes5.dex */
public final class c implements ThreadFactory {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f79719a;

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        switch (this.f79719a) {
            case 0:
                Thread thread = new Thread(runnable);
                thread.setDaemon(true);
                return thread;
            case 1:
                throw new AssertionError("No threads allowed.");
            case 2:
                return Executors.defaultThreadFactory().newThread(new k1(runnable, 2));
            default:
                return new x4.i(runnable);
        }
    }
}
