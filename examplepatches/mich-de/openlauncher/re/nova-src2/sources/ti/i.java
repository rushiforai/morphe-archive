package ti;

import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\b\n\u0002\b\b\b\u0087\b\u0018\u00002\u00020\u0001R\u0018\u0010\u0005\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0003\u0010\u0004R\u0018\u0010\u0007\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0006\u0010\u0004R\u0018\u0010\t\u001a\u0004\u0018\u00010\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\b\u0010\u0004¨\u0006\n"}, d2 = {"Lti/i;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "Ljava/lang/Integer;", "advertisedMemoryTier", "b", "availableMemoryTier", "c", "availableProcessorsTier", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes.dex */
public final /* data */ class i {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @gn.c("ad_mem_tier")
    @JvmField
    @Nullable
    public Integer advertisedMemoryTier;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @gn.c("avai_mem_tier")
    @JvmField
    @Nullable
    public Integer availableMemoryTier;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @gn.c("avai_proc_tier")
    @JvmField
    @Nullable
    public Integer availableProcessorsTier;

    public i() {
        this(0);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof i)) {
            return false;
        }
        i iVar = (i) obj;
        return Intrinsics.b(this.advertisedMemoryTier, iVar.advertisedMemoryTier) && Intrinsics.b(this.availableMemoryTier, iVar.availableMemoryTier) && Intrinsics.b(this.availableProcessorsTier, iVar.availableProcessorsTier);
    }

    public final int hashCode() {
        Integer num = this.advertisedMemoryTier;
        int iHashCode = (num == null ? 0 : num.hashCode()) * 31;
        Integer num2 = this.availableMemoryTier;
        int iHashCode2 = (iHashCode + (num2 == null ? 0 : num2.hashCode())) * 31;
        Integer num3 = this.availableProcessorsTier;
        return iHashCode2 + (num3 != null ? num3.hashCode() : 0);
    }

    public final String toString() {
        return "DeviceTierSignals(advertisedMemoryTier=" + this.advertisedMemoryTier + ", availableMemoryTier=" + this.availableMemoryTier + ", availableProcessorsTier=" + this.availableProcessorsTier + ")";
    }

    public i(int i5) {
        this.advertisedMemoryTier = null;
        this.availableMemoryTier = null;
        this.availableProcessorsTier = null;
    }
}
