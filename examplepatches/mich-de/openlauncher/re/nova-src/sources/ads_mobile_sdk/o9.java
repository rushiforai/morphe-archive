package ads_mobile_sdk;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class o9 {

    /* renamed from: a, reason: collision with root package name */
    public final q9 f7803a;

    /* renamed from: b, reason: collision with root package name */
    public final long f7804b;

    /* renamed from: c, reason: collision with root package name */
    public final ni.y f7805c;

    /* renamed from: d, reason: collision with root package name */
    public final String f7806d;

    public o9(q9 q9Var, long j11, ni.y yVar, String str) {
        this.f7803a = q9Var;
        this.f7804b = j11;
        this.f7805c = yVar;
        this.f7806d = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o9)) {
            return false;
        }
        o9 o9Var = (o9) obj;
        return this.f7803a == o9Var.f7803a && this.f7804b == o9Var.f7804b && this.f7805c == o9Var.f7805c && Intrinsics.b(this.f7806d, o9Var.f7806d);
    }

    public final int hashCode() {
        return this.f7806d.hashCode() + ((this.f7805c.hashCode() + c0.d(this.f7803a.hashCode() * 31, 31, this.f7804b)) * 31);
    }

    public final String toString() {
        return "AdValueParcel(type=" + this.f7803a + ", valueMicros=" + this.f7804b + ", precisionType=" + this.f7805c + ", currencyCode=" + this.f7806d + ")";
    }
}
