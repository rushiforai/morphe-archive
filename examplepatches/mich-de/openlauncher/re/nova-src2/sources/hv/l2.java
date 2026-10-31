package hv;

import b.c9;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l2 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f60385a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f60386b;

    /* renamed from: c, reason: collision with root package name */
    public final Function0 f60387c;

    public l2(boolean z11, boolean z12, Function0 onEditIconPressed) {
        Intrinsics.g(onEditIconPressed, "onEditIconPressed");
        this.f60385a = z11;
        this.f60386b = z12;
        this.f60387c = onEditIconPressed;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l2)) {
            return false;
        }
        l2 l2Var = (l2) obj;
        return this.f60385a == l2Var.f60385a && this.f60386b == l2Var.f60386b && Intrinsics.b(this.f60387c, l2Var.f60387c);
    }

    public final int hashCode() {
        return this.f60387c.hashCode() + c9.f(Boolean.hashCode(this.f60385a) * 31, 31, this.f60386b);
    }

    public final String toString() {
        return "Maybe(isEditing=" + this.f60385a + ", canEdit=" + this.f60386b + ", onEditIconPressed=" + this.f60387c + ")";
    }
}
