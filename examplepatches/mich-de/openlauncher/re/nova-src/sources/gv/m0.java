package gv;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m0 extends q0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f57900a;

    /* renamed from: b, reason: collision with root package name */
    public final String f57901b;

    public m0(String requested) {
        Intrinsics.g(requested, "requested");
        this.f57900a = requested;
        this.f57901b = "noPaymentMethodTypesAvailable";
    }

    @Override // gv.q0
    public final String a() {
        return this.f57901b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof m0) && Intrinsics.b(this.f57900a, ((m0) obj).f57900a);
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        return b.c0.l("None of the requested payment methods (", this.f57900a, ") are supported.");
    }

    public final int hashCode() {
        return this.f57900a.hashCode();
    }

    @Override // java.lang.Throwable
    public final String toString() {
        return b.c0.l("NoPaymentMethodTypesAvailable(requested=", this.f57900a, ")");
    }
}
