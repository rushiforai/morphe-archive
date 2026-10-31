package c0;

import b.u4;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class o0 {

    /* renamed from: a, reason: collision with root package name */
    public final Float f18892a;

    /* renamed from: b, reason: collision with root package name */
    public a0 f18893b;

    public o0(Float f11, a0 a0Var) {
        this.f18892a = f11;
        this.f18893b = a0Var;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof o0)) {
            return false;
        }
        o0 o0Var = (o0) obj;
        return o0Var.f18892a.equals(this.f18892a) && Intrinsics.b(o0Var.f18893b, this.f18893b);
    }

    public final int hashCode() {
        return this.f18893b.hashCode() + u4.a(0, this.f18892a.hashCode() * 31, 31);
    }
}
