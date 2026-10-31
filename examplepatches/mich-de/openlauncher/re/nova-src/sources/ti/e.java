package ti;

import kotlin.Metadata;
import kotlin.jvm.JvmField;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0010\u0006\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001R\u0016\u0010\u0005\u001a\u00020\u00028\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0003\u0010\u0004R\u0016\u0010\t\u001a\u00020\u00068\u0006@\u0006X\u0087\u000e¢\u0006\u0006\n\u0004\b\u0007\u0010\b¨\u0006\n"}, d2 = {"Lti/e;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "a", "Z", "isCharging", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "b", "D", "batteryLevel", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes.dex */
public final /* data */ class e {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @gn.c("is_charging")
    @JvmField
    public boolean isCharging;

    /* renamed from: b, reason: collision with root package name and from kotlin metadata */
    @gn.c("battery_level")
    @JvmField
    public double batteryLevel;

    public e() {
        this(0);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return this.isCharging == eVar.isCharging && Double.compare(this.batteryLevel, eVar.batteryLevel) == 0;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1, types: [int] */
    /* JADX WARN: Type inference failed for: r0v3 */
    /* JADX WARN: Type inference failed for: r0v4 */
    public final int hashCode() {
        boolean z11 = this.isCharging;
        ?? r02 = z11;
        if (z11) {
            r02 = 1;
        }
        return Double.hashCode(this.batteryLevel) + (r02 * 31);
    }

    public final String toString() {
        return "BatterySignals(isCharging=" + this.isCharging + ", batteryLevel=" + this.batteryLevel + ")";
    }

    public e(int i5) {
        this.isCharging = false;
        this.batteryLevel = 0.0d;
    }
}
