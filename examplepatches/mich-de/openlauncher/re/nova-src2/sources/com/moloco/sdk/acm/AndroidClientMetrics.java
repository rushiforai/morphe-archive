package com.moloco.sdk.acm;

import androidx.lifecycle.ProcessLifecycleOwner;
import com.amplitude.android.migration.DatabaseConstants;
import com.moloco.sdk.acm.db.MetricsDb;
import com.moloco.sdk.acm.eventprocessing.h;
import com.moloco.sdk.acm.eventprocessing.i;
import com.moloco.sdk.acm.eventprocessing.l;
import com.moloco.sdk.acm.eventprocessing.m;
import com.moloco.sdk.acm.services.ApplicationLifecycleObserver;
import com.moloco.sdk.acm.services.g;
import com.moloco.sdk.acm.services.j;
import com.vungle.ads.internal.protos.Sdk;
import java.util.Iterator;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.k0;
import t70.m0;
import t70.y0;

@Metadata(d1 = {"\u0000\u0082\u0001\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\b\bÆ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0018\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0082@¢\u0006\u0004\b\u0007\u0010\bJ\u000f\u0010\t\u001a\u00020\u0006H\u0002¢\u0006\u0004\b\t\u0010\u0003J!\u0010\u000e\u001a\u00020\u00062\u0006\u0010\u000b\u001a\u00020\n2\n\b\u0002\u0010\r\u001a\u0004\u0018\u00010\f¢\u0006\u0004\b\u000e\u0010\u000fJ\u0018\u0010\u0010\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004H\u0086@¢\u0006\u0004\b\u0010\u0010\bJ\u0017\u0010\u0015\u001a\u00020\u00062\u0006\u0010\u0012\u001a\u00020\u0011H\u0000¢\u0006\u0004\b\u0013\u0010\u0014J\u0017\u0010\u001b\u001a\u00020\u00182\u0006\u0010\u0017\u001a\u00020\u0016H\u0000¢\u0006\u0004\b\u0019\u0010\u001aJ\u0017\u0010\u001e\u001a\u00020\u00062\u0006\u0010\u0012\u001a\u00020\u0018H\u0000¢\u0006\u0004\b\u001c\u0010\u001dJ\u000f\u0010 \u001a\u00020\u0006H\u0001¢\u0006\u0004\b\u001f\u0010\u0003R\u0016\u0010\"\u001a\u00020!8\u0002@\u0002X\u0082.¢\u0006\u0006\n\u0004\b\"\u0010#R\u0016\u0010%\u001a\u00020$8\u0002@\u0002X\u0082.¢\u0006\u0006\n\u0004\b%\u0010&R(\u0010(\u001a\u00020'8\u0000@\u0000X\u0081.¢\u0006\u0018\n\u0004\b(\u0010)\u0012\u0004\b.\u0010\u0003\u001a\u0004\b*\u0010+\"\u0004\b,\u0010-R\u0018\u0010/\u001a\u0004\u0018\u00010\u00048\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b/\u00100R\u0014\u00102\u001a\u0002018\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b2\u00103R\u0014\u00105\u001a\u0002048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b5\u00106R\"\u0010:\u001a\u0010\u0012\f\u0012\n 9*\u0004\u0018\u00010808078\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b:\u0010;R\u001a\u0010=\u001a\b\u0012\u0004\u0012\u00020\u00180<8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b=\u0010>R\u001a\u0010?\u001a\b\u0012\u0004\u0012\u00020\u00110<8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b?\u0010>R\u0016\u0010A\u001a\u00020@8\u0002@\u0002X\u0082.¢\u0006\u0006\n\u0004\bA\u0010BR\u0014\u0010C\u001a\u00020\u00168\u0002X\u0082T¢\u0006\u0006\n\u0004\bC\u0010DR\u0014\u0010G\u001a\u0002088@X\u0080\u0004¢\u0006\u0006\u001a\u0004\bE\u0010F¨\u0006H"}, d2 = {"Lcom/moloco/sdk/acm/AndroidClientMetrics;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "<init>", "()V", "Lcom/moloco/sdk/acm/UpdateConfig;", "newConfig", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "updateConfigInternal", "(Lcom/moloco/sdk/acm/UpdateConfig;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "processQueuedEvents", "Lcom/moloco/sdk/acm/InitConfig;", "config", "Lcom/moloco/sdk/acm/AndroidClientMetricsCallback;", "callback", "initialize", "(Lcom/moloco/sdk/acm/InitConfig;Lcom/moloco/sdk/acm/AndroidClientMetricsCallback;)V", "updateConfig", "Lcom/moloco/sdk/acm/CountEvent;", DatabaseConstants.EVENT_FIELD, "recordCountEvent$moloco_android_client_metrics_release", "(Lcom/moloco/sdk/acm/CountEvent;)V", "recordCountEvent", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "eventName", "Lcom/moloco/sdk/acm/TimerEvent;", "startTimerEvent$moloco_android_client_metrics_release", "(Ljava/lang/String;)Lcom/moloco/sdk/acm/TimerEvent;", "startTimerEvent", "recordTimerEvent$moloco_android_client_metrics_release", "(Lcom/moloco/sdk/acm/TimerEvent;)V", "recordTimerEvent", "triggerBackgroundEvent$moloco_android_client_metrics_release", "triggerBackgroundEvent", "Lcom/moloco/sdk/acm/eventprocessing/h;", "eventProcessor", "Lcom/moloco/sdk/acm/eventprocessing/h;", "Lcom/moloco/sdk/acm/services/c;", "applicationLifecycleTracker", "Lcom/moloco/sdk/acm/services/c;", "Lcom/moloco/sdk/acm/a;", "opsConfig", "Lcom/moloco/sdk/acm/a;", "getOpsConfig$moloco_android_client_metrics_release", "()Lcom/moloco/sdk/acm/a;", "setOpsConfig$moloco_android_client_metrics_release", "(Lcom/moloco/sdk/acm/a;)V", "getOpsConfig$moloco_android_client_metrics_release$annotations", "pendingConfigUpdate", "Lcom/moloco/sdk/acm/UpdateConfig;", "Lc80/a;", "configMutex", "Lc80/a;", "Lt70/j0;", "ioScope", "Lt70/j0;", "Ljava/util/concurrent/atomic/AtomicReference;", "Lcom/moloco/sdk/acm/f;", "kotlin.jvm.PlatformType", "_initializationStatus", "Ljava/util/concurrent/atomic/AtomicReference;", "Ljava/util/concurrent/CopyOnWriteArrayList;", "preInitTimerList", "Ljava/util/concurrent/CopyOnWriteArrayList;", "preInitCountList", "Lcom/moloco/sdk/acm/eventprocessing/l;", "requestScheduler", "Lcom/moloco/sdk/acm/eventprocessing/l;", "TAG", "Ljava/lang/String;", "getInitializationStatus$moloco_android_client_metrics_release", "()Lcom/moloco/sdk/acm/f;", "initializationStatus", "moloco-android-client-metrics_release"}, k = 1, mv = {2, 0, 0})
@SourceDebugExtension
/* loaded from: classes.dex */
public final class AndroidClientMetrics {

    @NotNull
    private static final String TAG = "AndroidClientMetrics";

    @NotNull
    private static final AtomicReference<f> _initializationStatus;
    private static com.moloco.sdk.acm.services.c applicationLifecycleTracker;
    private static h eventProcessor;

    @NotNull
    private static final j0 ioScope;
    public static com.moloco.sdk.acm.a opsConfig;

    @Nullable
    private static UpdateConfig pendingConfigUpdate;

    @NotNull
    private static final CopyOnWriteArrayList<CountEvent> preInitCountList;

    @NotNull
    private static final CopyOnWriteArrayList<TimerEvent> preInitTimerList;
    private static l requestScheduler;

    @NotNull
    public static final AndroidClientMetrics INSTANCE = new AndroidClientMetrics();

    @NotNull
    private static final c80.a configMutex = new c80.d();

    @DebugMetadata(c = "com.moloco.sdk.acm.AndroidClientMetrics$initialize$1", f = "AndroidClientMetrics.kt", l = {261, Sdk.SDKError.Reason.ASSET_FAILED_MAX_SPACE_EXCEEDED_VALUE}, m = "invokeSuspend")
    @SourceDebugExtension
    public static final class a extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public Object f35994a;

        /* renamed from: b, reason: collision with root package name */
        public int f35995b;

        /* renamed from: c, reason: collision with root package name */
        public final /* synthetic */ InitConfig f35996c;

        /* renamed from: d, reason: collision with root package name */
        public final /* synthetic */ AndroidClientMetricsCallback f35997d;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public a(InitConfig initConfig, AndroidClientMetricsCallback androidClientMetricsCallback, Continuation<? super a> continuation) {
            super(2, continuation);
            this.f35996c = initConfig;
            this.f35997d = androidClientMetricsCallback;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((a) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new a(this.f35996c, this.f35997d, continuation);
        }

        /* JADX WARN: Code restructure failed: missing block: B:32:0x00e1, code lost:
        
            if (r3.updateConfigInternal(r13, r12) == r0) goto L33;
         */
        /* JADX WARN: Multi-variable type inference failed */
        /* JADX WARN: Removed duplicated region for block: B:37:0x00f4 A[Catch: Exception -> 0x002c, IllegalStateException -> 0x0031, TryCatch #3 {IllegalStateException -> 0x0031, Exception -> 0x002c, blocks: (B:35:0x00e6, B:37:0x00f4, B:38:0x00f8, B:39:0x00fd, B:14:0x0027, B:21:0x0039, B:23:0x009b, B:25:0x00a1, B:40:0x00fe, B:41:0x0103, B:42:0x0104, B:43:0x0109), top: B:52:0x0007 }] */
        /* JADX WARN: Type inference failed for: r1v0, types: [int] */
        /* JADX WARN: Type inference failed for: r1v14 */
        /* JADX WARN: Type inference failed for: r1v19 */
        /* JADX WARN: Type inference failed for: r1v20 */
        /* JADX WARN: Type inference failed for: r1v3 */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) {
            Object obj2;
            Object obj3;
            AndroidClientMetricsCallback androidClientMetricsCallback;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            ?? r12 = this.f35995b;
            try {
                try {
                } catch (Throwable th2) {
                    ((c80.d) r12).g(null);
                    throw th2;
                }
            } catch (IllegalStateException e3) {
                com.moloco.sdk.acm.services.e.a(com.moloco.sdk.acm.services.e.f36170a, MetricsDb.f36023c, "Unable to create metrics db", e3, false, 8, null);
                AndroidClientMetrics._initializationStatus.set(f.f36125c);
                AndroidClientMetricsCallback androidClientMetricsCallback2 = this.f35997d;
                if (androidClientMetricsCallback2 != null) {
                    androidClientMetricsCallback2.onInitializationFailure(e3);
                }
            } catch (Exception e11) {
                com.moloco.sdk.acm.services.e.a(com.moloco.sdk.acm.services.e.f36170a, AndroidClientMetrics.TAG, "Initialization error", e11, false, 8, null);
                AndroidClientMetrics._initializationStatus.set(f.f36125c);
                AndroidClientMetricsCallback androidClientMetricsCallback3 = this.f35997d;
                if (androidClientMetricsCallback3 != null) {
                    androidClientMetricsCallback3.onInitializationFailure(e11);
                }
            }
            if (r12 == 0) {
                ResultKt.b(obj);
                com.moloco.sdk.acm.db.d dVarB = MetricsDb.INSTANCE.b(this.f35996c.getContext()).b();
                j jVar = new j();
                AndroidClientMetrics androidClientMetrics = AndroidClientMetrics.INSTANCE;
                com.moloco.sdk.acm.eventprocessing.d dVar = new com.moloco.sdk.acm.eventprocessing.d(androidClientMetrics.getOpsConfig$moloco_android_client_metrics_release(), this.f35996c.getContext());
                AndroidClientMetrics.requestScheduler = new m(dVar, androidClientMetrics.getOpsConfig$moloco_android_client_metrics_release(), null, AndroidClientMetrics.ioScope, 4, null);
                AndroidClientMetrics.applicationLifecycleTracker = new com.moloco.sdk.acm.services.c(ProcessLifecycleOwner.f14727c.f14729b, new ApplicationLifecycleObserver(dVar, AndroidClientMetrics.ioScope, new g(this.f35996c.getContext())));
                l lVar = AndroidClientMetrics.requestScheduler;
                if (lVar == null) {
                    Intrinsics.m("requestScheduler");
                    throw null;
                }
                com.moloco.sdk.acm.services.c cVar = AndroidClientMetrics.applicationLifecycleTracker;
                if (cVar == null) {
                    Intrinsics.m("applicationLifecycleTracker");
                    throw null;
                }
                AndroidClientMetrics.eventProcessor = new i(dVarB, jVar, lVar, cVar);
                AndroidClientMetrics._initializationStatus.set(f.f36123a);
                c80.a aVar = AndroidClientMetrics.configMutex;
                this.f35994a = aVar;
                this.f35995b = 1;
                c80.d dVar2 = (c80.d) aVar;
                if (dVar2.e(this) != coroutineSingletons) {
                    obj2 = dVar2;
                }
                return coroutineSingletons;
            }
            if (r12 != 1) {
                if (r12 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                c80.a aVar2 = (c80.a) this.f35994a;
                ResultKt.b(obj);
                r12 = aVar2;
                Unit unit = Unit.f71706a;
                obj3 = r12;
                ((c80.d) obj3).g(null);
                AndroidClientMetrics.INSTANCE.processQueuedEvents();
                androidClientMetricsCallback = this.f35997d;
                if (androidClientMetricsCallback != null) {
                    androidClientMetricsCallback.onInitializationSuccess();
                }
                return Unit.f71706a;
            }
            Object obj4 = (c80.a) this.f35994a;
            ResultKt.b(obj);
            obj2 = obj4;
            UpdateConfig updateConfig = AndroidClientMetrics.pendingConfigUpdate;
            obj3 = obj2;
            if (updateConfig != null) {
                AndroidClientMetrics androidClientMetrics2 = AndroidClientMetrics.INSTANCE;
                AndroidClientMetrics.pendingConfigUpdate = null;
                com.moloco.sdk.acm.services.e.a(com.moloco.sdk.acm.services.e.f36170a, AndroidClientMetrics.TAG, "Updating config with pending config", false, 4, null);
                this.f35994a = obj2;
                this.f35995b = 2;
                r12 = obj2;
            }
            ((c80.d) obj3).g(null);
            AndroidClientMetrics.INSTANCE.processQueuedEvents();
            androidClientMetricsCallback = this.f35997d;
            if (androidClientMetricsCallback != null) {
            }
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.acm.AndroidClientMetrics$processQueuedEvents$1", f = "AndroidClientMetrics.kt", l = {237, 238}, m = "invokeSuspend")
    @SourceDebugExtension
    public static final class b extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public Object f35998a;

        /* renamed from: b, reason: collision with root package name */
        public int f35999b;

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
            return new b(continuation);
        }

        /* JADX WARN: Removed duplicated region for block: B:23:0x0064  */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(Object obj) {
            Iterator it;
            Iterator it2;
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f35999b;
            if (i5 == 0) {
                ResultKt.b(obj);
                it = AndroidClientMetrics.preInitTimerList.iterator();
            } else {
                if (i5 != 1) {
                    if (i5 != 2) {
                        throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                    }
                    it2 = (Iterator) this.f35998a;
                    ResultKt.b(obj);
                    while (it2.hasNext()) {
                        CountEvent countEvent = (CountEvent) it2.next();
                        h hVar = AndroidClientMetrics.eventProcessor;
                        if (hVar == null) {
                            Intrinsics.m("eventProcessor");
                            throw null;
                        }
                        Intrinsics.d(countEvent);
                        this.f35998a = it2;
                        this.f35999b = 2;
                        if (hVar.a(countEvent, this) == coroutineSingletons) {
                            return coroutineSingletons;
                        }
                    }
                    AndroidClientMetrics.preInitTimerList.clear();
                    AndroidClientMetrics.preInitCountList.clear();
                    return Unit.f71706a;
                }
                it = (Iterator) this.f35998a;
                ResultKt.b(obj);
            }
            while (it.hasNext()) {
                TimerEvent timerEvent = (TimerEvent) it.next();
                h hVar2 = AndroidClientMetrics.eventProcessor;
                if (hVar2 == null) {
                    Intrinsics.m("eventProcessor");
                    throw null;
                }
                Intrinsics.d(timerEvent);
                this.f35998a = it;
                this.f35999b = 1;
                if (hVar2.a(timerEvent, this) == coroutineSingletons) {
                    break;
                }
            }
            it2 = AndroidClientMetrics.preInitCountList.iterator();
            while (it2.hasNext()) {
            }
            AndroidClientMetrics.preInitTimerList.clear();
            AndroidClientMetrics.preInitCountList.clear();
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.acm.AndroidClientMetrics$recordCountEvent$1", f = "AndroidClientMetrics.kt", l = {193}, m = "invokeSuspend")
    public static final class c extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f36000a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ CountEvent f36001b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public c(CountEvent countEvent, Continuation<? super c> continuation) {
            super(2, continuation);
            this.f36001b = countEvent;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((c) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new c(this.f36001b, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f36000a;
            if (i5 == 0) {
                ResultKt.b(obj);
                h hVar = AndroidClientMetrics.eventProcessor;
                if (hVar == null) {
                    Intrinsics.m("eventProcessor");
                    throw null;
                }
                CountEvent countEvent = this.f36001b;
                this.f36000a = 1;
                if (hVar.a(countEvent, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.acm.AndroidClientMetrics$recordTimerEvent$1", f = "AndroidClientMetrics.kt", l = {228}, m = "invokeSuspend")
    public static final class d extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {

        /* renamed from: a, reason: collision with root package name */
        public int f36002a;

        /* renamed from: b, reason: collision with root package name */
        public final /* synthetic */ TimerEvent f36003b;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public d(TimerEvent timerEvent, Continuation<? super d> continuation) {
            super(2, continuation);
            this.f36003b = timerEvent;
        }

        @Override // kotlin.jvm.functions.Function2
        /* renamed from: a, reason: merged with bridge method [inline-methods] */
        public final Object invoke(j0 j0Var, Continuation<? super Unit> continuation) {
            return ((d) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Continuation<Unit> create(Object obj, Continuation<?> continuation) {
            return new d(this.f36003b, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        public final Object invokeSuspend(Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.f36002a;
            if (i5 == 0) {
                ResultKt.b(obj);
                h hVar = AndroidClientMetrics.eventProcessor;
                if (hVar == null) {
                    Intrinsics.m("eventProcessor");
                    throw null;
                }
                TimerEvent timerEvent = this.f36003b;
                this.f36002a = 1;
                if (hVar.a(timerEvent, this) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } else {
                if (i5 != 1) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
            }
            return Unit.f71706a;
        }
    }

    @DebugMetadata(c = "com.moloco.sdk.acm.AndroidClientMetrics", f = "AndroidClientMetrics.kt", l = {261, 167}, m = "updateConfig")
    public static final class e extends ContinuationImpl {

        /* renamed from: a, reason: collision with root package name */
        public Object f36004a;

        /* renamed from: b, reason: collision with root package name */
        public Object f36005b;

        /* renamed from: c, reason: collision with root package name */
        public /* synthetic */ Object f36006c;

        /* renamed from: e, reason: collision with root package name */
        public int f36008e;

        public e(Continuation<? super e> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.f36006c = obj;
            this.f36008e |= Integer.MIN_VALUE;
            return AndroidClientMetrics.this.updateConfig(null, this);
        }
    }

    static {
        a80.e eVar = y0.f88884a;
        ioScope = k0.a(a80.d.f488c.plus(m0.d()));
        _initializationStatus = new AtomicReference<>(f.f36125c);
        preInitTimerList = new CopyOnWriteArrayList<>();
        preInitCountList = new CopyOnWriteArrayList<>();
    }

    private AndroidClientMetrics() {
    }

    public static /* synthetic */ void getOpsConfig$moloco_android_client_metrics_release$annotations() {
    }

    public static /* synthetic */ void initialize$default(AndroidClientMetrics androidClientMetrics, InitConfig initConfig, AndroidClientMetricsCallback androidClientMetricsCallback, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            androidClientMetricsCallback = null;
        }
        androidClientMetrics.initialize(initConfig, androidClientMetricsCallback);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final void processQueuedEvents() {
        m0.t(ioScope, null, null, new b(null), 3);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object updateConfigInternal(UpdateConfig updateConfig, Continuation<? super Unit> continuation) {
        String postAnalyticsUrl = updateConfig.getPostAnalyticsUrl();
        if (postAnalyticsUrl != null) {
            INSTANCE.getOpsConfig$moloco_android_client_metrics_release().a(postAnalyticsUrl);
        }
        Long requestPeriodSeconds = updateConfig.getRequestPeriodSeconds();
        if (requestPeriodSeconds != null) {
            INSTANCE.getOpsConfig$moloco_android_client_metrics_release().a(requestPeriodSeconds.longValue());
        }
        l lVar = requestScheduler;
        if (lVar != null) {
            Object objA = lVar.a(continuation);
            return objA == CoroutineSingletons.f71806a ? objA : Unit.f71706a;
        }
        Intrinsics.m("requestScheduler");
        throw null;
    }

    @NotNull
    public final f getInitializationStatus$moloco_android_client_metrics_release() {
        f fVar = _initializationStatus.get();
        Intrinsics.f(fVar, "get(...)");
        return fVar;
    }

    @NotNull
    public final com.moloco.sdk.acm.a getOpsConfig$moloco_android_client_metrics_release() {
        com.moloco.sdk.acm.a aVar = opsConfig;
        if (aVar != null) {
            return aVar;
        }
        Intrinsics.m("opsConfig");
        throw null;
    }

    public final void initialize(@NotNull InitConfig config, @Nullable AndroidClientMetricsCallback callback) {
        Intrinsics.g(config, "config");
        com.moloco.sdk.acm.services.e.b(com.moloco.sdk.acm.services.e.f36170a, TAG, "ACM initialize", false, 4, null);
        AtomicReference<f> atomicReference = _initializationStatus;
        f fVar = f.f36125c;
        f fVar2 = f.f36124b;
        while (!atomicReference.compareAndSet(fVar, fVar2)) {
            if (atomicReference.get() != fVar) {
                return;
            }
        }
        setOpsConfig$moloco_android_client_metrics_release(com.moloco.sdk.acm.e.a(config));
        m0.t(ioScope, null, null, new a(config, callback, null), 3);
    }

    public final void recordCountEvent$moloco_android_client_metrics_release(@NotNull CountEvent event) {
        Intrinsics.g(event, "event");
        if (_initializationStatus.get() == f.f36123a) {
            m0.t(ioScope, null, null, new c(event, null), 3);
        } else {
            preInitCountList.add(event);
            com.moloco.sdk.acm.services.e.a(com.moloco.sdk.acm.services.e.f36170a, TAG, "Moloco Client Metrics not initialized", false, 4, null);
        }
    }

    public final void recordTimerEvent$moloco_android_client_metrics_release(@NotNull TimerEvent event) {
        Intrinsics.g(event, "event");
        event.stopTimer();
        if (_initializationStatus.get() == f.f36123a) {
            m0.t(ioScope, null, null, new d(event, null), 3);
        } else {
            preInitTimerList.add(event);
            com.moloco.sdk.acm.services.e.a(com.moloco.sdk.acm.services.e.f36170a, TAG, "Moloco Client Metrics not initialized", false, 4, null);
        }
    }

    public final void setOpsConfig$moloco_android_client_metrics_release(@NotNull com.moloco.sdk.acm.a aVar) {
        Intrinsics.g(aVar, "<set-?>");
        opsConfig = aVar;
    }

    @NotNull
    public final TimerEvent startTimerEvent$moloco_android_client_metrics_release(@NotNull String eventName) {
        Intrinsics.g(eventName, "eventName");
        if (_initializationStatus.get() != f.f36123a) {
            com.moloco.sdk.acm.services.e.a(com.moloco.sdk.acm.services.e.f36170a, TAG, "Moloco Client Metrics not initialized", false, 4, null);
        }
        TimerEvent timerEventCreate = TimerEvent.INSTANCE.create(eventName);
        timerEventCreate.startTimer();
        return timerEventCreate;
    }

    public final void triggerBackgroundEvent$moloco_android_client_metrics_release() {
        com.moloco.sdk.acm.services.c cVar = applicationLifecycleTracker;
        if (cVar != null) {
            cVar.a();
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:19:0x0069, code lost:
    
        if (r14.e(r0) == r1) goto L30;
     */
    /* JADX WARN: Code restructure failed: missing block: B:29:0x0091, code lost:
    
        if (updateConfigInternal(r13, r0) == r1) goto L30;
     */
    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /* JADX WARN: Type inference failed for: r12v0, types: [com.moloco.sdk.acm.AndroidClientMetrics] */
    /* JADX WARN: Type inference failed for: r13v7, types: [c80.a] */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object updateConfig(@NotNull UpdateConfig updateConfig, @NotNull Continuation<? super Unit> continuation) {
        e eVar;
        c80.d dVar;
        if (continuation instanceof e) {
            eVar = (e) continuation;
            int i5 = eVar.f36008e;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                eVar.f36008e = i5 - Integer.MIN_VALUE;
            } else {
                eVar = new e(continuation);
            }
        }
        Object obj = eVar.f36006c;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = eVar.f36008e;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (_initializationStatus.get() != f.f36123a) {
                com.moloco.sdk.acm.services.e.b(com.moloco.sdk.acm.services.e.f36170a, TAG, "ACM updateConfig called when the SDK was not initialized. Initialize the SDK first.", null, false, 12, null);
                c80.a aVar = configMutex;
                eVar.f36004a = updateConfig;
                eVar.f36005b = aVar;
                eVar.f36008e = 1;
                dVar = (c80.d) aVar;
            } else {
                com.moloco.sdk.acm.services.e.b(com.moloco.sdk.acm.services.e.f36170a, TAG, "ACM update called. ACM initialized already, proceeding with update", false, 4, null);
                eVar.f36008e = 2;
            }
            return coroutineSingletons;
        }
        if (i11 != 1) {
            if (i11 != 2) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            return Unit.f71706a;
        }
        ?? r13 = (c80.a) eVar.f36005b;
        UpdateConfig updateConfig2 = (UpdateConfig) eVar.f36004a;
        ResultKt.b(obj);
        dVar = r13;
        updateConfig = updateConfig2;
        try {
            pendingConfigUpdate = updateConfig;
            return Unit.f71706a;
        } finally {
            dVar.g(null);
        }
    }
}
