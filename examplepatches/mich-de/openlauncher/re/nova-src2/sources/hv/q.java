package hv;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class q {

    /* renamed from: a, reason: collision with root package name */
    public final p f60503a;

    /* renamed from: b, reason: collision with root package name */
    public final a1 f60504b;

    public q(p pVar, a1 a1Var) {
        this.f60503a = pVar;
        this.f60504b = a1Var;
    }

    public static q a(q qVar, p cardBrandChoice, a1 a1Var, int i5) {
        if ((i5 & 1) != 0) {
            cardBrandChoice = qVar.f60503a;
        }
        if ((i5 & 2) != 0) {
            a1Var = qVar.f60504b;
        }
        Intrinsics.g(cardBrandChoice, "cardBrandChoice");
        return new q(cardBrandChoice, a1Var);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q)) {
            return false;
        }
        q qVar = (q) obj;
        return Intrinsics.b(this.f60503a, qVar.f60503a) && Intrinsics.b(this.f60504b, qVar.f60504b);
    }

    public final int hashCode() {
        return this.f60504b.hashCode() + (this.f60503a.hashCode() * 31);
    }

    public final String toString() {
        return "CardDetailsEntry(cardBrandChoice=" + this.f60503a + ", expiryDateState=" + this.f60504b + ")";
    }
}
