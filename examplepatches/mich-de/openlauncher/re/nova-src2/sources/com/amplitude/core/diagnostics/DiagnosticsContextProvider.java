package com.amplitude.core.diagnostics;

import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\bæ\u0080\u0001\u0018\u00002\u00020\u0001J\b\u0010\u0002\u001a\u00020\u0003H&ø\u0001\u0000\u0082\u0002\u0006\n\u0004\b!0\u0001¨\u0006\u0004À\u0006\u0001"}, d2 = {"Lcom/amplitude/core/diagnostics/DiagnosticsContextProvider;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "getContextInfo", "Lcom/amplitude/core/diagnostics/DiagnosticsContextInfo;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public interface DiagnosticsContextProvider {
    @NotNull
    DiagnosticsContextInfo getContextInfo();
}
