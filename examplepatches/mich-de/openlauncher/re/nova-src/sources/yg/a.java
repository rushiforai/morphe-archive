package yg;

import cl.k1;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;

/* loaded from: classes3.dex */
public final class a implements ThreadFactory {

    /* renamed from: a, reason: collision with root package name */
    public final String f97310a;

    /* renamed from: b, reason: collision with root package name */
    public final ThreadFactory f97311b = Executors.defaultThreadFactory();

    public a(String str) {
        this.f97310a = str;
    }

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        Thread threadNewThread = this.f97311b.newThread(new k1(runnable, 3));
        threadNewThread.setName(this.f97310a);
        return threadNewThread;
    }
}
