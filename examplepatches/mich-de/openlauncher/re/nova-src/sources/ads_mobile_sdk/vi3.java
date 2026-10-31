package ads_mobile_sdk;

import b.o2;
import b.v7;
import cl.m0;
import cl.r0;
import cl.u0;

/* loaded from: classes2.dex */
public final class vi3 {

    /* renamed from: a, reason: collision with root package name */
    public final v7 f10792a;

    /* renamed from: b, reason: collision with root package name */
    public final o2 f10793b;

    public vi3(o2 o2Var, v7 v7Var) {
        this.f10792a = v7Var;
        this.f10793b = o2Var;
    }

    public final void a(yk0 yk0Var, r0 r0Var) {
        sh3 sh3Var = new sh3(yk0Var, this.f10793b, this.f10792a);
        sh3Var.b();
        r0Var.b(new u0(0, r0Var, new au(sh3Var, 16)), m0.f20038a);
    }

    public final void b(yk0 yk0Var) {
        ((qm1) this.f10792a).a(yk0Var.f12178a, -1L, null, null);
    }

    public final sh3 a(yk0 yk0Var) {
        return new sh3(yk0Var, this.f10793b, this.f10792a);
    }

    public final void a(yk0 yk0Var, Runnable runnable) {
        try {
            new sh3(yk0Var, this.f10793b, this.f10792a).b();
            runnable.run();
        } finally {
        }
    }
}
