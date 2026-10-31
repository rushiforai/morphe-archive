package z1;

import b00.w0;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import t0.g0;

/* loaded from: classes.dex */
public final class a extends b {
    @Override // z1.b
    public final b C(Function1 function1, Function1 function12) {
        return (b) ((f) k.f(new w0(new g0(2, function1, function12), 3)));
    }

    @Override // z1.b, z1.f
    public final void c() {
        synchronized (k.f97943c) {
            o();
            Unit unit = Unit.f71706a;
        }
    }

    @Override // z1.b, z1.f
    public final void k() {
        t.a();
        throw null;
    }

    @Override // z1.b, z1.f
    public final void l() {
        t.a();
        throw null;
    }

    @Override // z1.b, z1.f
    public final void m() {
        k.a();
    }

    @Override // z1.b, z1.f
    public final f u(Function1 function1) {
        return (e) ((f) k.f(new w0(new f20.h(function1, 6), 3)));
    }

    @Override // z1.b
    public final w.b w() {
        throw new IllegalStateException("Cannot apply the global snapshot directly. Call Snapshot.advanceGlobalSnapshot");
    }
}
