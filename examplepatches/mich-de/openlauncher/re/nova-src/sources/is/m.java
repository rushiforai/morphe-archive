package is;

import com.stripe.android.core.strings.ResolvableString;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m implements o {

    /* renamed from: a, reason: collision with root package name */
    public final ResolvableString f68049a;

    public m(ResolvableString message) {
        Intrinsics.g(message, "message");
        this.f68049a = message;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof m) && Intrinsics.b(this.f68049a, ((m) obj).f68049a);
    }

    public final int hashCode() {
        return this.f68049a.hashCode();
    }

    public final String toString() {
        return "Failed(message=" + this.f68049a + ")";
    }
}
