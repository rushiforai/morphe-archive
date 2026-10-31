package com.instabridge.ai.chat.ui;

import com.instabridge.ai.chat.model.ChatItem;
import com.instabridge.ai.chat.ui.AiChatView;
import java.io.Serializable;
import java.util.Map;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Ref;

/* loaded from: classes3.dex */
public final /* synthetic */ class w implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35469a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Object f35470b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ Object f35471c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Serializable f35472d;

    public /* synthetic */ w(Object obj, Object obj2, Serializable serializable, int i5) {
        this.f35469a = i5;
        this.f35470b = obj;
        this.f35471c = obj2;
        this.f35472d = serializable;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f35469a) {
            case 0:
                return AiChatView.AnonymousClass4.emit$lambda$14((StringBuilder) this.f35470b, (Ref.ObjectRef) this.f35471c, (Ref.ObjectRef) this.f35472d, (ChatItem.AiMessage) obj);
            case 1:
                return AiChatView.AnonymousClass4.emit$lambda$17((StringBuilder) this.f35470b, (Ref.ObjectRef) this.f35471c, (Ref.ObjectRef) this.f35472d, (ChatItem.AiMessage) obj);
            default:
                return AiChatView.lambda$9$lambda$8((AiChatView) this.f35470b, (Map) this.f35471c, (String) this.f35472d, (ChatItem.ToolCallCard) obj);
        }
    }
}
