package bn;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final nm.c f18246a;

    public m(nm.c transportFactoryProvider) {
        Intrinsics.g(transportFactoryProvider, "transportFactoryProvider");
        this.f18246a = transportFactoryProvider;
    }

    public final void a(m0 m0Var) {
        ((td.o) ((qd.g) this.f18246a.get())).a("FIREBASE_APPQUALITY_SESSION", new qd.c("json"), new bb.a(this)).a(new qd.a(m0Var, qd.d.f83918a, null), new ll.i(16));
    }
}
