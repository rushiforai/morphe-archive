package com.instabridge.ai.chat.ui;

import android.content.Context;
import android.view.View;
import com.instabridge.ai.chat.model.ChatItem;
import com.instabridge.ai.chat.ui.ChatAdapter;
import java.util.LinkedHashMap;
import kotlin.jvm.functions.Function1;

/* loaded from: classes3.dex */
public final /* synthetic */ class h0 implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35356a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f35357b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f35358c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f35359d;

    public /* synthetic */ h0(int i5, Object obj, Object obj2, Object obj3) {
        this.f35356a = i5;
        this.f35359d = obj;
        this.f35357b = obj2;
        this.f35358c = obj3;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        switch (this.f35356a) {
            case 0:
                ChatAdapter.ToolCallCardViewHolder.bindInputForm$lambda$16((LinkedHashMap) this.f35359d, (ChatAdapter) this.f35357b, (ChatItem.ToolCallCard) this.f35358c, view);
                break;
            case 1:
                ChatAdapter.ToolCallCardViewHolder.bindAskClarification$lambda$1$lambda$0((ChatAdapter) this.f35357b, (ChatItem.ToolCallCard) this.f35358c, (String) this.f35359d, view);
                break;
            default:
                UpgradeDialog.show$lambda$1((Context) this.f35359d, (m.k) this.f35357b, (Function1) this.f35358c, view);
                break;
        }
    }

    public /* synthetic */ h0(ChatAdapter chatAdapter, ChatItem.ToolCallCard toolCallCard, String str) {
        this.f35356a = 1;
        this.f35357b = chatAdapter;
        this.f35358c = toolCallCard;
        this.f35359d = str;
    }
}
