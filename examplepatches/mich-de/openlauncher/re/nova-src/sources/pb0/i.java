package pb0;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes5.dex */
public class i extends ib0.g {

    /* renamed from: c, reason: collision with root package name */
    public static final boolean f82521c;

    /* renamed from: g, reason: collision with root package name */
    public static volatile Object f82525g;

    /* renamed from: a, reason: collision with root package name */
    public final ScheduledExecutorService f82527a;

    /* renamed from: b, reason: collision with root package name */
    public volatile boolean f82528b;

    /* renamed from: h, reason: collision with root package name */
    public static final Object f82526h = new Object();

    /* renamed from: e, reason: collision with root package name */
    public static final ConcurrentHashMap f82523e = new ConcurrentHashMap();

    /* renamed from: f, reason: collision with root package name */
    public static final AtomicReference f82524f = new AtomicReference();

    /* renamed from: d, reason: collision with root package name */
    public static final int f82522d = Integer.getInteger("rx.scheduler.jdk6.purge-frequency-millis", 1000).intValue();

    static {
        boolean z11 = Boolean.getBoolean("rx.scheduler.jdk6.purge-force");
        int i5 = rb0.c.f85778a;
        f82521c = !z11 && (i5 == 0 || i5 >= 21);
    }

    public i(ThreadFactory threadFactory) {
        ScheduledExecutorService scheduledExecutorServiceNewScheduledThreadPool;
        ScheduledExecutorService scheduledExecutorServiceNewScheduledThreadPool2 = Executors.newScheduledThreadPool(1, threadFactory);
        if (!f(scheduledExecutorServiceNewScheduledThreadPool2) && (scheduledExecutorServiceNewScheduledThreadPool2 instanceof ScheduledThreadPoolExecutor)) {
            ScheduledThreadPoolExecutor scheduledThreadPoolExecutor = (ScheduledThreadPoolExecutor) scheduledExecutorServiceNewScheduledThreadPool2;
            loop0: while (true) {
                AtomicReference atomicReference = f82524f;
                if (((ScheduledExecutorService) atomicReference.get()) == null) {
                    scheduledExecutorServiceNewScheduledThreadPool = Executors.newScheduledThreadPool(1, new rb0.e("RxSchedulerPurge-"));
                    while (!atomicReference.compareAndSet(null, scheduledExecutorServiceNewScheduledThreadPool)) {
                        if (atomicReference.get() != null) {
                            break;
                        }
                    }
                    b.l lVar = new b.l(5);
                    long j11 = f82522d;
                    scheduledExecutorServiceNewScheduledThreadPool.scheduleAtFixedRate(lVar, j11, j11, TimeUnit.MILLISECONDS);
                    break loop0;
                }
                break;
                scheduledExecutorServiceNewScheduledThreadPool.shutdownNow();
            }
            f82523e.putIfAbsent(scheduledThreadPoolExecutor, scheduledThreadPoolExecutor);
        }
        this.f82527a = scheduledExecutorServiceNewScheduledThreadPool2;
    }

    public static Method d(ScheduledExecutorService scheduledExecutorService) throws SecurityException {
        for (Method method : scheduledExecutorService.getClass().getMethods()) {
            if (method.getName().equals("setRemoveOnCancelPolicy")) {
                Class<?>[] parameterTypes = method.getParameterTypes();
                if (parameterTypes.length == 1 && parameterTypes[0] == Boolean.TYPE) {
                    return method;
                }
            }
        }
        return null;
    }

    public static boolean f(ScheduledExecutorService scheduledExecutorService) throws IllegalAccessException, SecurityException, IllegalArgumentException, InvocationTargetException {
        Method methodD;
        if (f82521c) {
            if (scheduledExecutorService instanceof ScheduledThreadPoolExecutor) {
                Object obj = f82525g;
                Object obj2 = f82526h;
                if (obj == obj2) {
                    return false;
                }
                if (obj == null) {
                    methodD = d(scheduledExecutorService);
                    if (methodD != null) {
                        obj2 = methodD;
                    }
                    f82525g = obj2;
                } else {
                    methodD = (Method) obj;
                }
            } else {
                methodD = d(scheduledExecutorService);
            }
            if (methodD != null) {
                try {
                    methodD.invoke(scheduledExecutorService, Boolean.TRUE);
                    return true;
                } catch (IllegalAccessException e3) {
                    ub0.a.a(e3);
                } catch (IllegalArgumentException e11) {
                    ub0.a.a(e11);
                } catch (InvocationTargetException e12) {
                    ub0.a.a(e12);
                }
            }
        }
        return false;
    }

    @Override // ib0.i
    public final boolean a() {
        return this.f82528b;
    }

    @Override // ib0.i
    public final void b() {
        this.f82528b = true;
        this.f82527a.shutdownNow();
        f82523e.remove(this.f82527a);
    }

    @Override // ib0.g
    public final ib0.i c(mb0.a aVar) {
        return this.f82528b ? xb0.e.f95758a : e(aVar, 0L, null);
    }

    public final l e(mb0.a aVar, long j11, TimeUnit timeUnit) {
        l lVar = new l(ub0.a.c(aVar));
        ScheduledExecutorService scheduledExecutorService = this.f82527a;
        lVar.f82534a.c(new j(lVar, j11 <= 0 ? scheduledExecutorService.submit(lVar) : scheduledExecutorService.schedule(lVar, j11, timeUnit)));
        return lVar;
    }
}
