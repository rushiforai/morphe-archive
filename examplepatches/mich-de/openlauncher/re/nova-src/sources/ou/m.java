package ou;

import com.stripe.android.core.strings.ResolvableString;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class m implements n {

    /* renamed from: a, reason: collision with root package name */
    public final ResolvableString f80930a;

    public m(ResolvableString resolvableString) {
        this.f80930a = resolvableString;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof m) && Intrinsics.b(this.f80930a, ((m) obj).f80930a);
    }

    public final int hashCode() {
        return this.f80930a.hashCode();
    }

    public final String toString() {
        return "MandateOnly(mandate=" + this.f80930a + ")";
    }
}
