package b;

import java.util.LinkedHashMap;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;

/* loaded from: classes2.dex */
public final class wb {
    public static void a(LinkedHashMap adapterStatusMap, String adapterName, ti.c cVar, ads_mobile_sdk.va vaVar, long j11) {
        Intrinsics.g(adapterStatusMap, "adapterStatusMap");
        Intrinsics.g(adapterName, "adapterName");
        Duration.Companion companion = Duration.f72038b;
        adapterStatusMap.put(adapterName, new ads_mobile_sdk.ma(vaVar, cVar, DurationKt.h(j11, DurationUnit.f72045d)));
    }
}
