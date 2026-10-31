package p1;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a3 implements b3 {

    /* renamed from: a, reason: collision with root package name */
    public final Object f81383a;

    public a3(Object obj) {
        this.f81383a = obj;
    }

    @Override // p1.b3
    public final Object a(n1 n1Var) {
        return this.f81383a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof a3) && Intrinsics.b(this.f81383a, ((a3) obj).f81383a);
    }

    public final int hashCode() {
        Object obj = this.f81383a;
        if (obj == null) {
            return 0;
        }
        return obj.hashCode();
    }

    public final String toString() {
        return com.google.android.gms.internal.measurement.k2.j(new StringBuilder("StaticValueHolder(value="), this.f81383a, ')');
    }
}
