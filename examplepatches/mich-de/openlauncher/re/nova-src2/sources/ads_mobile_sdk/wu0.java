package ads_mobile_sdk;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class wu0 extends pu0 {

    /* renamed from: c, reason: collision with root package name */
    public final String f11412c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public wu0(String message) {
        super(wd1.f11217e);
        Intrinsics.g(message, "message");
        this.f11412c = message;
    }

    public final String c() {
        return this.f11412c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof wu0) && Intrinsics.b(this.f11412c, ((wu0) obj).f11412c);
    }

    public final int hashCode() {
        return this.f11412c.hashCode();
    }

    public final String toString() {
        return c0.l("RedirectLimitError(message=", this.f11412c, ")");
    }
}
