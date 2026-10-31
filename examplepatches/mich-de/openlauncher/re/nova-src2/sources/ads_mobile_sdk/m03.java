package ads_mobile_sdk;

import b.u1;
import com.google.gson.Gson;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class m03 implements u1 {

    /* renamed from: a, reason: collision with root package name */
    public final List f6996a;

    public m03(List rtbAdapterDataList) {
        Intrinsics.g(rtbAdapterDataList, "rtbAdapterDataList");
        this.f6996a = rtbAdapterDataList;
    }

    @Override // b.u1
    public final void a(ti.p signals) {
        Intrinsics.g(signals, "signals");
        Gson gson = new Gson();
        List list = this.f6996a;
        signals.realTimeBiddingSignals = gson.toJson(list);
        signals.E0 = list;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof m03) && Intrinsics.b(this.f6996a, ((m03) obj).f6996a);
    }

    public final int hashCode() {
        return this.f6996a.hashCode();
    }

    public final String toString() {
        return "RtbSignal(rtbAdapterDataList=" + this.f6996a + ")";
    }
}
