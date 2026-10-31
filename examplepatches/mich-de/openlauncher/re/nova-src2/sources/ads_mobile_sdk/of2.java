package ads_mobile_sdk;

import b.u1;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class of2 implements u1 {
    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        signals.isPictureInPictureAdRequest = Boolean.FALSE;
    }

    public final boolean equals(Object obj) {
        return this == obj || (obj instanceof of2);
    }

    public final int hashCode() {
        return 0;
    }

    public final String toString() {
        return "PictureInPictureAdSignal(isPipRequest=false)";
    }
}
