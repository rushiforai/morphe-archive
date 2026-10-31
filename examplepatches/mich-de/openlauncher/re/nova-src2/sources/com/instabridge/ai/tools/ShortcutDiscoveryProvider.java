package com.instabridge.ai.tools;

import java.util.List;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\bæ\u0080\u0001\u0018\u00002\u00020\u0001J\u000e\u0010\u0002\u001a\b\u0012\u0004\u0012\u00020\u00040\u0003H&¨\u0006\u0005"}, d2 = {"Lcom/instabridge/ai/tools/ShortcutDiscoveryProvider;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "discoverShortcuts", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/ai/tools/DynamicIntentTool;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public interface ShortcutDiscoveryProvider {
    @NotNull
    List<DynamicIntentTool> discoverShortcuts();
}
