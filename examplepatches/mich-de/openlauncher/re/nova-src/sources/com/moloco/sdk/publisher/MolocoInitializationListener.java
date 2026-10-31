package com.moloco.sdk.publisher;

import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\bæ\u0080\u0001\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&¨\u0006\u0006"}, d2 = {"Lcom/moloco/sdk/publisher/MolocoInitializationListener;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "onMolocoInitializationStatus", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "initStatus", "Lcom/moloco/sdk/publisher/MolocoInitStatus;", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
public interface MolocoInitializationListener {
    void onMolocoInitializationStatus(@NotNull MolocoInitStatus initStatus);
}
