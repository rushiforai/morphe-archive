package defpackage;

import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i23 implements ThreadFactory {
    public final /* synthetic */ int a;
    public final Number b;

    public i23() {
        this.a = 0;
        this.b = new AtomicInteger(0);
    }

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        int i = this.a;
        Number number = this.b;
        switch (i) {
            case 0:
                Thread thread = new Thread(runnable);
                thread.setName("arch_disk_io_" + ((AtomicInteger) number).getAndIncrement());
                return thread;
            default:
                Thread threadNewThread = Executors.defaultThreadFactory().newThread(new x44(0, runnable));
                threadNewThread.setName("awaitEvenIfOnMainThread task continuation executor" + ((AtomicLong) number).getAndIncrement());
                return threadNewThread;
        }
    }

    public i23(AtomicLong atomicLong) {
        this.a = 1;
        this.b = atomicLong;
    }
}
