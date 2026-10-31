package l1;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class d7 implements y6 {

    /* renamed from: a, reason: collision with root package name */
    public final e7 f73192a;

    /* renamed from: b, reason: collision with root package name */
    public final t70.m f73193b;

    public d7(e7 e7Var, t70.m mVar) {
        this.f73192a = e7Var;
        this.f73193b = mVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || d7.class != obj.getClass()) {
            return false;
        }
        d7 d7Var = (d7) obj;
        return Intrinsics.b(this.f73192a, d7Var.f73192a) && this.f73193b.equals(d7Var.f73193b);
    }

    public final int hashCode() {
        return this.f73193b.hashCode() + (this.f73192a.hashCode() * 31);
    }
}
