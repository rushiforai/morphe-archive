package cs;

import com.stripe.hcaptcha.HCaptchaException;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class k implements Function2 {

    /* renamed from: a, reason: collision with root package name */
    public static final k f47824a = new k();

    @Override // kotlin.jvm.functions.Function2
    public final Object invoke(Object obj, Object obj2) {
        HCaptchaException exception = (HCaptchaException) obj2;
        Intrinsics.g((zw.c) obj, "<unused var>");
        Intrinsics.g(exception, "exception");
        return Boolean.valueOf(exception.f45523a == yw.c.f97663d);
    }
}
