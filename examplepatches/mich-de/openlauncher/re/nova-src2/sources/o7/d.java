package o7;

import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class d implements ThreadFactory {

    /* renamed from: a, reason: collision with root package name */
    public final AtomicInteger f79644a = new AtomicInteger(0);

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ boolean f79645b;

    public d(boolean z11) {
        this.f79645b = z11;
    }

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        Intrinsics.g(runnable, "runnable");
        StringBuilder sbQ = a2.c.q(this.f79645b ? "WM.task-" : "androidx.work-");
        sbQ.append(this.f79644a.incrementAndGet());
        return new Thread(runnable, sbQ.toString());
    }
}
