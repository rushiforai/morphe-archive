package com.instabridge.ai.chat.ui.v2;

import kotlin.jvm.functions.Function1;

/* loaded from: classes3.dex */
public final /* synthetic */ class a implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35440a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ AiChatViewV2 f35441b;

    public /* synthetic */ a(AiChatViewV2 aiChatViewV2, int i5) {
        this.f35440a = i5;
        this.f35441b = aiChatViewV2;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f35440a) {
            case 0:
                return AiChatViewV2._init_$lambda$2(this.f35441b, (String) obj);
            default:
                return AiChatViewV2.sendMessageInternal$lambda$6(this.f35441b, ((Integer) obj).intValue());
        }
    }
}
