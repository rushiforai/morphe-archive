package com.instabridge.ai.tools.bii;

import android.content.Context;
import b70.g;
import b70.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import com.tiktok.util.TTConst;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.collections.builders.MapBuilder;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0010$\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0010 \n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J$\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\t2\u0006\u0010\u000e\u001a\u00020\t2\f\u0010\u000f\u001a\b\u0012\u0004\u0012\u00020\t0\nJ\u0006\u0010\u0010\u001a\u00020\fJ\"\u0010\u0011\u001a\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\u00010\u00072\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u0015J&\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\t0\n2\u0006\u0010\u0012\u001a\u00020\u00132\u0006\u0010\r\u001a\u00020\t2\u0006\u0010\u000e\u001a\u00020\tH\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R.\u0010\u0006\u001a\"\u0012\u0010\u0012\u000e\u0012\u0004\u0012\u00020\t\u0012\u0004\u0012\u00020\t0\b\u0012\n\u0012\b\u0012\u0004\u0012\u00020\t0\n\u0018\u00010\u0007X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u0017"}, d2 = {"Lcom/instabridge/ai/tools/bii/BIICapabilityEnrichment;", b.f42142b, "<init>", "()V", "MAX_ENUM_VALUES", b.f42142b, "testValues", b.f42142b, "Lkotlin/Pair;", b.f42142b, b.f42142b, "testOverrideValues", b.f42142b, "bii", "param", "values", "clearOverride", "enrichSchema", "context", "Landroid/content/Context;", "entry", "Lcom/instabridge/ai/tools/bii/BIIEntry;", "lookupValues", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class BIICapabilityEnrichment {
    private static final int MAX_ENUM_VALUES = 20;

    @Nullable
    private static volatile Map<Pair<String, String>, ? extends List<String>> testValues;

    @NotNull
    public static final BIICapabilityEnrichment INSTANCE = new BIICapabilityEnrichment();
    public static final int $stable = 8;

    private BIICapabilityEnrichment() {
    }

    private final List<String> lookupValues(Context context, String bii, String param) {
        List<String> list;
        Map<Pair<String, String>, ? extends List<String>> map = testValues;
        return (map == null || (list = map.get(new Pair(bii, param))) == null) ? g.I1(BIICapabilityDiscovery.INSTANCE.paramValuesFor(context, bii, param)) : list;
    }

    public final void clearOverride() {
        testValues = null;
    }

    @NotNull
    public final Map<String, Object> enrichSchema(@NotNull Context context, @NotNull BIIEntry entry) {
        Intrinsics.g(context, "context");
        Intrinsics.g(entry, "entry");
        Map<String, Object> mapParametersJsonSchema = entry.parametersJsonSchema();
        Object obj = mapParametersJsonSchema.get("properties");
        Map map = obj instanceof Map ? (Map) obj : null;
        if (map != null) {
            LinkedHashMap linkedHashMapU0 = MapsKt.u0(map);
            boolean z11 = false;
            for (BIIParameter bIIParameter : entry.getParameters()) {
                List<String> listLookupValues = lookupValues(context, entry.getBiiName(), bIIParameter.getName());
                if (!listLookupValues.isEmpty() && listLookupValues.size() <= 20) {
                    Object obj2 = linkedHashMapU0.get(bIIParameter.getName());
                    Map map2 = obj2 instanceof Map ? (Map) obj2 : null;
                    if (map2 != null) {
                        StringBuilder sb2 = new StringBuilder();
                        Object obj3 = map2.get(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION);
                        if (obj3 == null) {
                            obj3 = b.f42142b;
                        }
                        sb2.append(obj3);
                        sb2.append(" Known values on this device: " + g.f1(listLookupValues, ", ", null, null, 0, null, 62) + '.');
                        linkedHashMapU0.put(bIIParameter.getName(), MapsKt.m0(map2, k.e0(new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_DESCRIPTION, sb2.toString()))));
                        z11 = true;
                    }
                }
            }
            if (z11) {
                MapBuilder mapBuilder = new MapBuilder();
                mapBuilder.put(TTConst.TRACK_TYPE, "object");
                mapBuilder.put("properties", linkedHashMapU0);
                Object obj4 = mapParametersJsonSchema.get("required");
                List list = obj4 instanceof List ? (List) obj4 : null;
                if (list != null) {
                    List list2 = list.isEmpty() ? null : list;
                    if (list2 != null) {
                        mapBuilder.put("required", list2);
                    }
                }
                return mapBuilder.b();
            }
        }
        return mapParametersJsonSchema;
    }

    public final void testOverrideValues(@NotNull String bii, @NotNull String param, @NotNull List<String> values) {
        Intrinsics.g(bii, "bii");
        Intrinsics.g(param, "param");
        Intrinsics.g(values, "values");
        Map<Pair<String, String>, ? extends List<String>> map = testValues;
        LinkedHashMap linkedHashMapU0 = map != null ? MapsKt.u0(map) : new LinkedHashMap();
        linkedHashMapU0.put(new Pair(bii, param), values);
        testValues = linkedHashMapU0;
    }
}
