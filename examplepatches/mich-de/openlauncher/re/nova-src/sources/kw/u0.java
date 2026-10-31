package kw;

import com.stripe.android.core.strings.IdentifierResolvableString;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class u0 implements w0 {

    /* renamed from: a, reason: collision with root package name */
    public final int f72662a;

    /* renamed from: b, reason: collision with root package name */
    public final List f72663b;

    public u0(int i5, List list) {
        this.f72662a = i5;
        this.f72663b = list;
    }

    @Override // kw.w0
    public final List a() {
        return this.f72663b;
    }

    @Override // kw.w0
    public final IdentifierResolvableString b() {
        return com.google.android.gms.internal.consent_sdk.k0.r(this);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u0)) {
            return false;
        }
        u0 u0Var = (u0) obj;
        return this.f72662a == u0Var.f72662a && Intrinsics.b(this.f72663b, u0Var.f72663b);
    }

    @Override // kw.w0
    public final int getMessage() {
        return this.f72662a;
    }

    public final int hashCode() {
        int iHashCode = Integer.hashCode(this.f72662a) * 31;
        List list = this.f72663b;
        return iHashCode + (list == null ? 0 : list.hashCode());
    }

    public final String toString() {
        return "Error(message=" + this.f72662a + ", formatArgs=" + this.f72663b + ")";
    }
}
