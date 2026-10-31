package sr;

import com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetActivityResult;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c extends f {

    /* renamed from: a, reason: collision with root package name */
    public final FinancialConnectionsSheetActivityResult f87701a;

    public c(FinancialConnectionsSheetActivityResult financialConnectionsSheetActivityResult) {
        this.f87701a = financialConnectionsSheetActivityResult;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof c) && Intrinsics.b(this.f87701a, ((c) obj).f87701a);
    }

    public final int hashCode() {
        return this.f87701a.hashCode();
    }

    public final String toString() {
        return "FinishWithResult(result=" + this.f87701a + ")";
    }
}
