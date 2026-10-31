package bu;

import b.c9;
import com.stripe.android.core.strings.ResolvableString;
import hv.e3;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class u {

    /* renamed from: a, reason: collision with root package name */
    public final ResolvableString f18589a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f18590b;

    /* renamed from: c, reason: collision with root package name */
    public final e3 f18591c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f18592d;

    /* renamed from: e, reason: collision with root package name */
    public final boolean f18593e;

    /* renamed from: f, reason: collision with root package name */
    public final ResolvableString f18594f;

    /* renamed from: g, reason: collision with root package name */
    public final ResolvableString f18595g;

    public u(ResolvableString resolvableString, boolean z11, e3 e3Var, boolean z12, boolean z13, ResolvableString resolvableString2, ResolvableString resolvableString3) {
        this.f18589a = resolvableString;
        this.f18590b = z11;
        this.f18591c = e3Var;
        this.f18592d = z12;
        this.f18593e = z13;
        this.f18594f = resolvableString2;
        this.f18595g = resolvableString3;
    }

    public static u a(u uVar, ResolvableString resolvableString, boolean z11, e3 e3Var, boolean z12, ResolvableString resolvableString2, ResolvableString resolvableString3, int i5) {
        if ((i5 & 1) != 0) {
            resolvableString = uVar.f18589a;
        }
        ResolvableString resolvableString4 = resolvableString;
        if ((i5 & 2) != 0) {
            z11 = uVar.f18590b;
        }
        boolean z13 = z11;
        if ((i5 & 4) != 0) {
            e3Var = uVar.f18591c;
        }
        e3 e3Var2 = e3Var;
        if ((i5 & 8) != 0) {
            z12 = uVar.f18592d;
        }
        boolean z14 = z12;
        boolean z15 = uVar.f18593e;
        if ((i5 & 32) != 0) {
            resolvableString2 = uVar.f18594f;
        }
        ResolvableString resolvableString5 = resolvableString2;
        if ((i5 & 64) != 0) {
            resolvableString3 = uVar.f18595g;
        }
        uVar.getClass();
        return new u(resolvableString4, z13, e3Var2, z14, z15, resolvableString5, resolvableString3);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof u)) {
            return false;
        }
        u uVar = (u) obj;
        return Intrinsics.b(this.f18589a, uVar.f18589a) && this.f18590b == uVar.f18590b && Intrinsics.b(this.f18591c, uVar.f18591c) && this.f18592d == uVar.f18592d && this.f18593e == uVar.f18593e && Intrinsics.b(this.f18594f, uVar.f18594f) && Intrinsics.b(this.f18595g, uVar.f18595g);
    }

    public final int hashCode() {
        int iF = c9.f(c9.f((this.f18591c.hashCode() + c9.f(this.f18589a.hashCode() * 31, 31, this.f18590b)) * 31, 31, this.f18592d), 31, this.f18593e);
        ResolvableString resolvableString = this.f18594f;
        int iHashCode = (iF + (resolvableString == null ? 0 : resolvableString.hashCode())) * 31;
        ResolvableString resolvableString2 = this.f18595g;
        return iHashCode + (resolvableString2 != null ? resolvableString2.hashCode() : 0);
    }

    public final String toString() {
        return "State(primaryButtonLabel=" + this.f18589a + ", isEnabled=" + this.f18590b + ", processingState=" + this.f18591c + ", isProcessing=" + this.f18592d + ", shouldDisplayLockIcon=" + this.f18593e + ", error=" + this.f18594f + ", mandateText=" + this.f18595g + ")";
    }
}
