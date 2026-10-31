package ti;

import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001R\u0018\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0003\u0010\u0004R\u0018\u0010\t\u001a\u0004\u0018\u00010\u00068\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0007\u0010\b¨\u0006\n"}, d2 = {"Lti/k;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "Ljava/lang/Integer;", "activeNetworkState", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "b", "Ljava/lang/Boolean;", "isActiveNetworkMetered", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes.dex */
public final /* data */ class k {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @gn.c("active_network_state")
    @JvmField
    @Nullable
    public Integer activeNetworkState;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @gn.c("active_network_metered")
    @JvmField
    @Nullable
    public Boolean isActiveNetworkMetered;

    public k() {
        this(0);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof k)) {
            return false;
        }
        k kVar = (k) obj;
        return Intrinsics.b(this.activeNetworkState, kVar.activeNetworkState) && Intrinsics.b(this.isActiveNetworkMetered, kVar.isActiveNetworkMetered);
    }

    public final int hashCode() {
        Integer num = this.activeNetworkState;
        int iHashCode = (num == null ? 0 : num.hashCode()) * 31;
        Boolean bool = this.isActiveNetworkMetered;
        return iHashCode + (bool != null ? bool.hashCode() : 0);
    }

    public final String toString() {
        return "NetworkSignals(activeNetworkState=" + this.activeNetworkState + ", isActiveNetworkMetered=" + this.isActiveNetworkMetered + ")";
    }

    public k(int i5) {
        this.activeNetworkState = null;
        this.isActiveNetworkMetered = null;
    }
}
