package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class vu0 extends pu0 {

    /* renamed from: c, reason: collision with root package name */
    public final String f10896c;

    /* renamed from: d, reason: collision with root package name */
    public final Throwable f10897d;

    public /* synthetic */ vu0(String str) {
        this(str, null);
    }

    @Override // ads_mobile_sdk.pu0
    public final Throwable b() {
        return this.f10897d;
    }

    public final String c() {
        return this.f10896c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof vu0)) {
            return false;
        }
        vu0 vu0Var = (vu0) obj;
        return Intrinsics.b(this.f10896c, vu0Var.f10896c) && Intrinsics.b(this.f10897d, vu0Var.f10897d);
    }

    public final int hashCode() {
        int iHashCode = this.f10896c.hashCode() * 31;
        Throwable th2 = this.f10897d;
        return iHashCode + (th2 == null ? 0 : th2.hashCode());
    }

    public final String toString() {
        return "NonRetryableNetworkError(message=" + this.f10896c + ", exception=" + this.f10897d + ")";
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vu0(String message, Throwable th2) {
        super(wd1.f11217e);
        Intrinsics.g(message, "message");
        this.f10896c = message;
        this.f10897d = th2;
    }
}
