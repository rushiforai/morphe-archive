package bt;

import a80.m;
import b.c0;
import b.c9;
import b.u4;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.stripe.android.core.strings.IdentifierResolvableString;
import com.stripe.android.core.strings.ResolvableString;
import com.stripe.android.paymentsheet.model.PaymentMethodIncentive;
import com.stripe.android.ui.core.elements.SelectorIcon;
import com.stripe.android.ui.core.elements.SharedDataSpec;
import ct.j;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class g {

    /* renamed from: a, reason: collision with root package name */
    public final String f18480a;

    /* renamed from: b, reason: collision with root package name */
    public final String f18481b;

    /* renamed from: c, reason: collision with root package name */
    public final ResolvableString f18482c;

    /* renamed from: d, reason: collision with root package name */
    public final int f18483d;

    /* renamed from: e, reason: collision with root package name */
    public final Integer f18484e;

    /* renamed from: f, reason: collision with root package name */
    public final String f18485f;

    /* renamed from: g, reason: collision with root package name */
    public final String f18486g;

    /* renamed from: h, reason: collision with root package name */
    public final boolean f18487h;

    /* renamed from: i, reason: collision with root package name */
    public final ResolvableString f18488i;

    /* renamed from: j, reason: collision with root package name */
    public final Integer f18489j;

    /* JADX WARN: Illegal instructions before constructor call */
    public g(j paymentMethodDefinition, SharedDataSpec sharedDataSpec, int i5, int i11, Integer num, boolean z11, IdentifierResolvableString identifierResolvableString, Integer num2, int i12) {
        SelectorIcon selectorIcon;
        SelectorIcon selectorIcon2;
        String str = null;
        SharedDataSpec sharedDataSpec2 = (i12 & 2) != 0 ? null : sharedDataSpec;
        boolean z12 = (i12 & 32) != 0 ? false : z11;
        IdentifierResolvableString identifierResolvableString2 = (i12 & 64) != 0 ? null : identifierResolvableString;
        Integer num3 = (i12 & 128) != 0 ? null : num2;
        Intrinsics.g(paymentMethodDefinition, "paymentMethodDefinition");
        String str2 = paymentMethodDefinition.getType().f43655a;
        IdentifierResolvableString identifierResolvableStringG = zg.a.G(i5);
        String str3 = (sharedDataSpec2 == null || (selectorIcon2 = sharedDataSpec2.f45339c) == null) ? null : selectorIcon2.f45331a;
        if (sharedDataSpec2 != null && (selectorIcon = sharedDataSpec2.f45339c) != null) {
            str = selectorIcon.f45332b;
        }
        this(str2, identifierResolvableStringG, i11, num, str3, str, z12, identifierResolvableString2, num3, 2);
    }

    public final at.a a(PaymentMethodIncentive paymentMethodIncentive) {
        return new at.a(this.f18482c, true, this.f18483d, this.f18484e, this.f18485f, this.f18486g, this.f18487h, paymentMethodIncentive != null ? paymentMethodIncentive.f44798b : null, this.f18489j);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof g)) {
            return false;
        }
        g gVar = (g) obj;
        return Intrinsics.b(this.f18480a, gVar.f18480a) && Intrinsics.b(this.f18481b, gVar.f18481b) && Intrinsics.b(this.f18482c, gVar.f18482c) && this.f18483d == gVar.f18483d && Intrinsics.b(this.f18484e, gVar.f18484e) && Intrinsics.b(this.f18485f, gVar.f18485f) && Intrinsics.b(this.f18486g, gVar.f18486g) && this.f18487h == gVar.f18487h && Intrinsics.b(this.f18488i, gVar.f18488i) && Intrinsics.b(this.f18489j, gVar.f18489j);
    }

    public final int hashCode() {
        int iA = u4.a(this.f18483d, (this.f18482c.hashCode() + c0.e(this.f18480a.hashCode() * 31, 31, this.f18481b)) * 31, 31);
        Integer num = this.f18484e;
        int iHashCode = (iA + (num == null ? 0 : num.hashCode())) * 31;
        String str = this.f18485f;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f18486g;
        int iF = c9.f((iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31, 31, this.f18487h);
        ResolvableString resolvableString = this.f18488i;
        int iHashCode3 = (iF + (resolvableString == null ? 0 : resolvableString.hashCode())) * 31;
        Integer num2 = this.f18489j;
        return iHashCode3 + (num2 != null ? num2.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbW = c0.w("SupportedPaymentMethod(code=", this.f18480a, ", syntheticCode=", this.f18481b, ", displayName=");
        sbW.append(this.f18482c);
        sbW.append(", iconResource=");
        sbW.append(this.f18483d);
        sbW.append(", iconResourceNight=");
        sbW.append(this.f18484e);
        sbW.append(", lightThemeIconUrl=");
        sbW.append(this.f18485f);
        sbW.append(", darkThemeIconUrl=");
        m.q(this.f18486g, ", iconRequiresTinting=", ", subtitle=", sbW, this.f18487h);
        sbW.append(this.f18488i);
        sbW.append(", outlinedIconResource=");
        sbW.append(this.f18489j);
        sbW.append(")");
        return sbW.toString();
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public g(String code, String str, int i5, int i11, boolean z11, IdentifierResolvableString identifierResolvableString, int i12) {
        String syntheticCode = (i12 & 2) != 0 ? code : str;
        boolean z12 = (i12 & 32) != 0 ? false : z11;
        IdentifierResolvableString identifierResolvableString2 = (i12 & 256) != 0 ? null : identifierResolvableString;
        Integer num = (i12 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? null : 2131232249;
        Intrinsics.g(code, "code");
        Intrinsics.g(syntheticCode, "syntheticCode");
        this(code, syntheticCode, zg.a.G(i5), i11, (Integer) null, (String) null, (String) null, z12, identifierResolvableString2, num);
    }

    public /* synthetic */ g(String str, ResolvableString resolvableString, int i5, Integer num, String str2, String str3, boolean z11, ResolvableString resolvableString2, Integer num2, int i11) {
        this(str, str, resolvableString, i5, num, str2, str3, z11, (i11 & 256) != 0 ? null : resolvableString2, (i11 & EventBridgeChannel.QUEUE_CAPACITY) != 0 ? null : num2);
    }

    public g(String code, String syntheticCode, ResolvableString resolvableString, int i5, Integer num, String str, String str2, boolean z11, ResolvableString resolvableString2, Integer num2) {
        Intrinsics.g(code, "code");
        Intrinsics.g(syntheticCode, "syntheticCode");
        this.f18480a = code;
        this.f18481b = syntheticCode;
        this.f18482c = resolvableString;
        this.f18483d = i5;
        this.f18484e = num;
        this.f18485f = str;
        this.f18486g = str2;
        this.f18487h = z11;
        this.f18488i = resolvableString2;
        this.f18489j = num2;
    }
}
