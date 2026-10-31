package com.amplitude.id;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\bf\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\u0006À\u0006\u0001"}, d2 = {"Lcom/amplitude/id/IdentityStorageProvider;", b.f42142b, "getIdentityStorage", "Lcom/amplitude/id/IdentityStorage;", "configuration", "Lcom/amplitude/id/IdentityConfiguration;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public interface IdentityStorageProvider {
    @NotNull
    IdentityStorage getIdentityStorage(@NotNull IdentityConfiguration configuration);
}
