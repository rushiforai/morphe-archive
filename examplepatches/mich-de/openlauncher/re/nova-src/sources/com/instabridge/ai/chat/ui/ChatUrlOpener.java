package com.instabridge.ai.chat.ui;

import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0000\bf\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H&¨\u0006\u0006"}, d2 = {"Lcom/instabridge/ai/chat/ui/ChatUrlOpener;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "openChatUrl", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public interface ChatUrlOpener {
    boolean openChatUrl(@NotNull String url);
}
