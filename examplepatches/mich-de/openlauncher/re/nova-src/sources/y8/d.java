package y8;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class d implements g {

    /* renamed from: a, reason: collision with root package name */
    public final f f96842a;

    public d(f fVar) {
        this.f96842a = fVar;
    }

    @Override // y8.g
    public final Object a(m8.h hVar) {
        return this.f96842a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof d) {
            return Intrinsics.b(this.f96842a, ((d) obj).f96842a);
        }
        return false;
    }

    public final int hashCode() {
        return this.f96842a.hashCode();
    }
}
