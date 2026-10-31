package nova.branch.engage.sesame_lite.internal.stores;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.Map;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;

@Metadata(d1 = {"\u0000\u001e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\t\n\u0002\b\u0003\u001a8\u0010\u0000\u001a\u00020\u0001*\u000e\u0012\u0004\u0012\u00020\u0003\u0012\u0004\u0012\u00020\u00040\u00022\u0006\u0010\u0005\u001a\u00020\u00032\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\u00032\u0006\u0010\t\u001a\u00020\u0001H\u0002¨\u0006\n"}, d2 = {"isIgnored", b.f42142b, b.f42142b, b.f42142b, "Lnova/branch/engage/sesame_lite/internal/stores/IgnoreEntity;", "packageName", "userId", b.f42142b, "hostPackage", "ignoreHost", "sesame-lite_release"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class IgnoreStoreKt {
    /* JADX INFO: Access modifiers changed from: private */
    public static final boolean isIgnored(Map<String, IgnoreEntity> map, String str, long j11, String str2, boolean z11) {
        if (z11 && Intrinsics.b(str, str2)) {
            return true;
        }
        IgnoreEntity ignoreEntity = map.get(str);
        return ignoreEntity != null && ignoreEntity.matchesUser(j11);
    }
}
