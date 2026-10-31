package com.instabridge.ai.chat.ui;

import java.util.Map;
import kotlin.jvm.functions.Function3;

/* loaded from: classes3.dex */
public final /* synthetic */ class f implements Function3 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35346a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ AiChatView f35347b;

    public /* synthetic */ f(AiChatView aiChatView, int i5) {
        this.f35346a = i5;
        this.f35347b = aiChatView;
    }

    @Override // kotlin.jvm.functions.Function3
    public final Object invoke(Object obj, Object obj2, Object obj3) {
        String str = (String) obj;
        switch (this.f35346a) {
            case 0:
                return AiChatView._init_$lambda$5(this.f35347b, str, ((Integer) obj2).intValue(), (String) obj3);
            case 1:
                return AiChatView._init_$lambda$9(this.f35347b, str, (Map) obj2, (String) obj3);
            default:
                boolean zBooleanValue = ((Boolean) obj3).booleanValue();
                return AiChatView.showModelSelector$lambda$30(this.f35347b, str, (String) obj2, zBooleanValue);
        }
    }
}
