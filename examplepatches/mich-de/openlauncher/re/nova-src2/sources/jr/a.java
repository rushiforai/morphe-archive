package jr;

import b.c9;

/* loaded from: classes4.dex */
public final class a {
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        tq.a aVar = tq.a.f89560b;
        return true;
    }

    public final int hashCode() {
        return Boolean.hashCode(false) + c9.f(tq.a.f89562d.hashCode() * 31, 31, false);
    }

    public final String toString() {
        return "CustomerPermissions(removePaymentMethod=" + tq.a.f89562d + ", canRemoveLastPaymentMethod=false, canUpdateFullPaymentMethodDetails=false)";
    }
}
