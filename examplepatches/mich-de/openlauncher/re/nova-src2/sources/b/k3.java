package b;

import ads_mobile_sdk.jn;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationUnit;

/* loaded from: classes2.dex */
public final class k3 extends c0.g2 {
    public final long j() {
        Duration.Companion companion = Duration.f72038b;
        return ((Duration) a("gads:js_eng_full_load:timeout_millis", ed.k(60, DurationUnit.f72046e, "gads:js_eng_full_load:timeout_millis"), ads_mobile_sdk.u.a$1)).f72041a;
    }

    public final List k() {
        List defaultValue = ul.b.Q("/noop", "/updateActiveView", "/trackActiveViewUnit", "/jsLoaded", "/impressionRecorded", "/refresh", "/requestReload", "/navigation", "/closeStoreOverlay", "/instrument");
        Intrinsics.g(defaultValue, "defaultValue");
        return (List) a("gads:missing_gmsg_handlers_to_ignore", defaultValue, jn.a$20);
    }

    public final String l() {
        return (String) a("gads:sdk_core_constants:experiment_id", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, ads_mobile_sdk.u.a$7);
    }
}
