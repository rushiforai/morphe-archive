package bw;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final String f18668a;

    /* renamed from: b, reason: collision with root package name */
    public final Integer f18669b;

    /* renamed from: c, reason: collision with root package name */
    public final Integer f18670c;

    public m(String str, Integer num, Integer num2) {
        this.f18668a = str;
        this.f18669b = num;
        this.f18670c = num2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m)) {
            return false;
        }
        m mVar = (m) obj;
        return Intrinsics.b(this.f18668a, mVar.f18668a) && Intrinsics.b(this.f18669b, mVar.f18669b) && Intrinsics.b(this.f18670c, mVar.f18670c);
    }

    public final int hashCode() {
        int iHashCode = this.f18668a.hashCode() * 31;
        Integer num = this.f18669b;
        int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
        Integer num2 = this.f18670c;
        return iHashCode2 + (num2 != null ? num2.hashCode() : 0);
    }

    public final String toString() {
        return "ScannedCard(pan=" + this.f18668a + ", expirationMonth=" + this.f18669b + ", expirationYear=" + this.f18670c + ")";
    }
}
