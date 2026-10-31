package ti;

import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001R\u0016\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010\u0004R\u0016\u0010\t\u001a\u0004\u0018\u00010\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\b¨\u0006\n"}, d2 = {"Lti/b;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "Ljava/lang/Integer;", "priorClickCount", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "b", "Ljava/lang/Long;", "loadDuration", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes.dex */
public final /* data */ class b {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @gn.c("pcc")
    @JvmField
    @Nullable
    public final Integer priorClickCount;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @gn.c("dload")
    @JvmField
    @Nullable
    public final Long loadDuration;

    public b(Integer num, Long l9) {
        this.priorClickCount = num;
        this.loadDuration = l9;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return Intrinsics.b(this.priorClickCount, bVar.priorClickCount) && Intrinsics.b(this.loadDuration, bVar.loadDuration);
    }

    public final int hashCode() {
        Integer num = this.priorClickCount;
        int iHashCode = (num == null ? 0 : num.hashCode()) * 31;
        Long l9 = this.loadDuration;
        return iHashCode + (l9 != null ? l9.hashCode() : 0);
    }

    public final String toString() {
        return "AdUnitQualitySignals(priorClickCount=" + this.priorClickCount + ", loadDuration=" + this.loadDuration + ")";
    }
}
