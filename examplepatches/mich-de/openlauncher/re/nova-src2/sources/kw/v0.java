package kw;

import com.stripe.android.core.strings.IdentifierResolvableString;
import java.util.List;

/* loaded from: classes4.dex */
public final class v0 implements w0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f72700a;

    public v0(int i5) {
        this.f72700a = i5;
    }

    @Override // kw.w0
    public final List a() {
        return null;
    }

    @Override // kw.w0
    public final IdentifierResolvableString b() {
        return com.google.android.gms.internal.consent_sdk.k0.r(this);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof v0) && this.f72700a == ((v0) obj).f72700a;
    }

    @Override // kw.w0
    public final int getMessage() {
        return this.f72700a;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f72700a) * 31;
    }

    public final String toString() {
        return b.c0.i(this.f72700a, "Warning(message=", ", formatArgs=null)");
    }
}
