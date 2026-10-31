package mt;

import com.stripe.android.core.strings.ResolvableString;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c0 implements e0 {

    /* renamed from: a, reason: collision with root package name */
    public final Throwable f76738a;

    /* renamed from: b, reason: collision with root package name */
    public final ResolvableString f76739b;

    /* renamed from: c, reason: collision with root package name */
    public final s f76740c;

    public c0(Throwable th2, ResolvableString message, s sVar) {
        Intrinsics.g(message, "message");
        this.f76738a = th2;
        this.f76739b = message;
        this.f76740c = sVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof c0)) {
            return false;
        }
        c0 c0Var = (c0) obj;
        return Intrinsics.b(this.f76738a, c0Var.f76738a) && Intrinsics.b(this.f76739b, c0Var.f76739b) && Intrinsics.b(this.f76740c, c0Var.f76740c);
    }

    public final int hashCode() {
        return this.f76740c.hashCode() + ((this.f76739b.hashCode() + (this.f76738a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        return "Fail(cause=" + this.f76738a + ", message=" + this.f76739b + ", errorType=" + this.f76740c + ")";
    }
}
