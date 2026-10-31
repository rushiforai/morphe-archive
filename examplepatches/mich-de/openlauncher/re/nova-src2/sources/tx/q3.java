package tx;

import android.content.Context;
import android.content.pm.PackageManager;
import com.android.launcher3.logging.StatsLogManager;
import com.android.launcher3.util.ComponentKey;
import com.instabridge.ai.auth.ConsentStatus;
import com.instabridge.ai.context.AppUsageProvider;
import com.teslacoilsw.launcher.Stats;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class q3 implements AppUsageProvider {

    /* renamed from: a, reason: collision with root package name */
    public static final q3 f89964a = new q3();

    public static Stats a() {
        try {
            Context context = mx.g0.f77088a;
            StatsLogManager statsLogManagerB = StatsLogManager.b(mx.g0.e());
            if (statsLogManagerB instanceof Stats) {
                return (Stats) statsLogManagerB;
            }
            return null;
        } catch (Exception e3) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("NOVA_AI");
            bVar.p(e3, "Failed to get Stats instance", new Object[0]);
            return null;
        }
    }

    public static boolean b() {
        String str;
        if (!fo.d.j()) {
            return true;
        }
        try {
            ConsentStatus consentSnapshot = fo.d.a().getConsentSnapshot();
            if (consentSnapshot == null) {
                return true;
            }
            Boolean globalEnabled = consentSnapshot.getGlobalEnabled();
            Boolean bool = Boolean.TRUE;
            if (Intrinsics.b(globalEnabled, bool) && (str = io.p.f66714q.f66720d) != null) {
                return Intrinsics.b(consentSnapshot.getTypes().get(str), bool);
            }
            return false;
        } catch (Exception unused) {
            return true;
        }
    }

    @Override // com.instabridge.ai.context.AppUsageProvider
    public final List getFrequentApps(int i5) {
        if (!b()) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("NOVA_AI");
            bVar.b("getFrequentApps: APP_USAGE consent disabled — returning empty", new Object[0]);
            return EmptyList.f71733a;
        }
        Stats statsA = a();
        if (statsA == null) {
            mc0.b bVar2 = mc0.d.f76206a;
            bVar2.r("NOVA_AI");
            bVar2.n("getFrequentApps: Stats instance is null — StatsLogManager not available", new Object[0]);
            return EmptyList.f71733a;
        }
        Context context = mx.g0.f77088a;
        PackageManager packageManager = mx.g0.e().getPackageManager();
        try {
            ArrayList arrayListD = statsA.d();
            mc0.b bVar3 = mc0.d.f76206a;
            bVar3.r("NOVA_AI");
            bVar3.b("getFrequentApps: histogram size=%d, limit=%d", Integer.valueOf(arrayListD.size()), Integer.valueOf(i5));
            List listE1 = b70.g.E1(arrayListD, i5 * 2);
            ArrayList arrayList = new ArrayList();
            int i11 = 0;
            for (Object obj : listE1) {
                int i12 = i11 + 1;
                AppUsageProvider.AppUsageEntry appUsageEntry = null;
                if (i11 < 0) {
                    ul.b.e0();
                    throw null;
                }
                String packageName = ((ComponentKey) obj).f21251a.getPackageName();
                try {
                    appUsageEntry = new AppUsageProvider.AppUsageEntry(packageName, packageManager.getApplicationLabel(packageManager.getApplicationInfo(packageName, 0)).toString(), arrayListD.size() - i11, 0L, 8, null);
                } catch (Exception unused) {
                }
                if (appUsageEntry != null) {
                    arrayList.add(appUsageEntry);
                }
                i11 = i12;
            }
            HashSet hashSet = new HashSet();
            ArrayList arrayList2 = new ArrayList();
            Iterator it = arrayList.iterator();
            while (it.hasNext()) {
                Object next = it.next();
                if (hashSet.add(((AppUsageProvider.AppUsageEntry) next).getPackageName())) {
                    arrayList2.add(next);
                }
            }
            return b70.g.E1(arrayList2, i5);
        } catch (Exception e3) {
            mc0.b bVar4 = mc0.d.f76206a;
            bVar4.r("NOVA_AI");
            bVar4.p(e3, "getFrequentApps failed", new Object[0]);
            return EmptyList.f71733a;
        }
    }

    @Override // com.instabridge.ai.context.AppUsageProvider
    public final List getRecentApps(int i5) {
        AppUsageProvider.AppUsageEntry appUsageEntry;
        if (!b()) {
            mc0.b bVar = mc0.d.f76206a;
            bVar.r("NOVA_AI");
            bVar.b("getRecentApps: APP_USAGE consent disabled — returning empty", new Object[0]);
            return EmptyList.f71733a;
        }
        Stats statsA = a();
        if (statsA == null) {
            return EmptyList.f71733a;
        }
        Context context = mx.g0.f77088a;
        PackageManager packageManager = mx.g0.e().getPackageManager();
        try {
            List listE1 = b70.g.E1(statsA.f(), i5 * 2);
            ArrayList arrayList = new ArrayList();
            Iterator it = listE1.iterator();
            while (it.hasNext()) {
                String packageName = ((ComponentKey) it.next()).f21251a.getPackageName();
                try {
                    appUsageEntry = new AppUsageProvider.AppUsageEntry(packageName, packageManager.getApplicationLabel(packageManager.getApplicationInfo(packageName, 0)).toString(), 0, System.currentTimeMillis(), 4, null);
                } catch (Exception unused) {
                    appUsageEntry = null;
                }
                if (appUsageEntry != null) {
                    arrayList.add(appUsageEntry);
                }
            }
            HashSet hashSet = new HashSet();
            ArrayList arrayList2 = new ArrayList();
            Iterator it2 = arrayList.iterator();
            while (it2.hasNext()) {
                Object next = it2.next();
                if (hashSet.add(((AppUsageProvider.AppUsageEntry) next).getPackageName())) {
                    arrayList2.add(next);
                }
            }
            return b70.g.E1(arrayList2, i5);
        } catch (Exception e3) {
            mc0.b bVar2 = mc0.d.f76206a;
            bVar2.r("NOVA_AI");
            bVar2.p(e3, "getRecentApps failed", new Object[0]);
            return EmptyList.f71733a;
        }
    }
}
