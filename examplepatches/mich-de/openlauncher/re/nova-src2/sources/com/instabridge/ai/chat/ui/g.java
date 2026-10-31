package com.instabridge.ai.chat.ui;

import kotlin.jvm.functions.Function0;

/* loaded from: classes3.dex */
public final /* synthetic */ class g implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35349a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ AiChatView f35350b;

    public /* synthetic */ g(AiChatView aiChatView, int i5) {
        this.f35349a = i5;
        this.f35350b = aiChatView;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f35349a) {
            case 0:
                return AiChatView._init_$lambda$7(this.f35350b);
            default:
                return AiChatView.showModelSelector$lambda$31(this.f35350b);
        }
    }
}
