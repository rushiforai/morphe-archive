package com.instabridge.ai.context.collectors;

import ab.e0;
import android.app.usage.UsageStats;
import android.app.usage.UsageStatsManager;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.util.Log;
import b70.g;
import com.instabridge.ai.context.AppUsageProvider;
import com.instabridge.ai.context.summarizers.AppUsageEntry;
import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import fo.d;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashMap;
import java.util.List;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import tx.q3;

@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0007\u0018\u0000 \u00142\u00020\u0001:\u0001\u0014B\u0007¢\u0006\u0004\b\u0002\u0010\u0003J\u0014\u0010\u0004\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\u0006\u0010\u0007\u001a\u00020\bJ*\u0010\t\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\f\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u000b0\u00052\f\u0010\f\u001a\b\u0012\u0004\u0012\u00020\u000b0\u0005H\u0002J\u0016\u0010\r\u001a\b\u0012\u0004\u0012\u00020\u00060\u00052\u0006\u0010\u0007\u001a\u00020\bH\u0002J\u0018\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u0013H\u0002¨\u0006\u0015"}, d2 = {"Lcom/instabridge/ai/context/collectors/AppUsageCollector;", b.f42142b, "<init>", "()V", "collect", b.f42142b, "Lcom/instabridge/ai/context/summarizers/AppUsageEntry;", "context", "Landroid/content/Context;", "mergeFrequentAndRecent", "frequent", "Lcom/instabridge/ai/context/AppUsageProvider$AppUsageEntry;", "recent", "queryUsage", "isSystemApp", b.f42142b, "pm", "Landroid/content/pm/PackageManager;", "packageName", b.f42142b, k.O, "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class AppUsageCollector {
    public static final int $stable = 0;
    private static final int MAX_FREQUENT = 25;
    private static final int MAX_RECENT = 15;
    private static final long MIN_FOREGROUND_MS = 60000;
    private static final long QUERY_WINDOW_MS = 14400000;

    private final boolean isSystemApp(PackageManager pm2, String packageName) throws PackageManager.NameNotFoundException {
        try {
            ApplicationInfo applicationInfo = pm2.getApplicationInfo(packageName, 0);
            Intrinsics.f(applicationInfo, "getApplicationInfo(...)");
            return (applicationInfo.flags & 1) != 0;
        } catch (Exception unused) {
            return true;
        }
    }

    private final List<AppUsageEntry> mergeFrequentAndRecent(List<AppUsageProvider.AppUsageEntry> frequent, List<AppUsageProvider.AppUsageEntry> recent) {
        final long jCurrentTimeMillis = System.currentTimeMillis();
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (AppUsageProvider.AppUsageEntry appUsageEntry : frequent) {
            linkedHashMap.put(appUsageEntry.getPackageName(), new AppUsageEntry(appUsageEntry.getAppLabel(), appUsageEntry.getPackageName(), appUsageEntry.getLaunchCount(), 0, appUsageEntry.getLastUsedMs(), 0, 40, null));
        }
        int i5 = 0;
        for (AppUsageProvider.AppUsageEntry appUsageEntry2 : recent) {
            int i11 = i5 + 1;
            AppUsageEntry appUsageEntry3 = (AppUsageEntry) linkedHashMap.get(appUsageEntry2.getPackageName());
            if (appUsageEntry3 == null) {
                linkedHashMap.put(appUsageEntry2.getPackageName(), new AppUsageEntry(appUsageEntry2.getAppLabel(), appUsageEntry2.getPackageName(), 0, 0, appUsageEntry2.getLastUsedMs(), i11, 8, null));
            } else if (appUsageEntry2.getLastUsedMs() > appUsageEntry3.getLastUsedMs()) {
                linkedHashMap.put(appUsageEntry2.getPackageName(), AppUsageEntry.copy$default(appUsageEntry3, null, null, 0, 0, appUsageEntry2.getLastUsedMs(), i11, 15, null));
            } else {
                linkedHashMap.put(appUsageEntry2.getPackageName(), AppUsageEntry.copy$default(appUsageEntry3, null, null, 0, 0, 0L, i11, 31, null));
            }
            i5 = i11;
        }
        return g.I1(g.D1(new Comparator() { // from class: com.instabridge.ai.context.collectors.AppUsageCollector$mergeFrequentAndRecent$$inlined$sortedByDescending$1
            /* JADX WARN: Multi-variable type inference failed */
            @Override // java.util.Comparator
            public final int compare(T t6, T t9) {
                return e0.t(Double.valueOf(((AppUsageEntry) t9).combinedScore(jCurrentTimeMillis)), Double.valueOf(((AppUsageEntry) t6).combinedScore(jCurrentTimeMillis)));
            }
        }, linkedHashMap.values()));
    }

    private final List<AppUsageEntry> queryUsage(Context context) {
        AppUsageEntry appUsageEntry;
        Object systemService = context.getSystemService("usagestats");
        UsageStatsManager usageStatsManager = systemService instanceof UsageStatsManager ? (UsageStatsManager) systemService : null;
        if (usageStatsManager == null) {
            return EmptyList.f71733a;
        }
        long jCurrentTimeMillis = System.currentTimeMillis();
        List<UsageStats> listQueryUsageStats = usageStatsManager.queryUsageStats(4, jCurrentTimeMillis - QUERY_WINDOW_MS, jCurrentTimeMillis);
        if (listQueryUsageStats == null) {
            return EmptyList.f71733a;
        }
        PackageManager packageManager = context.getPackageManager();
        ArrayList arrayList = new ArrayList();
        for (Object obj : listQueryUsageStats) {
            if (((UsageStats) obj).getTotalTimeInForeground() > MIN_FOREGROUND_MS) {
                arrayList.add(obj);
            }
        }
        ArrayList<UsageStats> arrayList2 = new ArrayList();
        for (Object obj2 : arrayList) {
            Intrinsics.d(packageManager);
            String packageName = ((UsageStats) obj2).getPackageName();
            Intrinsics.f(packageName, "getPackageName(...)");
            if (!isSystemApp(packageManager, packageName)) {
                arrayList2.add(obj2);
            }
        }
        ArrayList arrayList3 = new ArrayList();
        for (UsageStats usageStats : arrayList2) {
            try {
                String string = packageManager.getApplicationLabel(packageManager.getApplicationInfo(usageStats.getPackageName(), 0)).toString();
                String packageName2 = usageStats.getPackageName();
                Intrinsics.f(packageName2, "getPackageName(...)");
                appUsageEntry = new AppUsageEntry(string, packageName2, 0, (int) (usageStats.getTotalTimeInForeground() / 60000), usageStats.getLastTimeUsed(), 0, 32, null);
            } catch (Exception unused) {
                appUsageEntry = null;
            }
            if (appUsageEntry != null) {
                arrayList3.add(appUsageEntry);
            }
        }
        return g.D1(new Comparator() { // from class: com.instabridge.ai.context.collectors.AppUsageCollector$queryUsage$$inlined$sortedByDescending$1
            /* JADX WARN: Multi-variable type inference failed */
            @Override // java.util.Comparator
            public final int compare(T t6, T t9) {
                return e0.t(Integer.valueOf(((AppUsageEntry) t9).getForegroundMinutes()), Integer.valueOf(((AppUsageEntry) t6).getForegroundMinutes()));
            }
        }, arrayList3);
    }

    @NotNull
    public final List<AppUsageEntry> collect(@NotNull Context context) {
        Intrinsics.g(context, "context");
        String str = d.j() ? d.c().f55441f : "INSTA_AI";
        q3 q3Var = d.f55476p;
        String packageName = context.getPackageName();
        if (q3Var != null) {
            try {
                List frequentApps = q3Var.getFrequentApps(25);
                List recentApps = q3Var.getRecentApps(15);
                if (d.j()) {
                    d.c();
                }
                if (!frequentApps.isEmpty() || !recentApps.isEmpty()) {
                    ArrayList arrayList = new ArrayList();
                    for (Object obj : frequentApps) {
                        if (!Intrinsics.b(((AppUsageProvider.AppUsageEntry) obj).getPackageName(), packageName)) {
                            arrayList.add(obj);
                        }
                    }
                    ArrayList arrayList2 = new ArrayList();
                    for (Object obj2 : recentApps) {
                        if (!Intrinsics.b(((AppUsageProvider.AppUsageEntry) obj2).getPackageName(), packageName)) {
                            arrayList2.add(obj2);
                        }
                    }
                    return mergeFrequentAndRecent(arrayList, arrayList2);
                }
            } catch (Exception e3) {
                Log.e(str, "AppUsageCollector: provider threw exception", e3);
            }
        } else if (d.j()) {
            d.c();
        }
        try {
            List<AppUsageEntry> listQueryUsage = queryUsage(context);
            if (!d.j()) {
                return listQueryUsage;
            }
            d.c();
            return listQueryUsage;
        } catch (SecurityException e11) {
            Log.w(str, "AppUsageCollector: UsageStatsManager permission denied", e11);
            return EmptyList.f71733a;
        } catch (Exception e12) {
            Log.w(str, "AppUsageCollector: UsageStatsManager failed", e12);
            return EmptyList.f71733a;
        }
    }
}
