package sx;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class l {

    /* renamed from: a, reason: collision with root package name */
    public final String f87801a;

    /* renamed from: b, reason: collision with root package name */
    public final o f87802b;

    /* renamed from: c, reason: collision with root package name */
    public final String f87803c;

    public l(String str, String str2, o oVar) {
        this.f87801a = str;
        this.f87802b = oVar;
        this.f87803c = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l)) {
            return false;
        }
        l lVar = (l) obj;
        return Intrinsics.b(this.f87801a, lVar.f87801a) && this.f87802b == lVar.f87802b && Intrinsics.b(this.f87803c, lVar.f87803c);
    }

    public final int hashCode() {
        return this.f87803c.hashCode() + ((this.f87802b.hashCode() + (this.f87801a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("DroppedTierKey(baseAdUnitId=");
        sb2.append(this.f87801a);
        sb2.append(", network=");
        sb2.append(this.f87802b);
        sb2.append(", tier=");
        return c0.q(sb2, this.f87803c, ")");
    }
}
