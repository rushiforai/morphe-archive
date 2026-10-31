package ft;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class v {

    /* renamed from: b, reason: collision with root package name */
    public static final v f56053b;

    /* renamed from: c, reason: collision with root package name */
    public static final v f56054c;

    /* renamed from: d, reason: collision with root package name */
    public static final v f56055d;

    /* renamed from: e, reason: collision with root package name */
    public static final v f56056e;

    /* renamed from: f, reason: collision with root package name */
    public static final v f56057f;

    /* renamed from: g, reason: collision with root package name */
    public static final v f56058g;

    /* renamed from: h, reason: collision with root package name */
    public static final v f56059h;

    /* renamed from: i, reason: collision with root package name */
    public static final v f56060i;

    /* renamed from: j, reason: collision with root package name */
    public static final /* synthetic */ v[] f56061j;

    /* renamed from: k, reason: collision with root package name */
    public static final /* synthetic */ i70.a f56062k;

    /* renamed from: a, reason: collision with root package name */
    public final String f56063a;

    static {
        v vVar = new v("ELEMENTS_DISABLE_FC_LITE", 0, "elements_disable_fc_lite");
        f56053b = vVar;
        v vVar2 = new v("ELEMENTS_PREFER_FC_LITE", 1, "elements_prefer_fc_lite");
        f56054c = vVar2;
        v vVar3 = new v("ELEMENTS_DISABLE_LINK_GLOBAL_HOLDBACK_LOOKUP", 2, "elements_disable_link_global_holdback_lookup");
        f56055d = vVar3;
        v vVar4 = new v("ELEMENTS_ENABLE_LINK_SPM", 3, "elements_enable_link_spm");
        f56056e = vVar4;
        v vVar5 = new v("ELEMENTS_ENABLE_PASSIVE_CAPTCHA", 4, "elements_enable_passive_captcha");
        f56057f = vVar5;
        v vVar6 = new v("ELEMENTS_MOBILE_FORCE_SETUP_FUTURE_USE_BEHAVIOR_AND_NEW_MANDATE_TEXT", 5, "elements_mobile_force_setup_future_use_behavior_and_new_mandate_text");
        f56058g = vVar6;
        v vVar7 = new v("ELEMENTS_MOBILE_ATTEST_ON_INTENT_CONFIRMATION", 6, "elements_mobile_attest_on_intent_confirmation");
        f56059h = vVar7;
        v vVar8 = new v("ELEMENTS_MOBILE_CARD_FUND_FILTERING", 7, "elements_mobile_card_funding_filtering");
        f56060i = vVar8;
        v[] vVarArr = {vVar, vVar2, vVar3, vVar4, vVar5, vVar6, vVar7, vVar8};
        f56061j = vVarArr;
        f56062k = EnumEntriesKt.a(vVarArr);
    }

    public v(String str, int i5, String str2) {
        this.f56063a = str2;
    }

    public static v valueOf(String str) {
        return (v) Enum.valueOf(v.class, str);
    }

    public static v[] values() {
        return (v[]) f56061j.clone();
    }
}
