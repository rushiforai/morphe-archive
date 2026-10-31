package com.instabridge.ai.tools;

import a80.m;
import android.util.Log;
import aq.f;
import aq.h0;
import aq.r;
import b.c0;
import b.u4;
import com.amplitude.core.events.Identify;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.instabridge.ai.auth.AccountDeletedInterceptor;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.persistenttransport.h;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;
import java.util.regex.Pattern;
import jo.e;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.collections.EmptyList;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.m0;
import t70.p2;
import t70.s;
import t70.y0;
import x80.a0;
import x80.d0;
import x80.e0;
import x80.g0;
import x80.k0;
import x80.p0;
import x80.z;

@Metadata(d1 = {"\u0000\u009a\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0010\n\u0002\u0010\u0003\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0007\u0018\u0000 `2\u00020\u0001:\u0001`B;\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u001e\u0010\u0007\u001a\u001a\b\u0001\u0012\f\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0004\u0012\n\b\u0002\u0010\t\u001a\u0004\u0018\u00010\b¢\u0006\u0004\b\n\u0010\u000bJ\u001a\u0010\u000f\u001a\u00020\u000e2\b\b\u0002\u0010\r\u001a\u00020\fH\u0086@¢\u0006\u0004\b\u000f\u0010\u0010J\u0013\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\u00120\u0011¢\u0006\u0004\b\u0013\u0010\u0014J#\u0010\u0017\u001a\u00020\u000e2\u0006\u0010\u0015\u001a\u00020\u00062\f\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00120\u0011¢\u0006\u0004\b\u0017\u0010\u0018J\r\u0010\u001a\u001a\u00020\u0019¢\u0006\u0004\b\u001a\u0010\u001bJ_\u0010$\u001a\u00020\u00192\u0006\u0010\u001c\u001a\u00020\u00062H\u0010#\u001aD\u0012#\u0012!\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u001e¢\u0006\f\b\u001f\u0012\b\b \u0012\u0004\b\b(!\u0012\u0015\u0012\u0013\u0018\u00010\u0006¢\u0006\f\b\u001f\u0012\b\b \u0012\u0004\b\b(\"\u0012\u0004\u0012\u00020\u00190\u001d¢\u0006\u0004\b$\u0010%J\u0015\u0010&\u001a\u00020\u00192\u0006\u0010\u001c\u001a\u00020\u0006¢\u0006\u0004\b&\u0010'J0\u0010*\u001a\u0004\u0018\u00010)2\u0006\u0010\u0015\u001a\u00020\u00062\u0006\u0010(\u001a\u00020\u00062\f\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00120\u0011H\u0086@¢\u0006\u0004\b*\u0010+J+\u0010,\u001a\u00020\u000e2\u0006\u0010\u001c\u001a\u00020\u00062\u0014\u0010!\u001a\u0010\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u001e¢\u0006\u0004\b,\u0010-J\u001d\u0010.\u001a\u00020\u000e2\u0006\u0010\u001c\u001a\u00020\u00062\u0006\u0010\"\u001a\u00020\u0006¢\u0006\u0004\b.\u0010/J\u000f\u00100\u001a\u0004\u0018\u00010\u0006¢\u0006\u0004\b0\u00101J\r\u00102\u001a\u00020\u000e¢\u0006\u0004\b2\u00103J9\u00104\u001a\u00020\u000e2\u0006\u0010\u001c\u001a\u00020\u00062\u0016\u0010!\u001a\u0012\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u001e2\b\u0010\"\u001a\u0004\u0018\u00010\u0006H\u0002¢\u0006\u0004\b4\u00105J%\u00107\u001a\u00020\u00192\u0006\u0010\u0015\u001a\u00020\u00062\f\u00106\u001a\b\u0012\u0004\u0012\u00020\u00060\u0011H\u0002¢\u0006\u0004\b7\u00108J#\u0010<\u001a\u00020\u00192\u0006\u00109\u001a\u00020\u00062\n\b\u0002\u0010;\u001a\u0004\u0018\u00010:H\u0002¢\u0006\u0004\b<\u0010=R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010>R,\u0010\u0007\u001a\u001a\b\u0001\u0012\f\u0012\n\u0012\u0006\u0012\u0004\u0018\u00010\u00060\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010?R\u0016\u0010\t\u001a\u0004\u0018\u00010\b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010@R\u0014\u0010B\u001a\u00020A8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bB\u0010CR\u001c\u0010F\u001a\n E*\u0004\u0018\u00010D0D8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bF\u0010GR8\u0010J\u001a&\u0012\f\u0012\n E*\u0004\u0018\u00010I0I E*\u0012\u0012\f\u0012\n E*\u0004\u0018\u00010I0I\u0018\u00010H0H8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bJ\u0010KR8\u0010M\u001a&\u0012\f\u0012\n E*\u0004\u0018\u00010L0L E*\u0012\u0012\f\u0012\n E*\u0004\u0018\u00010L0L\u0018\u00010H0H8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bM\u0010KR\u0018\u0010N\u001a\u0004\u0018\u00010\u00068\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bN\u0010OR\u001c\u0010P\u001a\b\u0012\u0004\u0012\u00020\u00060\u00118\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bP\u0010QR\u001c\u0010R\u001a\b\u0012\u0004\u0012\u00020\u00120\u00118\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bR\u0010QR\u001c\u0010T\u001a\b\u0012\u0004\u0012\u00020\u000e0S8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\bT\u0010UR*\u0010V\u001a\u0004\u0018\u00010)8\u0000@\u0000X\u0081\u000e¢\u0006\u0018\n\u0004\bV\u0010W\u0012\u0004\b\\\u0010\u001b\u001a\u0004\bX\u0010Y\"\u0004\bZ\u0010[RD\u0010^\u001a2\u0012\u0004\u0012\u00020\u0006\u0012(\u0012&\u0012\u0014\u0012\u0012\u0012\u0004\u0012\u00020\u0006\u0012\u0006\u0012\u0004\u0018\u00010\u0001\u0018\u00010\u001e\u0012\u0006\u0012\u0004\u0018\u00010\u0006\u0012\u0004\u0012\u00020\u00190\u001d0]8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b^\u0010_¨\u0006a"}, d2 = {"Lcom/instabridge/ai/tools/AiToolsManager;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lfo/a;", "config", "Lkotlin/Function1;", "Lkotlin/coroutines/Continuation;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "tokenProvider", "Lcom/instabridge/ai/tools/ToolRegistrationStateStore;", "registrationStateStore", "<init>", "(Lfo/a;Lkotlin/jvm/functions/Function1;Lcom/instabridge/ai/tools/ToolRegistrationStateStore;)V", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "timeoutMs", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "awaitRegistration", "(JLkotlin/coroutines/Continuation;)Ljava/lang/Object;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lcom/instabridge/ai/tools/ToolDefinition;", "getRegisteredTools", "()Ljava/util/List;", "sessionId", "tools", "restoreCachedRegistration", "(Ljava/lang/String;Ljava/util/List;)Z", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "clearRegistrationState", "()V", "callId", "Lkotlin/Function2;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "result", "error", "interceptor", "interceptCallback", "(Ljava/lang/String;Lkotlin/jvm/functions/Function2;)V", "removeInterceptor", "(Ljava/lang/String;)V", "appId", "Lcom/instabridge/ai/tools/ToolRegistrationResult;", "register", "(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "callback", "(Ljava/lang/String;Ljava/util/Map;)Z", "callbackError", "(Ljava/lang/String;Ljava/lang/String;)Z", "getSessionId", "()Ljava/lang/String;", "isRegistered", "()Z", "sendCallback", "(Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Z", "toolIds", "saveRegistrationSnapshot", "(Ljava/lang/String;Ljava/util/List;)V", PglCryptUtils.KEY_MESSAGE, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "throwable", "log", "(Ljava/lang/String;Ljava/lang/Throwable;)V", "Lfo/a;", "Lkotlin/jvm/functions/Function1;", "Lcom/instabridge/ai/tools/ToolRegistrationStateStore;", "Lx80/e0;", "client", "Lx80/e0;", "Laq/h0;", "kotlin.jvm.PlatformType", "moshi", "Laq/h0;", "Laq/r;", "Lcom/instabridge/ai/tools/ToolRegistrationRequest;", "registrationRequestAdapter", "Laq/r;", "Lcom/instabridge/ai/tools/ToolRegistrationResponse;", "registrationResponseAdapter", "currentSessionId", "Ljava/lang/String;", "registeredToolIds", "Ljava/util/List;", "registeredTools", "Lt70/r;", "registrationSignal", "Lt70/r;", "testStubResult", "Lcom/instabridge/ai/tools/ToolRegistrationResult;", "getTestStubResult$instabridge_ai_sdk_release", "()Lcom/instabridge/ai/tools/ToolRegistrationResult;", "setTestStubResult$instabridge_ai_sdk_release", "(Lcom/instabridge/ai/tools/ToolRegistrationResult;)V", "getTestStubResult$instabridge_ai_sdk_release$annotations", "Ljava/util/concurrent/ConcurrentHashMap;", "callbackInterceptors", "Ljava/util/concurrent/ConcurrentHashMap;", k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes3.dex */
public final class AiToolsManager {

    @NotNull
    private static final String TAG = "AiToolsManager";

    @NotNull
    private final ConcurrentHashMap<String, Function2<Map<String, ? extends Object>, String, Unit>> callbackInterceptors;

    @NotNull
    private final e0 client;

    @NotNull
    private final fo.a config;

    @Nullable
    private String currentSessionId;
    private final h0 moshi;

    @NotNull
    private List<String> registeredToolIds;

    @NotNull
    private List<ToolDefinition> registeredTools;
    private final r registrationRequestAdapter;
    private final r registrationResponseAdapter;

    @NotNull
    private t70.r registrationSignal;

    @Nullable
    private final ToolRegistrationStateStore registrationStateStore;

    @Nullable
    private ToolRegistrationResult testStubResult;

    @NotNull
    private final Function1<Continuation<? super String>, Object> tokenProvider;
    public static final int $stable = 8;

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    @DebugMetadata(c = "com.instabridge.ai.tools.AiToolsManager", f = "AiToolsManager.kt", l = {80}, m = "awaitRegistration")
    /* renamed from: com.instabridge.ai.tools.AiToolsManager$awaitRegistration$1, reason: invalid class name */
    public static final class AnonymousClass1 extends ContinuationImpl {
        int label;
        /* synthetic */ Object result;

        public AnonymousClass1(Continuation<? super AnonymousClass1> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return AiToolsManager.this.awaitRegistration(0L, this);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u000b\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<anonymous>", "(Lt70/j0;)Z"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.tools.AiToolsManager$awaitRegistration$2", f = "AiToolsManager.kt", l = {80}, m = "invokeSuspend")
    /* renamed from: com.instabridge.ai.tools.AiToolsManager$awaitRegistration$2, reason: invalid class name */
    public static final class AnonymousClass2 extends SuspendLambda implements Function2<j0, Continuation<? super Boolean>, Object> {
        int label;

        public AnonymousClass2(Continuation<? super AnonymousClass2> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return AiToolsManager.this.new AnonymousClass2(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 != 0) {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                return obj;
            }
            ResultKt.b(obj);
            t70.r rVar = AiToolsManager.this.registrationSignal;
            this.label = 1;
            Object objL = rVar.l(this);
            return objL == coroutineSingletons ? coroutineSingletons : objL;
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super Boolean> continuation) {
            return ((AnonymousClass2) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u0004\u0018\u00010\u0001*\u00020\u0000H\n¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", "Lcom/instabridge/ai/tools/ToolRegistrationResult;", "<anonymous>", "(Lt70/j0;)Lcom/instabridge/ai/tools/ToolRegistrationResult;"}, k = 3, mv = {2, 1, 0})
    @DebugMetadata(c = "com.instabridge.ai.tools.AiToolsManager$register$2", f = "AiToolsManager.kt", l = {201}, m = "invokeSuspend")
    @SourceDebugExtension
    /* renamed from: com.instabridge.ai.tools.AiToolsManager$register$2, reason: invalid class name and case insensitive filesystem */
    public static final class C28562 extends SuspendLambda implements Function2<j0, Continuation<? super ToolRegistrationResult>, Object> {
        final /* synthetic */ String $appId;
        final /* synthetic */ String $sessionId;
        final /* synthetic */ List<ToolDefinition> $tools;
        long J$0;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C28562(String str, List<ToolDefinition> list, String str2, Continuation<? super C28562> continuation) {
            super(2, continuation);
            this.$sessionId = str;
            this.$tools = list;
            this.$appId = str2;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return AiToolsManager.this.new C28562(this.$sessionId, this.$tools, this.$appId, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            long j11;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                AiToolsManager.this.currentSessionId = this.$sessionId;
                AiToolsManager.this.registeredTools = this.$tools;
                if (AiToolsManager.this.registrationSignal.isCompleted()) {
                    AiToolsManager.this.registrationSignal = m0.b();
                }
                long jCurrentTimeMillis = System.currentTimeMillis();
                ToolRegistrationResult testStubResult = AiToolsManager.this.getTestStubResult();
                if (testStubResult != null) {
                    AiToolsManager.this.currentSessionId = testStubResult.getSessionId();
                    AiToolsManager.this.registeredToolIds = testStubResult.getToolIds();
                    ((s) AiToolsManager.this.registrationSignal).X(Boolean.TRUE);
                    AiToolsManager.this.saveRegistrationSnapshot(testStubResult.getSessionId(), testStubResult.getToolIds());
                    e.a(jo.c.f69622a, Identify.UNSET_VALUE, jo.b.f69616a, new Long(System.currentTimeMillis() - jCurrentTimeMillis), b70.k.e0(new Pair("count", new Integer(testStubResult.getRegisteredCount()))));
                    return testStubResult;
                }
                Function1 function1 = AiToolsManager.this.tokenProvider;
                this.J$0 = jCurrentTimeMillis;
                this.label = 1;
                obj = function1.invoke(this);
                if (obj == coroutineSingletons) {
                    return coroutineSingletons;
                }
                j11 = jCurrentTimeMillis;
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                j11 = this.J$0;
                ResultKt.b(obj);
            }
            String str = (String) obj;
            if (str == null) {
                AiToolsManager.log$default(AiToolsManager.this, "Cannot register tools: no auth token", null, 2, null);
                ((s) AiToolsManager.this.registrationSignal).X(Boolean.FALSE);
                e.a(jo.c.f69622a, Identify.UNSET_VALUE, jo.b.f69617b, new Long(System.currentTimeMillis() - j11), m.n("reason", "no_token"));
                return null;
            }
            String str2 = this.$sessionId;
            String str3 = this.$appId;
            List<ToolDefinition> list = this.$tools;
            ArrayList arrayList = new ArrayList(b70.c.u0(list, 10));
            Iterator<T> it = list.iterator();
            while (it.hasNext()) {
                arrayList.add(((ToolDefinition) it.next()).toApiFormat$instabridge_ai_sdk_release());
            }
            ToolRegistrationRequest toolRegistrationRequest = new ToolRegistrationRequest(str2, str3, arrayList);
            g0 g0Var = new g0();
            g0Var.k(AiToolsManager.this.config.f55437b + "api/tools/register");
            g0Var.a("Authorization", "Bearer ".concat(str));
            g0Var.a("Content-Type", "application/json");
            x80.j0 j0Var = k0.Companion;
            String strD = AiToolsManager.this.registrationRequestAdapter.d(toolRegistrationRequest);
            Pattern pattern = a0.f95396e;
            a0 a0VarA = z.a("application/json");
            j0Var.getClass();
            g0Var.h(x80.j0.a(strD, a0VarA));
            try {
                x80.m0 m0VarL = AiToolsManager.this.client.c(g0Var.b()).l();
                try {
                    p0 p0Var = m0VarL.f95559g;
                    String strString = p0Var != null ? p0Var.string() : null;
                    m0VarL.close();
                    boolean zC = m0VarL.c();
                    int i11 = m0VarL.f95556d;
                    if (!zC) {
                        AiToolsManager.log$default(AiToolsManager.this, "Tool registration failed: HTTP " + i11, null, 2, null);
                        ((s) AiToolsManager.this.registrationSignal).X(Boolean.FALSE);
                        e.a(jo.c.f69622a, Identify.UNSET_VALUE, jo.b.f69617b, new Long(System.currentTimeMillis() - j11), b70.k.e0(new Pair("reason", "http_" + i11)));
                        return null;
                    }
                    ToolRegistrationResponse toolRegistrationResponse = strString != null ? (ToolRegistrationResponse) AiToolsManager.this.registrationResponseAdapter.b(strString) : null;
                    if (toolRegistrationResponse != null) {
                        AiToolsManager.this.currentSessionId = toolRegistrationResponse.getSessionId();
                        AiToolsManager.this.registeredToolIds = toolRegistrationResponse.getToolIds();
                        AiToolsManager.this.registeredTools = this.$tools;
                        ((s) AiToolsManager.this.registrationSignal).X(Boolean.TRUE);
                        AiToolsManager.this.saveRegistrationSnapshot(toolRegistrationResponse.getSessionId(), toolRegistrationResponse.getToolIds());
                        AiToolsManager.log$default(AiToolsManager.this, "Registered " + toolRegistrationResponse.getRegisteredCount() + " tools for session " + toolRegistrationResponse.getSessionId(), null, 2, null);
                        int i12 = jo.a.f69615a;
                        String sessionId = toolRegistrationResponse.getSessionId();
                        this.$tools.size();
                        List<ToolDefinition> list2 = this.$tools;
                        ArrayList arrayList2 = new ArrayList(b70.c.u0(list2, 10));
                        Iterator<T> it2 = list2.iterator();
                        while (it2.hasNext()) {
                            arrayList2.add(((ToolDefinition) it2.next()).getName());
                        }
                        this.$tools.size();
                        Intrinsics.g(sessionId, "sessionId");
                        jo.a.a();
                        e.a(jo.c.f69622a, Identify.UNSET_VALUE, jo.b.f69616a, new Long(System.currentTimeMillis() - j11), b70.k.e0(new Pair("count", new Integer(toolRegistrationResponse.getRegisteredCount()))));
                    }
                    if (toolRegistrationResponse != null) {
                        return new ToolRegistrationResult(toolRegistrationResponse.getSessionId(), toolRegistrationResponse.getRegisteredCount(), toolRegistrationResponse.getToolIds());
                    }
                    return null;
                } finally {
                }
            } catch (Exception e3) {
                AiToolsManager.this.log("Tool registration error: " + e3.getMessage(), e3);
                ((s) AiToolsManager.this.registrationSignal).X(Boolean.FALSE);
                e.a(jo.c.f69622a, Identify.UNSET_VALUE, jo.b.f69617b, new Long(System.currentTimeMillis() - j11), m.n("reason", "exception"));
                return null;
            }
        }

        @Override // kotlin.jvm.functions.Function2
        public final Object invoke(j0 j0Var, Continuation<? super ToolRegistrationResult> continuation) {
            return ((C28562) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public AiToolsManager(@NotNull fo.a config, @NotNull Function1<? super Continuation<? super String>, ? extends Object> tokenProvider, @Nullable ToolRegistrationStateStore toolRegistrationStateStore) {
        Intrinsics.g(config, "config");
        Intrinsics.g(tokenProvider, "tokenProvider");
        this.config = config;
        this.tokenProvider = tokenProvider;
        this.registrationStateStore = toolRegistrationStateStore;
        d0 d0Var = new d0();
        TimeUnit timeUnit = TimeUnit.SECONDS;
        d0Var.c(30L, timeUnit);
        d0Var.d(30L, timeUnit);
        d0Var.e(30L);
        d0Var.a(AccountDeletedInterceptor.INSTANCE);
        this.client = new e0(d0Var);
        aq.e0 e0Var = new aq.e0(0);
        e0Var.d(new f(6));
        h0 h0Var = new h0(e0Var);
        this.moshi = h0Var;
        Set set = bq.e.f18422a;
        this.registrationRequestAdapter = h0Var.b(ToolRegistrationRequest.class, set, null);
        this.registrationResponseAdapter = h0Var.b(ToolRegistrationResponse.class, set, null);
        EmptyList emptyList = EmptyList.f71733a;
        this.registeredToolIds = emptyList;
        this.registeredTools = emptyList;
        this.registrationSignal = m0.b();
        this.callbackInterceptors = new ConcurrentHashMap<>();
    }

    public static /* synthetic */ Object awaitRegistration$default(AiToolsManager aiToolsManager, long j11, Continuation continuation, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            j11 = h.f42227c;
        }
        return aiToolsManager.awaitRegistration(j11, continuation);
    }

    public static /* synthetic */ void getTestStubResult$instabridge_ai_sdk_release$annotations() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void log(String message, Throwable throwable) {
        this.config.getClass();
    }

    public static /* synthetic */ void log$default(AiToolsManager aiToolsManager, String str, Throwable th2, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            th2 = null;
        }
        aiToolsManager.log(str, th2);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void saveRegistrationSnapshot(String sessionId, List<String> toolIds) {
        ToolRegistrationStateStore toolRegistrationStateStore;
        if (toolIds.isEmpty() || (toolRegistrationStateStore = this.registrationStateStore) == null) {
            return;
        }
        toolRegistrationStateStore.save(new ToolRegistrationSnapshot(sessionId, toolIds, 0, 4, null));
    }

    private final boolean sendCallback(String callId, Map<String, ? extends Object> result, String error) {
        Function2<Map<String, ? extends Object>, String, Unit> function2Remove = this.callbackInterceptors.remove(callId);
        if (function2Remove != null) {
            log$default(this, c0.k("Callback intercepted for call ", callId), null, 2, null);
            function2Remove.invoke(result, error);
            e.b(jo.c.f69625d, Identify.UNSET_VALUE, error == null ? jo.b.f69616a : jo.b.f69617b, null, null, 24);
            return true;
        }
        Log.w(TAG, "No interceptor registered for tool call " + callId + " — result discarded. Ensure the caller registers an interceptor before dispatching tool execution.");
        return false;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object awaitRegistration(long j11, @NotNull Continuation<? super Boolean> continuation) {
        AnonymousClass1 anonymousClass1;
        if (continuation instanceof AnonymousClass1) {
            anonymousClass1 = (AnonymousClass1) continuation;
            int i5 = anonymousClass1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                anonymousClass1.label = i5 - Integer.MIN_VALUE;
            } else {
                anonymousClass1 = new AnonymousClass1(continuation);
            }
        }
        Object objD = anonymousClass1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = anonymousClass1.label;
        boolean zBooleanValue = false;
        try {
            if (i11 == 0) {
                ResultKt.b(objD);
                if (this.currentSessionId != null) {
                    return Boolean.TRUE;
                }
                AnonymousClass2 anonymousClass2 = new AnonymousClass2(null);
                anonymousClass1.label = 1;
                objD = p2.d(j11, anonymousClass2, anonymousClass1);
                if (objD == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i11 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(objD);
            }
            Boolean bool = (Boolean) objD;
            if (bool != null) {
                zBooleanValue = bool.booleanValue();
            }
        } catch (Exception unused) {
        }
        return Boolean.valueOf(zBooleanValue);
    }

    public final boolean callback(@NotNull String callId, @NotNull Map<String, ? extends Object> result) {
        Intrinsics.g(callId, "callId");
        Intrinsics.g(result, "result");
        return sendCallback(callId, result, null);
    }

    public final boolean callbackError(@NotNull String callId, @NotNull String error) {
        Intrinsics.g(callId, "callId");
        Intrinsics.g(error, "error");
        return sendCallback(callId, null, error);
    }

    public final void clearRegistrationState() {
        this.currentSessionId = null;
        EmptyList emptyList = EmptyList.f71733a;
        this.registeredToolIds = emptyList;
        this.registeredTools = emptyList;
        ToolRegistrationStateStore toolRegistrationStateStore = this.registrationStateStore;
        if (toolRegistrationStateStore != null) {
            toolRegistrationStateStore.clear();
        }
        ((s) this.registrationSignal).X(Boolean.FALSE);
        this.registrationSignal = m0.b();
    }

    @NotNull
    public final List<ToolDefinition> getRegisteredTools() {
        return this.registeredTools;
    }

    @Nullable
    /* renamed from: getSessionId, reason: from getter */
    public final String getCurrentSessionId() {
        return this.currentSessionId;
    }

    @Nullable
    /* renamed from: getTestStubResult$instabridge_ai_sdk_release, reason: from getter */
    public final ToolRegistrationResult getTestStubResult() {
        return this.testStubResult;
    }

    public final void interceptCallback(@NotNull String callId, @NotNull Function2<? super Map<String, ? extends Object>, ? super String, Unit> interceptor) {
        Intrinsics.g(callId, "callId");
        Intrinsics.g(interceptor, "interceptor");
        this.callbackInterceptors.put(callId, interceptor);
    }

    public final boolean isRegistered() {
        return (this.currentSessionId == null || this.registeredToolIds.isEmpty()) ? false : true;
    }

    @Nullable
    public final Object register(@NotNull String str, @NotNull String str2, @NotNull List<ToolDefinition> list, @NotNull Continuation<? super ToolRegistrationResult> continuation) {
        a80.e eVar = y0.f88884a;
        return m0.y(a80.d.f488c, new C28562(str, list, str2, null), continuation);
    }

    public final void removeInterceptor(@NotNull String callId) {
        Intrinsics.g(callId, "callId");
        this.callbackInterceptors.remove(callId);
    }

    public final boolean restoreCachedRegistration(@NotNull String sessionId, @NotNull List<ToolDefinition> tools) {
        ToolRegistrationSnapshot toolRegistrationSnapshotLoad;
        Intrinsics.g(sessionId, "sessionId");
        Intrinsics.g(tools, "tools");
        ToolRegistrationStateStore toolRegistrationStateStore = this.registrationStateStore;
        if (toolRegistrationStateStore == null || (toolRegistrationSnapshotLoad = toolRegistrationStateStore.load()) == null || toolRegistrationSnapshotLoad.getVersion() != 1 || !Intrinsics.b(toolRegistrationSnapshotLoad.getSessionId(), sessionId) || toolRegistrationSnapshotLoad.getToolIds().isEmpty()) {
            return false;
        }
        this.currentSessionId = toolRegistrationSnapshotLoad.getSessionId();
        this.registeredToolIds = toolRegistrationSnapshotLoad.getToolIds();
        this.registeredTools = tools;
        if (!this.registrationSignal.isCompleted()) {
            ((s) this.registrationSignal).X(Boolean.TRUE);
        }
        StringBuilder sbK = u4.k("Restored cached tool registration for session ", sessionId, " (");
        sbK.append(toolRegistrationSnapshotLoad.getToolIds().size());
        sbK.append(" tools)");
        log$default(this, sbK.toString(), null, 2, null);
        return true;
    }

    public final void setTestStubResult$instabridge_ai_sdk_release(@Nullable ToolRegistrationResult toolRegistrationResult) {
        this.testStubResult = toolRegistrationResult;
    }

    public /* synthetic */ AiToolsManager(fo.a aVar, Function1 function1, ToolRegistrationStateStore toolRegistrationStateStore, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(aVar, function1, (i5 & 4) != 0 ? null : toolRegistrationStateStore);
    }
}
