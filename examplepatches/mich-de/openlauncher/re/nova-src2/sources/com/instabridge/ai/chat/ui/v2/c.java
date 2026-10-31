package com.instabridge.ai.chat.ui.v2;

import android.view.View;
import b10.d0;

/* loaded from: classes3.dex */
public final /* synthetic */ class c implements View.OnClickListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35444a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f35445b;

    public /* synthetic */ c(Object obj, int i5) {
        this.f35444a = i5;
        this.f35445b = obj;
    }

    @Override // android.view.View.OnClickListener
    public final void onClick(View view) {
        switch (this.f35444a) {
            case 0:
                AiChatViewV2._init_$lambda$4((AiChatViewV2) this.f35445b, view);
                break;
            case 1:
                AiMessageViewHolderV2.bindSources$lambda$14((AiMessageViewHolderV2) this.f35445b, view);
                break;
            case 2:
                SystemMessageViewHolderV2.bind$lambda$0((SystemMessageViewHolderV2) this.f35445b, view);
                break;
            default:
                ((d0) this.f35445b).invoke();
                break;
        }
    }
}
