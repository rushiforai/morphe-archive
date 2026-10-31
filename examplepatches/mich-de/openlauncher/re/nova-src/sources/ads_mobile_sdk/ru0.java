package ads_mobile_sdk;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class ru0 extends pu0 {

    /* renamed from: c, reason: collision with root package name */
    public final int f9315c;

    /* renamed from: d, reason: collision with root package name */
    public final String f9316d;

    public ru0(String str, int i5) {
        super(wd1.f11217e);
        this.f9315c = i5;
        this.f9316d = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ru0)) {
            return false;
        }
        ru0 ru0Var = (ru0) obj;
        return this.f9315c == ru0Var.f9315c && Intrinsics.b(this.f9316d, ru0Var.f9316d);
    }

    public final int hashCode() {
        int iHashCode = Integer.hashCode(this.f9315c) * 31;
        String str = this.f9316d;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        return "HttpError(responseCode=" + this.f9315c + ", responseMessage=" + this.f9316d + ")";
    }
}
