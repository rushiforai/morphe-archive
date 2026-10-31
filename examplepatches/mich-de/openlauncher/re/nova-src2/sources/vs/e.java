package vs;

import b.c9;
import com.stripe.android.core.strings.ResolvableString;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class e {

    /* renamed from: a, reason: collision with root package name */
    public final String f92949a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f92950b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f92951c;

    /* renamed from: d, reason: collision with root package name */
    public final boolean f92952d;

    /* renamed from: e, reason: collision with root package name */
    public final g f92953e;

    /* renamed from: f, reason: collision with root package name */
    public final boolean f92954f;

    /* renamed from: g, reason: collision with root package name */
    public final ResolvableString f92955g;

    /* renamed from: h, reason: collision with root package name */
    public final String f92956h;

    public e(String merchantName, boolean z11, boolean z12, boolean z13, g signUpState, boolean z14, ResolvableString resolvableString, String str) {
        Intrinsics.g(merchantName, "merchantName");
        Intrinsics.g(signUpState, "signUpState");
        this.f92949a = merchantName;
        this.f92950b = z11;
        this.f92951c = z12;
        this.f92952d = z13;
        this.f92953e = signUpState;
        this.f92954f = z14;
        this.f92955g = resolvableString;
        this.f92956h = str;
    }

    public static e a(e eVar, boolean z11, g gVar, boolean z12, ResolvableString resolvableString, String str, int i5) {
        String merchantName = eVar.f92949a;
        if ((i5 & 2) != 0) {
            z11 = eVar.f92950b;
        }
        boolean z13 = z11;
        boolean z14 = eVar.f92951c;
        boolean z15 = eVar.f92952d;
        if ((i5 & 16) != 0) {
            gVar = eVar.f92953e;
        }
        g signUpState = gVar;
        if ((i5 & 32) != 0) {
            z12 = eVar.f92954f;
        }
        boolean z16 = z12;
        if ((i5 & 64) != 0) {
            resolvableString = eVar.f92955g;
        }
        ResolvableString resolvableString2 = resolvableString;
        if ((i5 & 128) != 0) {
            str = eVar.f92956h;
        }
        eVar.getClass();
        Intrinsics.g(merchantName, "merchantName");
        Intrinsics.g(signUpState, "signUpState");
        return new e(merchantName, z13, z14, z15, signUpState, z16, resolvableString2, str);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof e)) {
            return false;
        }
        e eVar = (e) obj;
        return Intrinsics.b(this.f92949a, eVar.f92949a) && this.f92950b == eVar.f92950b && this.f92951c == eVar.f92951c && this.f92952d == eVar.f92952d && this.f92953e == eVar.f92953e && this.f92954f == eVar.f92954f && Intrinsics.b(this.f92955g, eVar.f92955g) && Intrinsics.b(this.f92956h, eVar.f92956h);
    }

    public final int hashCode() {
        int iF = c9.f((this.f92953e.hashCode() + c9.f(c9.f(c9.f(this.f92949a.hashCode() * 31, 31, this.f92950b), 31, this.f92951c), 31, this.f92952d)) * 31, 31, this.f92954f);
        ResolvableString resolvableString = this.f92955g;
        int iHashCode = (iF + (resolvableString == null ? 0 : resolvableString.hashCode())) * 31;
        String str = this.f92956h;
        return iHashCode + (str != null ? str.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("SignUpScreenState(merchantName=");
        sb2.append(this.f92949a);
        sb2.append(", signUpEnabled=");
        sb2.append(this.f92950b);
        sb2.append(", requiresNameCollection=");
        a80.m.s(sb2, this.f92951c, ", canEditEmail=", this.f92952d, ", signUpState=");
        sb2.append(this.f92953e);
        sb2.append(", isSubmitting=");
        sb2.append(this.f92954f);
        sb2.append(", errorMessage=");
        sb2.append(this.f92955g);
        sb2.append(", suggestedEmail=");
        sb2.append(this.f92956h);
        sb2.append(")");
        return sb2.toString();
    }
}
