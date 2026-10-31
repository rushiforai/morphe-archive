package l1;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class z5 {

    /* renamed from: a, reason: collision with root package name */
    public final s0.a f74364a;

    /* renamed from: b, reason: collision with root package name */
    public final s0.a f74365b;

    /* renamed from: c, reason: collision with root package name */
    public final s0.a f74366c;

    /* renamed from: d, reason: collision with root package name */
    public final s0.a f74367d;

    /* renamed from: e, reason: collision with root package name */
    public final s0.a f74368e;

    public z5() {
        s0.g gVar = y5.f74310a;
        s0.g gVar2 = y5.f74311b;
        s0.g gVar3 = y5.f74312c;
        s0.g gVar4 = y5.f74313d;
        s0.g gVar5 = y5.f74314e;
        this.f74364a = gVar;
        this.f74365b = gVar2;
        this.f74366c = gVar3;
        this.f74367d = gVar4;
        this.f74368e = gVar5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z5)) {
            return false;
        }
        z5 z5Var = (z5) obj;
        return Intrinsics.b(this.f74364a, z5Var.f74364a) && Intrinsics.b(this.f74365b, z5Var.f74365b) && Intrinsics.b(this.f74366c, z5Var.f74366c) && Intrinsics.b(this.f74367d, z5Var.f74367d) && Intrinsics.b(this.f74368e, z5Var.f74368e);
    }

    public final int hashCode() {
        return this.f74368e.hashCode() + ((this.f74367d.hashCode() + ((this.f74366c.hashCode() + ((this.f74365b.hashCode() + (this.f74364a.hashCode() * 31)) * 31)) * 31)) * 31);
    }

    public final String toString() {
        return "Shapes(extraSmall=" + this.f74364a + ", small=" + this.f74365b + ", medium=" + this.f74366c + ", large=" + this.f74367d + ", extraLarge=" + this.f74368e + ')';
    }
}
