package w20;

import android.os.Handler;
import android.os.Looper;
import android.os.MessageQueue;
import java.util.Iterator;
import java.util.concurrent.ConcurrentLinkedQueue;
import kotlin.LazyKt;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public abstract class e0 {

    /* renamed from: a, reason: collision with root package name */
    public static final a70.d f93672a = LazyKt.a(new c0(0));

    /* renamed from: b, reason: collision with root package name */
    public static final ConcurrentLinkedQueue f93673b = new ConcurrentLinkedQueue();

    /* renamed from: c, reason: collision with root package name */
    public static volatile boolean f93674c;

    public static void a(MessageQueue messageQueue) {
        long jNanoTime = System.nanoTime();
        Iterator it = f93673b.iterator();
        while (it.hasNext()) {
            try {
                ((Function0) it.next()).invoke();
            } catch (Throwable unused) {
            }
            it.remove();
            long jNanoTime2 = (System.nanoTime() - jNanoTime) / 1000000;
            if (!messageQueue.isIdle() && jNanoTime2 > 10) {
                return;
            }
        }
    }

    public static void b(Function0 function0) {
        if (Intrinsics.b(Looper.myLooper(), Looper.getMainLooper())) {
            function0.invoke();
        } else {
            ((Handler) f93672a.getValue()).post(new b2.b(function0, 3));
        }
    }

    public static void c(Function0 function0) {
        final MessageQueue queue = Looper.getMainLooper().getQueue();
        f93673b.add(function0);
        if (!f93674c) {
            queue.addIdleHandler(new MessageQueue.IdleHandler() { // from class: w20.d0
                @Override // android.os.MessageQueue.IdleHandler
                public final boolean queueIdle() {
                    e0.a(queue);
                    return true;
                }
            });
            f93674c = true;
        }
        if (queue.isIdle()) {
            b(new s10.r(queue, 3));
        }
    }
}
