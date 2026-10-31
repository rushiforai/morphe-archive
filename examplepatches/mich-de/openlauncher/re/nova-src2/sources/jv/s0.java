package jv;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class s0 implements u0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f70155a;

    /* renamed from: b, reason: collision with root package name */
    public final String f70156b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f70157c;

    public /* synthetic */ s0(String str) {
        this(str, null, false);
    }

    @Override // jv.u0
    public final boolean a() {
        return Intrinsics.b(this, t0.f70170a);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s0)) {
            return false;
        }
        s0 s0Var = (s0) obj;
        return Intrinsics.b(this.f70155a, s0Var.f70155a) && Intrinsics.b(this.f70156b, s0Var.f70156b) && this.f70157c == s0Var.f70157c;
    }

    public final int hashCode() {
        int iHashCode = this.f70155a.hashCode() * 31;
        String str = this.f70156b;
        return Boolean.hashCode(this.f70157c) + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        return a80.m.k(b.c0.w("New(code=", this.f70155a, ", changeDetails=", this.f70156b, ", canBeChanged="), this.f70157c, ")");
    }

    public s0(String code, String str, boolean z11) {
        Intrinsics.g(code, "code");
        this.f70155a = code;
        this.f70156b = str;
        this.f70157c = z11;
    }
}
