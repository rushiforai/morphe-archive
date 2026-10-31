package is;

import com.stripe.android.core.strings.ResolvableString;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class c implements d {

    /* renamed from: a, reason: collision with root package name */
    public final ResolvableString f68017a;

    public c(ResolvableString error) {
        Intrinsics.g(error, "error");
        this.f68017a = error;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof c) && Intrinsics.b(this.f68017a, ((c) obj).f68017a);
    }

    public final int hashCode() {
        return this.f68017a.hashCode();
    }

    public final String toString() {
        return "Failed(error=" + this.f68017a + ")";
    }
}
