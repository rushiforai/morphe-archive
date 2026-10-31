package com.stripe.android.financialconnections.launcher;

import android.content.Context;
import android.content.Intent;
import com.stripe.android.financialconnections.FinancialConnectionsSheetResult;
import com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetActivityArgs;
import com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetActivityResult;
import com.stripe.android.financialconnections.model.FinancialConnectionsSession;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetForDataContract;", "Lk/b;", "Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetActivityArgs$ForData;", "Lcom/stripe/android/financialconnections/FinancialConnectionsSheetResult;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class FinancialConnectionsSheetForDataContract extends k.b {

    /* renamed from: a, reason: collision with root package name */
    public final Function1 f42679a;

    public FinancialConnectionsSheetForDataContract(Function1 intentBuilder) {
        Intrinsics.g(intentBuilder, "intentBuilder");
        this.f42679a = intentBuilder;
    }

    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        FinancialConnectionsSheetActivityArgs.ForData input = (FinancialConnectionsSheetActivityArgs.ForData) obj;
        Intrinsics.g(input, "input");
        return (Intent) this.f42679a.invoke(input);
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        FinancialConnectionsSheetActivityResult financialConnectionsSheetActivityResult;
        if (i5 != 0) {
            if (intent == null || (financialConnectionsSheetActivityResult = (FinancialConnectionsSheetActivityResult) intent.getParcelableExtra("com.stripe.android.financialconnections.ConnectionsSheetContract.extra_result")) == null) {
                return new FinancialConnectionsSheetResult.Failed(new IllegalArgumentException("Failed to retrieve a ConnectionsSheetResult."));
            }
            if (!(financialConnectionsSheetActivityResult instanceof FinancialConnectionsSheetActivityResult.Canceled)) {
                if (financialConnectionsSheetActivityResult instanceof FinancialConnectionsSheetActivityResult.Failed) {
                    return new FinancialConnectionsSheetResult.Failed(((FinancialConnectionsSheetActivityResult.Failed) financialConnectionsSheetActivityResult).f42678a);
                }
                if (!(financialConnectionsSheetActivityResult instanceof FinancialConnectionsSheetActivityResult.Completed)) {
                    throw new NoWhenBranchMatchedException();
                }
                FinancialConnectionsSession financialConnectionsSession = ((FinancialConnectionsSheetActivityResult.Completed) financialConnectionsSheetActivityResult).f42676b;
                return financialConnectionsSession == null ? new FinancialConnectionsSheetResult.Failed(new IllegalArgumentException("financialConnectionsSession not set.")) : new FinancialConnectionsSheetResult.Completed(financialConnectionsSession);
            }
        }
        return FinancialConnectionsSheetResult.Canceled.f42665a;
    }
}
