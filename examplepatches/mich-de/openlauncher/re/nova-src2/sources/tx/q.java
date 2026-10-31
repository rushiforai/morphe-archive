package tx;

import com.instabridge.ai.context.ShortcutUsageProvider;
import java.util.Comparator;
import java.util.List;
import java.util.Map;

/* loaded from: classes4.dex */
public final class q implements Comparator {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f89955a;

    public /* synthetic */ q(int i5) {
        this.f89955a = i5;
    }

    @Override // java.util.Comparator
    public final int compare(Object obj, Object obj2) {
        switch (this.f89955a) {
            case 0:
                return ab.e0.t((String) ((Map.Entry) obj).getKey(), (String) ((Map.Entry) obj2).getKey());
            case 1:
                return ab.e0.t(Integer.valueOf(((List) ((Map.Entry) obj2).getValue()).size()), Integer.valueOf(((List) ((Map.Entry) obj).getValue()).size()));
            case 2:
                return ab.e0.t(Integer.valueOf(((ShortcutUsageProvider.ShortcutUsageEntry) obj2).getLaunchCount()), Integer.valueOf(((ShortcutUsageProvider.ShortcutUsageEntry) obj).getLaunchCount()));
            case 3:
                return ab.e0.t(Long.valueOf(((ShortcutUsageProvider.ShortcutUsageEntry) obj2).getLastUsedMs()), Long.valueOf(((ShortcutUsageProvider.ShortcutUsageEntry) obj).getLastUsedMs()));
            default:
                return ab.e0.t(Integer.valueOf(((ShortcutUsageProvider.ShortcutUsageEntry) obj2).getLaunchCount()), Integer.valueOf(((ShortcutUsageProvider.ShortcutUsageEntry) obj).getLaunchCount()));
        }
    }
}
