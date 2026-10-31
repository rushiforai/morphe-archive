package m90;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public class e extends l0 {

    /* renamed from: h, reason: collision with root package name */
    public static final ReentrantLock f76107h;

    /* renamed from: i, reason: collision with root package name */
    public static final Condition f76108i;

    /* renamed from: j, reason: collision with root package name */
    public static final long f76109j;

    /* renamed from: k, reason: collision with root package name */
    public static final long f76110k;

    /* renamed from: l, reason: collision with root package name */
    public static e f76111l;

    /* renamed from: e, reason: collision with root package name */
    public boolean f76112e;

    /* renamed from: f, reason: collision with root package name */
    public e f76113f;

    /* renamed from: g, reason: collision with root package name */
    public long f76114g;

    static {
        ReentrantLock reentrantLock = new ReentrantLock();
        f76107h = reentrantLock;
        Condition conditionNewCondition = reentrantLock.newCondition();
        Intrinsics.f(conditionNewCondition, "newCondition(...)");
        f76108i = conditionNewCondition;
        long millis = TimeUnit.SECONDS.toMillis(60L);
        f76109j = millis;
        f76110k = TimeUnit.MILLISECONDS.toNanos(millis);
    }

    public final void h() {
        e eVar;
        long j11 = this.f76143c;
        boolean z11 = this.f76141a;
        if (j11 != 0 || z11) {
            ReentrantLock reentrantLock = f76107h;
            reentrantLock.lock();
            try {
                if (this.f76112e) {
                    throw new IllegalStateException("Unbalanced enter/exit");
                }
                this.f76112e = true;
                if (f76111l == null) {
                    f76111l = new e();
                    b bVar = new b("Okio Watchdog");
                    bVar.setDaemon(true);
                    bVar.start();
                }
                long jNanoTime = System.nanoTime();
                if (j11 != 0 && z11) {
                    this.f76114g = Math.min(j11, c() - jNanoTime) + jNanoTime;
                } else if (j11 != 0) {
                    this.f76114g = j11 + jNanoTime;
                } else {
                    if (!z11) {
                        throw new AssertionError();
                    }
                    this.f76114g = c();
                }
                long j12 = this.f76114g - jNanoTime;
                e eVar2 = f76111l;
                Intrinsics.d(eVar2);
                while (true) {
                    eVar = eVar2.f76113f;
                    if (eVar == null || j12 < eVar.f76114g - jNanoTime) {
                        break;
                    } else {
                        eVar2 = eVar;
                    }
                }
                this.f76113f = eVar;
                eVar2.f76113f = this;
                if (eVar2 == f76111l) {
                    f76108i.signal();
                }
                Unit unit = Unit.f71706a;
                reentrantLock.unlock();
            } catch (Throwable th2) {
                reentrantLock.unlock();
                throw th2;
            }
        }
    }

    public final boolean i() {
        ReentrantLock reentrantLock = f76107h;
        reentrantLock.lock();
        try {
            if (!this.f76112e) {
                return false;
            }
            this.f76112e = false;
            e eVar = f76111l;
            while (eVar != null) {
                e eVar2 = eVar.f76113f;
                if (eVar2 == this) {
                    eVar.f76113f = this.f76113f;
                    this.f76113f = null;
                    return false;
                }
                eVar = eVar2;
            }
            reentrantLock.unlock();
            return true;
        } finally {
            reentrantLock.unlock();
        }
    }

    public void j() {
    }
}
