package jr;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c0 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f69648a;

    /* renamed from: b, reason: collision with root package name */
    public final String f69649b;

    public c0(boolean z11, String str) {
        this.f69648a = z11;
        this.f69649b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c0)) {
            return false;
        }
        c0 c0Var = (c0) obj;
        return this.f69648a == c0Var.f69648a && Intrinsics.b(this.f69649b, c0Var.f69649b);
    }

    public final int hashCode() {
        int iHashCode = Boolean.hashCode(this.f69648a) * 31;
        String str = this.f69649b;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return "SelectionConfirmationState(isConfirming=" + this.f69648a + ", error=" + this.f69649b + ")";
    }
}
