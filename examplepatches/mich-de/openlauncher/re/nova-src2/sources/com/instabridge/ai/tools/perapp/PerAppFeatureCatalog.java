package com.instabridge.ai.tools.perapp;

import ab.e0;
import android.content.Context;
import android.content.pm.ApplicationInfo;
import android.content.pm.LauncherApps;
import android.content.pm.PackageManager;
import android.content.pm.ShortcutInfo;
import android.os.Process;
import android.util.Log;
import b.c0;
import b.c9;
import b70.c;
import b70.g;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.ai.proactive.AiDatabase;
import com.instabridge.ai.tools.perapp.PerAppFeatureCatalog;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.text.Regex;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import r70.k;
import r70.l;

@Metadata(d1 = {"\u0000Z\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010%\n\u0000\n\u0002\u0010$\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u0006\n\u0000\n\u0002\u0018\u0002\n\u0002\b\b\bÇ\u0002\u0018\u00002\u00020\u0001:\u0001&B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u0014\u0010\u0012\u001a\u00020\u00132\f\u0010\u0014\u001a\b\u0012\u0004\u0012\u00020\f0\u000bJ\u001e\u0010\u0015\u001a\b\u0012\u0004\u0012\u00020\f0\u000b2\u0006\u0010\u0016\u001a\u00020\u00172\b\b\u0002\u0010\u0018\u001a\u00020\u0019J\u0006\u0010\u001a\u001a\u00020\u0013J\u0016\u0010\u001b\u001a\b\u0012\u0004\u0012\u00020\f0\u000b2\u0006\u0010\u0016\u001a\u00020\u0017H\u0003J\u0010\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001e\u001a\u00020\u001fH\u0003J\u001a\u0010 \u001a\u0004\u0018\u00010\u00052\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010!\u001a\u00020\u0005H\u0002J\u0016\u0010\"\u001a\u00020\u00052\u0006\u0010 \u001a\u00020\u00052\u0006\u0010#\u001a\u00020\u0005J\u000e\u0010$\u001a\u00020\u00052\u0006\u0010%\u001a\u00020\u0005R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\tX\u0086T¢\u0006\u0002\n\u0000R\u0016\u0010\n\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u000bX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000RN\u0010\u000e\u001aB\u0012\f\u0012\n \u0010*\u0004\u0018\u00010\u00050\u0005\u0012\f\u0012\n \u0010*\u0004\u0018\u00010\u00050\u0005 \u0010* \u0012\f\u0012\n \u0010*\u0004\u0018\u00010\u00050\u0005\u0012\f\u0012\n \u0010*\u0004\u0018\u00010\u00050\u0005\u0018\u00010\u00110\u000fX\u0082\u0004¢\u0006\u0002\n\u0000R\u0016\u0010\u0012\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u000bX\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006'"}, d2 = {"Lcom/instabridge/ai/tools/perapp/PerAppFeatureCatalog;", b.f42142b, "<init>", "()V", "TAG", b.f42142b, "CACHE_TTL_MS", b.f42142b, "MAX_TOOLS", b.f42142b, "cached", b.f42142b, "Lcom/instabridge/ai/tools/perapp/PerAppFeatureCatalog$Feature;", "cachedAtMs", "appLabelCache", b.f42142b, "kotlin.jvm.PlatformType", b.f42142b, "testSeed", b.f42142b, "features", "discover", "context", "Landroid/content/Context;", "forceRefresh", b.f42142b, "invalidate", "probe", "scoreOf", b.f42142b, "s", "Landroid/content/pm/ShortcutInfo;", "appLabel", "pkg", "buildToolName", "featureLabel", "slug", "text", "Feature", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class PerAppFeatureCatalog {
    private static final long CACHE_TTL_MS = 86400000;
    public static final int MAX_TOOLS = 150;

    @NotNull
    private static final String TAG = "PerAppFeatureCatalog";

    @Nullable
    private static volatile List<Feature> cached;
    private static volatile long cachedAtMs;

    @Nullable
    private static volatile List<Feature> testSeed;

    @NotNull
    public static final PerAppFeatureCatalog INSTANCE = new PerAppFeatureCatalog();
    private static final Map<String, String> appLabelCache = Collections.synchronizedMap(new LinkedHashMap());
    public static final int $stable = 8;

    @Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0006\n\u0002\b\u0019\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001BG\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0003\u0012\u0006\u0010\u0007\u001a\u00020\u0003\u0012\u0006\u0010\b\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\u0006\u0010\f\u001a\u00020\r¢\u0006\u0004\b\u000e\u0010\u000fJ\t\u0010\u001b\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001c\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001d\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001e\u001a\u00020\u0003HÆ\u0003J\t\u0010\u001f\u001a\u00020\u0003HÆ\u0003J\t\u0010 \u001a\u00020\tHÆ\u0003J\t\u0010!\u001a\u00020\u000bHÆ\u0003J\t\u0010\"\u001a\u00020\rHÆ\u0003JY\u0010#\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00032\b\b\u0002\u0010\u0007\u001a\u00020\u00032\b\b\u0002\u0010\b\u001a\u00020\t2\b\b\u0002\u0010\n\u001a\u00020\u000b2\b\b\u0002\u0010\f\u001a\u00020\rHÆ\u0001J\u0013\u0010$\u001a\u00020\t2\b\u0010%\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010&\u001a\u00020'HÖ\u0001J\t\u0010(\u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u0011R\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0012\u0010\u0011R\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0011R\u0011\u0010\u0006\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0014\u0010\u0011R\u0011\u0010\u0007\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0015\u0010\u0011R\u0011\u0010\b\u001a\u00020\t¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\u0016R\u0011\u0010\n\u001a\u00020\u000b¢\u0006\b\n\u0000\u001a\u0004\b\u0017\u0010\u0018R\u0011\u0010\f\u001a\u00020\r¢\u0006\b\n\u0000\u001a\u0004\b\u0019\u0010\u001a¨\u0006)"}, d2 = {"Lcom/instabridge/ai/tools/perapp/PerAppFeatureCatalog$Feature;", b.f42142b, "toolName", b.f42142b, "appLabel", "featureLabel", "packageName", "shortcutId", "isManifest", b.f42142b, "lastChangedMs", b.f42142b, AiDatabase.COL_INSIGHT_SCORE, b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZJD)V", "getToolName", "()Ljava/lang/String;", "getAppLabel", "getFeatureLabel", "getPackageName", "getShortcutId", "()Z", "getLastChangedMs", "()J", "getScore", "()D", "component1", "component2", "component3", "component4", "component5", "component6", "component7", "component8", "copy", "equals", InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class Feature {
        public static final int $stable = 0;

        @NotNull
        private final String appLabel;

        @NotNull
        private final String featureLabel;
        private final boolean isManifest;
        private final long lastChangedMs;

        @NotNull
        private final String packageName;
        private final double score;

        @NotNull
        private final String shortcutId;

        @NotNull
        private final String toolName;

        public Feature(@NotNull String toolName, @NotNull String appLabel, @NotNull String featureLabel, @NotNull String packageName, @NotNull String shortcutId, boolean z11, long j11, double d5) {
            Intrinsics.g(toolName, "toolName");
            Intrinsics.g(appLabel, "appLabel");
            Intrinsics.g(featureLabel, "featureLabel");
            Intrinsics.g(packageName, "packageName");
            Intrinsics.g(shortcutId, "shortcutId");
            this.toolName = toolName;
            this.appLabel = appLabel;
            this.featureLabel = featureLabel;
            this.packageName = packageName;
            this.shortcutId = shortcutId;
            this.isManifest = z11;
            this.lastChangedMs = j11;
            this.score = d5;
        }

        public static /* synthetic */ Feature copy$default(Feature feature, String str, String str2, String str3, String str4, String str5, boolean z11, long j11, double d5, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = feature.toolName;
            }
            if ((i5 & 2) != 0) {
                str2 = feature.appLabel;
            }
            if ((i5 & 4) != 0) {
                str3 = feature.featureLabel;
            }
            if ((i5 & 8) != 0) {
                str4 = feature.packageName;
            }
            if ((i5 & 16) != 0) {
                str5 = feature.shortcutId;
            }
            if ((i5 & 32) != 0) {
                z11 = feature.isManifest;
            }
            if ((i5 & 64) != 0) {
                j11 = feature.lastChangedMs;
            }
            if ((i5 & 128) != 0) {
                d5 = feature.score;
            }
            double d11 = d5;
            long j12 = j11;
            String str6 = str5;
            boolean z12 = z11;
            return feature.copy(str, str2, str3, str4, str6, z12, j12, d11);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getToolName() {
            return this.toolName;
        }

        @NotNull
        /* renamed from: component2, reason: from getter */
        public final String getAppLabel() {
            return this.appLabel;
        }

        @NotNull
        /* renamed from: component3, reason: from getter */
        public final String getFeatureLabel() {
            return this.featureLabel;
        }

        @NotNull
        /* renamed from: component4, reason: from getter */
        public final String getPackageName() {
            return this.packageName;
        }

        @NotNull
        /* renamed from: component5, reason: from getter */
        public final String getShortcutId() {
            return this.shortcutId;
        }

        /* renamed from: component6, reason: from getter */
        public final boolean getIsManifest() {
            return this.isManifest;
        }

        /* renamed from: component7, reason: from getter */
        public final long getLastChangedMs() {
            return this.lastChangedMs;
        }

        /* renamed from: component8, reason: from getter */
        public final double getScore() {
            return this.score;
        }

        @NotNull
        public final Feature copy(@NotNull String toolName, @NotNull String appLabel, @NotNull String featureLabel, @NotNull String packageName, @NotNull String shortcutId, boolean isManifest, long lastChangedMs, double score) {
            Intrinsics.g(toolName, "toolName");
            Intrinsics.g(appLabel, "appLabel");
            Intrinsics.g(featureLabel, "featureLabel");
            Intrinsics.g(packageName, "packageName");
            Intrinsics.g(shortcutId, "shortcutId");
            return new Feature(toolName, appLabel, featureLabel, packageName, shortcutId, isManifest, lastChangedMs, score);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof Feature)) {
                return false;
            }
            Feature feature = (Feature) other;
            return Intrinsics.b(this.toolName, feature.toolName) && Intrinsics.b(this.appLabel, feature.appLabel) && Intrinsics.b(this.featureLabel, feature.featureLabel) && Intrinsics.b(this.packageName, feature.packageName) && Intrinsics.b(this.shortcutId, feature.shortcutId) && this.isManifest == feature.isManifest && this.lastChangedMs == feature.lastChangedMs && Double.compare(this.score, feature.score) == 0;
        }

        @NotNull
        public final String getAppLabel() {
            return this.appLabel;
        }

        @NotNull
        public final String getFeatureLabel() {
            return this.featureLabel;
        }

        public final long getLastChangedMs() {
            return this.lastChangedMs;
        }

        @NotNull
        public final String getPackageName() {
            return this.packageName;
        }

        public final double getScore() {
            return this.score;
        }

        @NotNull
        public final String getShortcutId() {
            return this.shortcutId;
        }

        @NotNull
        public final String getToolName() {
            return this.toolName;
        }

        public int hashCode() {
            return Double.hashCode(this.score) + c0.d(c9.f(c0.e(c0.e(c0.e(c0.e(this.toolName.hashCode() * 31, 31, this.appLabel), 31, this.featureLabel), 31, this.packageName), 31, this.shortcutId), 31, this.isManifest), 31, this.lastChangedMs);
        }

        public final boolean isManifest() {
            return this.isManifest;
        }

        @NotNull
        public String toString() {
            return "Feature(toolName=" + this.toolName + ", appLabel=" + this.appLabel + ", featureLabel=" + this.featureLabel + ", packageName=" + this.packageName + ", shortcutId=" + this.shortcutId + ", isManifest=" + this.isManifest + ", lastChangedMs=" + this.lastChangedMs + ", score=" + this.score + ')';
        }
    }

    private PerAppFeatureCatalog() {
    }

    private final String appLabel(Context context, String pkg) throws PackageManager.NameNotFoundException {
        String strN1;
        Map<String, String> appLabelCache2 = appLabelCache;
        Intrinsics.f(appLabelCache2, "appLabelCache");
        String str = appLabelCache2.get(pkg);
        if (str == null) {
            try {
                ApplicationInfo applicationInfo = context.getPackageManager().getApplicationInfo(pkg, 0);
                Intrinsics.f(applicationInfo, "getApplicationInfo(...)");
                strN1 = context.getPackageManager().getApplicationLabel(applicationInfo).toString();
            } catch (Exception unused) {
                strN1 = k.n1('.', pkg, pkg);
            }
            str = strN1;
            appLabelCache2.put(pkg, str);
        }
        return str;
    }

    public static /* synthetic */ List discover$default(PerAppFeatureCatalog perAppFeatureCatalog, Context context, boolean z11, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            z11 = false;
        }
        return perAppFeatureCatalog.discover(context, z11);
    }

    private final List<Feature> probe(Context context) throws PackageManager.NameNotFoundException {
        String string;
        Object systemService = context.getSystemService("launcherapps");
        LauncherApps launcherApps = systemService instanceof LauncherApps ? (LauncherApps) systemService : null;
        if (launcherApps == null) {
            return EmptyList.f71733a;
        }
        try {
            LauncherApps.ShortcutQuery shortcutQuery = new LauncherApps.ShortcutQuery();
            shortcutQuery.setQueryFlags(11);
            List<ShortcutInfo> shortcuts = launcherApps.getShortcuts(shortcutQuery, Process.myUserHandle());
            if (shortcuts == null) {
                shortcuts = EmptyList.f71733a;
            }
            LinkedHashSet linkedHashSet = new LinkedHashSet();
            ArrayList arrayList = new ArrayList();
            for (ShortcutInfo shortcutInfo : shortcuts) {
                CharSequence shortLabel = shortcutInfo.getShortLabel();
                if (shortLabel != null && (string = shortLabel.toString()) != null) {
                    String str = !k.U0(string) ? string : null;
                    if (str != null) {
                        String str2 = shortcutInfo.getPackage();
                        Intrinsics.f(str2, "getPackage(...)");
                        String strAppLabel = appLabel(context, str2);
                        if (strAppLabel != null) {
                            String strBuildToolName = buildToolName(strAppLabel, str);
                            if (!linkedHashSet.contains(strBuildToolName)) {
                                linkedHashSet.add(strBuildToolName);
                                String str3 = shortcutInfo.getPackage();
                                Intrinsics.f(str3, "getPackage(...)");
                                String id2 = shortcutInfo.getId();
                                Intrinsics.f(id2, "getId(...)");
                                arrayList.add(new Feature(strBuildToolName, strAppLabel, str, str3, id2, shortcutInfo.isDeclaredInManifest(), shortcutInfo.getLastChangedTimestamp(), scoreOf(shortcutInfo)));
                            }
                        }
                    }
                }
            }
            return g.E1(g.D1(new Comparator() { // from class: com.instabridge.ai.tools.perapp.PerAppFeatureCatalog$probe$$inlined$sortedByDescending$1
                /* JADX WARN: Multi-variable type inference failed */
                @Override // java.util.Comparator
                public final int compare(T t6, T t9) {
                    return e0.t(Double.valueOf(((PerAppFeatureCatalog.Feature) t9).getScore()), Double.valueOf(((PerAppFeatureCatalog.Feature) t6).getScore()));
                }
            }, arrayList), MAX_TOOLS);
        } catch (SecurityException e3) {
            Log.w(TAG, "No launcher privileges — feature discovery skipped", e3);
            return EmptyList.f71733a;
        } catch (Throwable th2) {
            Log.w(TAG, "Feature discovery failed", th2);
            return EmptyList.f71733a;
        }
    }

    private final double scoreOf(ShortcutInfo s11) {
        double dCurrentTimeMillis = (System.currentTimeMillis() - s11.getLastChangedTimestamp()) / 8.64E7d;
        if (dCurrentTimeMillis < 0.0d) {
            dCurrentTimeMillis = 0.0d;
        }
        double d5 = 1.0d / (dCurrentTimeMillis + 1.0d);
        double d11 = s11.isDeclaredInManifest() ? 1.2d : 1.0d;
        int rank = s11.getRank();
        if (rank > 10) {
            rank = 10;
        }
        return d5 * d11 * (((10 - rank) * 0.05d) + 1.0d);
    }

    @NotNull
    public final String buildToolName(@NotNull String appLabel, @NotNull String featureLabel) {
        Intrinsics.g(appLabel, "appLabel");
        Intrinsics.g(featureLabel, "featureLabel");
        return l.G1(63, "open_" + slug(appLabel) + '_' + slug(featureLabel));
    }

    @NotNull
    public final List<Feature> discover(@NotNull Context context, boolean forceRefresh) throws PackageManager.NameNotFoundException {
        Intrinsics.g(context, "context");
        List<Feature> list = testSeed;
        if (list != null) {
            return list;
        }
        if (!forceRefresh && cached != null && System.currentTimeMillis() - cachedAtMs < 86400000) {
            List<Feature> list2 = cached;
            Intrinsics.d(list2);
            return list2;
        }
        long jCurrentTimeMillis = System.currentTimeMillis();
        List<Feature> listProbe = probe(context);
        cached = listProbe;
        cachedAtMs = System.currentTimeMillis();
        StringBuilder sb2 = new StringBuilder("Discovered ");
        sb2.append(listProbe.size());
        sb2.append(" per-app feature tools in ");
        sb2.append(System.currentTimeMillis() - jCurrentTimeMillis);
        sb2.append("ms (from ");
        List<Feature> list3 = listProbe;
        ArrayList arrayList = new ArrayList(c.u0(list3, 10));
        Iterator<T> it = list3.iterator();
        while (it.hasNext()) {
            arrayList.add(((Feature) it.next()).getPackageName());
        }
        sb2.append(g.N1(arrayList).size());
        sb2.append(" apps)");
        Log.i(TAG, sb2.toString());
        if (Log.isLoggable(TAG, 3)) {
            for (Feature feature : g.E1(list3, 30)) {
                feature.getToolName();
                feature.getAppLabel();
                feature.getFeatureLabel();
                StringBuilder sb3 = new StringBuilder("manifest=");
                sb3.append(feature.isManifest());
                sb3.append(" score=%.3f");
                Arrays.copyOf(new Object[]{Double.valueOf(feature.getScore())}, 1);
            }
            if (listProbe.size() > 30) {
                listProbe.size();
            }
        }
        return listProbe;
    }

    public final void invalidate() {
        cached = null;
        cachedAtMs = 0L;
        appLabelCache.clear();
        testSeed = null;
        PerAppFeatureTool.INSTANCE.invalidateCache();
    }

    @NotNull
    public final String slug(@NotNull String text) {
        Intrinsics.g(text, "text");
        String lowerCase = text.toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        return k.v1(new Regex("[^a-z0-9]+").h("_", lowerCase), '_');
    }

    public final void testSeed(@NotNull List<Feature> features) {
        Intrinsics.g(features, "features");
        testSeed = features;
        cached = features;
        cachedAtMs = System.currentTimeMillis();
    }
}
