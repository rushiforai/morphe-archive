package dv;

import b.c0;
import b.u4;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;

/* loaded from: classes4.dex */
public final class q {

    /* renamed from: a, reason: collision with root package name */
    public final String f49632a;

    /* renamed from: b, reason: collision with root package name */
    public final long f49633b;

    /* renamed from: c, reason: collision with root package name */
    public final long f49634c;

    /* renamed from: d, reason: collision with root package name */
    public final int f49635d;

    /* renamed from: e, reason: collision with root package name */
    public final String f49636e;

    /* renamed from: f, reason: collision with root package name */
    public final String f49637f;

    public q(int i5, long j11, long j12, String clientSecret, String str, String str2) {
        Intrinsics.g(clientSecret, "clientSecret");
        this.f49632a = clientSecret;
        this.f49633b = j11;
        this.f49634c = j12;
        this.f49635d = i5;
        this.f49636e = str;
        this.f49637f = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q)) {
            return false;
        }
        q qVar = (q) obj;
        return Intrinsics.b(this.f49632a, qVar.f49632a) && Duration.d(this.f49633b, qVar.f49633b) && Duration.d(this.f49634c, qVar.f49634c) && this.f49635d == qVar.f49635d && Intrinsics.b(this.f49636e, qVar.f49636e) && Intrinsics.b(this.f49637f, qVar.f49637f);
    }

    public final int hashCode() {
        int iHashCode = this.f49632a.hashCode() * 31;
        Duration.Companion companion = Duration.f72038b;
        int iA = u4.a(this.f49635d, c0.d(c0.d(iHashCode, 31, this.f49633b), 31, this.f49634c), 31);
        String str = this.f49636e;
        int iHashCode2 = (iA + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f49637f;
        return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        String strR = Duration.r(this.f49633b);
        String strR2 = Duration.r(this.f49634c);
        StringBuilder sbW = c0.w("Args(clientSecret=", this.f49632a, ", timeLimit=", strR, ", initialDelay=");
        sbW.append(strR2);
        sbW.append(", ctaText=");
        sbW.append(this.f49635d);
        sbW.append(", stripeAccountId=");
        return c0.s(sbW, this.f49636e, ", qrCodeUrl=", this.f49637f, ")");
    }
}
