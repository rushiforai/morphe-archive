package com.instabridge.ai.chat.ui.v2;

import android.view.View;
import android.widget.TextView;
import androidx.recyclerview.widget.s2;
import com.instabridge.ai.chat.model.ChatItem;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000&\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0001\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0002¢\u0006\u0004\b\u0004\u0010\u0005J\u0015\u0010\t\u001a\u00020\b2\u0006\u0010\u0007\u001a\u00020\u0006¢\u0006\u0004\b\t\u0010\nR\u0014\u0010\f\u001a\u00020\u000b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\f\u0010\r¨\u0006\u000e"}, d2 = {"Lcom/instabridge/ai/chat/ui/v2/UserMessageViewHolderV2;", "Landroidx/recyclerview/widget/s2;", "Landroid/view/View;", "itemView", "<init>", "(Landroid/view/View;)V", "Lcom/instabridge/ai/chat/model/ChatItem$UserMessage;", "item", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "bind", "(Lcom/instabridge/ai/chat/model/ChatItem$UserMessage;)V", "Landroid/widget/TextView;", "textView", "Landroid/widget/TextView;", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class UserMessageViewHolderV2 extends s2 {
    public static final int $stable = 8;

    @NotNull
    private final TextView textView;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public UserMessageViewHolderV2(@NotNull View itemView) {
        super(itemView);
        Intrinsics.g(itemView, "itemView");
        View viewFindViewById = itemView.findViewById(2131429144);
        Intrinsics.f(viewFindViewById, "findViewById(...)");
        this.textView = (TextView) viewFindViewById;
    }

    public final void bind(@NotNull ChatItem.UserMessage item) {
        Intrinsics.g(item, "item");
        this.textView.setText(item.getContent());
    }
}
