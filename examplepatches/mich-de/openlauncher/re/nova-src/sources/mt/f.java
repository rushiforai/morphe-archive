package mt;

import com.stripe.android.core.strings.ResolvableString;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class f implements i {

    /* renamed from: a, reason: collision with root package name */
    public final Throwable f76744a;

    /* renamed from: b, reason: collision with root package name */
    public final ResolvableString f76745b;

    /* renamed from: c, reason: collision with root package name */
    public final s f76746c;

    public f(Throwable cause, ResolvableString resolvableString, s sVar) {
        Intrinsics.g(cause, "cause");
        this.f76744a = cause;
        this.f76745b = resolvableString;
        this.f76746c = sVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f)) {
            return false;
        }
        f fVar = (f) obj;
        return Intrinsics.b(this.f76744a, fVar.f76744a) && Intrinsics.b(this.f76745b, fVar.f76745b) && Intrinsics.b(this.f76746c, fVar.f76746c);
    }

    public final int hashCode() {
        return this.f76746c.hashCode() + ((this.f76745b.hashCode() + (this.f76744a.hashCode() * 31)) * 31);
    }

    public final String toString() {
        return "Failed(cause=" + this.f76744a + ", message=" + this.f76745b + ", type=" + this.f76746c + ")";
    }
}
