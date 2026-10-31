package ti;

import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0010\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\b\u0087\b\u0018\u00002\u00020\u0001R\u0014\u0010\u0005\u001a\u00020\u00028\u0006X\u0087\u0004¢\u0006\u0006\n\u0004\b\u0003\u0010\u0004¨\u0006\u0006"}, d2 = {"Lti/n;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "Lti/d;", "a", "Lti/d;", "appStats", "ads-mobile-sdk_release"}, k = 1, mv = {1, 9, 0})
/* loaded from: classes.dex */
public final /* data */ class n {

    /* renamed from: a, reason: collision with root package name and from kotlin metadata */
    @gn.c("app")
    @JvmField
    @NotNull
    public final d appStats;

    public n(d appStats) {
        Intrinsics.g(appStats, "appStats");
        this.appStats = appStats;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof n) && Intrinsics.b(this.appStats, ((n) obj).appStats);
    }

    public final int hashCode() {
        return this.appStats.hashCode();
    }

    public final String toString() {
        return "QualitySignals(appStats=" + this.appStats + ")";
    }
}
