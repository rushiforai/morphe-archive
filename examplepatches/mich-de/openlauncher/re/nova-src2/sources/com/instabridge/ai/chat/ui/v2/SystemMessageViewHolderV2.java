package com.instabridge.ai.chat.ui.v2;

import android.content.Context;
import android.content.res.ColorStateList;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.recyclerview.widget.s2;
import com.instabridge.ai.chat.model.ChatItem;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000<\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0001\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u0015\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\b¢\u0006\u0004\b\u000b\u0010\fR\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\rR\u0014\u0010\u000f\u001a\u00020\u000e8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010\u0010R\u0014\u0010\u0012\u001a\u00020\u00118\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0012\u0010\u0013R\u0014\u0010\u0015\u001a\u00020\u00148\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0015\u0010\u0016R\u0014\u0010\u0017\u001a\u00020\u00148\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0017\u0010\u0016¨\u0006\u0018"}, d2 = {"Lcom/instabridge/ai/chat/ui/v2/SystemMessageViewHolderV2;", "Landroidx/recyclerview/widget/s2;", "Landroid/view/View;", "itemView", "Lcom/instabridge/ai/chat/ui/v2/MessageActions;", "actions", "<init>", "(Landroid/view/View;Lcom/instabridge/ai/chat/ui/v2/MessageActions;)V", "Lcom/instabridge/ai/chat/model/ChatItem$SystemMessage;", "item", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "bind", "(Lcom/instabridge/ai/chat/model/ChatItem$SystemMessage;)V", "Lcom/instabridge/ai/chat/ui/v2/MessageActions;", "Landroid/widget/LinearLayout;", "pill", "Landroid/widget/LinearLayout;", "Landroid/widget/ImageView;", "icon", "Landroid/widget/ImageView;", "Landroid/widget/TextView;", "text", "Landroid/widget/TextView;", "retry", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class SystemMessageViewHolderV2 extends s2 {
    public static final int $stable = 8;

    @NotNull
    private final MessageActions actions;

    @NotNull
    private final ImageView icon;

    @NotNull
    private final LinearLayout pill;

    @NotNull
    private final TextView retry;

    @NotNull
    private final TextView text;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public SystemMessageViewHolderV2(@NotNull View itemView, @NotNull MessageActions actions) {
        super(itemView);
        Intrinsics.g(itemView, "itemView");
        Intrinsics.g(actions, "actions");
        this.actions = actions;
        View viewFindViewById = itemView.findViewById(2131429141);
        Intrinsics.f(viewFindViewById, "findViewById(...)");
        this.pill = (LinearLayout) viewFindViewById;
        View viewFindViewById2 = itemView.findViewById(2131429140);
        Intrinsics.f(viewFindViewById2, "findViewById(...)");
        this.icon = (ImageView) viewFindViewById2;
        View viewFindViewById3 = itemView.findViewById(2131429143);
        Intrinsics.f(viewFindViewById3, "findViewById(...)");
        this.text = (TextView) viewFindViewById3;
        View viewFindViewById4 = itemView.findViewById(2131429142);
        Intrinsics.f(viewFindViewById4, "findViewById(...)");
        this.retry = (TextView) viewFindViewById4;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void bind$lambda$0(SystemMessageViewHolderV2 systemMessageViewHolderV2, View view) {
        systemMessageViewHolderV2.actions.onSystemRetry();
    }

    public final void bind(@NotNull ChatItem.SystemMessage item) {
        Intrinsics.g(item, "item");
        this.text.setText(item.getText());
        Context context = this.itemView.getContext();
        if (item.isError()) {
            this.pill.setBackground(context.getDrawable(2131231135));
            int color = context.getColor(2131099769);
            this.text.setTextColor(color);
            this.icon.setImageTintList(ColorStateList.valueOf(color));
            this.icon.setVisibility(0);
            this.retry.setVisibility(item.isRetryable() ? 0 : 8);
            this.retry.setOnClickListener(new c(this, 2));
            return;
        }
        this.pill.setBackground(context.getDrawable(2131231134));
        int color2 = context.getColor(2131099771);
        this.text.setTextColor(color2);
        this.icon.setImageTintList(ColorStateList.valueOf(color2));
        this.icon.setVisibility(8);
        this.retry.setVisibility(8);
        this.retry.setOnClickListener(null);
    }
}
