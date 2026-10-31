package d00;

import com.instabridge.mobilesdk.ClaimedProvider;
import com.instabridge.mobilesdk.JourneyState;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class r extends s {

    /* renamed from: a, reason: collision with root package name */
    public final JourneyState f48708a;

    /* renamed from: b, reason: collision with root package name */
    public final ClaimedProvider f48709b;

    public r(JourneyState journeyState, ClaimedProvider claimedProvider) {
        this.f48708a = journeyState;
        this.f48709b = claimedProvider;
    }

    public final JourneyState a() {
        return this.f48708a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r)) {
            return false;
        }
        r rVar = (r) obj;
        return this.f48708a == rVar.f48708a && Intrinsics.b(this.f48709b, rVar.f48709b);
    }

    public final int hashCode() {
        int iHashCode = this.f48708a.hashCode() * 31;
        ClaimedProvider claimedProvider = this.f48709b;
        return iHashCode + (claimedProvider == null ? 0 : claimedProvider.hashCode());
    }

    public final String toString() {
        return "Success(state=" + this.f48708a + ", claimedProvider=" + this.f48709b + ")";
    }
}
