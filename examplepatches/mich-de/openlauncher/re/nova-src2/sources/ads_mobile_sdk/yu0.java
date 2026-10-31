package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.coroutines.TimeoutCancellationException;

/* loaded from: classes2.dex */
public final class yu0 extends pu0 {

    /* renamed from: c, reason: collision with root package name */
    public final String f12285c;

    /* renamed from: d, reason: collision with root package name */
    public final Throwable f12286d;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yu0(String message, Throwable th2) {
        super(wd1.f11222j);
        Intrinsics.g(message, "message");
        this.f12285c = message;
        this.f12286d = th2;
    }

    @Override // ads_mobile_sdk.pu0
    public final Throwable b() {
        return this.f12286d;
    }

    public final String c() {
        return this.f12285c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof yu0)) {
            return false;
        }
        yu0 yu0Var = (yu0) obj;
        return Intrinsics.b(this.f12285c, yu0Var.f12285c) && Intrinsics.b(this.f12286d, yu0Var.f12286d);
    }

    public final int hashCode() {
        int iHashCode = this.f12285c.hashCode() * 31;
        Throwable th2 = this.f12286d;
        return iHashCode + (th2 == null ? 0 : th2.hashCode());
    }

    public final String toString() {
        return "TimeoutError(message=" + this.f12285c + ", exception=" + this.f12286d + ")";
    }

    /* JADX WARN: 'this' call moved to the top of the method (can break code semantics) */
    public yu0(TimeoutCancellationException timeoutCancellationException, int i5) {
        this("Operation timed out.", (i5 & 2) != 0 ? null : timeoutCancellationException);
        sl0 sl0Var = sl0.f9598b;
    }
}
