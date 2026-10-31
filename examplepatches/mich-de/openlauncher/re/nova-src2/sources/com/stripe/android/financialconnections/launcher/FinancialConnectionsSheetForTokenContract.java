package com.stripe.android.financialconnections.launcher;

import android.content.Context;
import android.content.Intent;
import com.stripe.android.financialconnections.FinancialConnectionsSheetForTokenResult;
import com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetActivityArgs;
import com.stripe.android.financialconnections.launcher.FinancialConnectionsSheetActivityResult;
import com.stripe.android.financialconnections.model.FinancialConnectionsSession;
import com.stripe.android.model.Token;
import kotlin.Metadata;
import kotlin.NoWhenBranchMatchedException;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0007\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001¨\u0006\u0004"}, d2 = {"Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetForTokenContract;", "Lk/b;", "Lcom/stripe/android/financialconnections/launcher/FinancialConnectionsSheetActivityArgs$ForToken;", "Lcom/stripe/android/financialconnections/FinancialConnectionsSheetForTokenResult;", "financial-connections-core_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final class FinancialConnectionsSheetForTokenContract extends k.b {
    @Override // k.b
    public final Intent createIntent(Context context, Object obj) {
        FinancialConnectionsSheetActivityArgs.ForToken input = (FinancialConnectionsSheetActivityArgs.ForToken) obj;
        Intrinsics.g(input, "input");
        throw null;
    }

    @Override // k.b
    public final Object parseResult(int i5, Intent intent) {
        FinancialConnectionsSheetActivityResult financialConnectionsSheetActivityResult;
        if (intent == null || (financialConnectionsSheetActivityResult = (FinancialConnectionsSheetActivityResult) intent.getParcelableExtra("com.stripe.android.financialconnections.ConnectionsSheetContract.extra_result")) == null) {
            return new FinancialConnectionsSheetForTokenResult.Failed(new IllegalArgumentException("Failed to retrieve a ConnectionsSheetResult."));
        }
        if (financialConnectionsSheetActivityResult instanceof FinancialConnectionsSheetActivityResult.Canceled) {
            return FinancialConnectionsSheetForTokenResult.Canceled.f42661a;
        }
        if (financialConnectionsSheetActivityResult instanceof FinancialConnectionsSheetActivityResult.Failed) {
            return new FinancialConnectionsSheetForTokenResult.Failed(((FinancialConnectionsSheetActivityResult.Failed) financialConnectionsSheetActivityResult).f42678a);
        }
        if (!(financialConnectionsSheetActivityResult instanceof FinancialConnectionsSheetActivityResult.Completed)) {
            throw new NoWhenBranchMatchedException();
        }
        FinancialConnectionsSheetActivityResult.Completed completed = (FinancialConnectionsSheetActivityResult.Completed) financialConnectionsSheetActivityResult;
        FinancialConnectionsSession financialConnectionsSession = completed.f42676b;
        if (financialConnectionsSession == null) {
            return new FinancialConnectionsSheetForTokenResult.Failed(new IllegalArgumentException("FinancialConnectionsSession is not set"));
        }
        Token token = completed.f42677c;
        return token == null ? new FinancialConnectionsSheetForTokenResult.Failed(new IllegalArgumentException("PaymentAccount is not set on FinancialConnectionsSession")) : new FinancialConnectionsSheetForTokenResult.Completed(financialConnectionsSession, token);
    }
}
