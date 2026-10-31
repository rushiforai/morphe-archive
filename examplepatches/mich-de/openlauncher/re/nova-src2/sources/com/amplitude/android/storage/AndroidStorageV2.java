package com.amplitude.android.storage;

import android.content.SharedPreferences;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.android.utilities.AndroidKVS;
import com.amplitude.common.Logger;
import com.amplitude.core.Configuration;
import com.amplitude.core.Storage;
import com.amplitude.core.diagnostics.DiagnosticsClientProvider;
import com.amplitude.core.events.BaseEvent;
import com.amplitude.core.platform.EventPipeline;
import com.amplitude.core.utilities.Diagnostics;
import com.amplitude.core.utilities.EventsFileManager;
import com.amplitude.core.utilities.EventsFileStorage;
import com.amplitude.core.utilities.FileResponseHandler;
import com.amplitude.core.utilities.JSONUtil;
import com.amplitude.core.utilities.http.ResponseHandler;
import com.bytedance.sdk.component.pglcrypt.PglCryptUtils;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.io.File;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.coroutines.intrinsics.CoroutineSingletons;
import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.coroutines.jvm.internal.DebugMetadata;
import kotlin.jvm.functions.Function3;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.json.JSONArray;
import t70.c0;
import t70.j0;

@Metadata(d1 = {"\u0000¬\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0010 \n\u0002\u0010\u0000\n\u0002\b\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\u0010\b\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010%\n\u0002\b\u0003\u0018\u00002\u00020\u00012\u00020\u0002B=\b\u0000\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\b\u001a\u00020\u0007\u0012\u0006\u0010\n\u001a\u00020\t\u0012\u0006\u0010\f\u001a\u00020\u000b\u0012\n\b\u0002\u0010\u000e\u001a\u0004\u0018\u00010\r¢\u0006\u0004\b\u000f\u0010\u0010B1\b\u0016\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0005\u0012\u0006\u0010\b\u001a\u00020\u0007\u0012\u0006\u0010\n\u001a\u00020\t\u0012\u0006\u0010\f\u001a\u00020\u000b¢\u0006\u0004\b\u000f\u0010\u0011J\u0018\u0010\u0015\u001a\u00020\u00142\u0006\u0010\u0013\u001a\u00020\u0012H\u0096@¢\u0006\u0004\b\u0015\u0010\u0016J \u0010\u001a\u001a\u00020\u00142\u0006\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u0019\u001a\u00020\u0003H\u0096@¢\u0006\u0004\b\u001a\u0010\u001bJ\u0018\u0010\u001c\u001a\u00020\u00142\u0006\u0010\u0018\u001a\u00020\u0017H\u0096@¢\u0006\u0004\b\u001c\u0010\u001dJ\u0010\u0010\u001e\u001a\u00020\u0014H\u0096@¢\u0006\u0004\b\u001e\u0010\u001fJ\u0019\u0010 \u001a\u0004\u0018\u00010\u00032\u0006\u0010\u0018\u001a\u00020\u0017H\u0016¢\u0006\u0004\b \u0010!J\u0015\u0010$\u001a\b\u0012\u0004\u0012\u00020#0\"H\u0016¢\u0006\u0004\b$\u0010%J\u0017\u0010'\u001a\u00020\u00142\u0006\u0010&\u001a\u00020\u0003H\u0016¢\u0006\u0004\b'\u0010(J\u0018\u0010)\u001a\u00020\u00032\u0006\u0010&\u001a\u00020#H\u0096@¢\u0006\u0004\b)\u0010*J/\u00104\u001a\u0002032\u0006\u0010,\u001a\u00020+2\u0006\u0010.\u001a\u00020-2\u0006\u00100\u001a\u00020/2\u0006\u00102\u001a\u000201H\u0016¢\u0006\u0004\b4\u00105J\u0017\u00107\u001a\u0002062\u0006\u0010&\u001a\u00020\u0003H\u0016¢\u0006\u0004\b7\u00108JU\u0010A\u001a@\u0012\u0004\u0012\u00020\u0012\u0012\u0013\u0012\u00110;¢\u0006\f\b<\u0012\b\b=\u0012\u0004\b\b(>\u0012\u0013\u0012\u00110\u0003¢\u0006\f\b<\u0012\b\b=\u0012\u0004\b\b(?\u0012\u0004\u0012\u00020\u0014\u0018\u00010:j\u0004\u0018\u0001`@2\u0006\u00109\u001a\u00020\u0003H\u0016¢\u0006\u0004\bA\u0010BJ\u0017\u0010C\u001a\u00020\u00142\u0006\u00109\u001a\u00020\u0003H\u0016¢\u0006\u0004\bC\u0010(J\u001f\u0010F\u001a\u00020\u00142\u0006\u0010&\u001a\u00020\u00032\u0006\u0010E\u001a\u00020DH\u0016¢\u0006\u0004\bF\u0010GJ\r\u0010H\u001a\u00020\u0014¢\u0006\u0004\bH\u0010IR\u0014\u0010\u0006\u001a\u00020\u00058\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0006\u0010JR\u0017\u0010\b\u001a\u00020\u00078\u0006¢\u0006\f\n\u0004\b\b\u0010K\u001a\u0004\bL\u0010MR\u0016\u0010\u000e\u001a\u0004\u0018\u00010\r8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u000e\u0010NR\u0014\u0010P\u001a\u00020O8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bP\u0010QRZ\u0010S\u001aH\u0012\u0004\u0012\u00020\u0003\u0012>\u0012<\u0012\u0004\u0012\u00020\u0012\u0012\u0013\u0012\u00110;¢\u0006\f\b<\u0012\b\b=\u0012\u0004\b\b(>\u0012\u0013\u0012\u00110\u0003¢\u0006\f\b<\u0012\b\b=\u0012\u0004\b\b(?\u0012\u0004\u0012\u00020\u00140:j\u0002`@0R8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\bS\u0010T¨\u0006U"}, d2 = {"Lcom/amplitude/android/storage/AndroidStorageV2;", "Lcom/amplitude/core/Storage;", "Lcom/amplitude/core/utilities/EventsFileStorage;", b.f42142b, "storageKey", "Lcom/amplitude/common/Logger;", "logger", "Landroid/content/SharedPreferences;", "sharedPreferences", "Ljava/io/File;", "storageDirectory", "Lcom/amplitude/core/utilities/Diagnostics;", "diagnostics", "Lcom/amplitude/core/diagnostics/DiagnosticsClientProvider;", "diagnosticsClientProvider", "<init>", "(Ljava/lang/String;Lcom/amplitude/common/Logger;Landroid/content/SharedPreferences;Ljava/io/File;Lcom/amplitude/core/utilities/Diagnostics;Lcom/amplitude/core/diagnostics/DiagnosticsClientProvider;)V", "(Ljava/lang/String;Lcom/amplitude/common/Logger;Landroid/content/SharedPreferences;Ljava/io/File;Lcom/amplitude/core/utilities/Diagnostics;)V", "Lcom/amplitude/core/events/BaseEvent;", DatabaseConstants.EVENT_FIELD, b.f42142b, "writeEvent", "(Lcom/amplitude/core/events/BaseEvent;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Lcom/amplitude/core/Storage$Constants;", DatabaseConstants.KEY_FIELD, "value", "write", "(Lcom/amplitude/core/Storage$Constants;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "remove", "(Lcom/amplitude/core/Storage$Constants;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "rollover", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "read", "(Lcom/amplitude/core/Storage$Constants;)Ljava/lang/String;", b.f42142b, b.f42142b, "readEventsContent", "()Ljava/util/List;", "filePath", "releaseFile", "(Ljava/lang/String;)V", "getEventsString", "(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Lcom/amplitude/core/platform/EventPipeline;", "eventPipeline", "Lcom/amplitude/core/Configuration;", "configuration", "Lt70/j0;", "scope", "Lt70/c0;", "storageDispatcher", "Lcom/amplitude/core/utilities/http/ResponseHandler;", "getResponseHandler", "(Lcom/amplitude/core/platform/EventPipeline;Lcom/amplitude/core/Configuration;Lt70/j0;Lt70/c0;)Lcom/amplitude/core/utilities/http/ResponseHandler;", b.f42142b, "removeFile", "(Ljava/lang/String;)Z", "insertId", "Lkotlin/Function3;", b.f42142b, "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "status", PglCryptUtils.KEY_MESSAGE, "Lcom/amplitude/core/EventCallBack;", "getEventCallback", "(Ljava/lang/String;)Lkotlin/jvm/functions/Function3;", "removeEventCallback", "Lorg/json/JSONArray;", DatabaseConstants.EVENT_TABLE_NAME, "splitEventFile", "(Ljava/lang/String;Lorg/json/JSONArray;)V", "cleanupMetadata", "()V", "Lcom/amplitude/common/Logger;", "Landroid/content/SharedPreferences;", "getSharedPreferences", "()Landroid/content/SharedPreferences;", "Lcom/amplitude/core/diagnostics/DiagnosticsClientProvider;", "Lcom/amplitude/core/utilities/EventsFileManager;", "eventsFile", "Lcom/amplitude/core/utilities/EventsFileManager;", b.f42142b, "eventCallbacksMap", "Ljava/util/Map;", "android_release"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class AndroidStorageV2 implements Storage, EventsFileStorage {

    @Nullable
    private final DiagnosticsClientProvider diagnosticsClientProvider;

    @NotNull
    private final Map<String, Function3<BaseEvent, Integer, String, Unit>> eventCallbacksMap;

    @NotNull
    private final EventsFileManager eventsFile;

    @NotNull
    private final Logger logger;

    @NotNull
    private final SharedPreferences sharedPreferences;

    @Metadata(k = 3, mv = {1, 9, 0}, xi = 48)
    @DebugMetadata(c = "com.amplitude.android.storage.AndroidStorageV2", f = "AndroidStorageV2.kt", l = {67}, m = "writeEvent")
    /* renamed from: com.amplitude.android.storage.AndroidStorageV2$writeEvent$1, reason: invalid class name */
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
            return AndroidStorageV2.this.writeEvent(null, this);
        }
    }

    public AndroidStorageV2(@NotNull String storageKey, @NotNull Logger logger, @NotNull SharedPreferences sharedPreferences, @NotNull File storageDirectory, @NotNull Diagnostics diagnostics, @Nullable DiagnosticsClientProvider diagnosticsClientProvider) {
        Intrinsics.g(storageKey, "storageKey");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(sharedPreferences, "sharedPreferences");
        Intrinsics.g(storageDirectory, "storageDirectory");
        Intrinsics.g(diagnostics, "diagnostics");
        this.logger = logger;
        this.sharedPreferences = sharedPreferences;
        this.diagnosticsClientProvider = diagnosticsClientProvider;
        this.eventsFile = new EventsFileManager(storageDirectory, storageKey, new AndroidKVS(sharedPreferences), logger, diagnostics);
        this.eventCallbacksMap = new LinkedHashMap();
    }

    public final void cleanupMetadata() {
        this.eventsFile.cleanupMetadata();
    }

    @Override // com.amplitude.core.utilities.EventsFileStorage
    @Nullable
    public Function3<BaseEvent, Integer, String, Unit> getEventCallback(@NotNull String insertId) {
        Intrinsics.g(insertId, "insertId");
        return this.eventCallbacksMap.get(insertId);
    }

    @Override // com.amplitude.core.Storage, com.amplitude.core.utilities.EventsFileStorage
    @Nullable
    public Object getEventsString(@NotNull Object obj, @NotNull Continuation<? super String> continuation) {
        EventsFileManager eventsFileManager = this.eventsFile;
        Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.String");
        return eventsFileManager.getEventString((String) obj, continuation);
    }

    @Override // com.amplitude.core.Storage
    @NotNull
    public ResponseHandler getResponseHandler(@NotNull EventPipeline eventPipeline, @NotNull Configuration configuration, @NotNull j0 scope, @NotNull c0 storageDispatcher) {
        Intrinsics.g(eventPipeline, "eventPipeline");
        Intrinsics.g(configuration, "configuration");
        Intrinsics.g(scope, "scope");
        Intrinsics.g(storageDispatcher, "storageDispatcher");
        Logger logger = this.logger;
        DiagnosticsClientProvider diagnosticsClientProvider = this.diagnosticsClientProvider;
        return new FileResponseHandler(this, eventPipeline, configuration, scope, storageDispatcher, logger, diagnosticsClientProvider != null ? diagnosticsClientProvider.get() : null);
    }

    @NotNull
    public final SharedPreferences getSharedPreferences() {
        return this.sharedPreferences;
    }

    @Override // com.amplitude.core.Storage
    @Nullable
    public String read(@NotNull Storage.Constants key) {
        Intrinsics.g(key, "key");
        return this.sharedPreferences.getString(key.getRawVal(), null);
    }

    @Override // com.amplitude.core.Storage, com.amplitude.core.utilities.EventsFileStorage
    @NotNull
    public List<Object> readEventsContent() {
        return this.eventsFile.read();
    }

    @Override // com.amplitude.core.utilities.EventsFileStorage
    public void releaseFile(@NotNull String filePath) {
        Intrinsics.g(filePath, "filePath");
        this.eventsFile.release(filePath);
    }

    @Override // com.amplitude.core.Storage
    @Nullable
    public Object remove(@NotNull Storage.Constants constants, @NotNull Continuation<? super Unit> continuation) {
        SharedPreferences.Editor editorEdit = this.sharedPreferences.edit();
        editorEdit.remove(constants.getRawVal());
        editorEdit.apply();
        return Unit.f71706a;
    }

    @Override // com.amplitude.core.utilities.EventsFileStorage
    public void removeEventCallback(@NotNull String insertId) {
        Intrinsics.g(insertId, "insertId");
        this.eventCallbacksMap.remove(insertId);
    }

    @Override // com.amplitude.core.utilities.EventsFileStorage
    public boolean removeFile(@NotNull String filePath) {
        Intrinsics.g(filePath, "filePath");
        return this.eventsFile.remove(filePath);
    }

    @Override // com.amplitude.core.Storage, com.amplitude.core.utilities.EventsFileStorage
    @Nullable
    public Object rollover(@NotNull Continuation<? super Unit> continuation) {
        Object objRollover = this.eventsFile.rollover(continuation);
        return objRollover == CoroutineSingletons.f71806a ? objRollover : Unit.f71706a;
    }

    @Override // com.amplitude.core.utilities.EventsFileStorage
    public void splitEventFile(@NotNull String filePath, @NotNull JSONArray events) {
        Intrinsics.g(filePath, "filePath");
        Intrinsics.g(events, "events");
        this.eventsFile.splitFile(filePath, events);
    }

    @Override // com.amplitude.core.Storage
    @Nullable
    public Object write(@NotNull Storage.Constants constants, @NotNull String str, @NotNull Continuation<? super Unit> continuation) {
        SharedPreferences.Editor editorEdit = this.sharedPreferences.edit();
        editorEdit.putString(constants.getRawVal(), str);
        editorEdit.apply();
        return Unit.f71706a;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0013  */
    @Override // com.amplitude.core.Storage
    @Nullable
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public Object writeEvent(@NotNull BaseEvent baseEvent, @NotNull Continuation<? super Unit> continuation) {
        AnonymousClass1 anonymousClass1;
        AndroidStorageV2 androidStorageV2;
        String insertId;
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
            EventsFileManager eventsFileManager = this.eventsFile;
            String strEventToString = JSONUtil.INSTANCE.eventToString(baseEvent);
            anonymousClass1.L$0 = this;
            anonymousClass1.L$1 = baseEvent;
            anonymousClass1.label = 1;
            if (eventsFileManager.storeEvent(strEventToString, anonymousClass1) == coroutineSingletons) {
                return coroutineSingletons;
            }
            androidStorageV2 = this;
        } else {
            if (i11 != 1) {
                throw new IllegalStateException("call to 'resume' before 'invoke' with coroutine");
            }
            baseEvent = (BaseEvent) anonymousClass1.L$1;
            androidStorageV2 = (AndroidStorageV2) anonymousClass1.L$0;
            ResultKt.b(obj);
        }
        Function3<BaseEvent, Integer, String, Unit> callback = baseEvent.getCallback();
        if (callback != null && (insertId = baseEvent.getInsertId()) != null) {
            androidStorageV2.eventCallbacksMap.put(insertId, callback);
        }
        return Unit.f71706a;
    }

    public /* synthetic */ AndroidStorageV2(String str, Logger logger, SharedPreferences sharedPreferences, File file, Diagnostics diagnostics, DiagnosticsClientProvider diagnosticsClientProvider, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(str, logger, sharedPreferences, file, diagnostics, (i5 & 32) != 0 ? null : diagnosticsClientProvider);
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public AndroidStorageV2(@NotNull String storageKey, @NotNull Logger logger, @NotNull SharedPreferences sharedPreferences, @NotNull File storageDirectory, @NotNull Diagnostics diagnostics) {
        this(storageKey, logger, sharedPreferences, storageDirectory, diagnostics, null);
        Intrinsics.g(storageKey, "storageKey");
        Intrinsics.g(logger, "logger");
        Intrinsics.g(sharedPreferences, "sharedPreferences");
        Intrinsics.g(storageDirectory, "storageDirectory");
        Intrinsics.g(diagnostics, "diagnostics");
    }
}
