package com.amplitude.android.utilities;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.SourceDebugExtension;

@Metadata(d1 = {"\u0000\u0010\n\u0000\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0010\u0000\n\u0000\u001a\"\u0010\u0000\u001a\u0010\u0012\u0004\u0012\u00020\u0002\u0012\u0006\u0012\u0004\u0018\u00010\u00030\u0001*\n\u0012\u0002\b\u0003\u0012\u0002\b\u00030\u0001H\u0002¨\u0006\u0004"}, d2 = {"filterIsStringKey", b.f42142b, b.f42142b, b.f42142b, "android_release"}, k = 2, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class ObjectFilterKt {
    /* JADX INFO: Access modifiers changed from: private */
    public static final Map<String, Object> filterIsStringKey(Map<?, ?> map) {
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (Map.Entry<?, ?> entry : map.entrySet()) {
            if (entry.getKey() instanceof String) {
                linkedHashMap.put(entry.getKey(), entry.getValue());
            }
        }
        return linkedHashMap;
    }
}
