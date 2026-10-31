package ads_mobile_sdk;

import b.c0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;

/* loaded from: classes2.dex */
public final class jh3 {

    /* renamed from: a, reason: collision with root package name */
    public final int f5239a;

    /* renamed from: b, reason: collision with root package name */
    public final Integer f5240b;

    /* renamed from: c, reason: collision with root package name */
    public final long f5241c;

    /* renamed from: d, reason: collision with root package name */
    public final long f5242d;

    /* renamed from: e, reason: collision with root package name */
    public final im0 f5243e;

    public jh3(int i5, Integer num, long j11, long j12, im0 im0Var) {
        this.f5239a = i5;
        this.f5240b = num;
        this.f5241c = j11;
        this.f5242d = j12;
        this.f5243e = im0Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jh3)) {
            return false;
        }
        jh3 jh3Var = (jh3) obj;
        return this.f5239a == jh3Var.f5239a && Intrinsics.b(this.f5240b, jh3Var.f5240b) && Duration.d(this.f5241c, jh3Var.f5241c) && Duration.d(this.f5242d, jh3Var.f5242d) && this.f5243e == jh3Var.f5243e;
    }

    public final int hashCode() {
        int iHashCode = Integer.hashCode(this.f5239a) * 31;
        Integer num = this.f5240b;
        int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
        Duration.Companion companion = Duration.f72038b;
        return this.f5243e.hashCode() + c0.d(c0.d(iHashCode2, 31, this.f5241c), 31, this.f5242d);
    }

    public final String toString() {
        String strR = Duration.r(this.f5241c);
        String strR2 = Duration.r(this.f5242d);
        StringBuilder sb2 = new StringBuilder("ThrottleConfiguration(nofillsBeforeThrottle=");
        sb2.append(this.f5239a);
        sb2.append(", postThrottleNofillsBeforeThrottle=");
        sb2.append(this.f5240b);
        sb2.append(", nofillRetentionTime=");
        c0.D(sb2, strR, ", callbackDelay=", strR2, ", fillDefinition=");
        sb2.append(this.f5243e);
        sb2.append(")");
        return sb2.toString();
    }
}
