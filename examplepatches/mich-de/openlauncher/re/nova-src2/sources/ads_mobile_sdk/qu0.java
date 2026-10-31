package ads_mobile_sdk;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class qu0 extends pu0 {

    /* renamed from: c, reason: collision with root package name */
    public final Throwable f8811c;

    /* renamed from: d, reason: collision with root package name */
    public final wd1 f8812d;

    /* renamed from: e, reason: collision with root package name */
    public final String f8813e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public qu0(Throwable exception, wd1 internalErrorCode, String str) {
        super(internalErrorCode);
        Intrinsics.g(exception, "exception");
        Intrinsics.g(internalErrorCode, "internalErrorCode");
        this.f8811c = exception;
        this.f8812d = internalErrorCode;
        this.f8813e = str;
    }

    @Override // ads_mobile_sdk.pu0
    public final wd1 a() {
        return this.f8812d;
    }

    @Override // ads_mobile_sdk.pu0
    public final Throwable b() {
        return this.f8811c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qu0)) {
            return false;
        }
        qu0 qu0Var = (qu0) obj;
        return Intrinsics.b(this.f8811c, qu0Var.f8811c) && this.f8812d == qu0Var.f8812d && Intrinsics.b(this.f8813e, qu0Var.f8813e);
    }

    public final int hashCode() {
        int iHashCode = (this.f8812d.hashCode() + (this.f8811c.hashCode() * 31)) * 31;
        String str = this.f8813e;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("ExceptionError(exception=");
        sb2.append(this.f8811c);
        sb2.append(", internalErrorCode=");
        sb2.append(this.f8812d);
        sb2.append(", message=");
        return c0.q(sb2, this.f8813e, ")");
    }

    public /* synthetic */ qu0(Throwable th2, wd1 wd1Var, String str, int i5) {
        this(th2, (i5 & 2) != 0 ? wd1.f11213a : wd1Var, (i5 & 4) != 0 ? null : str);
    }
}
