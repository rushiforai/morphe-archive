package kotlin.time;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.SinceKotlin;
import kotlin.WasExperimental;
import kotlin.time.Duration;

@SinceKotlin
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\b\u0087\b\u0018\u0000*\u0004\b\u0000\u0010\u00012\u00020\u0002¨\u0006\u0003"}, d2 = {"Lkotlin/time/TimedValue;", "T", b.f42142b, "kotlin-stdlib"}, k = 1, mv = {2, 1, 0}, xi = 48)
@WasExperimental
/* loaded from: classes5.dex */
public final /* data */ class TimedValue<T> {
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof TimedValue) && Duration.d(0L, 0L);
    }

    public final int hashCode() {
        Duration.Companion companion = Duration.f72038b;
        return Long.hashCode(0L);
    }

    public final String toString() {
        return "TimedValue(value=null, duration=" + ((Object) Duration.r(0L)) + ')';
    }
}
