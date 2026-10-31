package com.stripe.android.financialconnections.model;

import com.stripe.android.financialconnections.model.BalanceRefresh;
import kotlinx.serialization.KSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class e {
    @NotNull
    public final KSerializer<BalanceRefresh.BalanceRefreshStatus> serializer() {
        return (KSerializer) BalanceRefresh.BalanceRefreshStatus.$cachedSerializer$delegate.getValue();
    }
}
