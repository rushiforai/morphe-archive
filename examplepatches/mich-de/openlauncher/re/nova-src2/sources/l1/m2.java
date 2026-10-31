package l1;

import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class m2 {

    /* renamed from: a, reason: collision with root package name */
    public final Object f73638a;

    /* renamed from: b, reason: collision with root package name */
    public final x1.e f73639b;

    public m2(y6 y6Var, x1.e eVar) {
        this.f73638a = y6Var;
        this.f73639b = eVar;
    }

    public final Object a() {
        return this.f73638a;
    }

    public final Function3 b() {
        return this.f73639b;
    }

    public final Object c() {
        return this.f73638a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m2)) {
            return false;
        }
        m2 m2Var = (m2) obj;
        return Intrinsics.b(this.f73638a, m2Var.f73638a) && this.f73639b.equals(m2Var.f73639b);
    }

    public final int hashCode() {
        Object obj = this.f73638a;
        return this.f73639b.hashCode() + ((obj == null ? 0 : obj.hashCode()) * 31);
    }

    public final String toString() {
        return "FadeInFadeOutAnimationItem(key=" + this.f73638a + ", transition=" + this.f73639b + ')';
    }
}
