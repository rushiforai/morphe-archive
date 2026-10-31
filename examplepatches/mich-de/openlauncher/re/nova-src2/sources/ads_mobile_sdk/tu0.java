package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class tu0 extends pu0 {

    /* renamed from: c, reason: collision with root package name */
    public final String f10084c;

    /* renamed from: d, reason: collision with root package name */
    public final wd1 f10085d;

    public /* synthetic */ tu0(String str) {
        this(str, wd1.f11213a);
    }

    @Override // ads_mobile_sdk.pu0
    public final wd1 a() {
        return this.f10085d;
    }

    public final String c() {
        return this.f10084c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof tu0)) {
            return false;
        }
        tu0 tu0Var = (tu0) obj;
        return Intrinsics.b(this.f10084c, tu0Var.f10084c) && this.f10085d == tu0Var.f10085d;
    }

    public final int hashCode() {
        return this.f10085d.hashCode() + (this.f10084c.hashCode() * 31);
    }

    public final String toString() {
        return "MessageError(message=" + this.f10084c + ", internalErrorCode=" + this.f10085d + ")";
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public tu0(String message, wd1 wd1Var) {
        super(wd1Var);
        Intrinsics.g(message, "message");
        this.f10084c = message;
        this.f10085d = wd1Var;
    }
}
