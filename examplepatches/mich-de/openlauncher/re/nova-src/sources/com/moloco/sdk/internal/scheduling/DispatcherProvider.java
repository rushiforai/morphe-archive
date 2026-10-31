package com.moloco.sdk.internal.scheduling;

import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import kotlin.Metadata;
import kotlin.coroutines.CoroutineContext;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u000b\bf\u0018\u00002\u00020\u0001R\u0012\u0010\u0002\u001a\u00020\u0003X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0004\u0010\u0005R\u0012\u0010\u0006\u001a\u00020\u0003X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0007\u0010\u0005R\u0012\u0010\b\u001a\u00020\u0003X¦\u0004¢\u0006\u0006\u001a\u0004\b\t\u0010\u0005R\u0012\u0010\n\u001a\u00020\u0003X¦\u0004¢\u0006\u0006\u001a\u0004\b\u000b\u0010\u0005R\u0012\u0010\f\u001a\u00020\u0003X¦\u0004¢\u0006\u0006\u001a\u0004\b\r\u0010\u0005¨\u0006\u000e"}, d2 = {"Lcom/moloco/sdk/internal/scheduling/DispatcherProvider;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "main", "Lkotlin/coroutines/CoroutineContext;", "getMain", "()Lkotlin/coroutines/CoroutineContext;", "mainImmediate", "getMainImmediate", CarrierConfigurator.APN_TYPE, "getDefault", "io", "getIo", "unconfined", "getUnconfined", "moloco-sdk_release"}, k = 1, mv = {2, 0, 0}, xi = 48)
/* loaded from: classes.dex */
public interface DispatcherProvider {
    @NotNull
    CoroutineContext getDefault();

    @NotNull
    CoroutineContext getIo();

    @NotNull
    CoroutineContext getMain();

    @NotNull
    CoroutineContext getMainImmediate();

    @NotNull
    CoroutineContext getUnconfined();
}
