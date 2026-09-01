package com.facebook;

import defpackage.b94;
import defpackage.if5;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
@Metadata(d1 = {"\u0000\n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001¨\u0006\u0002"}, d2 = {"Lcom/facebook/FacebookGraphResponseException;", "Lcom/facebook/FacebookException;", "facebook-core_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
public final class FacebookGraphResponseException extends FacebookException {
    public final if5 b;

    public FacebookGraphResponseException(if5 if5Var, String str) {
        super(str);
        this.b = if5Var;
    }

    @Override // com.facebook.FacebookException, java.lang.Throwable
    public final String toString() {
        b94 b94Var = this.b.c;
        StringBuilder sb = new StringBuilder("{FacebookGraphResponseException: ");
        String message = getMessage();
        if (message != null) {
            sb.append(message);
            sb.append(" ");
        }
        if (b94Var != null) {
            sb.append("httpResponseCode: ");
            sb.append(b94Var.a);
            sb.append(", facebookErrorCode: ");
            sb.append(b94Var.b);
            sb.append(", facebookErrorType: ");
            sb.append(b94Var.d);
            sb.append(", message: ");
            sb.append(b94Var.a());
            sb.append("}");
        }
        return sb.toString();
    }
}
