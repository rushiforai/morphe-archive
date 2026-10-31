package ti;

import com.fyber.inneractive.sdk.external.InneractiveMediationDefs;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000H\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0002\b\u0003\n\u0002\u0010\t\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001R\u0014\u0010\u0005\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010\u0004R\u0014\u0010\t\u001a\u00020\u00068\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0007\u0010\bR\u0016\u0010\r\u001a\u00020\n8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u000b\u0010\fR\u0014\u0010\u0011\u001a\u00020\u000e8\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u000f\u0010\u0010R\u0014\u0010\u0015\u001a\u00020\u00128\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0013\u0010\u0014R\u0014\u0010\u0019\u001a\u00020\u00168\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0017\u0010\u0018R\u0018\u0010\u001d\u001a\u0004\u0018\u00010\u001a8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u001b\u0010\u001cR\u0018\u0010!\u001a\u0004\u0018\u00010\u001e8\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u001f\u0010 ¨\u0006\""}, d2 = {"Lti/h;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lti/e;", "a", "Lti/e;", "batterySignals", "Lti/f;", "b", "Lti/f;", "browserSignals", "Lti/j;", "c", "Lti/j;", "memorySignals", "Lti/i;", "d", "Lti/i;", "deviceTierSignals", "Lti/k;", "e", "Lti/k;", "networkSignals", "Lti/m;", InneractiveMediationDefs.GENDER_FEMALE, "Lti/m;", "playStoreSignals", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "g", "Ljava/lang/String;", "buildName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "h", "Ljava/lang/Long;", "remainingDataPartitionSpaceKilobytes", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes.dex */
public final /* data */ class h {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @gn.c("battery")
    @JvmField
    @NotNull
    public final e batterySignals;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @gn.c("browser")
    @JvmField
    @NotNull
    public final f browserSignals;

    /* renamed from: c, reason: collision with root package name and from kotlin metadata */
    @gn.c("android_mem_info")
    @JvmField
    @NotNull
    public j memorySignals;

    /* renamed from: d, reason: collision with root package name and from kotlin metadata */
    @gn.c("device_tier")
    @JvmField
    @NotNull
    public final i deviceTierSignals;

    /* renamed from: e, reason: collision with root package name and from kotlin metadata */
    @gn.c("network")
    @JvmField
    @NotNull
    public final k networkSignals;

    /* renamed from: f, reason: collision with root package name and from kotlin metadata */
    @gn.c("play_store")
    @JvmField
    @NotNull
    public final m playStoreSignals;

    /* renamed from: g, reason: collision with root package name and from kotlin metadata */
    @gn.c("build")
    @JvmField
    @Nullable
    public String buildName;

    /* renamed from: h, reason: collision with root package name and from kotlin metadata */
    @gn.c("remaining_data_partition_space")
    @JvmField
    @Nullable
    public Long remainingDataPartitionSpaceKilobytes;

    public h() {
        this(0);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h)) {
            return false;
        }
        h hVar = (h) obj;
        return Intrinsics.b(this.batterySignals, hVar.batterySignals) && Intrinsics.b(this.browserSignals, hVar.browserSignals) && Intrinsics.b(this.memorySignals, hVar.memorySignals) && Intrinsics.b(this.deviceTierSignals, hVar.deviceTierSignals) && Intrinsics.b(this.networkSignals, hVar.networkSignals) && Intrinsics.b(this.playStoreSignals, hVar.playStoreSignals) && Intrinsics.b(this.buildName, hVar.buildName) && Intrinsics.b(this.remainingDataPartitionSpaceKilobytes, hVar.remainingDataPartitionSpaceKilobytes);
    }

    public final int hashCode() {
        int iHashCode = (this.playStoreSignals.hashCode() + ((this.networkSignals.hashCode() + ((this.deviceTierSignals.hashCode() + ((this.memorySignals.hashCode() + ((this.browserSignals.hashCode() + (this.batterySignals.hashCode() * 31)) * 31)) * 31)) * 31)) * 31)) * 31;
        String str = this.buildName;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        Long l9 = this.remainingDataPartitionSpaceKilobytes;
        return iHashCode2 + (l9 != null ? l9.hashCode() : 0);
    }

    public final String toString() {
        return "DeviceSignals(batterySignals=" + this.batterySignals + ", browserSignals=" + this.browserSignals + ", memorySignals=" + this.memorySignals + ", deviceTierSignals=" + this.deviceTierSignals + ", networkSignals=" + this.networkSignals + ", playStoreSignals=" + this.playStoreSignals + ", buildName=" + this.buildName + ", remainingDataPartitionSpaceKilobytes=" + this.remainingDataPartitionSpaceKilobytes + ")";
    }

    public h(int i5) {
        e eVar = new e(0);
        f fVar = new f(0);
        j jVar = new j(0);
        i iVar = new i(0);
        k kVar = new k(0);
        m mVar = new m(0);
        this.batterySignals = eVar;
        this.browserSignals = fVar;
        this.memorySignals = jVar;
        this.deviceTierSignals = iVar;
        this.networkSignals = kVar;
        this.playStoreSignals = mVar;
        this.buildName = null;
        this.remainingDataPartitionSpaceKilobytes = null;
    }
}
