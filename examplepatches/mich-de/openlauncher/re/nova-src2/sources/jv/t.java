package jv;

import b.c9;
import b.u4;
import com.stripe.android.core.strings.IdentifierResolvableString;
import com.stripe.android.core.strings.ResolvableString;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class t {

    /* renamed from: a, reason: collision with root package name */
    public final String f70158a;

    /* renamed from: b, reason: collision with root package name */
    public final String f70159b;

    /* renamed from: c, reason: collision with root package name */
    public final ResolvableString f70160c;

    /* renamed from: d, reason: collision with root package name */
    public final int f70161d;

    /* renamed from: e, reason: collision with root package name */
    public final Integer f70162e;

    /* renamed from: f, reason: collision with root package name */
    public final String f70163f;

    /* renamed from: g, reason: collision with root package name */
    public final String f70164g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f70165h;

    /* renamed from: i, reason: collision with root package name */
    public final ResolvableString f70166i;

    /* renamed from: j, reason: collision with root package name */
    public final String f70167j;

    /* renamed from: k, reason: collision with root package name */
    public final Function0 f70168k;

    /* renamed from: l, reason: collision with root package name */
    public final Integer f70169l;

    public /* synthetic */ t(String str, IdentifierResolvableString identifierResolvableString, int i5, ResolvableString resolvableString, Function0 function0) {
        this(str, str, identifierResolvableString, i5, null, null, null, false, resolvableString, null, function0, null);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t)) {
            return false;
        }
        t tVar = (t) obj;
        return Intrinsics.b(this.f70158a, tVar.f70158a) && Intrinsics.b(this.f70159b, tVar.f70159b) && Intrinsics.b(this.f70160c, tVar.f70160c) && this.f70161d == tVar.f70161d && Intrinsics.b(this.f70162e, tVar.f70162e) && Intrinsics.b(this.f70163f, tVar.f70163f) && Intrinsics.b(this.f70164g, tVar.f70164g) && this.f70165h == tVar.f70165h && Intrinsics.b(this.f70166i, tVar.f70166i) && Intrinsics.b(this.f70167j, tVar.f70167j) && Intrinsics.b(this.f70168k, tVar.f70168k) && Intrinsics.b(this.f70169l, tVar.f70169l);
    }

    public final int hashCode() {
        int iA = u4.a(this.f70161d, (this.f70160c.hashCode() + b.c0.e(this.f70158a.hashCode() * 31, 31, this.f70159b)) * 31, 31);
        Integer num = this.f70162e;
        int iHashCode = (iA + (num == null ? 0 : num.hashCode())) * 31;
        String str = this.f70163f;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f70164g;
        int iF = c9.f((iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31, 31, this.f70165h);
        ResolvableString resolvableString = this.f70166i;
        int iHashCode3 = (iF + (resolvableString == null ? 0 : resolvableString.hashCode())) * 31;
        String str3 = this.f70167j;
        int iHashCode4 = (this.f70168k.hashCode() + ((iHashCode3 + (str3 == null ? 0 : str3.hashCode())) * 31)) * 31;
        Integer num2 = this.f70169l;
        return iHashCode4 + (num2 != null ? num2.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("DisplayablePaymentMethod(code=", this.f70158a, ", syntheticCode=", this.f70159b, ", displayName=");
        sbW.append(this.f70160c);
        sbW.append(", iconResource=");
        sbW.append(this.f70161d);
        sbW.append(", iconResourceNight=");
        sbW.append(this.f70162e);
        sbW.append(", lightThemeIconUrl=");
        sbW.append(this.f70163f);
        sbW.append(", darkThemeIconUrl=");
        a80.m.q(this.f70164g, ", iconRequiresTinting=", ", subtitle=", sbW, this.f70165h);
        sbW.append(this.f70166i);
        sbW.append(", promoBadge=");
        sbW.append(this.f70167j);
        sbW.append(", onClick=");
        sbW.append(this.f70168k);
        sbW.append(", outlinedIconResource=");
        sbW.append(this.f70169l);
        sbW.append(")");
        return sbW.toString();
    }

    public t(String code, String syntheticCode, ResolvableString displayName, int i5, Integer num, String str, String str2, boolean z11, ResolvableString resolvableString, String str3, Function0 function0, Integer num2) {
        Intrinsics.g(code, "code");
        Intrinsics.g(syntheticCode, "syntheticCode");
        Intrinsics.g(displayName, "displayName");
        this.f70158a = code;
        this.f70159b = syntheticCode;
        this.f70160c = displayName;
        this.f70161d = i5;
        this.f70162e = num;
        this.f70163f = str;
        this.f70164g = str2;
        this.f70165h = z11;
        this.f70166i = resolvableString;
        this.f70167j = str3;
        this.f70168k = function0;
        this.f70169l = num2;
    }
}
