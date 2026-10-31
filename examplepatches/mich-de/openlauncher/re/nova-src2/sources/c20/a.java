package c20;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f19183a;

    /* renamed from: b, reason: collision with root package name */
    public final String f19184b;

    public a(boolean z11, String str) {
        this.f19183a = z11;
        this.f19184b = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return this.f19183a == aVar.f19183a && Intrinsics.b(this.f19184b, aVar.f19184b);
    }

    public final int hashCode() {
        return this.f19184b.hashCode() + (Boolean.hashCode(this.f19183a) * 31);
    }

    public final String toString() {
        return "PendingConditionUpdate(hasPendingCondition=" + this.f19183a + ", adjustedConditionText=" + this.f19184b + ")";
    }
}
