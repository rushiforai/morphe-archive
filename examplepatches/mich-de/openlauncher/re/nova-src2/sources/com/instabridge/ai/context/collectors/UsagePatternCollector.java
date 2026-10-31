package com.instabridge.ai.context.collectors;

import a00.a;
import ab.e0;
import android.app.usage.UsageStats;
import android.app.usage.UsageStatsManager;
import android.content.Context;
import android.content.pm.PackageManager;
import b70.c;
import b70.g;
import com.instabridge.ai.context.AppUsageProvider;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import fo.d;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import tx.q3;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u00072\u0006\u0010\b\u001a\u00020\tJ$\u0010\n\u001a\u00020\u00072\f\u0010\u000b\u001a\b\u0012\u0004\u0012\u00020\r0\f2\f\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\r0\fH\u0002J\u0012\u0010\u000f\u001a\u0004\u0018\u00010\u00072\u0006\u0010\b\u001a\u00020\tH\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000¨\u0006\u0010"}, d2 = {"Lcom/instabridge/ai/context/collectors/UsagePatternCollector;", b.f42142b, "<init>", "()V", "WEEK_MS", b.f42142b, "collect", b.f42142b, "context", "Landroid/content/Context;", "buildHostProviderSnippet", "frequent", b.f42142b, "Lcom/instabridge/ai/context/AppUsageProvider$AppUsageEntry;", "recent", "collectFromUsageStats", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class UsagePatternCollector {
    public static final int $stable = 0;

    @NotNull
    public static final UsagePatternCollector INSTANCE = new UsagePatternCollector();
    private static final long WEEK_MS = 604800000;

    private UsagePatternCollector() {
    }

    private final String buildHostProviderSnippet(List<AppUsageProvider.AppUsageEntry> frequent, List<AppUsageProvider.AppUsageEntry> recent) throws IOException {
        ArrayList arrayList = new ArrayList();
        arrayList.add("Most used apps: " + g.f1(g.E1(frequent, 7), ", ", null, null, 0, new a(21), 30));
        if (!recent.isEmpty()) {
            arrayList.add("Recently opened: " + g.f1(g.E1(recent, 5), ", ", null, null, 0, new a(22), 30));
        }
        return g.f1(arrayList, ". ", null, null, 0, null, 62);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final CharSequence buildHostProviderSnippet$lambda$3(AppUsageProvider.AppUsageEntry entry) {
        Intrinsics.g(entry, "entry");
        if (entry.getLaunchCount() <= 0) {
            return entry.getAppLabel();
        }
        return entry.getAppLabel() + " (" + entry.getLaunchCount() + " launches/week)";
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static final CharSequence buildHostProviderSnippet$lambda$4(AppUsageProvider.AppUsageEntry it) {
        Intrinsics.g(it, "it");
        return it.getAppLabel();
    }

    private final String collectFromUsageStats(Context context) {
        try {
            Object systemService = context.getSystemService("usagestats");
            UsageStatsManager usageStatsManager = systemService instanceof UsageStatsManager ? (UsageStatsManager) systemService : null;
            if (usageStatsManager == null) {
                return null;
            }
            long jCurrentTimeMillis = System.currentTimeMillis();
            List<UsageStats> listQueryUsageStats = usageStatsManager.queryUsageStats(0, jCurrentTimeMillis - 604800000, jCurrentTimeMillis);
            List<UsageStats> list = listQueryUsageStats;
            if (list != null && !list.isEmpty()) {
                PackageManager packageManager = context.getPackageManager();
                LinkedHashMap linkedHashMap = new LinkedHashMap();
                Iterator<UsageStats> it = listQueryUsageStats.iterator();
                while (true) {
                    if (!it.hasNext()) {
                        break;
                    }
                    UsageStats next = it.next();
                    if (next.getTotalTimeInForeground() >= 60000) {
                        try {
                            String string = packageManager.getApplicationLabel(packageManager.getApplicationInfo(next.getPackageName(), 0)).toString();
                            Long l9 = (Long) linkedHashMap.get(string);
                            linkedHashMap.put(string, Long.valueOf((l9 != null ? l9.longValue() : 0L) + next.getTotalTimeInForeground()));
                        } catch (PackageManager.NameNotFoundException unused) {
                        }
                    }
                }
                if (linkedHashMap.isEmpty()) {
                    return null;
                }
                List<Map.Entry> listE1 = g.E1(g.D1(new Comparator() { // from class: com.instabridge.ai.context.collectors.UsagePatternCollector$collectFromUsageStats$$inlined$sortedByDescending$1
                    @Override // java.util.Comparator
                    public final int compare(T t6, T t9) {
                        return e0.t((Long) ((Map.Entry) t9).getValue(), (Long) ((Map.Entry) t6).getValue());
                    }
                }, linkedHashMap.entrySet()), 5);
                ArrayList arrayList = new ArrayList(c.u0(listE1, 10));
                for (Map.Entry entry : listE1) {
                    String str = (String) entry.getKey();
                    long jLongValue = ((Number) entry.getValue()).longValue();
                    TimeUnit timeUnit = TimeUnit.MILLISECONDS;
                    long hours = timeUnit.toHours(jLongValue);
                    long minutes = timeUnit.toMinutes(jLongValue) % 60;
                    arrayList.add(hours > 0 ? str + " (" + hours + "h " + minutes + "m/week)" : str + " (" + minutes + "m/week)");
                }
                return "Weekly app usage: " + g.f1(arrayList, ", ", null, null, 0, null, 62);
            }
            return null;
        } catch (SecurityException | Exception unused2) {
            return null;
        }
    }

    @Nullable
    public final String collect(@NotNull Context context) {
        Intrinsics.g(context, "context");
        q3 q3Var = d.f55476p;
        if (q3Var != null) {
            String packageName = context.getPackageName();
            List frequentApps = q3Var.getFrequentApps(10);
            ArrayList arrayList = new ArrayList();
            for (Object obj : frequentApps) {
                if (!Intrinsics.b(((AppUsageProvider.AppUsageEntry) obj).getPackageName(), packageName)) {
                    arrayList.add(obj);
                }
            }
            if (!arrayList.isEmpty()) {
                List recentApps = q3Var.getRecentApps(5);
                ArrayList arrayList2 = new ArrayList();
                for (Object obj2 : recentApps) {
                    if (!Intrinsics.b(((AppUsageProvider.AppUsageEntry) obj2).getPackageName(), packageName)) {
                        arrayList2.add(obj2);
                    }
                }
                return INSTANCE.buildHostProviderSnippet(arrayList, arrayList2);
            }
        }
        return collectFromUsageStats(context);
    }
}
