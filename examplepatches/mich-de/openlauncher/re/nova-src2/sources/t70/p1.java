package t70;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class p1 extends t1 {

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ AtomicIntegerFieldUpdater f88850f = AtomicIntegerFieldUpdater.newUpdater(p1.class, "_invoked$volatile");
    private volatile /* synthetic */ int _invoked$volatile;

    /* renamed from: e, reason: collision with root package name */
    public final Function1 f88851e;

    public p1(Function1 function1) {
        this.f88851e = function1;
    }

    @Override // t70.t1
    public final boolean j() {
        return true;
    }

    @Override // t70.t1
    public final void k(Throwable th2) {
        if (f88850f.compareAndSet(this, 0, 1)) {
            this.f88851e.invoke(th2);
        }
    }
}
