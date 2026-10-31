package com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid;

import android.content.Context;
import android.graphics.Rect;
import android.webkit.WebView;
import com.moloco.sdk.internal.x;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.n;
import kotlin.NoWhenBranchMatchedException;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.json.internal.AbstractJsonLexerKt;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONObject;
import t70.j0;
import t70.m0;
import w70.g2;
import w70.l1;
import w70.q1;
import w70.t1;
import w70.u1;

/* loaded from: classes4.dex */
public final class g implements f {

    /* renamed from: i, reason: collision with root package name */
    public static final int f39103i = 8;

    /* renamed from: a, reason: collision with root package name */
    public final boolean f39104a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final j0 f39105b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final l1 f39106c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final q1 f39107d;

    /* renamed from: e, reason: collision with root package name */
    @NotNull
    public final v f39108e;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public final WebView f39109f;

    /* renamed from: g, reason: collision with root package name */
    @NotNull
    public final g2 f39110g;

    /* renamed from: h, reason: collision with root package name */
    @NotNull
    public final g2 f39111h;

    public static final class a implements o {
        public a() {
        }

        @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.o
        public boolean a(String fromUrl) {
            Intrinsics.g(fromUrl, "fromUrl");
            return g.this.b(fromUrl);
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.MraidBridgeImpl$consumeMraidJsCommand$1", f = "MraidBridge.kt", l = {101}, m = "invokeSuspend")
    public static final class b extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public Object f39113a;

        /* renamed from: b, reason: collision with root package name */
        public int f39114b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ com.moloco.sdk.internal.x<n, n.b.a> f39115c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ g f39116d;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public b(com.moloco.sdk.internal.x<n, n.b.a> xVar, g gVar, Continuation<? super b> continuation) {
            super(2, continuation);
            this.f39115c = xVar;
            this.f39116d = gVar;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((b) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new b(this.f39115c, this.f39116d, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            n nVar;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f39114b;
            if (i5 == 0) {
                ResultKt.b(obj);
                n nVar2 = (n) ((x.b) this.f39115c).a();
                l1 l1Var = this.f39116d.f39106c;
                this.f39113a = nVar2;
                this.f39114b = 1;
                if (l1Var.emit(nVar2, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
                nVar = nVar2;
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                nVar = (n) this.f39113a;
                ResultKt.b(obj);
            }
            this.f39116d.a(nVar);
            return Unit.f71706a;
        }
    }

    public g(@NotNull Context context, @NotNull j0 scope, boolean z11) {
        Intrinsics.g(context, "context");
        Intrinsics.g(scope, "scope");
        this.f39104a = z11;
        this.f39105b = new y70.d(scope.getCoroutineContext().plus(com.moloco.sdk.internal.scheduling.b.a().getMain()));
        t1 t1VarB = u1.b(0, 0, null, 7);
        this.f39106c = t1VarB;
        this.f39107d = t1VarB;
        v vVar = new v(context, new a());
        this.f39108e = vVar;
        this.f39109f = vVar;
        this.f39110g = vVar.c();
        this.f39111h = vVar.getUnrecoverableError();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.f
    @NotNull
    public g2 L() {
        return this.f39110g;
    }

    public final boolean b(String str) {
        com.moloco.sdk.internal.x<n, n.b.a> xVarA = n.f39148b.a(str);
        if (xVarA instanceof x.b) {
            m0.t(this.f39105b, null, null, new b(xVarA, this, null), 3);
            return true;
        }
        if (xVarA instanceof x.a) {
            return ((n.b.a) ((x.a) xVarA).a()).b();
        }
        throw new NoWhenBranchMatchedException();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.f
    @NotNull
    public WebView c() {
        return this.f39109f;
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.l
    public void destroy() {
        this.f39108e.destroy();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.f
    public void j() {
        c("mraidbridge.notifyReadyEvent()");
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.f
    @NotNull
    public q1 y() {
        return this.f39107d;
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.f
    @NotNull
    public g2 z() {
        return this.f39111h;
    }

    public final void c(String str) {
        this.f39108e.loadUrl("javascript:" + str);
    }

    public final void a(n nVar) {
        c("mraidbridge.nativeCallComplete(" + JSONObject.quote(nVar.a()) + ')');
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.f
    public void a(@NotNull n command, @NotNull String msg) {
        Intrinsics.g(command, "command");
        Intrinsics.g(msg, "msg");
        c("mraidbridge.notifyErrorEvent(" + JSONObject.quote(command.a()) + ", " + JSONObject.quote(msg) + ')');
    }

    public final String b(Rect rect) {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(rect.width());
        sb2.append(AbstractJsonLexerKt.COMMA);
        sb2.append(rect.height());
        return sb2.toString();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.f
    public void a(boolean z11) {
        c("mraidbridge.setIsViewable(" + z11 + ')');
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.f
    public void a(@NotNull r placementType) {
        Intrinsics.g(placementType, "placementType");
        c("mraidbridge.setPlacementType(" + JSONObject.quote(placementType.c()) + ')');
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.f
    public void a(@NotNull t state) {
        Intrinsics.g(state, "state");
        c("mraidbridge.setState(" + JSONObject.quote(state.c()) + ')');
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.f
    public void a(boolean z11, boolean z12, boolean z13, boolean z14, boolean z15) {
        c("mraidbridge.setSupports(" + z11 + AbstractJsonLexerKt.COMMA + z12 + AbstractJsonLexerKt.COMMA + z13 + AbstractJsonLexerKt.COMMA + z14 + AbstractJsonLexerKt.COMMA + z15 + ')');
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.f
    public void a(@NotNull s screenMetrics) {
        Intrinsics.g(screenMetrics, "screenMetrics");
        c("\n                mraidbridge.setScreenSize(" + b(screenMetrics.g()) + ");\n                mraidbridge.setMaxSize(" + b(screenMetrics.f()) + ");\n                mraidbridge.setCurrentPosition(" + a(screenMetrics.b()) + ");\n                mraidbridge.setDefaultPosition(" + a(screenMetrics.d()) + ")\n            ");
        StringBuilder sb2 = new StringBuilder("mraidbridge.notifySizeChangeEvent(");
        sb2.append(b(screenMetrics.b()));
        sb2.append(')');
        c(sb2.toString());
    }

    public final String a(Rect rect) {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(rect.left);
        sb2.append(AbstractJsonLexerKt.COMMA);
        sb2.append(rect.top);
        sb2.append(AbstractJsonLexerKt.COMMA);
        sb2.append(rect.width());
        sb2.append(AbstractJsonLexerKt.COMMA);
        sb2.append(rect.height());
        return sb2.toString();
    }

    @Override // com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.mraid.f
    @Nullable
    public Object a(@NotNull String str, @NotNull Continuation<? super com.moloco.sdk.internal.x<c, com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.errors.d>> continuation) {
        return this.f39108e.a(str, this.f39104a, continuation);
    }
}
