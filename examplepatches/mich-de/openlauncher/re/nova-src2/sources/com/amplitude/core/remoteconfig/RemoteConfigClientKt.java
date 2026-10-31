package com.amplitude.core.remoteconfig;

import com.amplitude.android.migration.DatabaseConstants;
import com.instabridge.mobilesdk.internal.esim.CarrierConfigurator;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import r70.i;

@Metadata(d1 = {"\u00000\n\u0000\n\u0002\u0010\u000b\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\b\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\b\u0002\u001a,\u0010\u0000\u001a\u00020\u0001*\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00040\u0002j\u0002`\u00052\u0006\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u0001\u001a,\u0010\b\u001a\u00020\t*\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00040\u0002j\u0002`\u00052\u0006\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\t\u001a,\u0010\n\u001a\u00020\u000b*\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00040\u0002j\u0002`\u00052\u0006\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u000b\u001a,\u0010\f\u001a\u00020\u0003*\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00040\u0002j\u0002`\u00052\u0006\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u0003\u001a8\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00030\u000e*\u0012\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00040\u0002j\u0002`\u00052\u0006\u0010\u0006\u001a\u00020\u00032\u000e\b\u0002\u0010\u0007\u001a\b\u0012\u0004\u0012\u00020\u00030\u000e*\"\u0010\u000f\"\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00040\u00022\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00040\u0002¨\u0006\u0010"}, d2 = {"getBoolean", b.f42142b, b.f42142b, b.f42142b, b.f42142b, "Lcom/amplitude/core/remoteconfig/ConfigMap;", DatabaseConstants.KEY_FIELD, CarrierConfigurator.APN_TYPE, "getDouble", b.f42142b, "getInt", b.f42142b, "getString", "getStringList", b.f42142b, "ConfigMap", "core"}, k = 2, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes2.dex */
public final class RemoteConfigClientKt {
    public static final boolean getBoolean(@NotNull Map<String, ? extends Object> map, @NotNull String key, boolean z11) {
        Intrinsics.g(map, "<this>");
        Intrinsics.g(key, "key");
        Object obj = map.get(key);
        Boolean bool = obj instanceof Boolean ? (Boolean) obj : null;
        return bool != null ? bool.booleanValue() : z11;
    }

    public static /* synthetic */ boolean getBoolean$default(Map map, String str, boolean z11, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            z11 = false;
        }
        return getBoolean(map, str, z11);
    }

    public static final double getDouble(@NotNull Map<String, ? extends Object> map, @NotNull String key, double d5) {
        Double dR0;
        Intrinsics.g(map, "<this>");
        Intrinsics.g(key, "key");
        Object obj = map.get(key);
        if (!(obj instanceof Double) && !(obj instanceof Number)) {
            return (!(obj instanceof String) || (dR0 = i.r0((String) obj)) == null) ? d5 : dR0.doubleValue();
        }
        return ((Number) obj).doubleValue();
    }

    public static /* synthetic */ double getDouble$default(Map map, String str, double d5, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            d5 = 0.0d;
        }
        return getDouble(map, str, d5);
    }

    public static final int getInt(@NotNull Map<String, ? extends Object> map, @NotNull String key, int i5) {
        Integer numU0;
        Intrinsics.g(map, "<this>");
        Intrinsics.g(key, "key");
        Object obj = map.get(key);
        if (!(obj instanceof Integer) && !(obj instanceof Number)) {
            return (!(obj instanceof String) || (numU0 = i.u0((String) obj)) == null) ? i5 : numU0.intValue();
        }
        return ((Number) obj).intValue();
    }

    public static /* synthetic */ int getInt$default(Map map, String str, int i5, int i11, Object obj) {
        if ((i11 & 2) != 0) {
            i5 = 0;
        }
        return getInt(map, str, i5);
    }

    @NotNull
    public static final String getString(@NotNull Map<String, ? extends Object> map, @NotNull String key, @NotNull String str) {
        Intrinsics.g(map, "<this>");
        Intrinsics.g(key, "key");
        Intrinsics.g(str, "default");
        Object obj = map.get(key);
        String str2 = obj instanceof String ? (String) obj : null;
        return str2 == null ? str : str2;
    }

    public static /* synthetic */ String getString$default(Map map, String str, String str2, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            str2 = b.f42142b;
        }
        return getString(map, str, str2);
    }

    @NotNull
    public static final List<String> getStringList(@NotNull Map<String, ? extends Object> map, @NotNull String key, @NotNull List<String> list) {
        Intrinsics.g(map, "<this>");
        Intrinsics.g(key, "key");
        Intrinsics.g(list, "default");
        Object obj = map.get(key);
        List list2 = obj instanceof List ? (List) obj : null;
        if (list2 == null) {
            return list;
        }
        ArrayList arrayList = new ArrayList();
        for (Object obj2 : list2) {
            String str = obj2 instanceof String ? (String) obj2 : null;
            if (str != null) {
                arrayList.add(str);
            }
        }
        return arrayList;
    }

    public static List getStringList$default(Map map, String str, List list, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            list = EmptyList.f71733a;
        }
        return getStringList(map, str, list);
    }
}
