package com.instabridge.ai.tools;

import kotlin.Metadata;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\bf\u0018\u00002\u00020\u0001J\n\u0010\u0002\u001a\u0004\u0018\u00010\u0003H&J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0003H&J\b\u0010\u0007\u001a\u00020\u0005H&¨\u0006\b"}, d2 = {"Lcom/instabridge/ai/tools/ToolRegistrationStateStore;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "load", "Lcom/instabridge/ai/tools/ToolRegistrationSnapshot;", ActionCategory.SAVE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "snapshot", "clear", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public interface ToolRegistrationStateStore {
    void clear();

    @Nullable
    ToolRegistrationSnapshot load();

    void save(@NotNull ToolRegistrationSnapshot snapshot);
}
