package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.events.handlers;

import ab.e0;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.r;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class h implements com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.events.a {

    /* renamed from: b, reason: collision with root package name */
    public static final int f39661b = 8;

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final r f39662a;

    public h(@NotNull r externalLinkHandler) {
        Intrinsics.g(externalLinkHandler, "externalLinkHandler");
        this.f39662a = externalLinkHandler;
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.events.a
    @NotNull
    public Set<String> a() {
        return e0.U("launchUrl");
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.events.a
    @NotNull
    public String b() {
        return "LaunchUrlHandler";
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.events.a
    public void a(@NotNull JSONObject event) throws JSONException {
        Intrinsics.g(event, "event");
        String string = event.getString(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
        r rVar = this.f39662a;
        Intrinsics.d(string);
        rVar.a(string);
    }
}
