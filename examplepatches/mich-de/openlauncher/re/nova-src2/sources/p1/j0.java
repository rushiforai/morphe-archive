package p1;

import kotlin.jvm.functions.Function1;

/* loaded from: classes.dex */
public final class j0 implements z1 {

    /* renamed from: a, reason: collision with root package name */
    public final Function1 f81457a;

    /* renamed from: b, reason: collision with root package name */
    public k0 f81458b;

    public j0(Function1 function1) {
        this.f81457a = function1;
    }

    @Override // p1.z1
    public final void a() {
        this.f81458b = (k0) this.f81457a.invoke(o0.f81517a);
    }

    @Override // p1.z1
    public final void g() {
    }

    @Override // p1.z1
    public final void i() {
        k0 k0Var = this.f81458b;
        if (k0Var != null) {
            k0Var.dispose();
        }
        this.f81458b = null;
    }
}
