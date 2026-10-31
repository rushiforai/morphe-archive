package at;

import b.c0;
import b.c9;
import b.u4;
import com.stripe.android.core.strings.IdentifierResolvableString;
import com.stripe.android.core.strings.ResolvableString;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final ResolvableString f15656a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f15657b;

    /* renamed from: c, reason: collision with root package name */
    public final int f15658c;

    /* renamed from: d, reason: collision with root package name */
    public final Integer f15659d;

    /* renamed from: e, reason: collision with root package name */
    public final String f15660e;

    /* renamed from: f, reason: collision with root package name */
    public final String f15661f;

    /* renamed from: g, reason: collision with root package name */
    public final boolean f15662g;

    /* renamed from: h, reason: collision with root package name */
    public final String f15663h;

    /* renamed from: i, reason: collision with root package name */
    public final Integer f15664i;

    public a(ResolvableString displayName, boolean z11, int i5, Integer num, String str, String str2, boolean z12, String str3, Integer num2) {
        Intrinsics.g(displayName, "displayName");
        this.f15656a = displayName;
        this.f15657b = z11;
        this.f15658c = i5;
        this.f15659d = num;
        this.f15660e = str;
        this.f15661f = str2;
        this.f15662g = z12;
        this.f15663h = str3;
        this.f15664i = num2;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r11v7, types: [com.stripe.android.core.strings.ResolvableString] */
    public static a a(a aVar, IdentifierResolvableString identifierResolvableString, String str, int i5) {
        IdentifierResolvableString identifierResolvableString2 = identifierResolvableString;
        if ((i5 & 1) != 0) {
            identifierResolvableString2 = aVar.f15656a;
        }
        IdentifierResolvableString displayName = identifierResolvableString2;
        boolean z11 = (i5 & 2) != 0 ? aVar.f15657b : false;
        int i11 = aVar.f15658c;
        Integer num = aVar.f15659d;
        String str2 = aVar.f15660e;
        String str3 = aVar.f15661f;
        boolean z12 = aVar.f15662g;
        if ((i5 & 128) != 0) {
            str = aVar.f15663h;
        }
        Integer num2 = aVar.f15664i;
        aVar.getClass();
        Intrinsics.g(displayName, "displayName");
        return new a(displayName, z11, i11, num, str2, str3, z12, str, num2);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return Intrinsics.b(this.f15656a, aVar.f15656a) && this.f15657b == aVar.f15657b && this.f15658c == aVar.f15658c && Intrinsics.b(this.f15659d, aVar.f15659d) && Intrinsics.b(this.f15660e, aVar.f15660e) && Intrinsics.b(this.f15661f, aVar.f15661f) && this.f15662g == aVar.f15662g && Intrinsics.b(this.f15663h, aVar.f15663h) && Intrinsics.b(this.f15664i, aVar.f15664i);
    }

    public final int hashCode() {
        int iA = u4.a(this.f15658c, c9.f(this.f15656a.hashCode() * 31, 31, this.f15657b), 31);
        Integer num = this.f15659d;
        int iHashCode = (iA + (num == null ? 0 : num.hashCode())) * 31;
        String str = this.f15660e;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f15661f;
        int iF = c9.f((iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31, 31, this.f15662g);
        String str3 = this.f15663h;
        int iHashCode3 = (iF + (str3 == null ? 0 : str3.hashCode())) * 31;
        Integer num2 = this.f15664i;
        return iHashCode3 + (num2 != null ? num2.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("FormHeaderInformation(displayName=");
        sb2.append(this.f15656a);
        sb2.append(", shouldShowIcon=");
        sb2.append(this.f15657b);
        sb2.append(", iconResource=");
        sb2.append(this.f15658c);
        sb2.append(", iconResourceNight=");
        sb2.append(this.f15659d);
        sb2.append(", lightThemeIconUrl=");
        c0.D(sb2, this.f15660e, ", darkThemeIconUrl=", this.f15661f, ", iconRequiresTinting=");
        c9.s(", promoBadge=", this.f15663h, ", outlinedIconResource=", sb2, this.f15662g);
        sb2.append(this.f15664i);
        sb2.append(")");
        return sb2.toString();
    }
}
