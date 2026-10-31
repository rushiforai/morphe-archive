package com.amplitude.core.platform.intercept;

import ads_mobile_sdk.pd;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.common.Logger;
import com.amplitude.core.Amplitude;
import com.amplitude.core.Configuration;
import com.amplitude.core.Constants;
import com.amplitude.core.Storage;
import com.amplitude.core.events.BaseEvent;
import com.amplitude.core.events.IdentifyOperation;
import com.amplitude.core.platform.plugins.AmplitudeDestination;
import com.amplitude.core.utilities.LoggerExtensionsKt;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Map;
import java.util.concurrent.atomic.AtomicBoolean;
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
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.j0;
import t70.m0;
import t70.r1;
import t70.t0;

@Metadata(d1 = {"\u0000f\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0010\u000e\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u00002\u00020\u0001B/\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\u0006\u0010\u000b\u001a\u00020\n¢\u0006\u0004\b\f\u0010\rJ\u0010\u0010\u000f\u001a\u00020\u000eH\u0082@¢\u0006\u0004\b\u000f\u0010\u0010J\u0012\u0010\u0012\u001a\u0004\u0018\u00010\u0011H\u0082@¢\u0006\u0004\b\u0012\u0010\u0010J\u000f\u0010\u0014\u001a\u00020\u0013H\u0002¢\u0006\u0004\b\u0014\u0010\u0015J\u0018\u0010\u0017\u001a\u00020\u000e2\u0006\u0010\u0016\u001a\u00020\u0011H\u0082@¢\u0006\u0004\b\u0017\u0010\u0018J\u0017\u0010\u001a\u001a\u00020\u00192\u0006\u0010\u0016\u001a\u00020\u0011H\u0002¢\u0006\u0004\b\u001a\u0010\u001bJ\u0017\u0010\u001c\u001a\u00020\u00192\u0006\u0010\u0016\u001a\u00020\u0011H\u0002¢\u0006\u0004\b\u001c\u0010\u001bJ\u001f\u0010\u001f\u001a\u00020\u00192\u0006\u0010\u0016\u001a\u00020\u00112\u0006\u0010\u001e\u001a\u00020\u001dH\u0002¢\u0006\u0004\b\u001f\u0010 J\u0017\u0010!\u001a\u00020\u00192\u0006\u0010\u0016\u001a\u00020\u0011H\u0002¢\u0006\u0004\b!\u0010\u001bJ\u0017\u0010\"\u001a\u00020\u00192\u0006\u0010\u0016\u001a\u00020\u0011H\u0002¢\u0006\u0004\b\"\u0010\u001bJ#\u0010&\u001a\u00020\u00192\b\u0010$\u001a\u0004\u0018\u00010#2\b\u0010%\u001a\u0004\u0018\u00010#H\u0002¢\u0006\u0004\b&\u0010'J\u001a\u0010(\u001a\u0004\u0018\u00010\u00112\u0006\u0010\u0016\u001a\u00020\u0011H\u0086@¢\u0006\u0004\b(\u0010\u0018J\u0010\u0010)\u001a\u00020\u000eH\u0086@¢\u0006\u0004\b)\u0010\u0010R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010*R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010+R\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010,R\u0014\u0010\t\u001a\u00020\b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010-R\u0014\u0010\u000b\u001a\u00020\n8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010.R\u0016\u00100\u001a\u00020/8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b0\u00101R\u0018\u00102\u001a\u0004\u0018\u00010#8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b2\u00103R\u0018\u00104\u001a\u0004\u0018\u00010#8\u0002@\u0002X\u0082\u000e¢\u0006\u0006\n\u0004\b4\u00103R\u0014\u00105\u001a\u00020/8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b5\u00101R\u0016\u00107\u001a\u0004\u0018\u0001068\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b7\u00108¨\u00069"}, d2 = {"Lcom/amplitude/core/platform/intercept/IdentifyInterceptor;", b.f42142b, "Lcom/amplitude/core/Storage;", PlaceTypes.STORAGE, "Lcom/amplitude/core/Amplitude;", "amplitude", "Lcom/amplitude/common/Logger;", "logger", "Lcom/amplitude/core/Configuration;", "configuration", "Lcom/amplitude/core/platform/plugins/AmplitudeDestination;", "plugin", "<init>", "(Lcom/amplitude/core/Storage;Lcom/amplitude/core/Amplitude;Lcom/amplitude/common/Logger;Lcom/amplitude/core/Configuration;Lcom/amplitude/core/platform/plugins/AmplitudeDestination;)V", b.f42142b, "clearIdentifyIntercepts", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Lcom/amplitude/core/events/BaseEvent;", "getTransferIdentifyEvent", "Lt70/r1;", "scheduleTransfer", "()Lt70/r1;", DatabaseConstants.EVENT_FIELD, "saveIdentifyProperties", "(Lcom/amplitude/core/events/BaseEvent;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", b.f42142b, "isClearAll", "(Lcom/amplitude/core/events/BaseEvent;)Z", "isSetOnly", "Lcom/amplitude/core/events/IdentifyOperation;", "action", "isActionOnly", "(Lcom/amplitude/core/events/BaseEvent;Lcom/amplitude/core/events/IdentifyOperation;)Z", "isSetGroups", "isIdentityUpdated", b.f42142b, "id", "updateId", "isIdUpdated", "(Ljava/lang/String;Ljava/lang/String;)Z", "intercept", "transferInterceptedIdentify", "Lcom/amplitude/core/Storage;", "Lcom/amplitude/core/Amplitude;", "Lcom/amplitude/common/Logger;", "Lcom/amplitude/core/Configuration;", "Lcom/amplitude/core/platform/plugins/AmplitudeDestination;", "Ljava/util/concurrent/atomic/AtomicBoolean;", "transferScheduled", "Ljava/util/concurrent/atomic/AtomicBoolean;", "userId", "Ljava/lang/String;", "deviceId", "identifySet", "Lcom/amplitude/core/platform/intercept/IdentifyInterceptStorageHandler;", "storageHandler", "Lcom/amplitude/core/platform/intercept/IdentifyInterceptStorageHandler;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class IdentifyInterceptor {

    @NotNull
    private final Amplitude amplitude;

    @NotNull
    private final Configuration configuration;

    @Nullable
    private String deviceId;

    @NotNull
    private final AtomicBoolean identifySet;

    @NotNull
    private final Logger logger;

    @NotNull
    private final AmplitudeDestination plugin;

    @NotNull
    private final Storage storage;

    @Nullable
    private final IdentifyInterceptStorageHandler storageHandler;

    @NotNull
    private AtomicBoolean transferScheduled;

    @Nullable
    private String userId;

    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    @DebugMetadata(c = "com.amplitude.core.platform.intercept.IdentifyInterceptor", f = "IdentifyInterceptor.kt", l = {52, 59, 65, 70, 81}, m = "intercept")
    /* renamed from: com.amplitude.core.platform.intercept.IdentifyInterceptor$intercept$1, reason: invalid class name */
    public static final class AnonymousClass1 extends ContinuationImpl {
        Object L$0;
        Object L$1;
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
            return IdentifyInterceptor.this.intercept(null, this);
        }
    }

    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    @DebugMetadata(c = "com.amplitude.core.platform.intercept.IdentifyInterceptor", f = "IdentifyInterceptor.kt", l = {114}, m = "saveIdentifyProperties")
    /* renamed from: com.amplitude.core.platform.intercept.IdentifyInterceptor$saveIdentifyProperties$1, reason: invalid class name and case insensitive filesystem */
    public static final class C04041 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public C04041(Continuation<? super C04041> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return IdentifyInterceptor.this.saveIdentifyProperties(null, this);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
    @DebugMetadata(c = "com.amplitude.core.platform.intercept.IdentifyInterceptor$scheduleTransfer$1", f = "IdentifyInterceptor.kt", l = {106, 107}, m = "invokeSuspend")
    /* renamed from: com.amplitude.core.platform.intercept.IdentifyInterceptor$scheduleTransfer$1, reason: invalid class name and case insensitive filesystem */
    public static final class C04051 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        int label;

        public C04051(Continuation<? super C04051> continuation) {
            super(2, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return IdentifyInterceptor.this.new C04051(continuation);
        }

        /* JADX WARN: Code restructure failed: missing block: B:16:0x004f, code lost:
        
            if (r7.transferInterceptedIdentify(r6) == r0) goto L17;
         */
        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
        */
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            int i5 = this.label;
            if (i5 == 0) {
                ResultKt.b(obj);
                if (!IdentifyInterceptor.this.transferScheduled.get()) {
                    IdentifyInterceptor.this.transferScheduled.getAndSet(true);
                    long identifyBatchIntervalMillis = IdentifyInterceptor.this.configuration.getIdentifyBatchIntervalMillis();
                    this.label = 1;
                    if (t0.b(identifyBatchIntervalMillis, this) != coroutineSingletons) {
                    }
                    return coroutineSingletons;
                }
                return Unit.f71706a;
            }
            if (i5 != 1) {
                if (i5 != 2) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                ResultKt.b(obj);
                IdentifyInterceptor.this.transferScheduled.getAndSet(false);
                return Unit.f71706a;
            }
            ResultKt.b(obj);
            IdentifyInterceptor identifyInterceptor = IdentifyInterceptor.this;
            this.label = 2;
        }

        @Override // kotlin.jvm.functions.Function2
        @Nullable
        public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
            return ((C04051) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    @DebugMetadata(c = "com.amplitude.core.platform.intercept.IdentifyInterceptor", f = "IdentifyInterceptor.kt", l = {pd.N0}, m = "transferInterceptedIdentify")
    /* renamed from: com.amplitude.core.platform.intercept.IdentifyInterceptor$transferInterceptedIdentify$1, reason: invalid class name and case insensitive filesystem */
    public static final class C04061 extends ContinuationImpl {
        Object L$0;
        int label;
        /* synthetic */ Object result;

        public C04061(Continuation<? super C04061> continuation) {
            super(continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            this.result = obj;
            this.label |= Integer.MIN_VALUE;
            return IdentifyInterceptor.this.transferInterceptedIdentify(this);
        }
    }

    public IdentifyInterceptor(@NotNull Storage storage, @NotNull Amplitude amplitude, @NotNull Logger logger, @NotNull Configuration configuration, @NotNull AmplitudeDestination plugin) {
        Intrinsics.g(storage, "storage");
        Intrinsics.g(amplitude, "amplitude");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(configuration, "configuration");
        Intrinsics.g(plugin, "plugin");
        this.storage = storage;
        this.amplitude = amplitude;
        this.logger = logger;
        this.configuration = configuration;
        this.plugin = plugin;
        this.transferScheduled = new AtomicBoolean(false);
        this.identifySet = new AtomicBoolean(false);
        this.storageHandler = IdentifyInterceptStorageHandler.INSTANCE.getIdentifyInterceptStorageHandler(storage, logger, amplitude);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object clearIdentifyIntercepts(Continuation<? super Unit> continuation) {
        IdentifyInterceptStorageHandler identifyInterceptStorageHandler = this.storageHandler;
        Intrinsics.d(identifyInterceptStorageHandler);
        Object objClearIdentifyIntercepts = identifyInterceptStorageHandler.clearIdentifyIntercepts(continuation);
        return objClearIdentifyIntercepts == CoroutineSingletons.f71806a ? objClearIdentifyIntercepts : Unit.f71706a;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public final Object getTransferIdentifyEvent(Continuation<? super BaseEvent> continuation) {
        IdentifyInterceptStorageHandler identifyInterceptStorageHandler = this.storageHandler;
        Intrinsics.d(identifyInterceptStorageHandler);
        return identifyInterceptStorageHandler.getTransferIdentifyEvent(continuation);
    }

    private final boolean isActionOnly(BaseEvent event, IdentifyOperation action) {
        Map<String, Object> userProperties = event.getUserProperties();
        return userProperties != null && userProperties.size() == 1 && userProperties.containsKey(action.getOperationType());
    }

    private final boolean isClearAll(BaseEvent event) {
        return isActionOnly(event, IdentifyOperation.CLEAR_ALL);
    }

    private final boolean isIdUpdated(String id2, String updateId) {
        if (id2 == null && updateId == null) {
            return false;
        }
        return id2 == null || updateId == null || !id2.equals(updateId);
    }

    private final boolean isIdentityUpdated(BaseEvent event) {
        boolean z11;
        if (!this.identifySet.getAndSet(true)) {
            this.userId = event.getUserId();
            this.deviceId = event.getDeviceId();
            return true;
        }
        if (isIdUpdated(this.userId, event.getUserId())) {
            this.userId = event.getUserId();
            z11 = true;
        } else {
            z11 = false;
        }
        if (!isIdUpdated(this.deviceId, event.getDeviceId())) {
            return z11;
        }
        this.deviceId = event.getDeviceId();
        return true;
    }

    private final boolean isSetGroups(BaseEvent event) {
        if (event.getGroups() == null) {
            return false;
        }
        Map<String, Object> groups = event.getGroups();
        Intrinsics.d(groups);
        return !groups.isEmpty();
    }

    private final boolean isSetOnly(BaseEvent event) {
        return isActionOnly(event, IdentifyOperation.SET);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object saveIdentifyProperties(BaseEvent baseEvent, Continuation<? super Unit> continuation) {
        C04041 c04041;
        IdentifyInterceptor identifyInterceptor;
        if (continuation instanceof C04041) {
            c04041 = (C04041) continuation;
            int i5 = c04041.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c04041.label = i5 - Integer.MIN_VALUE;
            } else {
                c04041 = new C04041(continuation);
            }
        }
        Object obj = c04041.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c04041.label;
        if (i11 == 0) {
            ResultKt.b(obj);
            try {
                Storage storage = this.storage;
                c04041.L$0 = this;
                c04041.label = 1;
                if (storage.writeEvent(baseEvent, c04041) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            } catch (Exception e3) {
                e = e3;
                identifyInterceptor = this;
                LoggerExtensionsKt.logWithStackTrace(e, identifyInterceptor.logger, "Error when intercepting identifies");
                return Unit.f71706a;
            }
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            identifyInterceptor = (IdentifyInterceptor) c04041.L$0;
            try {
                ResultKt.b(obj);
            } catch (Exception e11) {
                e = e11;
                LoggerExtensionsKt.logWithStackTrace(e, identifyInterceptor.logger, "Error when intercepting identifies");
                return Unit.f71706a;
            }
        }
        return Unit.f71706a;
    }

    private final r1 scheduleTransfer() {
        return m0.t(this.amplitude.getAmplitudeScope(), this.amplitude.getStorageIODispatcher(), null, new C04051(null), 2);
    }

    /* JADX WARN: Code restructure failed: missing block: B:27:0x006c, code lost:
    
        if (transferInterceptedIdentify(r0) == r1) goto L55;
     */
    /* JADX WARN: Removed duplicated region for block: B:56:0x00d0 A[RETURN] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object intercept(@NotNull BaseEvent baseEvent, @NotNull Continuation<? super BaseEvent> continuation) {
        AnonymousClass1 anonymousClass1;
        IdentifyInterceptor identifyInterceptor;
        IdentifyInterceptor identifyInterceptor2;
        if (continuation instanceof AnonymousClass1) {
            anonymousClass1 = (AnonymousClass1) continuation;
            int i5 = anonymousClass1.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                anonymousClass1.label = i5 - Integer.MIN_VALUE;
            } else {
                anonymousClass1 = new AnonymousClass1(continuation);
            }
        }
        Object obj = anonymousClass1.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = anonymousClass1.label;
        if (i11 == 0) {
            ResultKt.b(obj);
            if (this.storageHandler == null) {
                return baseEvent;
            }
            if (isIdentityUpdated(baseEvent)) {
                anonymousClass1.L$0 = this;
                anonymousClass1.L$1 = baseEvent;
                anonymousClass1.label = 1;
            }
            identifyInterceptor = this;
        } else {
            if (i11 != 1) {
                if (i11 == 2) {
                    identifyInterceptor2 = (IdentifyInterceptor) anonymousClass1.L$0;
                    ResultKt.b(obj);
                    identifyInterceptor2.scheduleTransfer();
                    return null;
                }
                if (i11 != 3 && i11 != 4 && i11 != 5) {
                    throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
                }
                BaseEvent baseEvent2 = (BaseEvent) anonymousClass1.L$0;
                ResultKt.b(obj);
                return baseEvent2;
            }
            baseEvent = (BaseEvent) anonymousClass1.L$1;
            identifyInterceptor = (IdentifyInterceptor) anonymousClass1.L$0;
            ResultKt.b(obj);
        }
        String eventType = baseEvent.getEventType();
        if (!Intrinsics.b(eventType, Constants.IDENTIFY_EVENT)) {
            if (!Intrinsics.b(eventType, Constants.GROUP_IDENTIFY_EVENT)) {
                anonymousClass1.L$0 = baseEvent;
                anonymousClass1.L$1 = null;
                anonymousClass1.label = 5;
                if (identifyInterceptor.transferInterceptedIdentify(anonymousClass1) == coroutineSingletons) {
                    return coroutineSingletons;
                }
            }
            return baseEvent;
        }
        if (identifyInterceptor.isSetOnly(baseEvent) && !identifyInterceptor.isSetGroups(baseEvent)) {
            anonymousClass1.L$0 = identifyInterceptor;
            anonymousClass1.L$1 = null;
            anonymousClass1.label = 2;
            if (identifyInterceptor.saveIdentifyProperties(baseEvent, anonymousClass1) != coroutineSingletons) {
                identifyInterceptor2 = identifyInterceptor;
                identifyInterceptor2.scheduleTransfer();
                return null;
            }
        } else if (identifyInterceptor.isClearAll(baseEvent)) {
            anonymousClass1.L$0 = baseEvent;
            anonymousClass1.L$1 = null;
            anonymousClass1.label = 3;
            if (identifyInterceptor.clearIdentifyIntercepts(anonymousClass1) != coroutineSingletons) {
                return baseEvent;
            }
        } else {
            anonymousClass1.L$0 = baseEvent;
            anonymousClass1.L$1 = null;
            anonymousClass1.label = 4;
            if (identifyInterceptor.transferInterceptedIdentify(anonymousClass1) == coroutineSingletons) {
            }
        }
        return coroutineSingletons;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final Object transferInterceptedIdentify(@NotNull Continuation<? super Unit> continuation) {
        C04061 c04061;
        IdentifyInterceptor identifyInterceptor;
        if (continuation instanceof C04061) {
            c04061 = (C04061) continuation;
            int i5 = c04061.label;
            if ((i5 & Integer.MIN_VALUE) != 0) {
                c04061.label = i5 - Integer.MIN_VALUE;
            } else {
                c04061 = new C04061(continuation);
            }
        }
        Object transferIdentifyEvent = c04061.result;
        CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
        int i11 = c04061.label;
        if (i11 == 0) {
            ResultKt.b(transferIdentifyEvent);
            c04061.L$0 = this;
            c04061.label = 1;
            transferIdentifyEvent = getTransferIdentifyEvent(c04061);
            if (transferIdentifyEvent == coroutineSingletons) {
                return coroutineSingletons;
            }
            identifyInterceptor = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            identifyInterceptor = (IdentifyInterceptor) c04061.L$0;
            ResultKt.b(transferIdentifyEvent);
        }
        BaseEvent baseEvent = (BaseEvent) transferIdentifyEvent;
        if (baseEvent != null) {
            identifyInterceptor.plugin.enqueuePipeline(baseEvent);
        }
        return Unit.f71706a;
    }
}
