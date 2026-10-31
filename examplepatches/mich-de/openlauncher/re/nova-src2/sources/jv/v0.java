package jv;

import b.c9;
import com.stripe.android.core.strings.ResolvableString;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class v0 {

    /* renamed from: a, reason: collision with root package name */
    public final List f70177a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f70178b;

    /* renamed from: c, reason: collision with root package name */
    public final u0 f70179c;

    /* renamed from: d, reason: collision with root package name */
    public final ou.j f70180d;

    /* renamed from: e, reason: collision with root package name */
    public final r0 f70181e;

    /* renamed from: f, reason: collision with root package name */
    public final ResolvableString f70182f;

    public v0(List displayablePaymentMethods, boolean z11, u0 u0Var, ou.j jVar, r0 availableSavedPaymentMethodAction, ResolvableString resolvableString) {
        Intrinsics.g(displayablePaymentMethods, "displayablePaymentMethods");
        Intrinsics.g(availableSavedPaymentMethodAction, "availableSavedPaymentMethodAction");
        this.f70177a = displayablePaymentMethods;
        this.f70178b = z11;
        this.f70179c = u0Var;
        this.f70180d = jVar;
        this.f70181e = availableSavedPaymentMethodAction;
        this.f70182f = resolvableString;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof v0)) {
            return false;
        }
        v0 v0Var = (v0) obj;
        return Intrinsics.b(this.f70177a, v0Var.f70177a) && this.f70178b == v0Var.f70178b && Intrinsics.b(this.f70179c, v0Var.f70179c) && Intrinsics.b(this.f70180d, v0Var.f70180d) && this.f70181e == v0Var.f70181e && Intrinsics.b(this.f70182f, v0Var.f70182f);
    }

    public final int hashCode() {
        int iF = c9.f(this.f70177a.hashCode() * 31, 31, this.f70178b);
        u0 u0Var = this.f70179c;
        int iHashCode = (iF + (u0Var == null ? 0 : u0Var.hashCode())) * 31;
        ou.j jVar = this.f70180d;
        int iHashCode2 = (this.f70181e.hashCode() + ((iHashCode + (jVar == null ? 0 : jVar.hashCode())) * 31)) * 31;
        ResolvableString resolvableString = this.f70182f;
        return iHashCode2 + (resolvableString != null ? resolvableString.hashCode() : 0);
    }

    public final String toString() {
        return "State(displayablePaymentMethods=" + this.f70177a + ", isProcessing=" + this.f70178b + ", selection=" + this.f70179c + ", displayedSavedPaymentMethod=" + this.f70180d + ", availableSavedPaymentMethodAction=" + this.f70181e + ", mandate=" + this.f70182f + ")";
    }
}
