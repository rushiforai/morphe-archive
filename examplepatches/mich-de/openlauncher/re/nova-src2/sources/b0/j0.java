package b0;

import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class j0 {

    /* renamed from: a, reason: collision with root package name */
    public final b2.f f16151a;

    /* renamed from: b, reason: collision with root package name */
    public final Function1 f16152b;

    /* renamed from: c, reason: collision with root package name */
    public final c0.c0 f16153c;

    public j0(b2.f fVar, c0.c0 c0Var, Function1 function1) {
        this.f16151a = fVar;
        this.f16152b = function1;
        this.f16153c = c0Var;
    }

    public final b2.f a() {
        return this.f16151a;
    }

    public final c0.c0 b() {
        return this.f16153c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j0)) {
            return false;
        }
        j0 j0Var = (j0) obj;
        return Intrinsics.b(this.f16151a, j0Var.f16151a) && Intrinsics.b(this.f16152b, j0Var.f16152b) && Intrinsics.b(this.f16153c, j0Var.f16153c);
    }

    public final int hashCode() {
        return Boolean.hashCode(true) + ((this.f16153c.hashCode() + ((this.f16152b.hashCode() + (this.f16151a.hashCode() * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "ChangeSize(alignment=" + this.f16151a + ", size=" + this.f16152b + ", animationSpec=" + this.f16153c + ", clip=true)";
    }
}
