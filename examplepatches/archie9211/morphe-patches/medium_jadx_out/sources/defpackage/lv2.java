package defpackage;

import com.android.billingclient.api.a;
import java.util.concurrent.Executors;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.atomic.AtomicInteger;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lv2 implements ThreadFactory {
    public final /* synthetic */ int a;
    public final Object b;
    public final Object c;

    public lv2(String str, int i) {
        this.a = i;
        switch (i) {
            case 1:
                this.c = Executors.defaultThreadFactory();
                this.b = str;
                break;
            default:
                this.b = str;
                this.c = new AtomicInteger(1);
                break;
        }
    }

    @Override // java.util.concurrent.ThreadFactory
    public final Thread newThread(Runnable runnable) {
        int i = this.a;
        Object obj = this.b;
        Object obj2 = this.c;
        switch (i) {
            case 0:
                Thread thread = new Thread(runnable, "datadog-" + ((String) obj) + "-thread-" + ((AtomicInteger) obj2).getAndIncrement());
                thread.setPriority(5);
                thread.setDaemon(false);
                return thread;
            case 1:
                Thread threadNewThread = ((ThreadFactory) obj2).newThread(new t86(3, runnable));
                threadNewThread.setName((String) obj);
                return threadNewThread;
            default:
                Thread threadNewThread2 = ((ThreadFactory) obj).newThread(runnable);
                threadNewThread2.setName("PlayBillingLibrary-" + ((AtomicInteger) obj2).getAndIncrement());
                return threadNewThread2;
        }
    }

    public lv2(a aVar) {
        this.a = 2;
        this.b = Executors.defaultThreadFactory();
        this.c = new AtomicInteger(1);
    }
}
