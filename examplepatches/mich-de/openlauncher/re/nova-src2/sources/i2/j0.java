package i2;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class j0 extends r0 {

    /* renamed from: b, reason: collision with root package name */
    public final h2.c f61125b;

    public j0(h2.c cVar) {
        this.f61125b = cVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof j0) {
            return Intrinsics.b(this.f61125b, ((j0) obj).f61125b);
        }
        return false;
    }

    public final int hashCode() {
        return this.f61125b.hashCode();
    }

    @Override // i2.r0
    public final h2.c j() {
        return this.f61125b;
    }
}
