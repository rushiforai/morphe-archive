package ys;

import com.stripe.android.financialconnections.FinancialConnectionsSheetConfiguration;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b implements c {

    /* renamed from: a, reason: collision with root package name */
    public final FinancialConnectionsSheetConfiguration f97425a;

    public b(FinancialConnectionsSheetConfiguration financialConnectionsSheetConfiguration) {
        this.f97425a = financialConnectionsSheetConfiguration;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof b) && Intrinsics.b(this.f97425a, ((b) obj).f97425a);
    }

    public final int hashCode() {
        FinancialConnectionsSheetConfiguration financialConnectionsSheetConfiguration = this.f97425a;
        if (financialConnectionsSheetConfiguration == null) {
            return 0;
        }
        return financialConnectionsSheetConfiguration.hashCode();
    }

    public final String toString() {
        return "Processing(configToPresent=" + this.f97425a + ")";
    }
}
