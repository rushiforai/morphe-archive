package com.amplitude.core.platform.intercept;

import com.amplitude.core.events.BaseEvent;
import com.amplitude.core.events.IdentifyOperation;
import com.amplitude.core.utilities.InMemoryStorage;
import com.google.android.libraries.places.api.model.PlaceTypes;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.coroutines.Continuation;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.TypeIntrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\r\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0002\u0010\u0004J\u000e\u0010\u0005\u001a\u00020\u0006H\u0096@¢\u0006\u0002\u0010\u0007J\u0010\u0010\b\u001a\u0004\u0018\u00010\tH\u0096@¢\u0006\u0002\u0010\u0007R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\n"}, d2 = {"Lcom/amplitude/core/platform/intercept/IdentifyInterceptInMemoryStorageHandler;", "Lcom/amplitude/core/platform/intercept/IdentifyInterceptStorageHandler;", PlaceTypes.STORAGE, "Lcom/amplitude/core/utilities/InMemoryStorage;", "(Lcom/amplitude/core/utilities/InMemoryStorage;)V", "clearIdentifyIntercepts", b.f42142b, "(Lkotlin/coroutines/Continuation;)Ljava/lang/Object;", "getTransferIdentifyEvent", "Lcom/amplitude/core/events/BaseEvent;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
/* loaded from: classes2.dex */
public final class IdentifyInterceptInMemoryStorageHandler implements IdentifyInterceptStorageHandler {

    @NotNull
    private final InMemoryStorage storage;

    public IdentifyInterceptInMemoryStorageHandler(@NotNull InMemoryStorage storage) {
        Intrinsics.g(storage, "storage");
        this.storage = storage;
    }

    @Override // com.amplitude.core.platform.intercept.IdentifyInterceptStorageHandler
    @Nullable
    public Object clearIdentifyIntercepts(@NotNull Continuation<? super Unit> continuation) {
        this.storage.removeEvents();
        return Unit.f71706a;
    }

    @Override // com.amplitude.core.platform.intercept.IdentifyInterceptStorageHandler
    @Nullable
    public Object getTransferIdentifyEvent(@NotNull Continuation<? super BaseEvent> continuation) {
        List<Object> eventsContent = this.storage.readEventsContent();
        Intrinsics.e(eventsContent, "null cannot be cast to non-null type kotlin.collections.List<kotlin.collections.List<com.amplitude.core.events.BaseEvent>>");
        if (eventsContent.isEmpty() || ((List) eventsContent.get(0)).isEmpty()) {
            return null;
        }
        List list = (List) eventsContent.get(0);
        BaseEvent baseEvent = (BaseEvent) list.get(0);
        IdentifyInterceptorUtil identifyInterceptorUtil = IdentifyInterceptorUtil.INSTANCE;
        Map<String, Object> userProperties = baseEvent.getUserProperties();
        Intrinsics.d(userProperties);
        IdentifyOperation identifyOperation = IdentifyOperation.SET;
        Object obj = userProperties.get(identifyOperation.getOperationType());
        Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.collections.MutableMap<kotlin.String, kotlin.Any?>");
        Map<String, Object> mapFilterNonNullValues = identifyInterceptorUtil.filterNonNullValues(TypeIntrinsics.c(obj));
        mapFilterNonNullValues.putAll(identifyInterceptorUtil.mergeIdentifyList(list.subList(1, list.size())));
        Map<String, Object> userProperties2 = baseEvent.getUserProperties();
        Intrinsics.d(userProperties2);
        userProperties2.put(identifyOperation.getOperationType(), mapFilterNonNullValues);
        return baseEvent;
    }
}
