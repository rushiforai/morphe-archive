package xu;

import com.stripe.android.core.strings.IdentifierResolvableString;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final IdentifierResolvableString f96327a;

    public a(IdentifierResolvableString identifierResolvableString) {
        this.f96327a = identifierResolvableString;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof a) && this.f96327a.equals(((a) obj).f96327a);
    }

    public final int hashCode() {
        return Boolean.hashCode(false) + (this.f96327a.hashCode() * 31);
    }

    public final String toString() {
        return "BuyButtonOverride(label=" + this.f96327a + ", lockEnabled=false)";
    }
}
