package q3;

import b.u4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class j0 implements n {

    /* renamed from: a, reason: collision with root package name */
    public final int f83570a;

    /* renamed from: b, reason: collision with root package name */
    public final b0 f83571b;

    /* renamed from: c, reason: collision with root package name */
    public final a0 f83572c;

    public j0(int i5, b0 b0Var, a0 a0Var) {
        this.f83570a = i5;
        this.f83571b = b0Var;
        this.f83572c = a0Var;
    }

    @Override // q3.n
    public final b0 a() {
        return this.f83571b;
    }

    @Override // q3.n
    public final int b() {
        return 0;
    }

    @Override // q3.n
    public final int c() {
        return 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j0)) {
            return false;
        }
        j0 j0Var = (j0) obj;
        return this.f83570a == j0Var.f83570a && Intrinsics.b(this.f83571b, j0Var.f83571b) && this.f83572c.equals(j0Var.f83572c);
    }

    public final int hashCode() {
        return this.f83572c.f83523a.hashCode() + u4.a(0, u4.a(0, ((this.f83570a * 31) + this.f83571b.f83539a) * 31, 31), 31);
    }

    public final String toString() {
        return "ResourceFont(resId=" + this.f83570a + ", weight=" + this.f83571b + ", style=" + ((Object) v.a(0)) + ", loadingStrategy=Blocking)";
    }
}
