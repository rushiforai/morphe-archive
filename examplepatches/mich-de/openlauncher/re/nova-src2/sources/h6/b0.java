package h6;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class b0 {

    /* renamed from: a, reason: collision with root package name */
    public t f59329a;

    /* renamed from: b, reason: collision with root package name */
    public y f59330b;

    public final void a(a0 a0Var, s sVar) {
        t tVarA = sVar.a();
        t state1 = this.f59329a;
        Intrinsics.g(state1, "state1");
        if (tVarA.compareTo(state1) < 0) {
            state1 = tVarA;
        }
        this.f59329a = state1;
        this.f59330b.d(a0Var, sVar);
        this.f59329a = tVarA;
    }
}
