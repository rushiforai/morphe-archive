package kb0;

import android.os.Looper;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes5.dex */
public final class a {

    /* renamed from: b, reason: collision with root package name */
    public static final AtomicReference f71314b = new AtomicReference();

    /* renamed from: a, reason: collision with root package name */
    public final d f71315a;

    public a() {
        AtomicReference atomicReference = jb0.a.f69426b.f69427a;
        if (atomicReference.get() == null) {
            while (!atomicReference.compareAndSet(null, jb0.b.f69428a) && atomicReference.get() == null) {
            }
        }
        ((jb0.b) atomicReference.get()).getClass();
        this.f71315a = new d(Looper.getMainLooper());
    }

    public static d a() {
        a aVar;
        loop0: while (true) {
            AtomicReference atomicReference = f71314b;
            aVar = (a) atomicReference.get();
            if (aVar == null) {
                aVar = new a();
                while (!atomicReference.compareAndSet(null, aVar)) {
                    if (atomicReference.get() != null) {
                        break;
                    }
                }
                break loop0;
            }
            break;
        }
        return aVar.f71315a;
    }
}
