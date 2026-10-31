package com.stripe.android.financialconnections.model;

import com.stripe.android.financialconnections.model.OwnershipRefresh;
import kotlinx.serialization.KSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class g0 {
    @NotNull
    public final KSerializer<OwnershipRefresh.Status> serializer() {
        return (KSerializer) OwnershipRefresh.Status.$cachedSerializer$delegate.getValue();
    }
}
