package c0;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class l1 implements c0 {

    /* renamed from: a, reason: collision with root package name */
    public final float f18867a;

    /* renamed from: b, reason: collision with root package name */
    public final float f18868b;

    /* renamed from: c, reason: collision with root package name */
    public final Object f18869c;

    public l1(float f11, float f12, Object obj) {
        this.f18867a = f11;
        this.f18868b = f12;
        this.f18869c = obj;
    }

    @Override // c0.m
    public final j2 a(i2 i2Var) {
        Object obj = this.f18869c;
        return new a5.d(this.f18867a, this.f18868b, obj == null ? null : (s) i2Var.f18832a.invoke(obj));
    }

    public final boolean equals(Object obj) {
        if (obj instanceof l1) {
            l1 l1Var = (l1) obj;
            if (l1Var.f18867a == this.f18867a && l1Var.f18868b == this.f18868b && Intrinsics.b(l1Var.f18869c, this.f18869c)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        Object obj = this.f18869c;
        return Float.hashCode(this.f18868b) + a80.m.d(this.f18867a, (obj != null ? obj.hashCode() : 0) * 31, 31);
    }

    public /* synthetic */ l1(float f11, int i5, Object obj) {
        this(1.0f, (i5 & 2) != 0 ? 1500.0f : f11, (i5 & 4) != 0 ? null : obj);
    }
}
