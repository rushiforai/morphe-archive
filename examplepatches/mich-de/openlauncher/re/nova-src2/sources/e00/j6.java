package e00;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j6 {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f50597a;

    /* renamed from: b, reason: collision with root package name */
    public final String f50598b;

    public j6(boolean z11, String str) {
        this.f50597a = z11;
        this.f50598b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j6)) {
            return false;
        }
        j6 j6Var = (j6) obj;
        return this.f50597a == j6Var.f50597a && Intrinsics.b(this.f50598b, j6Var.f50598b);
    }

    public final int hashCode() {
        return this.f50598b.hashCode() + (Boolean.hashCode(this.f50597a) * 31);
    }

    public final String toString() {
        return "TestResult(passed=" + this.f50597a + ", message=" + this.f50598b + ")";
    }
}
