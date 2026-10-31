package c0;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class h2 implements z {

    /* renamed from: a, reason: collision with root package name */
    public final int f18824a;

    /* renamed from: b, reason: collision with root package name */
    public final int f18825b;

    /* renamed from: c, reason: collision with root package name */
    public final a0 f18826c;

    public h2(int i5, a0 a0Var, int i11) {
        this((i11 & 1) != 0 ? 300 : i5, 0, (i11 & 4) != 0 ? b0.f18710a : a0Var);
    }

    @Override // c0.m
    public final j2 a(i2 i2Var) {
        return new bg.e(this.f18824a, this.f18825b, this.f18826c);
    }

    public final boolean equals(Object obj) {
        if (obj instanceof h2) {
            h2 h2Var = (h2) obj;
            if (h2Var.f18824a == this.f18824a && h2Var.f18825b == this.f18825b && Intrinsics.b(h2Var.f18826c, this.f18826c)) {
                return true;
            }
        }
        return false;
    }

    public final int hashCode() {
        return ((this.f18826c.hashCode() + (this.f18824a * 31)) * 31) + this.f18825b;
    }

    @Override // c0.z, c0.m
    public final l2 a(i2 i2Var) {
        return new bg.e(this.f18824a, this.f18825b, this.f18826c);
    }

    public h2(int i5, int i11, a0 a0Var) {
        this.f18824a = i5;
        this.f18825b = i11;
        this.f18826c = a0Var;
    }
}
