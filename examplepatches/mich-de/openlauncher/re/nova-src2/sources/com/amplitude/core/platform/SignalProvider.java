package com.amplitude.core.platform;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\bf\u0018\u00002\u00020\u0001J\b\u0010\b\u001a\u00020\tH\u0016J\b\u0010\n\u001a\u00020\tH\u0016J\u0014\u0010\u000b\u001a\u00020\t*\u00020\f2\u0006\u0010\r\u001a\u00020\u000eH\u0016R\u0018\u0010\u0002\u001a\u00020\u0003X¦\u000e¢\u0006\f\u001a\u0004\b\u0004\u0010\u0005\"\u0004\b\u0006\u0010\u0007ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\u000fÀ\u0006\u0001"}, d2 = {"Lcom/amplitude/core/platform/SignalProvider;", b.f42142b, "active", b.f42142b, "getActive", "()Z", "setActive", "(Z)V", "activate", b.f42142b, "deactivate", "emitSignal", "Lcom/amplitude/core/platform/Plugin;", "signal", "Lcom/amplitude/core/platform/Signal;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public interface SignalProvider {
    default void activate() {
        setActive(true);
    }

    default void deactivate() {
        setActive(false);
    }

    default void emitSignal(@NotNull Plugin plugin, @NotNull Signal signal) {
        Intrinsics.g(plugin, "<this>");
        Intrinsics.g(signal, "signal");
        if (getActive()) {
            plugin.getAmplitude().emitSignal$core(signal);
        }
    }

    boolean getActive();

    void setActive(boolean z11);
}
