package tx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class x1 extends a2 {

    /* renamed from: b, reason: collision with root package name */
    public final Long f90058b;

    public x1(Long l9) {
        super("temporary_failure");
        this.f90058b = l9;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof x1) && Intrinsics.b(this.f90058b, ((x1) obj).f90058b);
    }

    public final int hashCode() {
        Long l9 = this.f90058b;
        if (l9 == null) {
            return 0;
        }
        return l9.hashCode();
    }

    public final String toString() {
        return "TemporaryFailure(retryAfterSeconds=" + this.f90058b + ")";
    }
}
