package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer;

import android.webkit.JavascriptInterface;
import com.moloco.sdk.BuildConfig;
import com.moloco.sdk.internal.MolocoLogger;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.json.JSONException;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public static final a f39435b = new a(null);

    /* renamed from: c, reason: collision with root package name */
    public static final int f39436c = 8;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public static final String f39437d = "TemplateJavascript";

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.events.handlers.e f39438a;

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    public b(@NotNull com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.templates.renderer.events.handlers.e eventHandler) {
        Intrinsics.g(eventHandler, "eventHandler");
        this.f39438a = eventHandler;
    }

    @JavascriptInterface
    public final void log(@NotNull String message) {
        Intrinsics.g(message, "message");
        MolocoLogger.info$default(MolocoLogger.INSTANCE, f39437d, message, null, false, 12, null);
    }

    @JavascriptInterface
    public final void onEvent(@NotNull String event) throws JSONException {
        Intrinsics.g(event, "event");
        this.f39438a.a(event);
    }

    @JavascriptInterface
    @NotNull
    public final String sdkVersion() {
        return BuildConfig.SDK_VERSION_NAME;
    }
}
