package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class p31 {

    /* renamed from: a, reason: collision with root package name */
    public final Integer f8065a;

    /* renamed from: b, reason: collision with root package name */
    public final Integer f8066b;

    /* renamed from: c, reason: collision with root package name */
    public final Integer f8067c;

    public p31(Integer num, Integer num2, Integer num3) {
        this.f8065a = num;
        this.f8066b = num2;
        this.f8067c = num3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p31)) {
            return false;
        }
        p31 p31Var = (p31) obj;
        return Intrinsics.b(this.f8065a, p31Var.f8065a) && Intrinsics.b(this.f8066b, p31Var.f8066b) && Intrinsics.b(this.f8067c, p31Var.f8067c);
    }

    public final int hashCode() {
        Integer num = this.f8065a;
        int iHashCode = (num == null ? 0 : num.hashCode()) * 31;
        Integer num2 = this.f8066b;
        int iHashCode2 = (iHashCode + (num2 == null ? 0 : num2.hashCode())) * 31;
        Integer num3 = this.f8067c;
        return iHashCode2 + (num3 != null ? num3.hashCode() : 0);
    }

    public final String toString() {
        return "ImpressionSequences(impressionSequence=" + this.f8065a + ", formatImpressionSequence=" + this.f8066b + ", slotFormatImpressionSequence=" + this.f8067c + ")";
    }
}
