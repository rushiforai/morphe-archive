package hv;

import b.c9;
import com.stripe.android.CardBrandFilter;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class u {

    /* renamed from: a, reason: collision with root package name */
    public final CardBrandFilter f60607a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f60608b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f60609c;

    public u(CardBrandFilter cardBrandFilter, boolean z11, boolean z12) {
        Intrinsics.g(cardBrandFilter, "cardBrandFilter");
        this.f60607a = cardBrandFilter;
        this.f60608b = z11;
        this.f60609c = z12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u)) {
            return false;
        }
        u uVar = (u) obj;
        return Intrinsics.b(this.f60607a, uVar.f60607a) && this.f60608b == uVar.f60608b && this.f60609c == uVar.f60609c;
    }

    public final int hashCode() {
        return Boolean.hashCode(this.f60609c) + c9.f(this.f60607a.hashCode() * 31, 31, this.f60608b);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("CardEditConfiguration(cardBrandFilter=");
        sb2.append(this.f60607a);
        sb2.append(", isCbcModifiable=");
        sb2.append(this.f60608b);
        sb2.append(", areExpiryDateAndAddressModificationSupported=");
        return a80.m.k(sb2, this.f60609c, ")");
    }
}
