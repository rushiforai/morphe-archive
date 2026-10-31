package com.stripe.android.financialconnections.launcher;

import android.content.Context;
import android.content.Intent;
import com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetActivityArgs;
import com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetActivityResult;
import com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetInstantDebitsResult;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetForInstantDebitsContract;", "Lk/b;", "Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetActivityArgs$ForInstantDebits;", "Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetInstantDebitsResult;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class FinancialConnectionsSheetForInstantDebitsContract extends k.b {

    /* renamed from: a, reason: collision with root package name */
    public final Function1 f42680a;

    public FinancialConnectionsSheetForInstantDebitsContract(Function1 intentBuilder) {
        Intrinsics.g(intentBuilder, "intentBuilder");
        this.f42680a = intentBuilder;
    }

    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        FinancialConnectionsSheetActivityArgs.ForInstantDebits input = (FinancialConnectionsSheetActivityArgs.ForInstantDebits) obj;
        Intrinsics.g(input, "input");
        return (Intent) this.f42680a.invoke(input);
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        FinancialConnectionsSheetActivityResult financialConnectionsSheetActivityResult;
        if (intent == null || (financialConnectionsSheetActivityResult = (FinancialConnectionsSheetActivityResult) intent.getParcelableExtra("com.stripe.android.financialconnections.ConnectionsSheetContract.extra_result")) == null) {
            return new FinancialConnectionsSheetInstantDebitsResult.Failed(new IllegalArgumentException("Failed to retrieve a ConnectionsSheetResult."));
        }
        if (financialConnectionsSheetActivityResult instanceof FinancialConnectionsSheetActivityResult.Canceled) {
            return FinancialConnectionsSheetInstantDebitsResult.Canceled.f42681a;
        }
        if (financialConnectionsSheetActivityResult instanceof FinancialConnectionsSheetActivityResult.Failed) {
            return new FinancialConnectionsSheetInstantDebitsResult.Failed(((FinancialConnectionsSheetActivityResult.Failed) financialConnectionsSheetActivityResult).f42678a);
        }
        if (!(financialConnectionsSheetActivityResult instanceof FinancialConnectionsSheetActivityResult.Completed)) {
            throw new NoWhenBranchMatchedException();
        }
        InstantDebitsResult instantDebitsResult = ((FinancialConnectionsSheetActivityResult.Completed) financialConnectionsSheetActivityResult).f42675a;
        return instantDebitsResult == null ? new FinancialConnectionsSheetInstantDebitsResult.Failed(new IllegalArgumentException("Instant debits result is missing")) : new FinancialConnectionsSheetInstantDebitsResult.Completed(instantDebitsResult.f42687a, instantDebitsResult.f42688b, instantDebitsResult.f42689c, instantDebitsResult.f42690d);
    }
}
