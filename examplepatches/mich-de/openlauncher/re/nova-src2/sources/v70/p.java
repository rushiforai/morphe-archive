package v70;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class p extends q {

    /* renamed from: a, reason: collision with root package name */
    public final Throwable f92192a;

    public p(Throwable th2) {
        this.f92192a = th2;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof p) {
            return Intrinsics.b(this.f92192a, ((p) obj).f92192a);
        }
        return false;
    }

    public final int hashCode() {
        Throwable th2 = this.f92192a;
        if (th2 != null) {
            return th2.hashCode();
        }
        return 0;
    }

    @Override // v70.q
    public final String toString() {
        return "Closed(" + this.f92192a + ')';
    }
}
