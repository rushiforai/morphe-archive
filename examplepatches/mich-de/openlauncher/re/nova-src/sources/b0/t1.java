package b0;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Lambda;

/* loaded from: classes2.dex */
public final class t1 {

    /* renamed from: a, reason: collision with root package name */
    public final Lambda f16243a;

    /* renamed from: b, reason: collision with root package name */
    public final c0.c0 f16244b;

    /* JADX WARN: Multi-variable type inference failed */
    public t1(c0.c0 c0Var, Function1 function1) {
        this.f16243a = (Lambda) function1;
        this.f16244b = c0Var;
    }

    public final c0.c0 a() {
        return this.f16244b;
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [kotlin.jvm.functions.Function1, kotlin.jvm.internal.Lambda] */
    public final Function1 b() {
        return this.f16243a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t1)) {
            return false;
        }
        t1 t1Var = (t1) obj;
        return this.f16243a.equals(t1Var.f16243a) && this.f16244b.equals(t1Var.f16244b);
    }

    public final int hashCode() {
        return this.f16244b.hashCode() + (this.f16243a.hashCode() * 31);
    }

    public final String toString() {
        return "Slide(slideOffset=" + this.f16243a + ", animationSpec=" + this.f16244b + ')';
    }
}
