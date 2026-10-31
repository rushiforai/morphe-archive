package com.stripe.hcaptcha;

import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import yw.c;

@Metadata(d1 = {"\u0000\u000e\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\b\u0087\b\u0018\u00002\u00060\u0001j\u0002`\u0002¨\u0006\u0003"}, d2 = {"Lcom/stripe/hcaptcha/HCaptchaException;", "Ljava/lang/Exception;", "Lkotlin/Exception;", "hcaptcha_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes4.dex */
public final /* data */ class HCaptchaException extends Exception {

    /* renamed from: a, reason: collision with root package name */
    public final c f45523a;

    /* renamed from: b, reason: collision with root package name */
    public final String f45524b;

    public HCaptchaException(c cVar) {
        this.f45523a = cVar;
        this.f45524b = null;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof HCaptchaException)) {
            return false;
        }
        HCaptchaException hCaptchaException = (HCaptchaException) obj;
        return this.f45523a == hCaptchaException.f45523a && Intrinsics.b(this.f45524b, hCaptchaException.f45524b);
    }

    @Override // java.lang.Throwable
    public final String getMessage() {
        String str = this.f45524b;
        return str == null ? this.f45523a.f97671b : str;
    }

    public final int hashCode() {
        int iHashCode = this.f45523a.hashCode() * 31;
        String str = this.f45524b;
        return iHashCode + (str == null ? 0 : str.hashCode());
    }

    @Override // java.lang.Throwable
    public final String toString() {
        return "HCaptchaException(hCaptchaError=" + this.f45523a + ", hCaptchaMessage=" + this.f45524b + ")";
    }

    public HCaptchaException(c cVar, String str) {
        this.f45523a = cVar;
        this.f45524b = str;
    }
}
