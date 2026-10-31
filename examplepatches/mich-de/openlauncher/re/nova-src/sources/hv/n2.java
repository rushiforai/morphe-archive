package hv;

import b.c9;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class n2 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f60424a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f60425b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f60426c;

    /* renamed from: d, reason: collision with root package name */
    public final Function0 f60427d;

    public n2(boolean z11, boolean z12, boolean z13, Function0 onEditIconPressed) {
        Intrinsics.g(onEditIconPressed, "onEditIconPressed");
        this.f60424a = z11;
        this.f60425b = z12;
        this.f60426c = z13;
        this.f60427d = onEditIconPressed;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n2)) {
            return false;
        }
        n2 n2Var = (n2) obj;
        return this.f60424a == n2Var.f60424a && this.f60425b == n2Var.f60425b && this.f60426c == n2Var.f60426c && Intrinsics.b(this.f60427d, n2Var.f60427d);
    }

    public final int hashCode() {
        return this.f60427d.hashCode() + c9.f(c9.f(Boolean.hashCode(this.f60424a) * 31, 31, this.f60425b), 31, this.f60426c);
    }

    public final String toString() {
        return "PaymentSheetTopBarState(showTestModeLabel=" + this.f60424a + ", showEditMenu=" + this.f60425b + ", isEditing=" + this.f60426c + ", onEditIconPressed=" + this.f60427d + ")";
    }
}
