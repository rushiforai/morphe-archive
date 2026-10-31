package e0;

import com.google.android.gms.internal.measurement.k2;
import java.util.concurrent.CancellationException;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: classes.dex */
public final class j1 {

    /* renamed from: a, reason: collision with root package name */
    public final AtomicReference f50033a = new AtomicReference(null);

    /* renamed from: b, reason: collision with root package name */
    public final c80.d f50034b = new c80.d();

    public static final void a(j1 j1Var, g1 g1Var) {
        g1 g1Var2;
        AtomicReference atomicReference = j1Var.f50033a;
        do {
            g1Var2 = (g1) atomicReference.get();
            if (g1Var2 != null && !g1Var.a(g1Var2)) {
                throw new CancellationException("Current mutation had a higher priority");
            }
        } while (!k2.x(atomicReference, g1Var2, g1Var));
        if (g1Var2 != null) {
            g1Var2.b();
        }
    }
}
