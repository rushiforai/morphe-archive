package y40;

import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class y {

    @NotNull
    public static final x Companion = new x();

    public final boolean equals(Object obj) {
        return this == obj || (obj instanceof y);
    }

    public final int hashCode() {
        return 0;
    }

    public final String toString() {
        return "MaxDailyBandwidthCap(maxCellularBytesPerDay=null, maxWifiBytesPerDay=null)";
    }
}
