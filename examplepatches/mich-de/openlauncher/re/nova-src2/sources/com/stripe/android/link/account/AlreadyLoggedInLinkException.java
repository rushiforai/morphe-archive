package com.stripe.android.link.account;

import com.stripe.android.core.exception.StripeException;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import ls.f;

@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0081\b\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/stripe/android/link/account/AlreadyLoggedInLinkException;", "Lcom/stripe/android/core/exception/StripeException;", "paymentsheet_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class AlreadyLoggedInLinkException extends StripeException {

    /* renamed from: f, reason: collision with root package name */
    public final String f42963f;

    /* renamed from: g, reason: collision with root package name */
    public final f f42964g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public AlreadyLoggedInLinkException(String str, f accountStatus) {
        super(0, 31, null, null, null, null);
        Intrinsics.g(accountStatus, "accountStatus");
        this.f42963f = str;
        this.f42964g = accountStatus;
    }

    @Override // com.stripe.android.core.exception.StripeException
    public final String a() {
        return "alreadyLoggedIntoLinkError";
    }

    @Override // com.stripe.android.core.exception.StripeException
    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof AlreadyLoggedInLinkException)) {
            return false;
        }
        AlreadyLoggedInLinkException alreadyLoggedInLinkException = (AlreadyLoggedInLinkException) obj;
        return Intrinsics.b(this.f42963f, alreadyLoggedInLinkException.f42963f) && Intrinsics.b(this.f42964g, alreadyLoggedInLinkException.f42964g);
    }

    @Override // com.stripe.android.core.exception.StripeException
    public final int hashCode() {
        String str = this.f42963f;
        return this.f42964g.hashCode() + ((str == null ? 0 : str.hashCode()) * 31);
    }

    @Override // com.stripe.android.core.exception.StripeException, java.lang.Throwable
    public final String toString() {
        return "AlreadyLoggedInLinkException(email=" + this.f42963f + ", accountStatus=" + this.f42964g + ")";
    }
}
