package com.amplitude.core.utilities;

import b70.g;
import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.core.Configuration;
import com.amplitude.core.Storage;
import com.amplitude.core.diagnostics.DiagnosticsClientProvider;
import com.amplitude.core.events.BaseEvent;
import com.amplitude.core.platform.EventPipeline;
import com.amplitude.core.utilities.http.ResponseHandler;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import t70.c0;
import t70.j0;

@Metadata(d1 = {"\u0000h\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\t\n\u0002\u0010 \n\u0002\u0010\u0000\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010!\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\u0018\u00002\u00020\u0001B\u0015\b\u0000\u0012\n\b\u0002\u0010\u0003\u001a\u0004\u0018\u00010\u0002¢\u0006\u0004\b\u0004\u0010\u0005B\t\b\u0016¢\u0006\u0004\b\u0004\u0010\u0006J\u0018\u0010\n\u001a\u00020\t2\u0006\u0010\b\u001a\u00020\u0007H\u0096@¢\u0006\u0004\b\n\u0010\u000bJ \u0010\u0010\u001a\u00020\t2\u0006\u0010\r\u001a\u00020\f2\u0006\u0010\u000f\u001a\u00020\u000eH\u0096@¢\u0006\u0004\b\u0010\u0010\u0011J\u0018\u0010\u0012\u001a\u00020\t2\u0006\u0010\r\u001a\u00020\fH\u0096@¢\u0006\u0004\b\u0012\u0010\u0013J\u0010\u0010\u0014\u001a\u00020\tH\u0096@¢\u0006\u0004\b\u0014\u0010\u0015J\u0019\u0010\u0016\u001a\u0004\u0018\u00010\u000e2\u0006\u0010\r\u001a\u00020\fH\u0016¢\u0006\u0004\b\u0016\u0010\u0017J\u0015\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\u00190\u0018H\u0016¢\u0006\u0004\b\u001a\u0010\u001bJ\u0018\u0010\u001d\u001a\u00020\u000e2\u0006\u0010\u001c\u001a\u00020\u0019H\u0096@¢\u0006\u0004\b\u001d\u0010\u001eJ/\u0010(\u001a\u00020'2\u0006\u0010 \u001a\u00020\u001f2\u0006\u0010\"\u001a\u00020!2\u0006\u0010$\u001a\u00020#2\u0006\u0010&\u001a\u00020%H\u0016¢\u0006\u0004\b(\u0010)J\r\u0010*\u001a\u00020\t¢\u0006\u0004\b*\u0010\u0006R\u0016\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010+R\u001a\u0010-\u001a\b\u0012\u0004\u0012\u00020\u00070,8\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b-\u0010.R\u0014\u0010/\u001a\u00020\u00198\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b/\u00100R \u00102\u001a\u000e\u0012\u0004\u0012\u00020\u000e\u0012\u0004\u0012\u00020\u000e018\u0002X\u0082\u0004¢\u0006\u0006\n\u0004\b2\u00103¨\u00064"}, d2 = {"Lcom/amplitude/core/utilities/InMemoryStorage;", "Lcom/amplitude/core/Storage;", "Lcom/amplitude/core/diagnostics/DiagnosticsClientProvider;", "diagnosticsClientProvider", "<init>", "(Lcom/amplitude/core/diagnostics/DiagnosticsClientProvider;)V", "()V", "Lcom/amplitude/core/events/BaseEvent;", DatabaseConstants.EVENT_FIELD, b.f42142b, "writeEvent", "(Lcom/amplitude/core/events/BaseEvent;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Lcom/amplitude/core/Storage$Constants;", DatabaseConstants.KEY_FIELD, b.f42142b, "value", "write", "(Lcom/amplitude/core/Storage$Constants;Ljava/lang/String;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "remove", "(Lcom/amplitude/core/Storage$Constants;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "rollover", "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "read", "(Lcom/amplitude/core/Storage$Constants;)Ljava/lang/String;", b.f42142b, b.f42142b, "readEventsContent", "()Ljava/util/List;", "content", "getEventsString", "(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "Lcom/amplitude/core/platform/EventPipeline;", "eventPipeline", "Lcom/amplitude/core/Configuration;", "configuration", "Lt70/j0;", "scope", "Lt70/c0;", "storageDispatcher", "Lcom/amplitude/core/utilities/http/ResponseHandler;", "getResponseHandler", "(Lcom/amplitude/core/platform/EventPipeline;Lcom/amplitude/core/Configuration;Lt70/j0;Lt70/c0;)Lcom/amplitude/core/utilities/http/ResponseHandler;", "removeEvents", "Lcom/amplitude/core/diagnostics/DiagnosticsClientProvider;", b.f42142b, "eventsBuffer", "Ljava/util/List;", "eventsListLock", "Ljava/lang/Object;", "Ljava/util/concurrent/ConcurrentHashMap;", "valuesMap", "Ljava/util/concurrent/ConcurrentHashMap;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class InMemoryStorage implements Storage {

    @Nullable
    private final DiagnosticsClientProvider diagnosticsClientProvider;

    @NotNull
    private final List<BaseEvent> eventsBuffer;

    @NotNull
    private final Object eventsListLock;

    @NotNull
    private final ConcurrentHashMap<String, String> valuesMap;

    public InMemoryStorage(@Nullable DiagnosticsClientProvider diagnosticsClientProvider) {
        this.diagnosticsClientProvider = diagnosticsClientProvider;
        this.eventsBuffer = new ArrayList();
        this.eventsListLock = new Object();
        this.valuesMap = new ConcurrentHashMap<>();
    }

    @Override // com.amplitude.core.Storage, com.amplitude.core.utilities.EventsFileStorage
    @Nullable
    public Object getEventsString(@NotNull Object obj, @NotNull Continuation<? super String> continuation) {
        JSONUtil jSONUtil = JSONUtil.INSTANCE;
        Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.collections.List<com.amplitude.core.events.BaseEvent>");
        return jSONUtil.eventsToString((List) obj);
    }

    @Override // com.amplitude.core.Storage
    @NotNull
    public ResponseHandler getResponseHandler(@NotNull EventPipeline eventPipeline, @NotNull Configuration configuration, @NotNull j0 scope, @NotNull c0 storageDispatcher) {
        Intrinsics.g(eventPipeline, "eventPipeline");
        Intrinsics.g(configuration, "configuration");
        Intrinsics.g(scope, "scope");
        Intrinsics.g(storageDispatcher, "storageDispatcher");
        DiagnosticsClientProvider diagnosticsClientProvider = this.diagnosticsClientProvider;
        return new InMemoryResponseHandler(eventPipeline, configuration, scope, storageDispatcher, diagnosticsClientProvider != null ? diagnosticsClientProvider.get() : null);
    }

    @Override // com.amplitude.core.Storage
    @Nullable
    public String read(@NotNull Storage.Constants key) {
        Intrinsics.g(key, "key");
        return this.valuesMap.get(key.getRawVal());
    }

    @Override // com.amplitude.core.Storage, com.amplitude.core.utilities.EventsFileStorage
    @NotNull
    public List<Object> readEventsContent() {
        List listI1;
        synchronized (this.eventsListLock) {
            listI1 = g.I1(this.eventsBuffer);
            this.eventsBuffer.clear();
            Unit unit = Unit.f71706a;
        }
        return ul.b.P(listI1);
    }

    @Override // com.amplitude.core.Storage
    @Nullable
    public Object remove(@NotNull Storage.Constants constants, @NotNull Continuation<? super Unit> continuation) {
        this.valuesMap.remove(constants.getRawVal());
        return Unit.f71706a;
    }

    public final void removeEvents() {
        synchronized (this.eventsListLock) {
            this.eventsBuffer.clear();
            Unit unit = Unit.f71706a;
        }
    }

    @Override // com.amplitude.core.Storage, com.amplitude.core.utilities.EventsFileStorage
    @Nullable
    public Object rollover(@NotNull Continuation<? super Unit> continuation) {
        return Unit.f71706a;
    }

    @Override // com.amplitude.core.Storage
    @Nullable
    public Object write(@NotNull Storage.Constants constants, @NotNull String str, @NotNull Continuation<? super Unit> continuation) {
        this.valuesMap.put(constants.getRawVal(), str);
        return Unit.f71706a;
    }

    @Override // com.amplitude.core.Storage
    @Nullable
    public Object writeEvent(@NotNull BaseEvent baseEvent, @NotNull Continuation<? super Unit> continuation) {
        synchronized (this.eventsListLock) {
            this.eventsBuffer.add(baseEvent);
        }
        return Unit.f71706a;
    }

    public /* synthetic */ InMemoryStorage(DiagnosticsClientProvider diagnosticsClientProvider, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this((i5 & 1) != 0 ? null : diagnosticsClientProvider);
    }

    public InMemoryStorage() {
        this(null);
    }
}
