package com.amplitude.core.diagnostics;

import com.amplitude.core.RestrictedAmplitudeFeature;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import java.util.Map;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@RestrictedAmplitudeFeature
@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0002\b\u0002\n\u0002\u0010$\n\u0002\b\u0002\n\u0002\u0010\u0006\n\u0002\b\u0004\bg\u0018\u00002\u00020\u0001J\b\u0010\u0002\u001a\u00020\u0003H&J\b\u0010\u0004\u001a\u00020\u0003H&J\u001a\u0010\u0005\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u00072\b\b\u0002\u0010\b\u001a\u00020\tH&J(\u0010\n\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u00072\u0016\b\u0002\u0010\u000b\u001a\u0010\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u0001\u0018\u00010\fH&J\u0018\u0010\r\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u000e\u001a\u00020\u000fH&J\u0018\u0010\u0010\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u000e\u001a\u00020\u0007H&J\u001c\u0010\u0011\u001a\u00020\u00032\u0012\u0010\u0012\u001a\u000e\u0012\u0004\u0012\u00020\u0007\u0012\u0004\u0012\u00020\u00070\fH&ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\u0013À\u0006\u0001"}, d2 = {"Lcom/amplitude/core/diagnostics/DiagnosticsClient;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, n.f39150d, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "flush", "increment", PendingUpgradeStore.KEY_NAME, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "size", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "recordEvent", "properties", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "recordHistogram", "value", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "setTag", "setTags", "tags", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public interface DiagnosticsClient {
    static /* synthetic */ void increment$default(DiagnosticsClient diagnosticsClient, String str, long j11, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: increment");
        }
        if ((i5 & 2) != 0) {
            j11 = 1;
        }
        diagnosticsClient.increment(str, j11);
    }

    /* JADX WARN: Multi-variable type inference failed */
    static /* synthetic */ void recordEvent$default(DiagnosticsClient diagnosticsClient, String str, Map map, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: recordEvent");
        }
        if ((i5 & 2) != 0) {
            map = null;
        }
        diagnosticsClient.recordEvent(str, map);
    }

    void close();

    void flush();

    void increment(@NotNull String name, long size);

    void recordEvent(@NotNull String name, @Nullable Map<String, ? extends Object> properties);

    void recordHistogram(@NotNull String name, double value);

    void setTag(@NotNull String name, @NotNull String value);

    void setTags(@NotNull Map<String, String> tags);
}
