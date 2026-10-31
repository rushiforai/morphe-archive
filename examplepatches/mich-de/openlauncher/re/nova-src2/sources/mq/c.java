package mq;

import b.c0;
import com.stripe.android.model.PassiveCaptchaParams;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final PassiveCaptchaParams f76605a;

    /* renamed from: b, reason: collision with root package name */
    public final String f76606b;

    /* renamed from: c, reason: collision with root package name */
    public final Set f76607c;

    public c(PassiveCaptchaParams passiveCaptchaParams, String str, Set productUsage) {
        Intrinsics.g(passiveCaptchaParams, "passiveCaptchaParams");
        Intrinsics.g(productUsage, "productUsage");
        this.f76605a = passiveCaptchaParams;
        this.f76606b = str;
        this.f76607c = productUsage;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Intrinsics.b(this.f76605a, cVar.f76605a) && Intrinsics.b(this.f76606b, cVar.f76606b) && Intrinsics.b(this.f76607c, cVar.f76607c);
    }

    public final int hashCode() {
        return this.f76607c.hashCode() + c0.e(this.f76605a.hashCode() * 31, 31, this.f76606b);
    }

    public final String toString() {
        return "Args(passiveCaptchaParams=" + this.f76605a + ", publishableKey=" + this.f76606b + ", productUsage=" + this.f76607c + ")";
    }
}
