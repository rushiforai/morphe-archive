package bv;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class p {

    /* renamed from: a, reason: collision with root package name */
    public final String f18649a;

    /* renamed from: b, reason: collision with root package name */
    public final String f18650b;

    /* renamed from: c, reason: collision with root package name */
    public final String f18651c;

    /* renamed from: d, reason: collision with root package name */
    public final String f18652d;

    public p(String str, String str2, String accountNumber, String sortCode) {
        Intrinsics.g(accountNumber, "accountNumber");
        Intrinsics.g(sortCode, "sortCode");
        this.f18649a = str;
        this.f18650b = str2;
        this.f18651c = accountNumber;
        this.f18652d = sortCode;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof p)) {
            return false;
        }
        p pVar = (p) obj;
        return Intrinsics.b(this.f18649a, pVar.f18649a) && Intrinsics.b(this.f18650b, pVar.f18650b) && Intrinsics.b(this.f18651c, pVar.f18651c) && Intrinsics.b(this.f18652d, pVar.f18652d);
    }

    public final int hashCode() {
        return this.f18652d.hashCode() + c0.e(c0.e(this.f18649a.hashCode() * 31, 31, this.f18650b), 31, this.f18651c);
    }

    public final String toString() {
        return c0.s(c0.w("BacsMandateData(name=", this.f18649a, ", email=", this.f18650b, ", accountNumber="), this.f18651c, ", sortCode=", this.f18652d, ")");
    }
}
