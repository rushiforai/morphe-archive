package ku;

import com.stripe.android.stripe3ds2.transaction.InitChallengeArgs;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f extends h {

    /* renamed from: a, reason: collision with root package name */
    public final InitChallengeArgs f72235a;

    public f(InitChallengeArgs initChallengeArgs) {
        this.f72235a = initChallengeArgs;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof f) && Intrinsics.b(this.f72235a, ((f) obj).f72235a);
    }

    public final int hashCode() {
        return this.f72235a.hashCode();
    }

    public final String toString() {
        return "StartChallenge(args=" + this.f72235a + ")";
    }
}
