package wu;

import com.stripe.android.core.strings.ResolvableString;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final ResolvableString f94687a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f94688b;

    public b(ResolvableString resolvableString, boolean z11) {
        this.f94687a = resolvableString;
        this.f94688b = z11;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return Intrinsics.b(this.f94687a, bVar.f94687a) && this.f94688b == bVar.f94688b;
    }

    public final int hashCode() {
        ResolvableString resolvableString = this.f94687a;
        return Boolean.hashCode(this.f94688b) + ((resolvableString == null ? 0 : resolvableString.hashCode()) * 31);
    }

    public final String toString() {
        return "MandateText(text=" + this.f94687a + ", showAbovePrimaryButton=" + this.f94688b + ")";
    }
}
