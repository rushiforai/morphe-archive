package com.amplitude.core.platform.intercept;

import com.amplitude.android.migration.DatabaseConstants;
import com.amplitude.core.events.BaseEvent;
import com.amplitude.core.events.IdentifyOperation;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.jvm.internal.TypeIntrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0010%\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\bÆ\u0002\u0018\u00002\u00020\u0001B\u0007\b\u0002¢\u0006\u0002\u0010\u0002J*\u0010\u0003\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00042\u0014\u0010\u0006\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u0004J\"\u0010\u0007\u001a\u0010\u0012\u0004\u0012\u00020\u0005\u0012\u0006\u0012\u0004\u0018\u00010\u00010\u00042\f\u0010\b\u001a\b\u0012\u0004\u0012\u00020\n0\t¨\u0006\u000b"}, d2 = {"Lcom/amplitude/core/platform/intercept/IdentifyInterceptorUtil;", b.f42142b, "()V", "filterNonNullValues", b.f42142b, b.f42142b, "map", "mergeIdentifyList", DatabaseConstants.EVENT_TABLE_NAME, b.f42142b, "Lcom/amplitude/core/events/BaseEvent;", "core"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class IdentifyInterceptorUtil {

    @NotNull
    public static final IdentifyInterceptorUtil INSTANCE = new IdentifyInterceptorUtil();

    private IdentifyInterceptorUtil() {
    }

    @NotNull
    public final Map<String, Object> filterNonNullValues(@NotNull Map<String, Object> map) {
        Intrinsics.g(map, "map");
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry<String, Object> entry : map.entrySet()) {
            if (entry.getValue() != null) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        return MapsKt.u0(linkedHashMap);
    }

    @NotNull
    public final Map<String, Object> mergeIdentifyList(@NotNull List<? extends BaseEvent> events) {
        Intrinsics.g(events, "events");
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (BaseEvent baseEvent : events) {
            IdentifyInterceptorUtil identifyInterceptorUtil = INSTANCE;
            Map<String, Object> userProperties = baseEvent.getUserProperties();
            Intrinsics.d(userProperties);
            Object obj = userProperties.get(IdentifyOperation.SET.getOperationType());
            Intrinsics.e(obj, "null cannot be cast to non-null type kotlin.collections.MutableMap<kotlin.String, kotlin.Any?>");
            linkedHashMap.putAll(identifyInterceptorUtil.filterNonNullValues(TypeIntrinsics.c(obj)));
        }
        return linkedHashMap;
    }
}
