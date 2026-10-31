package ads_mobile_sdk;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class zu0 extends pu0 {

    /* renamed from: c, reason: collision with root package name */
    public final int f12666c;

    /* renamed from: d, reason: collision with root package name */
    public final String f12667d;

    /* renamed from: e, reason: collision with root package name */
    public final String f12668e;

    public zu0(int i5, String str, String str2) {
        super(wd1.f11217e);
        this.f12666c = i5;
        this.f12667d = str;
        this.f12668e = str2;
    }

    public final String c() {
        return this.f12667d;
    }

    public final int d() {
        return this.f12666c;
    }

    public final String e() {
        return this.f12668e;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zu0)) {
            return false;
        }
        zu0 zu0Var = (zu0) obj;
        return this.f12666c == zu0Var.f12666c && Intrinsics.b(this.f12667d, zu0Var.f12667d) && Intrinsics.b(this.f12668e, zu0Var.f12668e);
    }

    public final int hashCode() {
        int iHashCode = Integer.hashCode(this.f12666c) * 31;
        String str = this.f12667d;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f12668e;
        return iHashCode2 + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("WebError(errorCode=");
        sb2.append(this.f12666c);
        sb2.append(", description=");
        sb2.append(this.f12667d);
        sb2.append(", failingUrl=");
        return c0.q(sb2, this.f12668e, ")");
    }
}
