package es;

import com.stripe.android.link.model.LinkAccount;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j0 implements k0 {

    /* renamed from: a, reason: collision with root package name */
    public final LinkAccount f52963a;

    public j0(LinkAccount linkAccount) {
        Intrinsics.g(linkAccount, "linkAccount");
        this.f52963a = linkAccount;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof j0) && Intrinsics.b(this.f52963a, ((j0) obj).f52963a);
    }

    public final int hashCode() {
        return this.f52963a.hashCode();
    }

    public final String toString() {
        return "VerificationDialog(linkAccount=" + this.f52963a + ")";
    }
}
