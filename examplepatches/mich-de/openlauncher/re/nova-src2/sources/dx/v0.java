package dx;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class v0 implements w0 {

    /* renamed from: a, reason: collision with root package name */
    public final n f49806a;

    public v0(n nVar) {
        this.f49806a = nVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof v0) && Intrinsics.b(this.f49806a, ((v0) obj).f49806a);
    }

    public final int hashCode() {
        return this.f49806a.hashCode();
    }

    public final String toString() {
        return "Failed(reason=" + this.f49806a + ")";
    }
}
