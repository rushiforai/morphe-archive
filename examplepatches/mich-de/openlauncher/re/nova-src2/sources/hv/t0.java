package hv;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class t0 implements w0 {

    /* renamed from: a, reason: collision with root package name */
    public final p f60597a;

    public t0(p cardBrandChoice) {
        Intrinsics.g(cardBrandChoice, "cardBrandChoice");
        this.f60597a = cardBrandChoice;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof t0) && Intrinsics.b(this.f60597a, ((t0) obj).f60597a);
    }

    public final int hashCode() {
        return this.f60597a.hashCode();
    }

    public final String toString() {
        return "BrandChoiceChanged(cardBrandChoice=" + this.f60597a + ")";
    }
}
