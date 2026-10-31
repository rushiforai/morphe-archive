package cn;

import com.google.firebase.crashlytics.internal.common.CrashlyticsAppQualitySessionsSubscriber;
import java.util.concurrent.CountDownLatch;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final CountDownLatch f20131a;

    /* renamed from: b, reason: collision with root package name */
    public CrashlyticsAppQualitySessionsSubscriber f20132b = null;

    public a(CountDownLatch countDownLatch) {
        this.f20131a = countDownLatch;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return this.f20131a.equals(aVar.f20131a) && Intrinsics.b(this.f20132b, aVar.f20132b);
    }

    public final int hashCode() {
        int iHashCode = this.f20131a.hashCode() * 31;
        CrashlyticsAppQualitySessionsSubscriber crashlyticsAppQualitySessionsSubscriber = this.f20132b;
        return iHashCode + (crashlyticsAppQualitySessionsSubscriber == null ? 0 : crashlyticsAppQualitySessionsSubscriber.hashCode());
    }

    public final String toString() {
        return "Dependency(latch=" + this.f20131a + ", subscriber=" + this.f20132b + ')';
    }
}
