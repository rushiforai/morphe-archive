package ti;

import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\t\n\u0002\b\u0007\n\u0002\u0010\b\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001R\u0018\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0003\u0010\u0004R\u0018\u0010\u0007\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0006\u0010\u0004R\u0018\u0010\t\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\b\u0010\u0004R\u0018\u0010\r\u001a\u0004\u0018\u00010\n8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u000b\u0010\f¨\u0006\u000e"}, d2 = {"Lti/j;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "Ljava/lang/Long;", "runtimeFreeMemory", "b", "runtimeMaxMemory", "c", "runtimeTotalMemory", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "d", "Ljava/lang/Integer;", "webviewCount", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes.dex */
public final /* data */ class j {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @gn.c("runtime_free")
    @JvmField
    @Nullable
    public Long runtimeFreeMemory;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @gn.c("runtime_max")
    @JvmField
    @Nullable
    public Long runtimeMaxMemory;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @gn.c("runtime_total")
    @JvmField
    @Nullable
    public Long runtimeTotalMemory;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    @gn.c("web_view_count")
    @JvmField
    @Nullable
    public Integer webviewCount;

    public j() {
        this(0);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j)) {
            return false;
        }
        j jVar = (j) obj;
        return Intrinsics.b(this.runtimeFreeMemory, jVar.runtimeFreeMemory) && Intrinsics.b(this.runtimeMaxMemory, jVar.runtimeMaxMemory) && Intrinsics.b(this.runtimeTotalMemory, jVar.runtimeTotalMemory) && Intrinsics.b(this.webviewCount, jVar.webviewCount);
    }

    public final int hashCode() {
        Long l9 = this.runtimeFreeMemory;
        int iHashCode = (l9 == null ? 0 : l9.hashCode()) * 31;
        Long l11 = this.runtimeMaxMemory;
        int iHashCode2 = (iHashCode + (l11 == null ? 0 : l11.hashCode())) * 31;
        Long l12 = this.runtimeTotalMemory;
        int iHashCode3 = (iHashCode2 + (l12 == null ? 0 : l12.hashCode())) * 31;
        Integer num = this.webviewCount;
        return iHashCode3 + (num != null ? num.hashCode() : 0);
    }

    public final String toString() {
        return "MemorySignals(runtimeFreeMemory=" + this.runtimeFreeMemory + ", runtimeMaxMemory=" + this.runtimeMaxMemory + ", runtimeTotalMemory=" + this.runtimeTotalMemory + ", webviewCount=" + this.webviewCount + ")";
    }

    public j(int i5) {
        this.runtimeFreeMemory = null;
        this.runtimeMaxMemory = null;
        this.runtimeTotalMemory = null;
        this.webviewCount = null;
    }
}
