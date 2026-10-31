package e0;

import androidx.compose.foundation.MutationInterruptedException;

/* loaded from: classes2.dex */
public final class g1 {

    /* renamed from: a, reason: collision with root package name */
    public final f1 f49999a;

    /* renamed from: b, reason: collision with root package name */
    public final t70.r1 f50000b;

    public g1(f1 f1Var, t70.r1 r1Var) {
        this.f49999a = f1Var;
        this.f50000b = r1Var;
    }

    public final boolean a(g1 g1Var) {
        return this.f49999a.compareTo(g1Var.f49999a) >= 0;
    }

    public final void b() {
        this.f50000b.c(new MutationInterruptedException());
    }
}
