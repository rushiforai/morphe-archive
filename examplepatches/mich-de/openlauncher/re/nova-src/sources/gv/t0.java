package gv;

import com.stripe.android.core.strings.ResolvableString;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class t0 implements v0 {

    /* renamed from: a, reason: collision with root package name */
    public final ResolvableString f57945a;

    public t0(ResolvableString resolvableString) {
        this.f57945a = resolvableString;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof t0) && Intrinsics.b(this.f57945a, ((t0) obj).f57945a);
    }

    public final int hashCode() {
        ResolvableString resolvableString = this.f57945a;
        if (resolvableString == null) {
            return 0;
        }
        return resolvableString.hashCode();
    }

    public final String toString() {
        return "Idle(error=" + this.f57945a + ")";
    }
}
