package gx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e0 {

    /* renamed from: a, reason: collision with root package name */
    public final f0 f58063a;

    /* renamed from: b, reason: collision with root package name */
    public final String f58064b;

    public e0(f0 f0Var, String str) {
        this.f58063a = f0Var;
        this.f58064b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e0)) {
            return false;
        }
        e0 e0Var = (e0) obj;
        return Intrinsics.b(this.f58063a, e0Var.f58063a) && Intrinsics.b(this.f58064b, e0Var.f58064b);
    }

    public final int hashCode() {
        return this.f58064b.hashCode() + (this.f58063a.hashCode() * 31);
    }

    public final String toString() {
        return "LoadResult(ad=" + this.f58063a + ", requestId=" + this.f58064b + ")";
    }
}
