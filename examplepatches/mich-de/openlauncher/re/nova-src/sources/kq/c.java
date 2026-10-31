package kq;

import b.c0;
import com.stripe.android.model.PassiveCaptchaParams;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c {

    /* renamed from: a, reason: collision with root package name */
    public final PassiveCaptchaParams f72117a;

    /* renamed from: b, reason: collision with root package name */
    public final String f72118b;

    /* renamed from: c, reason: collision with root package name */
    public final Set f72119c;

    public c(PassiveCaptchaParams passiveCaptchaParams, String publishableKey, Set productUsage) {
        Intrinsics.g(passiveCaptchaParams, "passiveCaptchaParams");
        Intrinsics.g(publishableKey, "publishableKey");
        Intrinsics.g(productUsage, "productUsage");
        this.f72117a = passiveCaptchaParams;
        this.f72118b = publishableKey;
        this.f72119c = productUsage;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c)) {
            return false;
        }
        c cVar = (c) obj;
        return Intrinsics.b(this.f72117a, cVar.f72117a) && Intrinsics.b(this.f72118b, cVar.f72118b) && Intrinsics.b(this.f72119c, cVar.f72119c);
    }

    public final int hashCode() {
        return this.f72119c.hashCode() + c0.e(this.f72117a.hashCode() * 31, 31, this.f72118b);
    }

    public final String toString() {
        return "Args(passiveCaptchaParams=" + this.f72117a + ", publishableKey=" + this.f72118b + ", productUsage=" + this.f72119c + ")";
    }
}
