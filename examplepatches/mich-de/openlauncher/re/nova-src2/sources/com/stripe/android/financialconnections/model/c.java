package com.stripe.android.financialconnections.model;

import com.stripe.android.financialconnections.model.Balance;
import kotlinx.serialization.KSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class c {
    @NotNull
    public final KSerializer<Balance.Type> serializer() {
        return (KSerializer) Balance.Type.$cachedSerializer$delegate.getValue();
    }
}
