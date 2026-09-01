package com.facebook;

import defpackage.f70;
import defpackage.f94;
import defpackage.ka4;
import defpackage.na4;
import java.security.SecureRandom;
import kotlin.Metadata;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0016\u0018\u00002\u00060\u0001j\u0002`\u0002¨\u0006\u0003"}, d2 = {"Lcom/facebook/FacebookException;", "Ljava/lang/RuntimeException;", "Lkotlin/RuntimeException;", "facebook-core_release"}, k = 1, mv = {1, 8, 0}, xi = 48)
public class FacebookException extends RuntimeException {
    public static final SecureRandom a = new SecureRandom();

    public FacebookException(String str) {
        super(str);
        if (str == null || !f94.q.get() || a.nextInt(100) <= 50) {
            return;
        }
        na4.a(new f70(20, str), ka4.ErrorReport);
    }

    @Override // java.lang.Throwable
    public String toString() {
        String message = getMessage();
        return message == null ? "" : message;
    }
}
