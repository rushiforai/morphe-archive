package com.instabridge.ai.chat.ui;

import android.view.View;
import com.instabridge.ai.chat.model.ChatItem;
import com.instabridge.ai.chat.ui.ChatAdapter;

/* loaded from: classes3.dex */
public final /* synthetic */ class i0 implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35361a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ChatAdapter f35362b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ChatItem.ToolCallCard f35363c;

    public /* synthetic */ i0(ChatAdapter chatAdapter, ChatItem.ToolCallCard toolCallCard, int i5) {
        this.f35361a = i5;
        this.f35362b = chatAdapter;
        this.f35363c = toolCallCard;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        switch (this.f35361a) {
            case 0:
                ChatAdapter.ToolCallCardViewHolder.bindConfirmAction$lambda$8(this.f35362b, this.f35363c, view);
                break;
            case 1:
                ChatAdapter.ToolCallCardViewHolder.bindConfirmAction$lambda$9(this.f35362b, this.f35363c, view);
                break;
            default:
                ChatAdapter.ToolCallCardViewHolder.bindAskClarification$lambda$6(this.f35362b, this.f35363c, view);
                break;
        }
    }
}
