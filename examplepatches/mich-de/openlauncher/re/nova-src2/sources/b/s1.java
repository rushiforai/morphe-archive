package b;

import ads_mobile_sdk.mz;
import com.tiktok.util.TTConst;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes.dex */
public final class s1 extends c0.g2 {
    public static com.google.gson.r j(String str, mz mzVar) {
        com.google.gson.r rVar = new com.google.gson.r();
        rVar.s("bk", str);
        rVar.s("sk", str);
        rVar.q(Integer.valueOf(mzVar.f7383a), TTConst.TRACK_TYPE);
        return rVar;
    }

    public final String k() {
        com.google.gson.m mVar = new com.google.gson.m();
        mz mzVar = mz.f7379b;
        com.google.gson.r rVar = new com.google.gson.r();
        rVar.s("consent_key", "gad_has_consent_for_cookies");
        rVar.s("consent_value_match", "0");
        rVar.q(1, "consent_value_type");
        mVar.p(rVar);
        com.google.gson.r rVar2 = new com.google.gson.r();
        rVar2.s("consent_key", "IABTCF_gdprApplies");
        rVar2.s("consent_value_match", "1");
        rVar2.q(1, "consent_value_type");
        mVar.p(rVar2);
        Unit unit = Unit.f71706a;
        String string = mVar.toString();
        Intrinsics.f(string, "toString(...)");
        return (String) a("gads:full_consent_check_map", string, ads_mobile_sdk.u.a$7);
    }

    public final String l() {
        com.google.gson.m mVar = new com.google.gson.m();
        mz mzVar = mz.f7379b;
        mVar.p(j("IABTCF_AddtlConsent", mzVar));
        mVar.p(j("IABConsent_CMPPresent", mz.f7381d));
        mz mzVar2 = mz.f7380c;
        mVar.p(j("IABTCF_CmpSdkID", mzVar2));
        mVar.p(j("IABConsent_ConsentString", mzVar));
        mVar.p(j("IABTCF_gdprApplies", mzVar2));
        mVar.p(j("IABGPP_HDR_GppString", mzVar));
        mVar.p(j("IABGPP_GppSID", mzVar));
        mVar.p(j("gad_has_consent_for_cookies", mzVar2));
        mVar.p(j("IABConsent_ParsedPurposeConsents", mzVar));
        mVar.p(j("personalized_ad_status", mzVar));
        mVar.p(j("IABTCF_PolicyVersion", mzVar2));
        mVar.p(j("IABUSPrivacy_String", mzVar));
        mVar.p(j("IABTCF_PurposeConsents", mzVar));
        mVar.p(j("gad_rdp", mzVar2));
        mVar.p(j("IABConsent_SubjectToGDPR", mzVar));
        mVar.p(j("IABTCF_TCString", mzVar));
        mVar.p(j("IABConsent_ParsedVendorConsents", mzVar));
        mVar.p(j("UMP_eids", mzVar));
        Unit unit = Unit.f71706a;
        String string = mVar.toString();
        Intrinsics.f(string, "toString(...)");
        return (String) a("gads:sp:json_string", string, ads_mobile_sdk.u.a$7);
    }
}
