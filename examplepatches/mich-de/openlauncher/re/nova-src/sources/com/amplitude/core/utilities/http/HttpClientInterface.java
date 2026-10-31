package com.amplitude.core.utilities.http;

import com.amplitude.android.migration.DatabaseConstants;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\bf\u0018\u00002\u00020\u0001J\u001c\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\n\b\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005H&ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\u0007À\u0006\u0001"}, d2 = {"Lcom/amplitude/core/utilities/http/HttpClientInterface;", b.f42142b, "upload", "Lcom/amplitude/core/utilities/http/AnalyticsResponse;", DatabaseConstants.EVENT_TABLE_NAME, b.f42142b, "diagnostics", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public interface HttpClientInterface {
    static /* synthetic */ AnalyticsResponse upload$default(HttpClientInterface httpClientInterface, String str, String str2, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: upload");
        }
        if ((i5 & 2) != 0) {
            str2 = null;
        }
        return httpClientInterface.upload(str, str2);
    }

    @NotNull
    AnalyticsResponse upload(@NotNull String events, @Nullable String diagnostics);
}
