package b0;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class h1 {

    /* renamed from: a, reason: collision with root package name */
    public final c0.c0 f16138a;

    public h1(c0.c0 c0Var) {
        this.f16138a = c0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof h1) {
            return Float.compare(0.0f, 0.0f) == 0 && Intrinsics.b(this.f16138a, ((h1) obj).f16138a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f16138a.hashCode() + (Float.hashCode(0.0f) * 31);
    }

    public final String toString() {
        return "Fade(alpha=0.0, animationSpec=" + this.f16138a + ')';
    }
}
