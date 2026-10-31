package com.moloco.sdk.internal.services.init;

import android.content.SharedPreferences;
import android.util.Base64;
import com.moloco.sdk.Init;
import com.moloco.sdk.acm.CountEvent;
import com.moloco.sdk.acm.TimerEvent;
import com.moloco.sdk.acm.recorder.MetricsRecorder;
import com.moloco.sdk.internal.MolocoLogger;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.CoroutineContext;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.m0;

@SourceDebugExtension
/* loaded from: classes.dex */
public final class h implements g {

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public static final a f38046d = new a(null);

    /* renamed from: e, reason: collision with root package name */
    public static final int f38047e = 8;

    /* renamed from: f, reason: collision with root package name */
    @NotNull
    public static final String f38048f = "InitCacheImpl";

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final SharedPreferences f38049b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final CoroutineContext f38050c;

    public static final class a {
        public /* synthetic */ a(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        public a() {
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.services.init.InitCacheImpl$clearAll$2", f = "InitCache.kt", l = {}, m = "invokeSuspend")
    /* loaded from: classes4.dex */
    public static final class b extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f38051a;

        public b(Continuation<? super b> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((b) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return h.this.new b(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f38051a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            h.this.f38049b.edit().clear().commit();
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.services.init.InitCacheImpl$clearCache$2", f = "InitCache.kt", l = {}, m = "invokeSuspend")
    public static final class c extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f38053a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ MetricsRecorder f38054b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ com.moloco.sdk.internal.services.init.a f38055c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ h f38056d;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(MetricsRecorder metricsRecorder, com.moloco.sdk.internal.services.init.a aVar, h hVar, Continuation<? super c> continuation) {
            super(2, continuation);
            this.f38054b = metricsRecorder;
            this.f38055c = aVar;
            this.f38056d = hVar;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((c) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new c(this.f38054b, this.f38055c, this.f38056d, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f38053a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            TimerEvent timerEventStartTimerEvent = this.f38054b.startTimerEvent("SDKInitCacheClear");
            try {
                MolocoLogger molocoLogger = MolocoLogger.INSTANCE;
                MolocoLogger.info$default(molocoLogger, h.f38048f, "Clearing cache for cacheKey: " + this.f38055c.c(), null, false, 12, null);
                SharedPreferences.Editor editorEdit = this.f38056d.f38049b.edit();
                h hVar = this.f38056d;
                com.moloco.sdk.internal.services.init.a aVar = this.f38055c;
                Intrinsics.d(editorEdit);
                hVar.a(aVar, editorEdit);
                editorEdit.remove(this.f38055c.c());
                if (editorEdit.commit()) {
                    MolocoLogger.info$default(molocoLogger, h.f38048f, "Successfully cleared cache for cacheKey: " + this.f38055c.c(), null, false, 12, null);
                    this.f38054b.recordCountEvent(new CountEvent("SDKInitCacheClear").withTag("Result", "success"));
                    this.f38054b.recordTimerEvent(timerEventStartTimerEvent.withTag("Result", "success"));
                } else {
                    MolocoLogger.warn$default(molocoLogger, h.f38048f, "Failed to clear cache for cacheKey: " + this.f38055c.c(), null, false, 12, null);
                    this.f38054b.recordCountEvent(new CountEvent("SDKInitCacheClear").withTag("Result", "failure").withTag("Reason", "commit_failure"));
                    this.f38054b.recordTimerEvent(timerEventStartTimerEvent.withTag("Result", "failure").withTag("Reason", "commit_failure"));
                }
            } catch (Exception e3) {
                MolocoLogger.warn$default(MolocoLogger.INSTANCE, h.f38048f, "Failed to clear cache for cacheKey: " + this.f38055c.c() + " with exception", e3, false, 8, null);
                this.f38054b.recordCountEvent(new CountEvent("SDKInitCacheClear").withTag("Result", "failure").withTag("Reason", e3.getClass().getSimpleName()));
                this.f38054b.recordTimerEvent(timerEventStartTimerEvent.withTag("Result", "failure").withTag("Reason", e3.getClass().getSimpleName()));
            }
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.services.init.InitCacheImpl$get$2", f = "InitCache.kt", l = {}, m = "invokeSuspend")
    public static final class d extends SuspendLambda implements Function2<j0, Continuation<? super Init.SDKInitResponse>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f38057a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ MetricsRecorder f38058b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ com.moloco.sdk.internal.services.init.a f38059c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ h f38060d;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(MetricsRecorder metricsRecorder, com.moloco.sdk.internal.services.init.a aVar, h hVar, Continuation<? super d> continuation) {
            super(2, continuation);
            this.f38058b = metricsRecorder;
            this.f38059c = aVar;
            this.f38060d = hVar;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Init.SDKInitResponse> continuation) {
            return ((d) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new d(this.f38058b, this.f38059c, this.f38060d, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f38057a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            TimerEvent timerEventStartTimerEvent = this.f38058b.startTimerEvent("SDKInitCacheRead");
            try {
                MolocoLogger molocoLogger = MolocoLogger.INSTANCE;
                MolocoLogger.info$default(molocoLogger, h.f38048f, "Reading cache for cacheKey: " + this.f38059c.c(), null, false, 12, null);
                h hVar = this.f38060d;
                hVar.b(this.f38059c, hVar.f38049b);
                String string = this.f38060d.f38049b.getString(this.f38059c.c(), null);
                Init.SDKInitResponse from = string != null ? Init.SDKInitResponse.parseFrom(Base64.decode(string, 0)) : null;
                if (from != null) {
                    MolocoLogger.info$default(molocoLogger, h.f38048f, "Successfully read cache for cacheKey: " + this.f38059c.c(), null, false, 12, null);
                    this.f38058b.recordTimerEvent(timerEventStartTimerEvent.withTag("Result", "success"));
                    this.f38058b.recordCountEvent(new CountEvent("SDKInitCacheRead").withTag("Result", "success"));
                    return from;
                }
                MolocoLogger.info$default(molocoLogger, h.f38048f, "Failed to read from cache (cache_miss) for cacheKey: " + this.f38059c.c(), null, false, 12, null);
                this.f38058b.recordTimerEvent(timerEventStartTimerEvent.withTag("Result", "failure").withTag("Reason", "cache_miss"));
                this.f38058b.recordCountEvent(new CountEvent("SDKInitCacheRead").withTag("Result", "failure").withTag("Reason", "cache_miss"));
                return from;
            } catch (Exception e3) {
                MolocoLogger.warn$default(MolocoLogger.INSTANCE, h.f38048f, "Failed to read cache for cacheKey: " + this.f38059c.c() + " with exception", e3, false, 8, null);
                this.f38058b.recordTimerEvent(timerEventStartTimerEvent.withTag("Result", "failure").withTag("Reason", e3.getClass().getSimpleName()));
                this.f38058b.recordCountEvent(new CountEvent("SDKInitCacheRead").withTag("Result", "failure").withTag("Reason", e3.getClass().getSimpleName()));
                return null;
            }
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.internal.services.init.InitCacheImpl$updateCache$2", f = "InitCache.kt", l = {}, m = "invokeSuspend")
    public static final class e extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f38061a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ MetricsRecorder f38062b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ com.moloco.sdk.internal.services.init.a f38063c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ Init.SDKInitResponse f38064d;

        /* renamed from: e, reason: collision with root package name */
        public final /* synthetic */ h f38065e;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public e(MetricsRecorder metricsRecorder, com.moloco.sdk.internal.services.init.a aVar, Init.SDKInitResponse sDKInitResponse, h hVar, Continuation<? super e> continuation) {
            super(2, continuation);
            this.f38062b = metricsRecorder;
            this.f38063c = aVar;
            this.f38064d = sDKInitResponse;
            this.f38065e = hVar;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((e) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new e(this.f38062b, this.f38063c, this.f38064d, this.f38065e, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            boolean zCommit;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.f38061a != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            TimerEvent timerEventStartTimerEvent = this.f38062b.startTimerEvent("SDKInitCacheWrite");
            try {
                MolocoLogger molocoLogger = MolocoLogger.INSTANCE;
                MolocoLogger.info$default(molocoLogger, h.f38048f, "Updating cache for cacheKey: " + this.f38063c.c(), null, false, 12, null);
                boolean z11 = false;
                String strEncodeToString = Base64.encodeToString(this.f38064d.toByteArray(), 0);
                if (strEncodeToString == null || strEncodeToString.length() == 0) {
                    zCommit = false;
                    MolocoLogger.warn$default(molocoLogger, h.f38048f, "Failed to encode SDKInitResponse for cacheKey: " + this.f38063c.c(), null, false, 12, null);
                    z11 = true;
                } else {
                    zCommit = false;
                }
                if (!z11) {
                    zCommit = this.f38065e.f38049b.edit().putString(this.f38063c.c(), strEncodeToString).commit();
                }
                if (zCommit) {
                    MolocoLogger.info$default(molocoLogger, h.f38048f, "Successfully updated cache for cacheKey: " + this.f38063c.c(), null, false, 12, null);
                    this.f38062b.recordTimerEvent(timerEventStartTimerEvent.withTag("Result", "success"));
                    this.f38062b.recordCountEvent(new CountEvent("SDKInitCacheWrite").withTag("Result", "success"));
                } else {
                    String str = z11 ? "encoding_failure" : "commit_failure";
                    MolocoLogger.warn$default(molocoLogger, h.f38048f, "Failed to update cache for cacheKey: " + this.f38063c.c() + " with error: " + str, null, false, 12, null);
                    this.f38062b.recordTimerEvent(timerEventStartTimerEvent.withTag("Result", "failure").withTag("Reason", str));
                    this.f38062b.recordCountEvent(new CountEvent("SDKInitCacheWrite").withTag("Result", "failure").withTag("Reason", str));
                }
            } catch (Exception e3) {
                MolocoLogger.warn$default(MolocoLogger.INSTANCE, h.f38048f, "Failed to update cache for cacheKey: " + this.f38063c.c() + " with exception", e3, false, 8, null);
                this.f38062b.recordTimerEvent(timerEventStartTimerEvent.withTag("Result", "failure").withTag("Reason", e3.getClass().getSimpleName()));
                this.f38062b.recordCountEvent(new CountEvent("SDKInitCacheWrite").withTag("Result", "failure").withTag("Reason", e3.getClass().getSimpleName()));
            }
            return Unit.f71706a;
        }
    }

    public h(@NotNull SharedPreferences sharedPreferences, @NotNull CoroutineContext ioDispatcherContext) {
        Intrinsics.g(sharedPreferences, "sharedPreferences");
        Intrinsics.g(ioDispatcherContext, "ioDispatcherContext");
        this.f38049b = sharedPreferences;
        this.f38050c = ioDispatcherContext;
    }

    @Override // com.moloco.sdk.internal.services.init.g
    @Nullable
    public Object b(@NotNull com.moloco.sdk.internal.services.init.a aVar, @NotNull MetricsRecorder metricsRecorder, @NotNull Continuation<? super Unit> continuation) throws Throwable {
        Object objY = m0.y(this.f38050c, new c(metricsRecorder, aVar, this, null), continuation);
        return objY == CoroutineSingletons.f71806a ? objY : Unit.f71706a;
    }

    public final void b(com.moloco.sdk.internal.services.init.a aVar, SharedPreferences sharedPreferences) {
        MolocoLogger.info$default(MolocoLogger.INSTANCE, f38048f, "Performing migration for cache key: " + aVar.c(), null, false, 12, null);
        a(aVar, sharedPreferences);
    }

    @Override // com.moloco.sdk.internal.services.init.g
    @Nullable
    public Object a(@NotNull com.moloco.sdk.internal.services.init.a aVar, @NotNull MetricsRecorder metricsRecorder, @NotNull Init.SDKInitResponse sDKInitResponse, @NotNull Continuation<? super Unit> continuation) throws Throwable {
        Object objY = m0.y(this.f38050c, new e(metricsRecorder, aVar, sDKInitResponse, this, null), continuation);
        return objY == CoroutineSingletons.f71806a ? objY : Unit.f71706a;
    }

    @Override // com.moloco.sdk.internal.services.init.g
    @Nullable
    public Object a(@NotNull com.moloco.sdk.internal.services.init.a aVar, @NotNull MetricsRecorder metricsRecorder, @NotNull Continuation<? super Init.SDKInitResponse> continuation) {
        return m0.y(this.f38050c, new d(metricsRecorder, aVar, this, null), continuation);
    }

    @Override // com.moloco.sdk.internal.services.init.g
    @Nullable
    public Object a(@NotNull Continuation<? super Unit> continuation) throws Throwable {
        Object objY = m0.y(this.f38050c, new b(null), continuation);
        return objY == CoroutineSingletons.f71806a ? objY : Unit.f71706a;
    }

    public final void a(com.moloco.sdk.internal.services.init.a aVar, SharedPreferences sharedPreferences) {
        MolocoLogger molocoLogger = MolocoLogger.INSTANCE;
        MolocoLogger.info$default(molocoLogger, f38048f, "Migrating from v0 to v1 for cache key: " + aVar.c(), null, false, 12, null);
        MolocoLogger.info$default(molocoLogger, f38048f, "Total keys in cache: " + sharedPreferences.getAll().size(), null, false, 12, null);
        Map<String, ?> all = sharedPreferences.getAll();
        Intrinsics.f(all, "getAll(...)");
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry<String, ?> entry : all.entrySet()) {
            String key = entry.getKey();
            Intrinsics.f(key, "<get-key>(...)");
            List listI1 = r70.k.i1(key, new String[]{"___"}, 6);
            if (Intrinsics.b(b70.g.Y0(listI1), aVar.b()) && Intrinsics.b(b70.g.i1(listI1), "v0")) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        MolocoLogger molocoLogger2 = MolocoLogger.INSTANCE;
        MolocoLogger.info$default(molocoLogger2, f38048f, "Number of existing V0 keys in cache: " + linkedHashMap.size(), null, false, 12, null);
        if (linkedHashMap.isEmpty()) {
            MolocoLogger.info$default(molocoLogger2, f38048f, "No v0 cache keys found for migration for appKey: " + aVar.b(), null, false, 12, null);
            return;
        }
        MolocoLogger.info$default(molocoLogger2, f38048f, "Found v0 cache key: " + ((String) b70.g.V0(linkedHashMap.keySet())) + ", migrating to new key: " + aVar.c(), null, false, 12, null);
        SharedPreferences.Editor editor = sharedPreferences.edit();
        Intrinsics.f(editor, "editor");
        String strC = aVar.c();
        Object objV0 = b70.g.V0(linkedHashMap.values());
        editor.putString(strC, objV0 instanceof String ? (String) objV0 : null);
        Iterator it = linkedHashMap.entrySet().iterator();
        while (it.hasNext()) {
            editor.remove((String) ((Map.Entry) it.next()).getKey());
        }
        editor.commit();
    }

    public final void a(com.moloco.sdk.internal.services.init.a aVar, SharedPreferences.Editor editor) {
        Iterator<String> it = aVar.d().iterator();
        while (it.hasNext()) {
            editor.remove(it.next());
        }
    }
}
