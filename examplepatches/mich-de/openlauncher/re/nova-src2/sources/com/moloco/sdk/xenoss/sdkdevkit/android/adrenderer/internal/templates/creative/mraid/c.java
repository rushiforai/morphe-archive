package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.creative.mraid;

import android.content.Context;
import android.webkit.JavascriptInterface;
import com.moloco.sdk.internal.MolocoLogger;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.p;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONException;
import org.json.JSONObject;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public static final a f39417c = new a(null);

    /* renamed from: d, reason: collision with root package name */
    public static final int f39418d = 8;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public static final String f39419e = "MraidJsEventReceiver";

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Context f39420a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.creative.mraid.a f39421b;

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    public c(@NotNull Context context, @NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.creative.mraid.a mraidCommunicationHub) {
        Intrinsics.g(context, "context");
        Intrinsics.g(mraidCommunicationHub, "mraidCommunicationHub");
        this.f39420a = context;
        this.f39421b = mraidCommunicationHub;
    }

    @JavascriptInterface
    public final void close() {
        this.f39421b.a();
    }

    @JavascriptInterface
    public final void expand(@NotNull String url) {
        Intrinsics.g(url, "url");
    }

    @JavascriptInterface
    public final void open(@NotNull String jsonParams) throws JSONException {
        Intrinsics.g(jsonParams, "jsonParams");
        String string = new JSONObject(jsonParams).getString(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL);
        com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.creative.mraid.a aVar = this.f39421b;
        Intrinsics.d(string);
        aVar.a(string);
    }

    @JavascriptInterface
    public final void resize(@NotNull String url) {
        Intrinsics.g(url, "url");
    }

    @JavascriptInterface
    public final void setOrientationProperties(@NotNull String jsonParams) {
        Intrinsics.g(jsonParams, "jsonParams");
        try {
            JSONObject jSONObject = new JSONObject(jsonParams);
            boolean zOptBoolean = jSONObject.optBoolean("allowOrientationChange", true);
            String strOptString = jSONObject.optString("forceOrientation", "none");
            MolocoLogger.debug$default(MolocoLogger.INSTANCE, f39419e, "Orientation Set from JSON: " + zOptBoolean + ", " + strOptString, false, 4, null);
            p pVarA = p.f39173a.a(strOptString);
            if (pVarA != null) {
                this.f39421b.a(zOptBoolean, pVarA);
            }
        } catch (Exception e3) {
            MolocoLogger.error$default(MolocoLogger.INSTANCE, f39419e, "Error parsing orientation properties JSON", e3, false, 8, null);
        }
    }
}
