package cs;

import com.stripe.hcaptcha.HCaptchaException;
import kotlin.Result;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j implements bx.a {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ t70.m f47823a;

    public j(t70.m mVar) {
        this.f47823a = mVar;
    }

    @Override // bx.a
    public final void b(HCaptchaException exception) {
        Intrinsics.g(exception, "exception");
        int i5 = Result.f71687b;
        this.f47823a.resumeWith(new s(exception));
    }
}
