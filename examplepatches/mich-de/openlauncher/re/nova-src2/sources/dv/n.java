package dv;

import b.c0;
import b.u4;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;

/* loaded from: classes4.dex */
public final class n {

    /* renamed from: a, reason: collision with root package name */
    public final long f49621a;

    /* renamed from: b, reason: collision with root package name */
    public final int f49622b;

    /* renamed from: c, reason: collision with root package name */
    public final m f49623c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f49624d;

    public n(long j11, int i5, m pollingState, boolean z11) {
        Intrinsics.g(pollingState, "pollingState");
        this.f49621a = j11;
        this.f49622b = i5;
        this.f49623c = pollingState;
        this.f49624d = z11;
    }

    public static n a(n nVar, long j11, m mVar, boolean z11, int i5) {
        if ((i5 & 1) != 0) {
            j11 = nVar.f49621a;
        }
        long j12 = j11;
        int i11 = nVar.f49622b;
        if ((i5 & 4) != 0) {
            mVar = nVar.f49623c;
        }
        m pollingState = mVar;
        if ((i5 & 8) != 0) {
            z11 = nVar.f49624d;
        }
        nVar.getClass();
        Intrinsics.g(pollingState, "pollingState");
        return new n(j12, i11, pollingState, z11);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n)) {
            return false;
        }
        n nVar = (n) obj;
        return Duration.d(this.f49621a, nVar.f49621a) && this.f49622b == nVar.f49622b && this.f49623c == nVar.f49623c && this.f49624d == nVar.f49624d;
    }

    public final int hashCode() {
        Duration.Companion companion = Duration.f72038b;
        return Boolean.hashCode(this.f49624d) + ((this.f49623c.hashCode() + u4.a(this.f49622b, Long.hashCode(this.f49621a) * 31, 31)) * 31);
    }

    public final String toString() {
        StringBuilder sbV = c0.v("PollingUiState(durationRemaining=", this.f49622b, Duration.r(this.f49621a), ", ctaText=", ", pollingState=");
        sbV.append(this.f49623c);
        sbV.append(", shouldShowQrCode=");
        sbV.append(this.f49624d);
        sbV.append(")");
        return sbV.toString();
    }
}
