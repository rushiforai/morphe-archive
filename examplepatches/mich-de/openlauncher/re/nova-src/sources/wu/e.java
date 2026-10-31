package wu;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e extends h {

    /* renamed from: b, reason: collision with root package name */
    public final g f94695b;

    public e(g gVar) {
        super(gVar);
        this.f94695b = gVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof e) && Intrinsics.b(this.f94695b, ((e) obj).f94695b);
    }

    public final int hashCode() {
        g gVar = this.f94695b;
        if (gVar == null) {
            return 0;
        }
        return gVar.f94697a.hashCode();
    }

    public final String toString() {
        return "Reset(message=" + this.f94695b + ")";
    }
}
