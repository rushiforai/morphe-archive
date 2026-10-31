package wu;

import com.stripe.android.core.strings.ResolvableString;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final ResolvableString f94697a;

    public g(ResolvableString message) {
        Intrinsics.g(message, "message");
        this.f94697a = message;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof g) && Intrinsics.b(this.f94697a, ((g) obj).f94697a);
    }

    public final int hashCode() {
        return this.f94697a.hashCode();
    }

    public final String toString() {
        return "UserErrorMessage(message=" + this.f94697a + ")";
    }
}
