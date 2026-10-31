package com.instabridge.ai.chat.ui;

import android.app.Activity;
import android.content.Context;
import android.content.ContextWrapper;
import android.content.Intent;
import android.net.Uri;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\bÁ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0016\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tJ\u0015\u0010\n\u001a\u0004\u0018\u00010\u000b2\b\u0010\u0006\u001a\u0004\u0018\u00010\u0007H\u0082\u0010¨\u0006\f"}, d2 = {"Lcom/instabridge/ai/chat/ui/ChatUrlOpeners;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "open", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "context", "Landroid/content/Context;", TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "findOpener", "Lcom/instabridge/ai/chat/ui/ChatUrlOpener;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ChatUrlOpeners {
    public static final int $stable = 0;

    @NotNull
    public static final ChatUrlOpeners INSTANCE = new ChatUrlOpeners();

    private ChatUrlOpeners() {
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r4v1 */
    /* JADX WARN: Type inference failed for: r4v4 */
    /* JADX WARN: Type inference failed for: r4v5 */
    private final ChatUrlOpener findOpener(Context context) {
        ContextWrapper baseContext = context;
        while (baseContext != 0) {
            if (baseContext instanceof ChatUrlOpener) {
                return (ChatUrlOpener) baseContext;
            }
            if (!(baseContext instanceof ContextWrapper)) {
                return null;
            }
            ContextWrapper contextWrapper = baseContext;
            if (contextWrapper.getBaseContext() == baseContext) {
                return null;
            }
            baseContext = contextWrapper.getBaseContext();
        }
        return null;
    }

    public final boolean open(@NotNull Context context, @NotNull String url) {
        Intrinsics.g(context, "context");
        Intrinsics.g(url, "url");
        ChatUrlOpener chatUrlOpenerFindOpener = findOpener(context);
        if (chatUrlOpenerFindOpener != null && chatUrlOpenerFindOpener.openChatUrl(url)) {
            return true;
        }
        try {
            Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(url));
            if (!(context instanceof Activity)) {
                intent.addFlags(268435456);
            }
            context.startActivity(intent);
            return true;
        } catch (Exception unused) {
            return false;
        }
    }
}
