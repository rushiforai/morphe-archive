package ft;

import com.tiktok.appevents.contents.TTContentsEventConstants;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class s0 {

    /* renamed from: a, reason: collision with root package name */
    public final String f56021a;

    /* renamed from: b, reason: collision with root package name */
    public final String f56022b;

    /* renamed from: c, reason: collision with root package name */
    public final String f56023c;

    /* renamed from: d, reason: collision with root package name */
    public final String f56024d;

    /* renamed from: e, reason: collision with root package name */
    public final String f56025e;

    /* renamed from: f, reason: collision with root package name */
    public final Locale f56026f;

    /* renamed from: g, reason: collision with root package name */
    public final Long f56027g;

    /* renamed from: h, reason: collision with root package name */
    public final String f56028h;

    /* renamed from: i, reason: collision with root package name */
    public final String f56029i;

    /* renamed from: j, reason: collision with root package name */
    public final n f56030j;

    /* renamed from: k, reason: collision with root package name */
    public final String f56031k;

    /* renamed from: l, reason: collision with root package name */
    public final String f56032l;

    public s0(String email, String str, String str2, String countryInferringMethod, String str3, Locale locale, Long l9, String str4, String str5, n consentAction, String str6, String str7) {
        Intrinsics.g(email, "email");
        Intrinsics.g(countryInferringMethod, "countryInferringMethod");
        Intrinsics.g(consentAction, "consentAction");
        this.f56021a = email;
        this.f56022b = str;
        this.f56023c = str2;
        this.f56024d = countryInferringMethod;
        this.f56025e = str3;
        this.f56026f = locale;
        this.f56027g = l9;
        this.f56028h = str4;
        this.f56029i = str5;
        this.f56030j = consentAction;
        this.f56031k = str6;
        this.f56032l = str7;
    }

    public final Map a() {
        String lowerCase = this.f56021a.toLowerCase(Locale.ROOT);
        Intrinsics.f(lowerCase, "toLowerCase(...)");
        LinkedHashMap linkedHashMapK0 = MapsKt.k0(new Pair("email_address", lowerCase), new Pair("amount", this.f56027g), new Pair(TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, this.f56028h), new Pair("consent_action", this.f56030j.f55981a), new Pair("request_surface", this.f56029i), new Pair("country_inferring_method", this.f56024d));
        Locale locale = this.f56026f;
        if (locale != null) {
            linkedHashMapK0.put("locale", locale.toLanguageTag());
        }
        String str = this.f56022b;
        if (str != null) {
            if (r70.k.U0(str)) {
                str = null;
            }
            if (str != null) {
                linkedHashMapK0.put("phone_number", str);
            }
        }
        String str2 = this.f56023c;
        if (str2 != null) {
            if (r70.k.U0(str2)) {
                str2 = null;
            }
            if (str2 != null) {
                linkedHashMapK0.put("country", str2);
            }
        }
        String str3 = this.f56025e;
        if (str3 != null) {
            String str4 = r70.k.U0(str3) ? null : str3;
            if (str4 != null) {
                linkedHashMapK0.put("legal_name", str4);
            }
        }
        String str5 = this.f56031k;
        if (str5 != null) {
            linkedHashMapK0.put("android_verification_token", str5);
        }
        String str6 = this.f56032l;
        if (str6 != null) {
            linkedHashMapK0.put("app_id", str6);
        }
        linkedHashMapK0.putAll(b70.h.f17594a);
        return MapsKt.s0(linkedHashMapK0);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof s0)) {
            return false;
        }
        s0 s0Var = (s0) obj;
        return Intrinsics.b(this.f56021a, s0Var.f56021a) && Intrinsics.b(this.f56022b, s0Var.f56022b) && Intrinsics.b(this.f56023c, s0Var.f56023c) && Intrinsics.b(this.f56024d, s0Var.f56024d) && Intrinsics.b(this.f56025e, s0Var.f56025e) && Intrinsics.b(this.f56026f, s0Var.f56026f) && Intrinsics.b(this.f56027g, s0Var.f56027g) && Intrinsics.b(this.f56028h, s0Var.f56028h) && this.f56029i.equals(s0Var.f56029i) && this.f56030j == s0Var.f56030j && Intrinsics.b(this.f56031k, s0Var.f56031k) && Intrinsics.b(this.f56032l, s0Var.f56032l);
    }

    public final int hashCode() {
        int iHashCode = this.f56021a.hashCode() * 31;
        String str = this.f56022b;
        int iHashCode2 = (iHashCode + (str == null ? 0 : str.hashCode())) * 31;
        String str2 = this.f56023c;
        int iE = b.c0.e((iHashCode2 + (str2 == null ? 0 : str2.hashCode())) * 31, 31, this.f56024d);
        String str3 = this.f56025e;
        int iHashCode3 = (iE + (str3 == null ? 0 : str3.hashCode())) * 31;
        Locale locale = this.f56026f;
        int iHashCode4 = (iHashCode3 + (locale == null ? 0 : locale.hashCode())) * 31;
        Long l9 = this.f56027g;
        int iHashCode5 = (iHashCode4 + (l9 == null ? 0 : l9.hashCode())) * 31;
        String str4 = this.f56028h;
        int iHashCode6 = (this.f56030j.hashCode() + b.c0.e((iHashCode5 + (str4 == null ? 0 : str4.hashCode())) * 961, 31, this.f56029i)) * 31;
        String str5 = this.f56031k;
        int iHashCode7 = (iHashCode6 + (str5 == null ? 0 : str5.hashCode())) * 31;
        String str6 = this.f56032l;
        return iHashCode7 + (str6 != null ? str6.hashCode() : 0);
    }

    public final String toString() {
        StringBuilder sbW = b.c0.w("SignUpParams(email=", this.f56021a, ", phoneNumber=", this.f56022b, ", country=");
        b.c0.D(sbW, this.f56023c, ", countryInferringMethod=", this.f56024d, ", name=");
        sbW.append(this.f56025e);
        sbW.append(", locale=");
        sbW.append(this.f56026f);
        sbW.append(", amount=");
        sbW.append(this.f56027g);
        sbW.append(", currency=");
        sbW.append(this.f56028h);
        sbW.append(", incentiveEligibilitySession=null, requestSurface=");
        sbW.append(this.f56029i);
        sbW.append(", consentAction=");
        sbW.append(this.f56030j);
        sbW.append(", verificationToken=");
        return b.c0.s(sbW, this.f56031k, ", appId=", this.f56032l, ")");
    }
}
