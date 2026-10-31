package bv;

import b.c0;
import com.stripe.android.core.strings.IdentifierResolvableString;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class o {

    /* renamed from: a, reason: collision with root package name */
    public final String f18642a;

    /* renamed from: b, reason: collision with root package name */
    public final String f18643b;

    /* renamed from: c, reason: collision with root package name */
    public final String f18644c;

    /* renamed from: d, reason: collision with root package name */
    public final String f18645d;

    /* renamed from: e, reason: collision with root package name */
    public final IdentifierResolvableString f18646e;

    /* renamed from: f, reason: collision with root package name */
    public final IdentifierResolvableString f18647f;

    /* renamed from: g, reason: collision with root package name */
    public final IdentifierResolvableString f18648g;

    public o(String email, String nameOnAccount, String sortCode, String accountNumber, IdentifierResolvableString identifierResolvableString, IdentifierResolvableString identifierResolvableString2, IdentifierResolvableString identifierResolvableString3) {
        Intrinsics.g(email, "email");
        Intrinsics.g(nameOnAccount, "nameOnAccount");
        Intrinsics.g(sortCode, "sortCode");
        Intrinsics.g(accountNumber, "accountNumber");
        this.f18642a = email;
        this.f18643b = nameOnAccount;
        this.f18644c = sortCode;
        this.f18645d = accountNumber;
        this.f18646e = identifierResolvableString;
        this.f18647f = identifierResolvableString2;
        this.f18648g = identifierResolvableString3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o)) {
            return false;
        }
        o oVar = (o) obj;
        return Intrinsics.b(this.f18642a, oVar.f18642a) && Intrinsics.b(this.f18643b, oVar.f18643b) && Intrinsics.b(this.f18644c, oVar.f18644c) && Intrinsics.b(this.f18645d, oVar.f18645d) && this.f18646e.equals(oVar.f18646e) && this.f18647f.equals(oVar.f18647f) && this.f18648g.equals(oVar.f18648g);
    }

    public final int hashCode() {
        return this.f18648g.hashCode() + ((this.f18647f.hashCode() + ((this.f18646e.hashCode() + c0.e(c0.e(c0.e(this.f18642a.hashCode() * 31, 31, this.f18643b), 31, this.f18644c), 31, this.f18645d)) * 31)) * 31);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("BacsMandateConfirmationViewState(email=", this.f18642a, ", nameOnAccount=", this.f18643b, ", sortCode=");
        c0.D(sbW, this.f18644c, ", accountNumber=", this.f18645d, ", payer=");
        sbW.append(this.f18646e);
        sbW.append(", supportAddressAsHtml=");
        sbW.append(this.f18647f);
        sbW.append(", debitGuaranteeAsHtml=");
        sbW.append(this.f18648g);
        sbW.append(")");
        return sbW.toString();
    }
}
