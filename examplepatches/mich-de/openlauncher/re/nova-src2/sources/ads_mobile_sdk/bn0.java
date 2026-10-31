package ads_mobile_sdk;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class bn0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f1469a;

    /* renamed from: b, reason: collision with root package name */
    public final String f1470b;

    /* renamed from: c, reason: collision with root package name */
    public final String f1471c;

    public bn0(String str, String str2, String firebaseAdEventId) {
        Intrinsics.g(firebaseAdEventId, "firebaseAdEventId");
        this.f1469a = str;
        this.f1470b = str2;
        this.f1471c = firebaseAdEventId;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof bn0)) {
            return false;
        }
        bn0 bn0Var = (bn0) obj;
        return Intrinsics.b(this.f1469a, bn0Var.f1469a) && Intrinsics.b(this.f1470b, bn0Var.f1470b) && Intrinsics.b(this.f1471c, bn0Var.f1471c);
    }

    public final int hashCode() {
        String str = this.f1469a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.f1470b;
        return this.f1471c.hashCode() + ((iHashCode + (str2 != null ? str2.hashCode() : 0)) * 31);
    }

    public final String toString() {
        return c0.q(c0.w("FirebaseAnalyticsIds(firebaseAppId=", this.f1469a, ", firebaseAppInstanceId=", this.f1470b, ", firebaseAdEventId="), this.f1471c, ")");
    }
}
