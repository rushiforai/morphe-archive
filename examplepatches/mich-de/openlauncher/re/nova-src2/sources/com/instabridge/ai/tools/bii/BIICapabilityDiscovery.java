package com.instabridge.ai.tools.bii;

import android.content.Context;
import android.content.pm.Capability;
import android.content.pm.CapabilityParams;
import android.content.pm.LauncherApps;
import android.content.pm.ShortcutInfo;
import android.os.Build;
import android.os.Process;
import android.util.Log;
import b.c0;
import b.c9;
import b.i1;
import b70.c;
import b70.g;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.collections.builders.ListBuilder;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\"\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0006\n\u0002\u0010\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\u00020\u0001:\u0001\u001bB\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003J\u001e\u0010\u000e\u001a\b\u0012\u0004\u0012\u00020\u00050\t2\u0006\u0010\u000f\u001a\u00020\u00102\b\b\u0002\u0010\u0011\u001a\u00020\u0012J\u0014\u0010\u0013\u001a\b\u0012\u0004\u0012\u00020\f0\u000b2\u0006\u0010\u000f\u001a\u00020\u0010J\u0018\u0010\u0014\u001a\u0004\u0018\u00010\f2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0015\u001a\u00020\u0005J$\u0010\u0016\u001a\b\u0012\u0004\u0012\u00020\u00050\t2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0015\u001a\u00020\u00052\u0006\u0010\u0017\u001a\u00020\u0005J\u0006\u0010\u0018\u001a\u00020\u0019J\u0016\u0010\u001a\u001a\b\u0012\u0004\u0012\u00020\f0\u000b2\u0006\u0010\u000f\u001a\u00020\u0010H\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082T¢\u0006\u0002\n\u0000R\u0016\u0010\b\u001a\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\tX\u0082\u000e¢\u0006\u0002\n\u0000R\u0016\u0010\n\u001a\n\u0012\u0004\u0012\u00020\f\u0018\u00010\u000bX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\r\u001a\u00020\u0007X\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u001c"}, d2 = {"Lcom/instabridge/ai/tools/bii/BIICapabilityDiscovery;", b.f42142b, "<init>", "()V", "TAG", b.f42142b, "CACHE_TTL_MS", b.f42142b, "cachedNames", b.f42142b, "cachedBindings", b.f42142b, "Lcom/instabridge/ai/tools/bii/BIICapabilityDiscovery$CapabilityBinding;", "cachedAtMs", "discover", "context", "Landroid/content/Context;", "forceRefresh", b.f42142b, "allBindings", "bestBindingFor", "biiName", "paramValuesFor", "paramName", "invalidate", b.f42142b, "probe", "CapabilityBinding", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes3.dex */
public final class BIICapabilityDiscovery {
    private static final long CACHE_TTL_MS = 86400000;

    @NotNull
    private static final String TAG = "BIICapabilityDiscov";
    private static volatile long cachedAtMs;

    @Nullable
    private static volatile List<CapabilityBinding> cachedBindings;

    @Nullable
    private static volatile Set<String> cachedNames;

    @NotNull
    public static final BIICapabilityDiscovery INSTANCE = new BIICapabilityDiscovery();
    public static final int $stable = 8;

    @Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0010$\n\u0002\u0010 \n\u0002\b\u0011\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\b\n\u0002\b\u0002\b\u0087\b\u0018\u00002\u00020\u0001BA\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0003\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0018\u0010\b\u001a\u0014\u0012\u0004\u0012\u00020\u0003\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00030\n0\t¢\u0006\u0004\b\u000b\u0010\fJ\t\u0010\u0015\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0016\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0017\u001a\u00020\u0003HÆ\u0003J\t\u0010\u0018\u001a\u00020\u0007HÆ\u0003J\u001b\u0010\u0019\u001a\u0014\u0012\u0004\u0012\u00020\u0003\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00030\n0\tHÆ\u0003JM\u0010\u001a\u001a\u00020\u00002\b\b\u0002\u0010\u0002\u001a\u00020\u00032\b\b\u0002\u0010\u0004\u001a\u00020\u00032\b\b\u0002\u0010\u0005\u001a\u00020\u00032\b\b\u0002\u0010\u0006\u001a\u00020\u00072\u001a\b\u0002\u0010\b\u001a\u0014\u0012\u0004\u0012\u00020\u0003\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00030\n0\tHÆ\u0001J\u0013\u0010\u001b\u001a\u00020\u001c2\b\u0010\u001d\u001a\u0004\u0018\u00010\u0001HÖ\u0003J\t\u0010\u001e\u001a\u00020\u001fHÖ\u0001J\t\u0010 \u001a\u00020\u0003HÖ\u0001R\u0011\u0010\u0002\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\r\u0010\u000eR\u0011\u0010\u0004\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u000f\u0010\u000eR\u0011\u0010\u0005\u001a\u00020\u0003¢\u0006\b\n\u0000\u001a\u0004\b\u0010\u0010\u000eR\u0011\u0010\u0006\u001a\u00020\u0007¢\u0006\b\n\u0000\u001a\u0004\b\u0011\u0010\u0012R#\u0010\b\u001a\u0014\u0012\u0004\u0012\u00020\u0003\u0012\n\u0012\b\u0012\u0004\u0012\u00020\u00030\n0\t¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014¨\u0006!"}, d2 = {"Lcom/instabridge/ai/tools/bii/BIICapabilityDiscovery$CapabilityBinding;", b.f42142b, "biiName", b.f42142b, "packageName", "shortcutId", "lastChangedMs", b.f42142b, "paramBindings", b.f42142b, b.f42142b, "<init>", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/Map;)V", "getBiiName", "()Ljava/lang/String;", "getPackageName", "getShortcutId", "getLastChangedMs", "()J", "getParamBindings", "()Ljava/util/Map;", "component1", "component2", "component3", "component4", "component5", "copy", "equals", b.f42142b, InneractiveMediationNameConsts.OTHER, "hashCode", b.f42142b, "toString", "instabridge-ai-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final /* data */ class CapabilityBinding {
        public static final int $stable = 8;

        @NotNull
        private final String biiName;
        private final long lastChangedMs;

        @NotNull
        private final String packageName;

        @NotNull
        private final Map<String, List<String>> paramBindings;

        @NotNull
        private final String shortcutId;

        /* JADX WARN: Multi-variable type inference failed */
        public CapabilityBinding(@NotNull String biiName, @NotNull String packageName, @NotNull String shortcutId, long j11, @NotNull Map<String, ? extends List<String>> paramBindings) {
            Intrinsics.g(biiName, "biiName");
            Intrinsics.g(packageName, "packageName");
            Intrinsics.g(shortcutId, "shortcutId");
            Intrinsics.g(paramBindings, "paramBindings");
            this.biiName = biiName;
            this.packageName = packageName;
            this.shortcutId = shortcutId;
            this.lastChangedMs = j11;
            this.paramBindings = paramBindings;
        }

        public static /* synthetic */ CapabilityBinding copy$default(CapabilityBinding capabilityBinding, String str, String str2, String str3, long j11, Map map, int i5, Object obj) {
            if ((i5 & 1) != 0) {
                str = capabilityBinding.biiName;
            }
            if ((i5 & 2) != 0) {
                str2 = capabilityBinding.packageName;
            }
            if ((i5 & 4) != 0) {
                str3 = capabilityBinding.shortcutId;
            }
            if ((i5 & 8) != 0) {
                j11 = capabilityBinding.lastChangedMs;
            }
            if ((i5 & 16) != 0) {
                map = capabilityBinding.paramBindings;
            }
            Map map2 = map;
            String str4 = str3;
            return capabilityBinding.copy(str, str2, str4, j11, map2);
        }

        @NotNull
        /* renamed from: component1, reason: from getter */
        public final String getBiiName() {
            return this.biiName;
        }

        @NotNull
        /* renamed from: component2, reason: from getter */
        public final String getPackageName() {
            return this.packageName;
        }

        @NotNull
        /* renamed from: component3, reason: from getter */
        public final String getShortcutId() {
            return this.shortcutId;
        }

        /* renamed from: component4, reason: from getter */
        public final long getLastChangedMs() {
            return this.lastChangedMs;
        }

        @NotNull
        public final Map<String, List<String>> component5() {
            return this.paramBindings;
        }

        @NotNull
        public final CapabilityBinding copy(@NotNull String biiName, @NotNull String packageName, @NotNull String shortcutId, long lastChangedMs, @NotNull Map<String, ? extends List<String>> paramBindings) {
            Intrinsics.g(biiName, "biiName");
            Intrinsics.g(packageName, "packageName");
            Intrinsics.g(shortcutId, "shortcutId");
            Intrinsics.g(paramBindings, "paramBindings");
            return new CapabilityBinding(biiName, packageName, shortcutId, lastChangedMs, paramBindings);
        }

        public boolean equals(@Nullable Object other) {
            if (this == other) {
                return true;
            }
            if (!(other instanceof CapabilityBinding)) {
                return false;
            }
            CapabilityBinding capabilityBinding = (CapabilityBinding) other;
            return Intrinsics.b(this.biiName, capabilityBinding.biiName) && Intrinsics.b(this.packageName, capabilityBinding.packageName) && Intrinsics.b(this.shortcutId, capabilityBinding.shortcutId) && this.lastChangedMs == capabilityBinding.lastChangedMs && Intrinsics.b(this.paramBindings, capabilityBinding.paramBindings);
        }

        @NotNull
        public final String getBiiName() {
            return this.biiName;
        }

        public final long getLastChangedMs() {
            return this.lastChangedMs;
        }

        @NotNull
        public final String getPackageName() {
            return this.packageName;
        }

        @NotNull
        public final Map<String, List<String>> getParamBindings() {
            return this.paramBindings;
        }

        @NotNull
        public final String getShortcutId() {
            return this.shortcutId;
        }

        public int hashCode() {
            return this.paramBindings.hashCode() + c0.d(c0.e(c0.e(this.biiName.hashCode() * 31, 31, this.packageName), 31, this.shortcutId), 31, this.lastChangedMs);
        }

        @NotNull
        public String toString() {
            StringBuilder sb2 = new StringBuilder("CapabilityBinding(biiName=");
            sb2.append(this.biiName);
            sb2.append(", packageName=");
            sb2.append(this.packageName);
            sb2.append(", shortcutId=");
            sb2.append(this.shortcutId);
            sb2.append(", lastChangedMs=");
            sb2.append(this.lastChangedMs);
            sb2.append(", paramBindings=");
            return c9.l(sb2, this.paramBindings, ')');
        }
    }

    private BIICapabilityDiscovery() {
    }

    public static /* synthetic */ Set discover$default(BIICapabilityDiscovery bIICapabilityDiscovery, Context context, boolean z11, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            z11 = false;
        }
        return bIICapabilityDiscovery.discover(context, z11);
    }

    private final List<CapabilityBinding> probe(Context context) {
        List<ShortcutInfo> shortcuts;
        List capabilityParams;
        if (Build.VERSION.SDK_INT < 33) {
            return EmptyList.f71733a;
        }
        Object systemService = context.getSystemService("launcherapps");
        LauncherApps launcherApps = systemService instanceof LauncherApps ? (LauncherApps) systemService : null;
        if (launcherApps == null) {
            return EmptyList.f71733a;
        }
        LauncherApps.ShortcutQuery shortcutQuery = new LauncherApps.ShortcutQuery();
        shortcutQuery.setQueryFlags(11);
        ArrayList arrayList = new ArrayList();
        try {
            shortcuts = launcherApps.getShortcuts(shortcutQuery, Process.myUserHandle());
        } catch (SecurityException e3) {
            Log.w(TAG, "No launcher privileges — discovery skipped", e3);
        } catch (Exception e11) {
            Log.w(TAG, "BII capability discovery failed", e11);
        }
        if (shortcuts == null) {
            return EmptyList.f71733a;
        }
        for (ShortcutInfo shortcutInfo : shortcuts) {
            List capabilities = shortcutInfo.getCapabilities();
            if (capabilities != null) {
                Iterator it = capabilities.iterator();
                while (it.hasNext()) {
                    Capability capabilityB = i1.b(it.next());
                    try {
                        capabilityParams = shortcutInfo.getCapabilityParams(capabilityB);
                    } catch (Throwable unused) {
                        capabilityParams = null;
                    }
                    LinkedHashMap linkedHashMap = new LinkedHashMap();
                    if (capabilityParams != null) {
                        Iterator it2 = capabilityParams.iterator();
                        while (it2.hasNext()) {
                            CapabilityParams capabilityParamsC = i1.c(it2.next());
                            String name = capabilityParamsC.getName();
                            if (name != null) {
                                ListBuilder listBuilderW = ul.b.w();
                                String value = capabilityParamsC.getValue();
                                if (value != null) {
                                    listBuilderW.add(value);
                                }
                                List<String> aliases = capabilityParamsC.getAliases();
                                if (aliases != null) {
                                    for (String str : aliases) {
                                        if (str != null && !listBuilderW.contains(str)) {
                                            listBuilderW.add(str);
                                        }
                                    }
                                }
                                ListBuilder listBuilderM = ul.b.m(listBuilderW);
                                if (!listBuilderM.isEmpty()) {
                                    linkedHashMap.put(name, listBuilderM);
                                }
                            }
                        }
                    }
                    String name2 = capabilityB.getName();
                    Intrinsics.f(name2, "getName(...)");
                    String str2 = shortcutInfo.getPackage();
                    Intrinsics.f(str2, "getPackage(...)");
                    String id2 = shortcutInfo.getId();
                    Intrinsics.f(id2, "getId(...)");
                    arrayList.add(new CapabilityBinding(name2, str2, id2, shortcutInfo.getLastChangedTimestamp(), linkedHashMap));
                }
            }
        }
        return arrayList;
    }

    @NotNull
    public final List<CapabilityBinding> allBindings(@NotNull Context context) {
        Intrinsics.g(context, "context");
        discover$default(this, context, false, 2, null);
        List<CapabilityBinding> list = cachedBindings;
        return list == null ? EmptyList.f71733a : list;
    }

    @Nullable
    public final CapabilityBinding bestBindingFor(@NotNull Context context, @NotNull String biiName) {
        Intrinsics.g(context, "context");
        Intrinsics.g(biiName, "biiName");
        Object next = null;
        discover$default(this, context, false, 2, null);
        List<CapabilityBinding> list = cachedBindings;
        if (list == null) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        for (Object obj : list) {
            if (Intrinsics.b(((CapabilityBinding) obj).getBiiName(), biiName)) {
                arrayList.add(obj);
            }
        }
        Iterator it = arrayList.iterator();
        if (it.hasNext()) {
            next = it.next();
            if (it.hasNext()) {
                long lastChangedMs = ((CapabilityBinding) next).getLastChangedMs();
                do {
                    Object next2 = it.next();
                    long lastChangedMs2 = ((CapabilityBinding) next2).getLastChangedMs();
                    if (lastChangedMs < lastChangedMs2) {
                        next = next2;
                        lastChangedMs = lastChangedMs2;
                    }
                } while (it.hasNext());
            }
        }
        return (CapabilityBinding) next;
    }

    @NotNull
    public final Set<String> discover(@NotNull Context context, boolean forceRefresh) {
        Intrinsics.g(context, "context");
        if (!forceRefresh && cachedNames != null && System.currentTimeMillis() - cachedAtMs < 86400000) {
            Set<String> set = cachedNames;
            Intrinsics.d(set);
            return set;
        }
        long jCurrentTimeMillis = System.currentTimeMillis();
        List<CapabilityBinding> listProbe = probe(context);
        List<CapabilityBinding> list = listProbe;
        ArrayList arrayList = new ArrayList(c.u0(list, 10));
        Iterator<T> it = list.iterator();
        while (it.hasNext()) {
            arrayList.add(((CapabilityBinding) it.next()).getBiiName());
        }
        Set<String> setN1 = g.N1(arrayList);
        cachedNames = setN1;
        cachedBindings = listProbe;
        cachedAtMs = System.currentTimeMillis();
        ArrayList arrayList2 = new ArrayList(c.u0(list, 10));
        Iterator<T> it2 = list.iterator();
        while (it2.hasNext()) {
            arrayList2.add(((CapabilityBinding) it2.next()).getShortcutId());
        }
        int size = g.N1(arrayList2).size();
        ArrayList arrayList3 = new ArrayList(c.u0(list, 10));
        Iterator<T> it3 = list.iterator();
        while (it3.hasNext()) {
            arrayList3.add(((CapabilityBinding) it3.next()).getPackageName());
        }
        Log.i(TAG, "Discovered " + listProbe.size() + " capability bindings in " + (System.currentTimeMillis() - jCurrentTimeMillis) + "ms (from " + size + " shortcuts, " + g.N1(arrayList3).size() + " apps)");
        return setN1;
    }

    public final void invalidate() {
        cachedNames = null;
        cachedBindings = null;
        cachedAtMs = 0L;
    }

    @NotNull
    public final Set<String> paramValuesFor(@NotNull Context context, @NotNull String biiName, @NotNull String paramName) {
        Intrinsics.g(context, "context");
        Intrinsics.g(biiName, "biiName");
        Intrinsics.g(paramName, "paramName");
        discover$default(this, context, false, 2, null);
        LinkedHashSet linkedHashSet = new LinkedHashSet();
        List<CapabilityBinding> list = cachedBindings;
        if (list != null) {
            ArrayList arrayList = new ArrayList();
            for (Object obj : list) {
                if (Intrinsics.b(((CapabilityBinding) obj).getBiiName(), biiName)) {
                    arrayList.add(obj);
                }
            }
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                List<String> list2 = ((CapabilityBinding) it.next()).getParamBindings().get(paramName);
                if (list2 != null) {
                    Iterator<T> it2 = list2.iterator();
                    while (it2.hasNext()) {
                        linkedHashSet.add((String) it2.next());
                    }
                }
            }
        }
        return linkedHashSet;
    }
}
