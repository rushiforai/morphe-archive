package com.instabridge.ai.tools;

import com.instabridge.mobilesdk.JourneyState;
import com.instabridge.mobilesdk.internal.ServiceGraph;
import com.instabridge.mobilesdk.internal.ui.theme.MobileThemeKt;
import com.moloco.sdk.internal.A;
import com.moloco.sdk.internal.C2930d;
import com.moloco.sdk.internal.h;
import com.moloco.sdk.internal.ortb.model.H;
import com.moloco.sdk.internal.ortb.model.w;
import com.moloco.sdk.internal.p;
import com.moloco.sdk.internal.q;
import com.moloco.sdk.internal.unity_bridge.MolocoUnityPlugin;
import com.moloco.sdk.service_locator.a;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.MraidActivity;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.e;
import java.lang.annotation.Annotation;
import kotlin.jvm.functions.Function0;
import kotlinx.serialization.internal.EnumsKt;

/* loaded from: classes3.dex */
public final /* synthetic */ class a implements Function0 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35557a;

    public /* synthetic */ a(int i5) {
        this.f35557a = i5;
    }

    @Override // kotlin.jvm.functions.Function0
    public final Object invoke() {
        switch (this.f35557a) {
            case 0:
                return AiTool.common_delegate$lambda$8();
            case 1:
                return AiTool.expanded_delegate$lambda$9();
            case 2:
                return JourneyState._init_$_anonymous_();
            case 3:
                return Boolean.valueOf(ServiceGraph.Companion.create$lambda$1());
            case 4:
                return MobileThemeKt.LocalMobileSdkTheme$lambda$0();
            case 5:
                return com.moloco.sdk.acm.http.b.b();
            case 6:
                return com.moloco.sdk.acm.http.c.a();
            case 7:
                return A.a();
            case 8:
                return C2930d.b();
            case 9:
                return h.b();
            case 10:
                return com.moloco.sdk.internal.ortb.d.b();
            case 11:
                return EnumsKt.createAnnotatedEnumSerializer("com.moloco.sdk.internal.ortb.model.VerticalAlignment", H.values(), new String[]{"top", "center", "bottom"}, new Annotation[][]{null, null, null}, null);
            case 12:
                return EnumsKt.createAnnotatedEnumSerializer("com.moloco.sdk.internal.ortb.model.HorizontalAlignment", w.values(), new String[]{"start", "center", "end", "left", "right"}, new Annotation[][]{null, null, null, null, null}, null);
            case 13:
                return p.b();
            case 14:
                return p.d();
            case 15:
                return p.e();
            case 16:
                return p.f();
            case 17:
                return p.a();
            case 18:
                return p.c();
            case 19:
                return q.a();
            case 20:
                return MolocoUnityPlugin.context_delegate$lambda$0();
            case 21:
                return MolocoUnityPlugin.adManager_delegate$lambda$1();
            case 22:
                return a.C0182a.c();
            case 23:
                return a.g.d();
            case 24:
                return a.g.c();
            case 25:
                return MraidActivity.b();
            case 26:
                return MraidActivity.d.a();
            case 27:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.b.p();
            case 28:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.b.o();
            default:
                return e.l();
        }
    }
}
