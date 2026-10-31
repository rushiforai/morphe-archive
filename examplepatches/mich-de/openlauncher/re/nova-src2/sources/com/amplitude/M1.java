package com.amplitude;

import android.app.ActivityManager;
import android.content.Context;
import java.io.File;
import java.util.ArrayList;
import kotlin.io.FilesKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Charsets;
import kotlin.text.Regex;

/* loaded from: classes2.dex */
public abstract class M1 {

    /* renamed from: a, reason: collision with root package name */
    public static final Regex f20324a = new Regex("cpu[0-9]+");

    /* renamed from: b, reason: collision with root package name */
    public static final L1 f20325b = new L1(4294967296L, 6, 2000);

    /* renamed from: c, reason: collision with root package name */
    public static final L1 f20326c = new L1(6442450944L, 8, 2500);

    public static boolean a(I0 i02, L1 l12) {
        if (i02.f20267a < l12.f20314a || i02.f20268b < l12.f20315b) {
            return true;
        }
        Integer num = i02.f20269c;
        return num != null && num.intValue() < l12.f20316c.intValue();
    }

    public static I0 a(Context context) {
        Long lV0;
        Object systemService = context.getSystemService("activity");
        Integer numValueOf = null;
        ActivityManager activityManager = systemService instanceof ActivityManager ? (ActivityManager) systemService : null;
        if (activityManager != null) {
            ActivityManager.MemoryInfo memoryInfo = new ActivityManager.MemoryInfo();
            activityManager.getMemoryInfo(memoryInfo);
            long j11 = memoryInfo.totalMem;
            int iAvailableProcessors = Runtime.getRuntime().availableProcessors();
            try {
                File[] fileArrListFiles = new File("/sys/devices/system/cpu").listFiles();
                if (fileArrListFiles != null) {
                    ArrayList arrayList = new ArrayList();
                    int i5 = 0;
                    for (File file : fileArrListFiles) {
                        String name = file.getName();
                        Intrinsics.f(name, "getName(...)");
                        if (f20324a.f(name)) {
                            arrayList.add(file);
                        }
                    }
                    ArrayList arrayList2 = new ArrayList();
                    int size = arrayList.size();
                    while (i5 < size) {
                        Object obj = arrayList.get(i5);
                        i5++;
                        try {
                            lV0 = r70.i.v0(r70.k.u1(FilesKt.t0(new File((File) obj, "cpufreq/cpuinfo_max_freq"), Charsets.f72000b)).toString());
                        } catch (Exception unused) {
                            lV0 = null;
                        }
                        if (lV0 != null) {
                            arrayList2.add(lV0);
                        }
                    }
                    Long l9 = (Long) b70.g.j1(arrayList2);
                    if (l9 != null) {
                        numValueOf = Integer.valueOf((int) (l9.longValue() / 1000));
                    }
                }
            } catch (Exception unused2) {
            }
            return new I0(j11, iAvailableProcessors, numValueOf, Integer.valueOf(activityManager.getMemoryClass()));
        }
        throw new IllegalArgumentException("ActivityManager unavailable");
    }
}
