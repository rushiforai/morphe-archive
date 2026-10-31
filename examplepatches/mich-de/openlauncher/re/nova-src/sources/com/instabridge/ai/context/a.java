package com.instabridge.ai.context;

import com.instabridge.ai.proactive.AiProactiveManager;
import io.p;
import kotlin.jvm.functions.Function1;

/* loaded from: classes3.dex */
public final /* synthetic */ class a implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35514a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ AiContextManager f35515b;

    public /* synthetic */ a(AiContextManager aiContextManager, int i5) {
        this.f35514a = i5;
        this.f35515b = aiContextManager;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f35514a) {
            case 0:
                return AiContextManager.addContext$lambda$4(this.f35515b, (p) obj);
            default:
                return AiProactiveManager.generateInsights$lambda$15(this.f35515b, (ContextType) obj);
        }
    }
}
