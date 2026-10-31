package com.instabridge.ai.chat.ui.v2;

import android.view.View;
import com.instabridge.ai.chat.model.ChatItem;

/* loaded from: classes3.dex */
public final /* synthetic */ class l implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35466a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ ToolCallCardViewHolderV2 f35467b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ ChatItem.ToolCallCard f35468c;

    public /* synthetic */ l(ToolCallCardViewHolderV2 toolCallCardViewHolderV2, ChatItem.ToolCallCard toolCallCard, int i5) {
        this.f35466a = i5;
        this.f35467b = toolCallCardViewHolderV2;
        this.f35468c = toolCallCard;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        switch (this.f35466a) {
            case 0:
                ToolCallCardViewHolderV2.bindAskClarification$lambda$6(this.f35467b, this.f35468c, view);
                break;
            case 1:
                ToolCallCardViewHolderV2.bindConfirmAction$lambda$8(this.f35467b, this.f35468c, view);
                break;
            default:
                ToolCallCardViewHolderV2.bindConfirmAction$lambda$9(this.f35467b, this.f35468c, view);
                break;
        }
    }
}
