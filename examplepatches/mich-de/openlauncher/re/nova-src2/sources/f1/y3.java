package f1;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class y3 {

    /* renamed from: a, reason: collision with root package name */
    public final s0.a f54131a;

    /* renamed from: b, reason: collision with root package name */
    public final s0.a f54132b;

    /* renamed from: c, reason: collision with root package name */
    public final s0.a f54133c;

    public y3(s0.a aVar, s0.a aVar2, s0.a aVar3) {
        this.f54131a = aVar;
        this.f54132b = aVar2;
        this.f54133c = aVar3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof y3)) {
            return false;
        }
        y3 y3Var = (y3) obj;
        return Intrinsics.b(this.f54131a, y3Var.f54131a) && Intrinsics.b(this.f54132b, y3Var.f54132b) && Intrinsics.b(this.f54133c, y3Var.f54133c);
    }

    public final int hashCode() {
        return this.f54133c.hashCode() + ((this.f54132b.hashCode() + (this.f54131a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        return "Shapes(small=" + this.f54131a + ", medium=" + this.f54132b + ", large=" + this.f54133c + ')';
    }
}
