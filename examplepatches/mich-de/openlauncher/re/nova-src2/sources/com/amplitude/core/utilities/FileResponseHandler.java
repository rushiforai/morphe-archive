package com.amplitude.core.utilities;

import b70.g;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.common.Logger;
import com.amplitude.core.Configuration;
import com.amplitude.core.diagnostics.DiagnosticsClient;
import com.amplitude.core.events.BaseEvent;
import com.amplitude.core.events.Identify;
import com.amplitude.core.platform.EventPipeline;
import com.amplitude.core.utilities.http.BadRequestResponse;
import com.amplitude.core.utilities.http.FailedResponse;
import com.amplitude.core.utilities.http.HttpStatus;
import com.amplitude.core.utilities.http.PayloadTooLargeResponse;
import com.amplitude.core.utilities.http.ResponseHandler;
import com.amplitude.core.utilities.http.SuccessResponse;
import com.amplitude.core.utilities.http.TimeoutResponse;
import com.amplitude.core.utilities.http.TooManyRequestsResponse;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.coroutines.jvm.internal.SuspendLambda;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.sequences.GeneratorSequence$iterator$1;
import kotlin.text.MatchResult;
import kotlin.text.Regex;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;
import org.json.JSONException;
import r70.k;
import t70.c0;
import t70.j0;
import t70.m0;

@Metadata(d1 = {"\u0000\u009a\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u000b\u0018\u00002\u00020\u0001BC\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\u0006\u0010\u000b\u001a\u00020\n\u0012\b\u0010\r\u001a\u0004\u0018\u00010\f\u0012\b\u0010\u000f\u001a\u0004\u0018\u00010\u000e¢\u0006\u0004\b\u0010\u0010\u0011B;\b\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\t\u001a\u00020\b\u0012\u0006\u0010\u000b\u001a\u00020\n\u0012\b\u0010\r\u001a\u0004\u0018\u00010\f¢\u0006\u0004\b\u0010\u0010\u0012J\u001f\u0010\u0017\u001a\u00020\u00162\u0006\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0015\u001a\u00020\u0013H\u0002¢\u0006\u0004\b\u0017\u0010\u0018J-\u0010 \u001a\u00020\u001f2\f\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\u001a0\u00192\u0006\u0010\u001d\u001a\u00020\u001c2\u0006\u0010\u001e\u001a\u00020\u0013H\u0002¢\u0006\u0004\b \u0010!J\u0017\u0010\"\u001a\u00020\u001f2\u0006\u0010\u0014\u001a\u00020\u0013H\u0002¢\u0006\u0004\b\"\u0010#J'\u0010'\u001a\u00020\u001f2\u0006\u0010%\u001a\u00020$2\u0006\u0010\u001b\u001a\u00020&2\u0006\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b'\u0010(J'\u0010,\u001a\u00020+2\u0006\u0010*\u001a\u00020)2\u0006\u0010\u001b\u001a\u00020&2\u0006\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b,\u0010-J'\u00100\u001a\u00020\u001f2\u0006\u0010/\u001a\u00020.2\u0006\u0010\u001b\u001a\u00020&2\u0006\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b0\u00101J'\u00104\u001a\u00020\u001f2\u0006\u00103\u001a\u0002022\u0006\u0010\u001b\u001a\u00020&2\u0006\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b4\u00105J'\u00108\u001a\u00020\u001f2\u0006\u00107\u001a\u0002062\u0006\u0010\u001b\u001a\u00020&2\u0006\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b8\u00109J'\u0010<\u001a\u00020\u001f2\u0006\u0010;\u001a\u00020:2\u0006\u0010\u001b\u001a\u00020&2\u0006\u0010\u0014\u001a\u00020\u0013H\u0016¢\u0006\u0004\b<\u0010=R\u0014\u0010\u0003\u001a\u00020\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010>R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0005\u0010?R\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010@R\u0014\u0010\t\u001a\u00020\b8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\t\u0010AR\u0014\u0010\u000b\u001a\u00020\n8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000b\u0010BR\u0016\u0010\r\u001a\u0004\u0018\u00010\f8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\r\u0010CR\u0016\u0010\u000f\u001a\u0004\u0018\u00010\u000e8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010D¨\u0006E"}, d2 = {"Lcom/amplitude/core/utilities/FileResponseHandler;", "Lcom/amplitude/core/utilities/http/ResponseHandler;", "Lcom/amplitude/core/utilities/EventsFileStorage;", PlaceTypes.STORAGE, "Lcom/amplitude/core/platform/EventPipeline;", "eventPipeline", "Lcom/amplitude/core/Configuration;", "configuration", "Lt70/j0;", "scope", "Lt70/c0;", "storageDispatcher", "Lcom/amplitude/common/Logger;", "logger", "Lcom/amplitude/core/diagnostics/DiagnosticsClient;", "diagnosticsClient", "<init>", "(Lcom/amplitude/core/utilities/EventsFileStorage;Lcom/amplitude/core/platform/EventPipeline;Lcom/amplitude/core/Configuration;Lt70/j0;Lt70/c0;Lcom/amplitude/common/Logger;Lcom/amplitude/core/diagnostics/DiagnosticsClient;)V", "(Lcom/amplitude/core/utilities/EventsFileStorage;Lcom/amplitude/core/platform/EventPipeline;Lcom/amplitude/core/Configuration;Lt70/j0;Lt70/c0;Lcom/amplitude/common/Logger;)V", b.f42142b, "eventsString", "eventFilePath", "Lorg/json/JSONArray;", "parseEvents", "(Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;", b.f42142b, "Lcom/amplitude/core/events/BaseEvent;", DatabaseConstants.EVENT_TABLE_NAME, b.f42142b, "status", PglCryptUtils.KEY_MESSAGE, b.f42142b, "triggerEventsCallback", "(Ljava/util/List;ILjava/lang/String;)V", "removeCallbackByInsertId", "(Ljava/lang/String;)V", "Lcom/amplitude/core/utilities/http/SuccessResponse;", "successResponse", b.f42142b, "handleSuccessResponse", "(Lcom/amplitude/core/utilities/http/SuccessResponse;Ljava/lang/Object;Ljava/lang/String;)V", "Lcom/amplitude/core/utilities/http/BadRequestResponse;", "badRequestResponse", b.f42142b, "handleBadRequestResponse", "(Lcom/amplitude/core/utilities/http/BadRequestResponse;Ljava/lang/Object;Ljava/lang/String;)Z", "Lcom/amplitude/core/utilities/http/PayloadTooLargeResponse;", "payloadTooLargeResponse", "handlePayloadTooLargeResponse", "(Lcom/amplitude/core/utilities/http/PayloadTooLargeResponse;Ljava/lang/Object;Ljava/lang/String;)V", "Lcom/amplitude/core/utilities/http/TooManyRequestsResponse;", "tooManyRequestsResponse", "handleTooManyRequestsResponse", "(Lcom/amplitude/core/utilities/http/TooManyRequestsResponse;Ljava/lang/Object;Ljava/lang/String;)V", "Lcom/amplitude/core/utilities/http/TimeoutResponse;", "timeoutResponse", "handleTimeoutResponse", "(Lcom/amplitude/core/utilities/http/TimeoutResponse;Ljava/lang/Object;Ljava/lang/String;)V", "Lcom/amplitude/core/utilities/http/FailedResponse;", "failedResponse", "handleFailedResponse", "(Lcom/amplitude/core/utilities/http/FailedResponse;Ljava/lang/Object;Ljava/lang/String;)V", "Lcom/amplitude/core/utilities/EventsFileStorage;", "Lcom/amplitude/core/platform/EventPipeline;", "Lcom/amplitude/core/Configuration;", "Lt70/j0;", "Lt70/c0;", "Lcom/amplitude/common/Logger;", "Lcom/amplitude/core/diagnostics/DiagnosticsClient;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class FileResponseHandler implements ResponseHandler {

    @NotNull
    private final Configuration configuration;

    @Nullable
    private final DiagnosticsClient diagnosticsClient;

    @NotNull
    private final EventPipeline eventPipeline;

    @Nullable
    private final Logger logger;

    @NotNull
    private final j0 scope;

    @NotNull
    private final EventsFileStorage storage;

    @NotNull
    private final c0 storageDispatcher;

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
    @DebugMetadata(c = "com.amplitude.core.utilities.FileResponseHandler$handleBadRequestResponse$1", f = "FileResponseHandler.kt", l = {}, m = "invokeSuspend")
    /* renamed from: com.amplitude.core.utilities.FileResponseHandler$handleBadRequestResponse$1, reason: invalid class name */
    public static final class AnonymousClass1 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ String $eventFilePath;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AnonymousClass1(String str, Continuation<? super AnonymousClass1> continuation) {
            super(2, continuation);
            this.$eventFilePath = str;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return FileResponseHandler.this.new AnonymousClass1(this.$eventFilePath, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            FileResponseHandler.this.storage.removeFile(this.$eventFilePath);
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        @Nullable
        public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
            return ((AnonymousClass1) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
    @DebugMetadata(c = "com.amplitude.core.utilities.FileResponseHandler$handleBadRequestResponse$3", f = "FileResponseHandler.kt", l = {}, m = "invokeSuspend")
    /* renamed from: com.amplitude.core.utilities.FileResponseHandler$handleBadRequestResponse$3, reason: invalid class name */
    public static final class AnonymousClass3 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ Object $events;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AnonymousClass3(Object obj, Continuation<? super AnonymousClass3> continuation) {
            super(2, continuation);
            this.$events = obj;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return FileResponseHandler.this.new AnonymousClass3(this.$events, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            FileResponseHandler.this.storage.releaseFile((String) this.$events);
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        @Nullable
        public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
            return ((AnonymousClass3) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
    @DebugMetadata(c = "com.amplitude.core.utilities.FileResponseHandler$handleBadRequestResponse$5", f = "FileResponseHandler.kt", l = {}, m = "invokeSuspend")
    /* renamed from: com.amplitude.core.utilities.FileResponseHandler$handleBadRequestResponse$5, reason: invalid class name */
    public static final class AnonymousClass5 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ String $eventFilePath;
        final /* synthetic */ List<BaseEvent> $eventsToDrop;
        final /* synthetic */ List<BaseEvent> $eventsToRetry;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AnonymousClass5(String str, List<BaseEvent> list, List<BaseEvent> list2, Continuation<? super AnonymousClass5> continuation) {
            super(2, continuation);
            this.$eventFilePath = str;
            this.$eventsToDrop = list;
            this.$eventsToRetry = list2;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return FileResponseHandler.this.new AnonymousClass5(this.$eventFilePath, this.$eventsToDrop, this.$eventsToRetry, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            Logger logger = FileResponseHandler.this.logger;
            if (logger != null) {
                logger.debug("--> remove file: " + g.F1(2, k.i1(this.$eventFilePath, new String[]{Identify.UNSET_VALUE}, 6)) + ", dropped events: " + this.$eventsToDrop.size() + ", retry events: " + this.$eventsToRetry.size());
            }
            FileResponseHandler.this.storage.removeFile(this.$eventFilePath);
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        @Nullable
        public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
            return ((AnonymousClass5) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
    @DebugMetadata(c = "com.amplitude.core.utilities.FileResponseHandler$handleFailedResponse$1", f = "FileResponseHandler.kt", l = {}, m = "invokeSuspend")
    /* renamed from: com.amplitude.core.utilities.FileResponseHandler$handleFailedResponse$1, reason: invalid class name and case insensitive filesystem */
    public static final class C04141 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ Object $events;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C04141(Object obj, Continuation<? super C04141> continuation) {
            super(2, continuation);
            this.$events = obj;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return FileResponseHandler.this.new C04141(this.$events, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            EventsFileStorage eventsFileStorage = FileResponseHandler.this.storage;
            Object obj2 = this.$events;
            Intrinsics.e(obj2, "null cannot be cast to non-null type kotlin.String");
            eventsFileStorage.releaseFile((String) obj2);
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        @Nullable
        public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
            return ((C04141) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
    @DebugMetadata(c = "com.amplitude.core.utilities.FileResponseHandler$handlePayloadTooLargeResponse$1", f = "FileResponseHandler.kt", l = {}, m = "invokeSuspend")
    /* renamed from: com.amplitude.core.utilities.FileResponseHandler$handlePayloadTooLargeResponse$1, reason: invalid class name and case insensitive filesystem */
    public static final class C04151 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ String $eventFilePath;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C04151(String str, Continuation<? super C04151> continuation) {
            super(2, continuation);
            this.$eventFilePath = str;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return FileResponseHandler.this.new C04151(this.$eventFilePath, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            FileResponseHandler.this.storage.removeFile(this.$eventFilePath);
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        @Nullable
        public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
            return ((C04151) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
    @DebugMetadata(c = "com.amplitude.core.utilities.FileResponseHandler$handlePayloadTooLargeResponse$2", f = "FileResponseHandler.kt", l = {}, m = "invokeSuspend")
    /* renamed from: com.amplitude.core.utilities.FileResponseHandler$handlePayloadTooLargeResponse$2, reason: invalid class name */
    public static final class AnonymousClass2 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ String $eventFilePath;
        final /* synthetic */ JSONArray $rawEvents;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public AnonymousClass2(String str, JSONArray jSONArray, Continuation<? super AnonymousClass2> continuation) {
            super(2, continuation);
            this.$eventFilePath = str;
            this.$rawEvents = jSONArray;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return FileResponseHandler.this.new AnonymousClass2(this.$eventFilePath, this.$rawEvents, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            FileResponseHandler.this.storage.splitEventFile(this.$eventFilePath, this.$rawEvents);
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        @Nullable
        public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
            return ((AnonymousClass2) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
    @DebugMetadata(c = "com.amplitude.core.utilities.FileResponseHandler$handleSuccessResponse$1", f = "FileResponseHandler.kt", l = {}, m = "invokeSuspend")
    /* renamed from: com.amplitude.core.utilities.FileResponseHandler$handleSuccessResponse$1, reason: invalid class name and case insensitive filesystem */
    public static final class C04161 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ String $eventFilePath;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C04161(String str, Continuation<? super C04161> continuation) {
            super(2, continuation);
            this.$eventFilePath = str;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return FileResponseHandler.this.new C04161(this.$eventFilePath, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            FileResponseHandler.this.storage.removeFile(this.$eventFilePath);
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        @Nullable
        public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
            return ((C04161) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
    @DebugMetadata(c = "com.amplitude.core.utilities.FileResponseHandler$handleTimeoutResponse$1", f = "FileResponseHandler.kt", l = {}, m = "invokeSuspend")
    /* renamed from: com.amplitude.core.utilities.FileResponseHandler$handleTimeoutResponse$1, reason: invalid class name and case insensitive filesystem */
    public static final class C04171 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ Object $events;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C04171(Object obj, Continuation<? super C04171> continuation) {
            super(2, continuation);
            this.$events = obj;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return FileResponseHandler.this.new C04171(this.$events, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            EventsFileStorage eventsFileStorage = FileResponseHandler.this.storage;
            Object obj2 = this.$events;
            Intrinsics.e(obj2, "null cannot be cast to non-null type kotlin.String");
            eventsFileStorage.releaseFile((String) obj2);
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        @Nullable
        public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
            return ((C04171) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
    @DebugMetadata(c = "com.amplitude.core.utilities.FileResponseHandler$handleTooManyRequestsResponse$1", f = "FileResponseHandler.kt", l = {}, m = "invokeSuspend")
    /* renamed from: com.amplitude.core.utilities.FileResponseHandler$handleTooManyRequestsResponse$1, reason: invalid class name and case insensitive filesystem */
    public static final class C04181 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ Object $events;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C04181(Object obj, Continuation<? super C04181> continuation) {
            super(2, continuation);
            this.$events = obj;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return FileResponseHandler.this.new C04181(this.$events, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            EventsFileStorage eventsFileStorage = FileResponseHandler.this.storage;
            Object obj2 = this.$events;
            Intrinsics.e(obj2, "null cannot be cast to non-null type kotlin.String");
            eventsFileStorage.releaseFile((String) obj2);
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        @Nullable
        public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
            return ((C04181) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    @Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\u0010\u0002\u001a\u00020\u0001*\u00020\u0000H\u008a@¢\u0006\u0004\b\u0002\u0010\u0003"}, d2 = {"Lt70/j0;", b.f42142b, "<anonymous>", "(Lt70/j0;)V"}, k = 3, mv = {1, 9, 0})
    @DebugMetadata(c = "com.amplitude.core.utilities.FileResponseHandler$parseEvents$1", f = "FileResponseHandler.kt", l = {}, m = "invokeSuspend")
    /* renamed from: com.amplitude.core.utilities.FileResponseHandler$parseEvents$1, reason: invalid class name and case insensitive filesystem */
    public static final class C04191 extends SuspendLambda implements Function2<j0, Continuation<? super Unit>, Object> {
        final /* synthetic */ String $eventFilePath;
        int label;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public C04191(String str, Continuation<? super C04191> continuation) {
            super(2, continuation);
            this.$eventFilePath = str;
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @NotNull
        public final Continuation<Unit> create(@Nullable Object obj, @NotNull Continuation<?> continuation) {
            return FileResponseHandler.this.new C04191(this.$eventFilePath, continuation);
        }

        @Override // kotlin.coroutines.jvm.internal.BaseContinuationImpl
        @Nullable
        public final Object invokeSuspend(@NotNull Object obj) {
            CoroutineSingletons coroutineSingletons = CoroutineSingletons.f71806a;
            if (this.label != 0) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            ResultKt.b(obj);
            FileResponseHandler.this.storage.removeFile(this.$eventFilePath);
            return Unit.f71706a;
        }

        @Override // kotlin.jvm.functions.Function2
        @Nullable
        public final Object invoke(@NotNull j0 j0Var, @Nullable Continuation<? super Unit> continuation) {
            return ((C04191) create(j0Var, continuation)).invokeSuspend(Unit.f71706a);
        }
    }

    public FileResponseHandler(@NotNull EventsFileStorage storage, @NotNull EventPipeline eventPipeline, @NotNull Configuration configuration, @NotNull j0 scope, @NotNull c0 storageDispatcher, @Nullable Logger logger, @Nullable DiagnosticsClient diagnosticsClient) {
        Intrinsics.g(storage, "storage");
        Intrinsics.g(eventPipeline, "eventPipeline");
        Intrinsics.g(configuration, "configuration");
        Intrinsics.g(scope, "scope");
        Intrinsics.g(storageDispatcher, "storageDispatcher");
        this.storage = storage;
        this.eventPipeline = eventPipeline;
        this.configuration = configuration;
        this.scope = scope;
        this.storageDispatcher = storageDispatcher;
        this.logger = logger;
        this.diagnosticsClient = diagnosticsClient;
    }

    private final JSONArray parseEvents(String eventsString, String eventFilePath) throws JSONException {
        try {
            return new JSONArray(eventsString);
        } catch (JSONException e3) {
            m0.t(this.scope, this.storageDispatcher, null, new C04191(eventFilePath, null), 2);
            removeCallbackByInsertId(eventsString);
            throw e3;
        }
    }

    private final void removeCallbackByInsertId(String eventsString) {
        GeneratorSequence$iterator$1 generatorSequence$iterator$1 = new GeneratorSequence$iterator$1(Regex.d(new Regex("\"insert_id\":\"(.{36})\","), eventsString));
        while (generatorSequence$iterator$1.hasNext()) {
            m0.t(this.scope, this.storageDispatcher, null, new FileResponseHandler$removeCallbackByInsertId$1$1(this, (MatchResult) generatorSequence$iterator$1.next(), null), 2);
        }
    }

    private final void triggerEventsCallback(List<? extends BaseEvent> events, int status, String message) {
        int i5;
        String str;
        DiagnosticsClient diagnosticsClient;
        if (!events.isEmpty() && (diagnosticsClient = this.diagnosticsClient) != null) {
            DiagnosticsExtensionsKt.recordEventOutcome(diagnosticsClient, events, status, message);
        }
        for (BaseEvent baseEvent : events) {
            Function3<BaseEvent, Integer, String, Unit> callback = this.configuration.getCallback();
            if (callback != null) {
                callback.invoke(baseEvent, Integer.valueOf(status), message);
            }
            String insertId = baseEvent.getInsertId();
            if (insertId != null) {
                i5 = status;
                str = message;
                m0.t(this.scope, this.storageDispatcher, null, new FileResponseHandler$triggerEventsCallback$1$2$1(this, insertId, baseEvent, i5, str, null), 2);
            } else {
                i5 = status;
                str = message;
            }
            status = i5;
            message = str;
        }
    }

    @Override // com.amplitude.core.utilities.http.ResponseHandler
    public boolean handleBadRequestResponse(@NotNull BadRequestResponse badRequestResponse, @NotNull Object events, @NotNull String eventsString) throws JSONException {
        Intrinsics.g(badRequestResponse, "badRequestResponse");
        Intrinsics.g(events, "events");
        Intrinsics.g(eventsString, "eventsString");
        Logger logger = this.logger;
        if (logger != null) {
            logger.debug("Handle response, status: " + badRequestResponse.getStatus() + ", error: " + badRequestResponse.getError());
        }
        String str = (String) events;
        List<? extends BaseEvent> events2 = JSONUtilKt.toEvents(parseEvents(eventsString, str));
        if (badRequestResponse.isInvalidApiKeyResponse()) {
            triggerEventsCallback(events2, HttpStatus.BAD_REQUEST.getStatusCode(), badRequestResponse.getError());
            m0.t(this.scope, this.storageDispatcher, null, new AnonymousClass1(str, null), 2);
            return false;
        }
        Set<Integer> eventIndicesToDrop = badRequestResponse.getEventIndicesToDrop();
        ArrayList arrayList = new ArrayList();
        ArrayList arrayList2 = new ArrayList();
        int i5 = 0;
        for (Object obj : events2) {
            int i11 = i5 + 1;
            if (i5 < 0) {
                ul.b.e0();
                throw null;
            }
            BaseEvent baseEvent = (BaseEvent) obj;
            if (eventIndicesToDrop.contains(Integer.valueOf(i5)) || badRequestResponse.isEventSilenced(baseEvent)) {
                arrayList.add(baseEvent);
            } else {
                arrayList2.add(baseEvent);
            }
            i5 = i11;
        }
        if (arrayList.isEmpty()) {
            m0.t(this.scope, this.storageDispatcher, null, new AnonymousClass3(events, null), 2);
            return true;
        }
        triggerEventsCallback(arrayList, HttpStatus.BAD_REQUEST.getStatusCode(), badRequestResponse.getError());
        Iterator it = arrayList2.iterator();
        while (it.hasNext()) {
            this.eventPipeline.put((BaseEvent) it.next());
        }
        m0.t(this.scope, this.storageDispatcher, null, new AnonymousClass5(str, arrayList, arrayList2, null), 2);
        return false;
    }

    @Override // com.amplitude.core.utilities.http.ResponseHandler
    public void handleFailedResponse(@NotNull FailedResponse failedResponse, @NotNull Object events, @NotNull String eventsString) {
        Intrinsics.g(failedResponse, "failedResponse");
        Intrinsics.g(events, "events");
        Intrinsics.g(eventsString, "eventsString");
        Logger logger = this.logger;
        if (logger != null) {
            logger.debug("Handle response, status: " + failedResponse.getStatus() + ", error: " + failedResponse.getError());
        }
        m0.t(this.scope, this.storageDispatcher, null, new C04141(events, null), 2);
    }

    @Override // com.amplitude.core.utilities.http.ResponseHandler
    public void handlePayloadTooLargeResponse(@NotNull PayloadTooLargeResponse payloadTooLargeResponse, @NotNull Object events, @NotNull String eventsString) throws JSONException {
        Intrinsics.g(payloadTooLargeResponse, "payloadTooLargeResponse");
        Intrinsics.g(events, "events");
        Intrinsics.g(eventsString, "eventsString");
        Logger logger = this.logger;
        if (logger != null) {
            logger.debug("Handle response, status: " + payloadTooLargeResponse.getStatus() + ", error: " + payloadTooLargeResponse.getError());
        }
        String str = (String) events;
        JSONArray events2 = parseEvents(eventsString, str);
        if (events2.length() != 1) {
            m0.t(this.scope, this.storageDispatcher, null, new AnonymousClass2(str, events2, null), 2);
        } else {
            triggerEventsCallback(JSONUtilKt.toEvents(events2), HttpStatus.PAYLOAD_TOO_LARGE.getStatusCode(), payloadTooLargeResponse.getError());
            m0.t(this.scope, this.storageDispatcher, null, new C04151(str, null), 2);
        }
    }

    @Override // com.amplitude.core.utilities.http.ResponseHandler
    public void handleSuccessResponse(@NotNull SuccessResponse successResponse, @NotNull Object events, @NotNull String eventsString) {
        Intrinsics.g(successResponse, "successResponse");
        Intrinsics.g(events, "events");
        Intrinsics.g(eventsString, "eventsString");
        String str = (String) events;
        Logger logger = this.logger;
        if (logger != null) {
            logger.debug("Handle response, status: " + successResponse.getStatus());
        }
        triggerEventsCallback(JSONUtilKt.toEvents(parseEvents(eventsString, str)), HttpStatus.SUCCESS.getStatusCode(), "Event sent success.");
        m0.t(this.scope, this.storageDispatcher, null, new C04161(str, null), 2);
    }

    @Override // com.amplitude.core.utilities.http.ResponseHandler
    public void handleTimeoutResponse(@NotNull TimeoutResponse timeoutResponse, @NotNull Object events, @NotNull String eventsString) {
        Intrinsics.g(timeoutResponse, "timeoutResponse");
        Intrinsics.g(events, "events");
        Intrinsics.g(eventsString, "eventsString");
        Logger logger = this.logger;
        if (logger != null) {
            logger.debug("Handle response, status: " + timeoutResponse.getStatus());
        }
        m0.t(this.scope, this.storageDispatcher, null, new C04171(events, null), 2);
    }

    @Override // com.amplitude.core.utilities.http.ResponseHandler
    public void handleTooManyRequestsResponse(@NotNull TooManyRequestsResponse tooManyRequestsResponse, @NotNull Object events, @NotNull String eventsString) {
        Intrinsics.g(tooManyRequestsResponse, "tooManyRequestsResponse");
        Intrinsics.g(events, "events");
        Intrinsics.g(eventsString, "eventsString");
        Logger logger = this.logger;
        if (logger != null) {
            logger.debug("Handle response, status: " + tooManyRequestsResponse.getStatus() + ", error: " + tooManyRequestsResponse.getError());
        }
        m0.t(this.scope, this.storageDispatcher, null, new C04181(events, null), 2);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public FileResponseHandler(@NotNull EventsFileStorage storage, @NotNull EventPipeline eventPipeline, @NotNull Configuration configuration, @NotNull j0 scope, @NotNull c0 storageDispatcher, @Nullable Logger logger) {
        this(storage, eventPipeline, configuration, scope, storageDispatcher, logger, null);
        Intrinsics.g(storage, "storage");
        Intrinsics.g(eventPipeline, "eventPipeline");
        Intrinsics.g(configuration, "configuration");
        Intrinsics.g(scope, "scope");
        Intrinsics.g(storageDispatcher, "storageDispatcher");
    }
}
