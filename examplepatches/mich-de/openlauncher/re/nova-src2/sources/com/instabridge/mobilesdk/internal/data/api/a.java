package com.instabridge.mobilesdk.internal.data.api;

import c50.g;
import com.instabridge.mobilesdk.internal.data.repo.CheckoutRepository;
import com.instabridge.mobilesdk.internal.data.repo.JourneyRepository;
import com.instabridge.mobilesdk.internal.data.repo.TravelPlan;
import com.instabridge.mobilesdk.internal.data.repo.TravelRepository;
import com.moloco.sdk.acm.http.c;
import com.moloco.sdk.internal.ortb.model.B;
import com.moloco.sdk.internal.publisher.H;
import com.moloco.sdk.internal.publisher.J;
import com.moloco.sdk.internal.q;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.A;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.d;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.media.j;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.MraidActivity;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.e;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.fullscreen.FullscreenWebviewActivity;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.C2994a;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.l;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.rewardedcountdowntimer.b;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.x;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.model.y;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.compose.x;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.render.o;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.services.a;
import cu.v;
import g.s;
import j3.b0;
import java.io.File;
import jv.u;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.JsonBuilder;

/* loaded from: classes3.dex */
public final /* synthetic */ class a implements Function1 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f35575a;

    public /* synthetic */ a(int i5) {
        this.f35575a = i5;
    }

    @Override // kotlin.jvm.functions.Function1
    public final Object invoke(Object obj) {
        switch (this.f35575a) {
            case 0:
                return ApiClient.json$lambda$0((JsonBuilder) obj);
            case 1:
                return CheckoutRepository.errorJson$lambda$9((JsonBuilder) obj);
            case 2:
                return JourneyRepository.errorJson$lambda$12((JsonBuilder) obj);
            case 3:
                return TravelRepository.getPlans_0E7RQCE$lambda$25$lambda$23((TravelPlan) obj);
            case 4:
                return TravelRepository.getPlans_0E7RQCE$lambda$25$lambda$24((TravelPlan) obj);
            case 5:
                return TravelRepository.regionName$lambda$31((String) obj);
            case 6:
                return c.a((g) obj);
            case 7:
                return H.a((B) obj);
            case 8:
                return J.a((B) obj);
            case 9:
                return q.a((JsonBuilder) obj);
            case 10:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.B.a(A.f38333d, (b0) obj);
            case 11:
                return Long.valueOf(j.b((File) obj));
            case 12:
                return MraidActivity.d.a((a.AbstractC0299a.c) obj);
            case 13:
                return e.b((String) obj);
            case 14:
                return e.a((d) obj);
            case 15:
                return FullscreenWebviewActivity.a((s) obj);
            case 16:
                return C2994a.a("Ad Badge", (b0) obj);
            case 17:
                return l.a.a((String) obj);
            case 18:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.rewardedcountdowntimer.a.a("rewarded_countdown_timer", (b0) obj);
            case 19:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.rewardedcountdowntimer.a.b("rewarded_countdown_timer_custom", (b0) obj);
            case 20:
                return b.a("custom_countdown_timer_text", (b0) obj);
            case 21:
                return b.b("custom_timer_container", (b0) obj);
            case 22:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.rewardedcountdowntimer.c.a("timer_container", (b0) obj);
            case 23:
                return com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.ui.rewardedcountdowntimer.c.b("countdown_timer_text", (b0) obj);
            case 24:
                return x.a((k2.c) obj);
            case 25:
                return Boolean.valueOf(com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.g.a((y) obj));
            case 26:
                return x.f.a.a("mute_button", (b0) obj);
            case 27:
                return o.a.a((com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.c) obj);
            case 28:
                v it = (v) obj;
                Intrinsics.g(it, "it");
                return Unit.f71706a;
            default:
                u state = (u) obj;
                Intrinsics.g(state, "state");
                return state.a();
        }
    }
}
