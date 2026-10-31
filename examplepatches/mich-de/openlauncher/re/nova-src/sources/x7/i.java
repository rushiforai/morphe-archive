package x7;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class i {

    /* renamed from: a, reason: collision with root package name */
    public final String f95141a;

    /* renamed from: b, reason: collision with root package name */
    public final int f95142b;

    public i(String workSpecId, int i5) {
        Intrinsics.g(workSpecId, "workSpecId");
        this.f95141a = workSpecId;
        this.f95142b = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        return Intrinsics.b(this.f95141a, iVar.f95141a) && this.f95142b == iVar.f95142b;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f95142b) + (this.f95141a.hashCode() * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("WorkGenerationalId(workSpecId=");
        sb2.append(this.f95141a);
        sb2.append(", generation=");
        return a2.c.m(sb2, this.f95142b, ')');
    }
}
