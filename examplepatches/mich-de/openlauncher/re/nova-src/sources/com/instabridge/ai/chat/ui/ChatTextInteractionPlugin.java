package com.instabridge.ai.chat.ui;

import android.widget.TextView;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0017\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0016¢\u0006\u0004\b\u0007\u0010\b¨\u0006\t"}, d2 = {"Lcom/instabridge/ai/chat/ui/ChatTextInteractionPlugin;", "Lh60/a;", "<init>", "()V", "Landroid/widget/TextView;", "textView", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "afterSetText", "(Landroid/widget/TextView;)V", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class ChatTextInteractionPlugin extends h60.a {
    public static final int $stable = 8;

    @Override // h60.a, h60.f
    public void afterSetText(@NotNull TextView textView) {
        Intrinsics.g(textView, "textView");
        textView.setTextIsSelectable(true);
        textView.setHighlightColor(textView.getContext().getColor(2131099740));
        textView.setLinkTextColor(textView.getContext().getColor(2131099718));
    }
}
