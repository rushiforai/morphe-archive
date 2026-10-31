package k0;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class a0 implements a3.d {

    /* renamed from: a, reason: collision with root package name */
    public final Function1 f70556a;

    /* renamed from: b, reason: collision with root package name */
    public g2 f70557b;

    public a0(Function1 function1) {
        this.f70556a = function1;
    }

    @Override // a3.d
    public final void b(a3.j jVar) {
        g2 g2Var = (g2) jVar.getCurrent(i2.f70646a);
        if (Intrinsics.b(g2Var, this.f70557b)) {
            return;
        }
        this.f70557b = g2Var;
        this.f70556a.invoke(g2Var);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof a0) && ((a0) obj).f70556a == this.f70556a;
    }

    public final int hashCode() {
        return this.f70556a.hashCode();
    }
}
