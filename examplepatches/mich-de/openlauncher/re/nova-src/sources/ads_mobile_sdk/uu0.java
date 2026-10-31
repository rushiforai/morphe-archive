package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class uu0 extends pu0 {

    /* renamed from: c, reason: collision with root package name */
    public final String f10486c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f10487d;

    /* JADX WARN: Illegal instructions before constructor call */
    public uu0(String str, int i5) {
        if ((i5 & 1) != 0) {
            sl0 sl0Var = sl0.f9598b;
            str = "No fill.";
        }
        this(str, false);
    }

    public final String c() {
        return this.f10486c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof uu0)) {
            return false;
        }
        uu0 uu0Var = (uu0) obj;
        return Intrinsics.b(this.f10486c, uu0Var.f10486c) && this.f10487d == uu0Var.f10487d;
    }

    /* JADX WARN: Multi-variable type inference failed */
    public final int hashCode() {
        int iHashCode = this.f10486c.hashCode() * 31;
        boolean z11 = this.f10487d;
        int i5 = z11;
        if (z11 != 0) {
            i5 = 1;
        }
        return iHashCode + i5;
    }

    public final String toString() {
        return "NoFillError(message=" + this.f10486c + ", isThrottled=" + this.f10487d + ")";
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public uu0(String message, boolean z11) {
        super(wd1.f11215c);
        Intrinsics.g(message, "message");
        this.f10486c = message;
        this.f10487d = z11;
    }
}
