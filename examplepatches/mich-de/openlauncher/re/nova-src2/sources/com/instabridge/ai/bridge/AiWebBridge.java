package com.instabridge.ai.bridge;

import a80.e;
import ae.c;
import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.webkit.JavascriptInterface;
import android.webkit.WebView;
import aq.e0;
import aq.f;
import aq.h0;
import aq.r;
import b.c0;
import b70.h;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import h6.c1;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import r70.j;
import t70.i2;
import t70.j0;
import t70.k0;
import t70.m0;
import t70.y0;
import y70.o;

@Metadata(d1 = {"\u0000V\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010\u0002\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010$\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010%\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u0000 -2\u00020\u0001:\u0001-B\u0017\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004¢\u0006\u0004\b\u0006\u0010\u0007J\u001f\u0010\u000b\u001a\u00020\n2\u0006\u0010\b\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\u000b\u0010\fJ\u0017\u0010\u000e\u001a\u00020\u00042\u0006\u0010\r\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\u000e\u0010\u000fJ\u0017\u0010\u0011\u001a\u00020\u00042\u0006\u0010\u0010\u001a\u00020\u0004H\u0002¢\u0006\u0004\b\u0011\u0010\u000fJ\u0015\u0010\u0014\u001a\u00020\n2\u0006\u0010\u0013\u001a\u00020\u0012¢\u0006\u0004\b\u0014\u0010\u0015J+\u0010\u000b\u001a\u00020\n2\u0006\u0010\b\u001a\u00020\u00042\u0014\u0010\u0017\u001a\u0010\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0016¢\u0006\u0004\b\u000b\u0010\u0018J\u001f\u0010\u0019\u001a\u00020\u00042\u0006\u0010\b\u001a\u00020\u00042\u0006\u0010\t\u001a\u00020\u0004H\u0007¢\u0006\u0004\b\u0019\u0010\u001aR\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010\u001bR\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010\u001cR\u0014\u0010\u001e\u001a\u00020\u001d8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u001e\u0010\u001fR\u0014\u0010!\u001a\u00020 8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b!\u0010\"R \u0010$\u001a\u000e\u0012\u0004\u0012\u00020\u0004\u0012\u0004\u0012\u00020\u00120#8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b$\u0010%R\u001c\u0010(\u001a\n '*\u0004\u0018\u00010&0&8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b(\u0010)Rp\u0010+\u001a^\u0012(\u0012&\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u0001 '*\u0012\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u00160\u0016 '*.\u0012(\u0012&\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u0001 '*\u0012\u0012\u0004\u0012\u00020\u0004\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u00160\u0016\u0018\u00010*0*8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b+\u0010,¨\u0006."}, d2 = {"Lcom/instabridge/ai/bridge/AiWebBridge;", b.f42142b, "Landroid/webkit/WebView;", "webView", b.f42142b, "appId", "<init>", "(Landroid/webkit/WebView;Ljava/lang/String;)V", "channel", "payloadJson", b.f42142b, "sendToWeb", "(Ljava/lang/String;Ljava/lang/String;)V", PglCryptUtils.KEY_MESSAGE, "errorJson", "(Ljava/lang/String;)Ljava/lang/String;", "value", "escapeForJs", "Lcom/instabridge/ai/bridge/ChannelHandler;", "handler", "registerHandler", "(Lcom/instabridge/ai/bridge/ChannelHandler;)V", b.f42142b, "payload", "(Ljava/lang/String;Ljava/util/Map;)V", "send", "(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;", "Landroid/webkit/WebView;", "Ljava/lang/String;", "Landroid/os/Handler;", "mainHandler", "Landroid/os/Handler;", "Lt70/j0;", "scope", "Lt70/j0;", b.f42142b, "handlers", "Ljava/util/Map;", "Laq/h0;", "kotlin.jvm.PlatformType", "moshi", "Laq/h0;", "Laq/r;", "mapAdapter", "Laq/r;", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class AiWebBridge {

    @NotNull
    public static final String JS_INTERFACE_NAME = "NativeAI";

    @NotNull
    private static final String TAG = "AiWebBridge";

    @NotNull
    private final String appId;

    @NotNull
    private final Map<String, ChannelHandler> handlers;

    @NotNull
    private final Handler mainHandler;
    private final r mapAdapter;
    private final h0 moshi;

    @NotNull
    private final j0 scope;

    @NotNull
    private final WebView webView;
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.bridge.AiWebBridge$send$1", f = "AiWebBridge.kt", l = {182}, m = "invokeSuspend")
    /* renamed from: com.instabridge.ai.bridge.AiWebBridge$send$1, reason: invalid class name */
    public static final class AnonymousClass1 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ String $action;
        final /* synthetic */ String $channel;
        final /* synthetic */ String $domain;
        final /* synthetic */ ChannelHandler $handler;
        final /* synthetic */ Map<String, Object> $payload;
        final /* synthetic */ AiWebBridge$send$responder$1 $responder;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AnonymousClass1(ChannelHandler channelHandler, String str, Map<String, ? extends Object> map, AiWebBridge$send$responder$1 aiWebBridge$send$responder$1, String str2, String str3, Continuation<? super AnonymousClass1> continuation) {
            super(2, continuation);
            this.$handler = channelHandler;
            this.$action = str;
            this.$payload = map;
            this.$responder = aiWebBridge$send$responder$1;
            this.$channel = str2;
            this.$domain = str3;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new AnonymousClass1(this.$handler, this.$action, this.$payload, this.$responder, this.$channel, this.$domain, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            try {
                if (i5 == 0) {
                    ResultKt.b(obj);
                    ChannelHandler channelHandler = this.$handler;
                    String str = this.$action;
                    Map<String, ? extends Object> map = this.$payload;
                    AiWebBridge$send$responder$1 aiWebBridge$send$responder$1 = this.$responder;
                    this.label = 1;
                    if (channelHandler.handleAsync(str, map, aiWebBridge$send$responder$1, this) == coroutineSingletons) {
                        return coroutineSingletons;
                    }
                } else {
                    if (i5 != 1) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    ResultKt.b(obj);
                }
            } catch (Exception e3) {
                Log.e(AiWebBridge.TAG, "Async handler failed for " + this.$channel, e3);
                AiWebBridge$send$responder$1 aiWebBridge$send$responder$12 = this.$responder;
                String strQ = c0.q(new StringBuilder(), this.$domain, "/error");
                String message = e3.getMessage();
                if (message == null) {
                    message = "Async handler failed";
                }
                aiWebBridge$send$responder$12.sendError(strQ, message);
            }
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((AnonymousClass1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    public AiWebBridge(@NotNull WebView webView, @NotNull String appId) {
        Intrinsics.g(webView, "webView");
        Intrinsics.g(appId, "appId");
        this.webView = webView;
        this.appId = appId;
        this.mainHandler = new Handler(Looper.getMainLooper());
        i2 i2VarD = m0.d();
        e eVar = y0.f88884a;
        this.scope = k0.a(CoroutineContext.Element.DefaultImpls.d(i2VarD, o.f96819a));
        this.handlers = new LinkedHashMap();
        e0 e0Var = new e0(0);
        e0Var.d(new f(6));
        h0 h0Var = new h0(e0Var);
        this.moshi = h0Var;
        this.mapAdapter = h0Var.b(aq.m0.f(Map.class, String.class, Object.class), bq.e.f18422a, null);
        Context context = webView.getContext();
        Intrinsics.f(context, "getContext(...)");
        registerHandler(new ToolsChannelHandler(context));
        registerHandler(new SessionChannelHandler());
    }

    private final String errorJson(String message) {
        return c0.l("{\"error\":\"", j.F0(message, "\"", "\\\"", false), "\"}");
    }

    private final String escapeForJs(String value) {
        return j.F0(j.F0(j.F0(j.F0(j.F0(j.F0(value, "\\", "\\\\", false), "'", "\\'", false), "\"", "\\\"", false), "\n", "\\n", false), "\r", "\\r", false), "\t", "\\t", false);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final void sendToWeb$lambda$0(AiWebBridge aiWebBridge, String str) {
        aiWebBridge.webView.evaluateJavascript(str, null);
    }

    public final void registerHandler(@NotNull ChannelHandler handler) {
        Intrinsics.g(handler, "handler");
        this.handlers.put(handler.getDomain(), handler);
        handler.getDomain();
    }

    @JavascriptInterface
    @NotNull
    public final String send(@NotNull String channel, @NotNull String payloadJson) {
        String str;
        Exception exc;
        Map<String, ? extends Object> map;
        Intrinsics.g(channel, "channel");
        Intrinsics.g(payloadJson, "payloadJson");
        List listI1 = r70.k.i1(channel, new String[]{"/"}, 2);
        if (listI1.size() != 2) {
            return errorJson(c0.l("Invalid channel format: ", channel, " (expected domain/action)"));
        }
        String str2 = (String) listI1.get(0);
        String str3 = (String) listI1.get(1);
        ChannelHandler channelHandler = this.handlers.get(str2);
        if (channelHandler == null) {
            return errorJson(c0.k("Unknown channel domain: ", str2));
        }
        try {
            boolean zU0 = r70.k.U0(payloadJson);
            h hVar = h.f17594a;
            if (zU0) {
                map = hVar;
            } else {
                try {
                    if (!payloadJson.equals("{}")) {
                        Map<String, ? extends Object> map2 = (Map) this.mapAdapter.b(payloadJson);
                        if (map2 != null) {
                            map = map2;
                        }
                    }
                    map = hVar;
                } catch (Exception e3) {
                    exc = e3;
                    str = channel;
                    Log.e(TAG, "Failed to parse payload for ".concat(str), exc);
                    return errorJson(c1.s(exc, new StringBuilder("Invalid JSON payload: ")));
                }
            }
            String strHandle = channelHandler.handle(str3, map);
            if (strHandle != null) {
                return strHandle;
            }
            m0.t(this.scope, null, null, new AnonymousClass1(channelHandler, str3, map, new AiWebBridge$send$responder$1(this), channel, str2, null), 3);
            return "{\"ack\":true}";
        } catch (Exception e11) {
            str = channel;
            exc = e11;
        }
    }

    public final void sendToWeb(@NotNull String channel, @NotNull Map<String, ? extends Object> payload) {
        Intrinsics.g(channel, "channel");
        Intrinsics.g(payload, "payload");
        try {
            sendToWeb(channel, this.mapAdapter.d(payload));
        } catch (Exception e3) {
            Log.e(TAG, "Failed to serialize payload for ".concat(channel), e3);
        }
    }

    private final void sendToWeb(String channel, String payloadJson) {
        this.mainHandler.post(new c(12, this, c0.n("javascript:void((function(){if(typeof window.__onNativeMessage==='function'){window.__onNativeMessage('", escapeForJs(channel), "','", escapeForJs(payloadJson), "');}})())")));
    }
}
