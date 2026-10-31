package bv;

import b.c0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final String f18635a;

    /* renamed from: b, reason: collision with root package name */
    public final String f18636b;

    /* renamed from: c, reason: collision with root package name */
    public final String f18637c;

    /* renamed from: d, reason: collision with root package name */
    public final String f18638d;

    public m(String email, String nameOnAccount, String sortCode, String accountNumber) {
        Intrinsics.g(email, "email");
        Intrinsics.g(nameOnAccount, "nameOnAccount");
        Intrinsics.g(sortCode, "sortCode");
        Intrinsics.g(accountNumber, "accountNumber");
        this.f18635a = email;
        this.f18636b = nameOnAccount;
        this.f18637c = sortCode;
        this.f18638d = accountNumber;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m)) {
            return false;
        }
        m mVar = (m) obj;
        return Intrinsics.b(this.f18635a, mVar.f18635a) && Intrinsics.b(this.f18636b, mVar.f18636b) && Intrinsics.b(this.f18637c, mVar.f18637c) && Intrinsics.b(this.f18638d, mVar.f18638d);
    }

    public final int hashCode() {
        return this.f18638d.hashCode() + c0.e(c0.e(this.f18635a.hashCode() * 31, 31, this.f18636b), 31, this.f18637c);
    }

    public final String toString() {
        return c0.s(c0.w("Args(email=", this.f18635a, ", nameOnAccount=", this.f18636b, ", sortCode="), this.f18637c, ", accountNumber=", this.f18638d, ")");
    }
}
