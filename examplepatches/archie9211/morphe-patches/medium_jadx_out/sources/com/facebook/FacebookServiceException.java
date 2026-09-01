package com.facebook;

import defpackage.b94;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/facebook/FacebookServiceException;", "Lcom/facebook/FacebookException;", "facebook-core_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
public final class FacebookServiceException extends FacebookException {
    public final b94 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public FacebookServiceException(b94 b94Var, String str) {
        super(str);
        b94Var.getClass();
        this.b = b94Var;
    }

    @Override // com.facebook.FacebookException, java.lang.Throwable
    public final String toString() {
        StringBuilder sb = new StringBuilder("{FacebookServiceException: httpResponseCode: ");
        b94 b94Var = this.b;
        sb.append(b94Var.a);
        sb.append(", facebookErrorCode: ");
        sb.append(b94Var.b);
        sb.append(", facebookErrorType: ");
        sb.append(b94Var.d);
        sb.append(", message: ");
        sb.append(b94Var.a());
        sb.append("}");
        return sb.toString();
    }
}
