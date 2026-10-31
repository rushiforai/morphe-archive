package ads_mobile_sdk;

import android.app.ActivityManager;
import android.content.Context;
import android.os.Build;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.atomic.AtomicReference;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class fi0 {

    /* renamed from: a, reason: collision with root package name */
    public final jr0 f3357a;

    /* renamed from: b, reason: collision with root package name */
    public final AtomicReference f3358b;

    /* renamed from: c, reason: collision with root package name */
    public final AtomicReference f3359c;

    /* renamed from: d, reason: collision with root package name */
    public final ActivityManager f3360d;

    public fi0(Context context, jr0 flags) {
        Intrinsics.g(context, "context");
        Intrinsics.g(flags, "flags");
        this.f3357a = flags;
        this.f3358b = new AtomicReference(ph0.TIER_UNKNOWN);
        this.f3359c = new AtomicReference(rh0.PROCESSOR_TIER_UNKNOWN);
        this.f3360d = (ActivityManager) context.getSystemService(ActivityManager.class);
    }

    public final qh0 a() {
        jr0 jr0Var = this.f3357a;
        jr0Var.getClass();
        Boolean bool = Boolean.TRUE;
        jn jnVar = jn.a$10;
        if (!((Boolean) jr0Var.a("gads:device_tier_manager:enabled", bool, jnVar)).booleanValue() || !((Boolean) jr0Var.a("gads:available_memory_tier:enabled", Boolean.FALSE, jnVar)).booleanValue()) {
            return qh0.AVAILABLE_MEMORY_TIER_UNKNOWN;
        }
        ActivityManager.MemoryInfo memoryInfo = new ActivityManager.MemoryInfo();
        this.f3360d.getMemoryInfo(memoryInfo);
        long j11 = memoryInfo.availMem;
        List defaultValue = ul.b.Q(1, 2, 4, 6, 8, 12, 16);
        Intrinsics.g(defaultValue, "defaultValue");
        return (qh0) a(j11, (List) jr0Var.a("gads:device_tier:available_memory_thresholds_gb", defaultValue, jn.a$16), ul.b.Q(1L, 2L, 4L, 6L, 8L, 12L, 16L), ul.b.Q(qh0.AVAILABLE_MEMORY_TIER_EXTREME_LOW, qh0.AVAILABLE_MEMORY_TIER_VERY_LOW, qh0.AVAILABLE_MEMORY_TIER_LOW, qh0.AVAILABLE_MEMORY_TIER_MID, qh0.AVAILABLE_MEMORY_TIER_MID_PLUS, qh0.AVAILABLE_MEMORY_TIER_HIGH, qh0.AVAILABLE_MEMORY_TIER_VERY_HIGH), qh0.AVAILABLE_MEMORY_TIER_INVALID_DATA_SOURCE, qh0.AVAILABLE_MEMORY_TIER_EXTREME_HIGH, 1073741824L);
    }

    public final void b() {
        long j11;
        jr0 jr0Var = this.f3357a;
        jr0Var.getClass();
        if (((Boolean) jr0Var.a("gads:device_tier_manager:enabled", Boolean.TRUE, jn.a$10)).booleanValue()) {
            AtomicReference atomicReference = this.f3358b;
            Object obj = atomicReference.get();
            ph0 ph0Var = ph0.TIER_UNKNOWN;
            AtomicReference atomicReference2 = this.f3359c;
            if (obj == ph0Var || atomicReference2.get() == rh0.PROCESSOR_TIER_UNKNOWN) {
                int i5 = Build.VERSION.SDK_INT;
                ActivityManager activityManager = this.f3360d;
                if (i5 >= 34) {
                    ActivityManager.MemoryInfo memoryInfo = new ActivityManager.MemoryInfo();
                    activityManager.getMemoryInfo(memoryInfo);
                    j11 = memoryInfo.advertisedMem;
                } else {
                    ActivityManager.MemoryInfo memoryInfo2 = new ActivityManager.MemoryInfo();
                    activityManager.getMemoryInfo(memoryInfo2);
                    j11 = memoryInfo2.totalMem;
                }
                long j12 = j11;
                List defaultValue = ul.b.Q(1, 2, 4, 6, 8, 12, 16);
                Intrinsics.g(defaultValue, "defaultValue");
                atomicReference.set((ph0) a(j12, (List) jr0Var.a("gads:device_tier:advertised_memory_thresholds_gb", defaultValue, jn.a$16), ul.b.Q(1L, 2L, 4L, 6L, 8L, 12L, 16L), ul.b.Q(ph0.TIER_EXTREME_LOW, ph0.TIER_VERY_LOW, ph0.TIER_LOW, ph0.TIER_MID, ph0.TIER_MID_PLUS, ph0.TIER_HIGH, ph0.TIER_VERY_HIGH), ph0.TIER_INVALID_DATA_SOURCE, ph0.TIER_EXTREME_HIGH, 1073741824L));
                atomicReference2.set(a(Runtime.getRuntime().availableProcessors()));
            }
        }
    }

    public final rh0 a(int i5) {
        long j11 = i5;
        jr0 jr0Var = this.f3357a;
        jr0Var.getClass();
        List defaultValue = ul.b.Q(2, 4, 6, 8, 10);
        Intrinsics.g(defaultValue, "defaultValue");
        return (rh0) a(j11, (List) jr0Var.a("gads:device_tier:available_processor_thresholds", defaultValue, jn.a$16), ul.b.Q(2L, 4L, 6L, 8L, 10L), ul.b.Q(rh0.PROCESSOR_TIER_EXTREME_LOW, rh0.PROCESSOR_TIER_LOW, rh0.PROCESSOR_TIER_MID, rh0.PROCESSOR_TIER_MID_PLUS, rh0.PROCESSOR_TIER_HIGH), rh0.PROCESSOR_TIER_INVALID_DATA_SOURCE, rh0.PROCESSOR_TIER_EXTREME_HIGH, 1L);
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r5v0, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r5v1, types: [java.util.List] */
    /* JADX WARN: Type inference failed for: r5v2, types: [java.util.ArrayList] */
    public static Object a(long j11, List list, List list2, List list3, Enum r72, Enum r82, long j12) {
        if (j11 <= 0) {
            return r72;
        }
        if (!list.isEmpty()) {
            list2 = new ArrayList(b70.c.u0(list, 10));
            Iterator it = list.iterator();
            while (it.hasNext()) {
                list2.add(Long.valueOf(((Number) it.next()).intValue()));
            }
        }
        int size = list2.size();
        for (int i5 = 0; i5 < size && i5 < list3.size(); i5++) {
            if (j11 <= ((Number) list2.get(i5)).longValue() * j12) {
                return list3.get(i5);
            }
        }
        return r82;
    }
}
