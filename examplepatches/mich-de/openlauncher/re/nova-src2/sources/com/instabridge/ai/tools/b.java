package com.instabridge.ai.tools;

import com.instabridge.ai.tools.SendMessageTool;
import com.instabridge.ai.tools.ToolPreloader;
import com.instabridge.ai.tools.bii.BIIRegistry;
import com.instabridge.mobilesdk.internal.auth.BrandSigninClient;
import com.instabridge.mobilesdk.internal.auth.UsersApiClient;
import java.util.Map;
import kotlin.jvm.functions.Function1;
import kotlinx.serialization.json.JsonBuilder;

/* loaded from: classes3.dex */
public final /* synthetic */ class b implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35558a;

    public /* synthetic */ b(int i5) {
        this.f35558a = i5;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f35558a) {
            case 0:
                return DynamicIntentTool.SCHEME_SEARCH_PATTERNS$lambda$18((String) obj);
            case 1:
                return DynamicIntentTool.SCHEME_SEARCH_PATTERNS$lambda$9((String) obj);
            case 2:
                return DynamicIntentTool.SCHEME_SEARCH_PATTERNS$lambda$10((String) obj);
            case 3:
                return DynamicIntentTool.SCHEME_SEARCH_PATTERNS$lambda$11((String) obj);
            case 4:
                return DynamicIntentTool.SCHEME_SEARCH_PATTERNS$lambda$12((String) obj);
            case 5:
                return DynamicIntentTool.SCHEME_SEARCH_PATTERNS$lambda$13((String) obj);
            case 6:
                return DynamicIntentTool.SCHEME_SEARCH_PATTERNS$lambda$14((String) obj);
            case 7:
                return DynamicIntentTool.SCHEME_SEARCH_PATTERNS$lambda$15((String) obj);
            case 8:
                return DynamicIntentTool.SCHEME_SEARCH_PATTERNS$lambda$16((String) obj);
            case 9:
                return IntentToolDiscovery.SCHEME_DESCRIPTIONS$lambda$6((String) obj);
            case 10:
                return IntentToolDiscovery.SCHEME_DESCRIPTIONS$lambda$15((String) obj);
            case 11:
                return IntentToolDiscovery.SCHEME_DESCRIPTIONS$lambda$16((String) obj);
            case 12:
                return IntentToolDiscovery.SCHEME_DESCRIPTIONS$lambda$7((String) obj);
            case 13:
                return IntentToolDiscovery.SCHEME_DESCRIPTIONS$lambda$8((String) obj);
            case 14:
                return IntentToolDiscovery.SCHEME_DESCRIPTIONS$lambda$9((String) obj);
            case 15:
                return IntentToolDiscovery.SCHEME_DESCRIPTIONS$lambda$10((String) obj);
            case 16:
                return IntentToolDiscovery.SCHEME_DESCRIPTIONS$lambda$11((String) obj);
            case 17:
                return IntentToolDiscovery.SCHEME_DESCRIPTIONS$lambda$12((String) obj);
            case 18:
                return IntentToolDiscovery.SCHEME_DESCRIPTIONS$lambda$13((String) obj);
            case 19:
                return IntentToolDiscovery.SCHEME_DESCRIPTIONS$lambda$14((String) obj);
            case 20:
                return SendMessageTool.execute$lambda$15((SendMessageTool.ResolvedContact) obj);
            case 21:
                return SendMessageTool.toDefinition$lambda$9((String) obj);
            case 22:
                return ToolPreloader.runBestEffortInternal$lambda$5((ToolPreloader.Result) obj);
            case 23:
                return BIIRegistry.entries$lambda$9$lambda$1((Map) obj);
            case 24:
                return BIIRegistry.entries$lambda$9$lambda$3((Map) obj);
            case 25:
                return BIIRegistry.entries$lambda$9$lambda$4((Map) obj);
            case 26:
                return BIIRegistry.entries$lambda$9$lambda$6((Map) obj);
            case 27:
                return BIIRegistry.entries$lambda$9$lambda$8((Map) obj);
            case 28:
                return BrandSigninClient.json$lambda$0((JsonBuilder) obj);
            default:
                return UsersApiClient.json$lambda$0((JsonBuilder) obj);
        }
    }
}
