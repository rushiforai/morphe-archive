package hu;

import com.stripe.android.payments.bankaccount.navigation.CollectBankAccountResultInternal;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c extends e {

    /* renamed from: a, reason: collision with root package name */
    public final CollectBankAccountResultInternal f60066a;

    public c(CollectBankAccountResultInternal result) {
        Intrinsics.g(result, "result");
        this.f60066a = result;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof c) && Intrinsics.b(this.f60066a, ((c) obj).f60066a);
    }

    public final int hashCode() {
        return this.f60066a.hashCode();
    }

    public final String toString() {
        return "FinishWithResult(result=" + this.f60066a + ")";
    }
}
