package t70;

import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import kotlin.coroutines.intrinsics.IntrinsicsKt;
import kotlinx.coroutines.DispatchException;

/* loaded from: classes.dex */
public final class u0 extends y70.s {

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ AtomicIntegerFieldUpdater f88866e = AtomicIntegerFieldUpdater.newUpdater(u0.class, "_decision$volatile");
    private volatile /* synthetic */ int _decision$volatile;

    @Override // y70.s, t70.x1
    public final void u(Object obj) throws DispatchException {
        v(obj);
    }

    @Override // y70.s, t70.x1
    public final void v(Object obj) throws DispatchException {
        AtomicIntegerFieldUpdater atomicIntegerFieldUpdater;
        do {
            atomicIntegerFieldUpdater = f88866e;
            int i5 = atomicIntegerFieldUpdater.get(this);
            if (i5 != 0) {
                if (i5 != 1) {
                    throw new IllegalStateException("Already resumed");
                }
                y70.g.d(w.a(obj), IntrinsicsKt.b(this.f96824d));
                return;
            }
        } while (!atomicIntegerFieldUpdater.compareAndSet(this, 0, 2));
    }
}
