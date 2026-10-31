package fs;

import com.stripe.android.link.model.LinkAccount;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p0 implements q0 {

    /* renamed from: a, reason: collision with root package name */
    public final LinkAccount f55818a;

    public p0(LinkAccount account) {
        Intrinsics.g(account, "account");
        this.f55818a = account;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof p0) && Intrinsics.b(this.f55818a, ((p0) obj).f55818a);
    }

    public final int hashCode() {
        return this.f55818a.hashCode();
    }

    public final String toString() {
        return "Success(account=" + this.f55818a + ")";
    }
}
