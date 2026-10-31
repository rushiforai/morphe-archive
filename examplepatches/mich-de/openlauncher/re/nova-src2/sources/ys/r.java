package ys;

import com.stripe.android.core.strings.IdentifierResolvableString;
import com.stripe.android.core.strings.ResolvableString;

/* loaded from: classes4.dex */
public final class r extends u {

    /* renamed from: d, reason: collision with root package name */
    public final IdentifierResolvableString f97554d;

    public r(IdentifierResolvableString identifierResolvableString) {
        super(identifierResolvableString, "WALLET_MENU_REMOVE_ITEM_TAG", true);
        this.f97554d = identifierResolvableString;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof r) && this.f97554d.equals(((r) obj).f97554d);
    }

    @Override // ys.u, ss.a
    public final ResolvableString getText() {
        return this.f97554d;
    }

    public final int hashCode() {
        return this.f97554d.hashCode();
    }

    public final String toString() {
        return "RemoveItem(text=" + this.f97554d + ")";
    }
}
