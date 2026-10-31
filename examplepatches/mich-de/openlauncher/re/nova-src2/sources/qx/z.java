package qx;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class z {

    /* renamed from: a, reason: collision with root package name */
    public final List f84658a;

    /* renamed from: b, reason: collision with root package name */
    public final e f84659b;

    public z(List list, e eVar) {
        this.f84658a = list;
        this.f84659b = eVar;
    }

    public final List a() {
        return this.f84658a;
    }

    public final e b() {
        return this.f84659b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof z)) {
            return false;
        }
        z zVar = (z) obj;
        return Intrinsics.b(this.f84658a, zVar.f84658a) && Intrinsics.b(this.f84659b, zVar.f84659b);
    }

    public final int hashCode() {
        int iHashCode = this.f84658a.hashCode() * 31;
        e eVar = this.f84659b;
        return iHashCode + (eVar == null ? 0 : eVar.hashCode());
    }

    public final String toString() {
        return "BatchResult(ads=" + this.f84658a + ", lastError=" + this.f84659b + ")";
    }
}
