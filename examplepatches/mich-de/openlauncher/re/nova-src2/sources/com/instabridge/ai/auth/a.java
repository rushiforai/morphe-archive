package com.instabridge.ai.auth;

import com.instabridge.ai.chat.data.ConversationApiClient;
import kotlin.jvm.functions.Function0;

/* loaded from: classes3.dex */
public final /* synthetic */ class a implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35310a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ AiAuthManager f35311b;

    public /* synthetic */ a(AiAuthManager aiAuthManager, int i5) {
        this.f35310a = i5;
        this.f35311b = aiAuthManager;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f35310a) {
            case 0:
                return AiAuthManager.loginApi_delegate$lambda$2(this.f35311b);
            case 1:
                return AiAuthManager.consentApi_delegate$lambda$39(this.f35311b);
            default:
                return ConversationApiClient._init_$lambda$0(this.f35311b);
        }
    }
}
