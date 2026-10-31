package c0;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class n2 {

    /* renamed from: a, reason: collision with root package name */
    public final s f18889a;

    /* renamed from: b, reason: collision with root package name */
    public final a0 f18890b;

    public n2(s sVar, a0 a0Var) {
        this.f18889a = sVar;
        this.f18890b = a0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n2)) {
            return false;
        }
        n2 n2Var = (n2) obj;
        return Intrinsics.b(this.f18889a, n2Var.f18889a) && Intrinsics.b(this.f18890b, n2Var.f18890b);
    }

    public final int hashCode() {
        return Integer.hashCode(0) + ((this.f18890b.hashCode() + (this.f18889a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        return "VectorizedKeyframeSpecElementInfo(vectorValue=" + this.f18889a + ", easing=" + this.f18890b + ", arcMode=ArcMode(value=0))";
    }
}
