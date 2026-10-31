package com.instabridge.ai.chat.ui.v2;

import com.instabridge.ai.proactive.InsightGenerator;
import com.instabridge.ai.protocol.PendingToolCall;
import java.util.Map;
import java.util.Set;
import kotlin.jvm.functions.Function2;
import t70.s;

/* loaded from: classes3.dex */
public final /* synthetic */ class d implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35446a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ Map f35447b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ PendingToolCall f35448c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Set f35449d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ s f35450e;

    public /* synthetic */ d(int i5, PendingToolCall pendingToolCall, Map map, Set set, s sVar) {
        this.f35446a = i5;
        this.f35447b = map;
        this.f35448c = pendingToolCall;
        this.f35449d = set;
        this.f35450e = sVar;
    }

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        switch (this.f35446a) {
            case 0:
                PendingToolCall pendingToolCall = this.f35448c;
                return AiChatViewV2.executeAndCollectToolResults$lambda$39(this.f35447b, pendingToolCall, this.f35449d, this.f35450e, (Map) obj, (String) obj2);
            case 1:
                PendingToolCall pendingToolCall2 = this.f35448c;
                return AiChatViewV2.executeAndCollectToolResults$lambda$40(this.f35447b, pendingToolCall2, this.f35449d, this.f35450e, (Map) obj, (String) obj2);
            default:
                PendingToolCall pendingToolCall3 = this.f35448c;
                return InsightGenerator.executeToolsInBackground$lambda$23(this.f35447b, pendingToolCall3, this.f35449d, this.f35450e, (Map) obj, (String) obj2);
        }
    }
}
