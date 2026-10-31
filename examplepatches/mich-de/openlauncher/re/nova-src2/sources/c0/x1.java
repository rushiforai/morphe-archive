package c0;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class x1 implements w1 {

    /* renamed from: a, reason: collision with root package name */
    public final Object f19008a;

    /* renamed from: b, reason: collision with root package name */
    public final Object f19009b;

    public x1(Object obj, Object obj2) {
        this.f19008a = obj;
        this.f19009b = obj2;
    }

    @Override // c0.w1
    public final Object a() {
        return this.f19009b;
    }

    @Override // c0.w1
    public final Object b() {
        return this.f19008a;
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof w1)) {
            return false;
        }
        w1 w1Var = (w1) obj;
        return Intrinsics.b(this.f19008a, w1Var.b()) && Intrinsics.b(this.f19009b, w1Var.a());
    }

    public final int hashCode() {
        Object obj = this.f19008a;
        int iHashCode = (obj != null ? obj.hashCode() : 0) * 31;
        Object obj2 = this.f19009b;
        return iHashCode + (obj2 != null ? obj2.hashCode() : 0);
    }
}
