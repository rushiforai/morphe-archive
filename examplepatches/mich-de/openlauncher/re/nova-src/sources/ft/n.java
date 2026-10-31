package ft;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class n {

    /* renamed from: b, reason: collision with root package name */
    public static final n f55970b;

    /* renamed from: c, reason: collision with root package name */
    public static final n f55971c;

    /* renamed from: d, reason: collision with root package name */
    public static final n f55972d;

    /* renamed from: e, reason: collision with root package name */
    public static final n f55973e;

    /* renamed from: f, reason: collision with root package name */
    public static final n f55974f;

    /* renamed from: g, reason: collision with root package name */
    public static final n f55975g;

    /* renamed from: h, reason: collision with root package name */
    public static final n f55976h;

    /* renamed from: i, reason: collision with root package name */
    public static final n f55977i;

    /* renamed from: j, reason: collision with root package name */
    public static final n f55978j;

    /* renamed from: k, reason: collision with root package name */
    public static final n f55979k;

    /* renamed from: l, reason: collision with root package name */
    public static final /* synthetic */ n[] f55980l;

    /* renamed from: a, reason: collision with root package name */
    public final String f55981a;

    static {
        n nVar = new n("Checkbox", 0, "clicked_checkbox_nospm_mobile_v0");
        f55970b = nVar;
        n nVar2 = new n("CheckboxWithPrefilledEmail", 1, "clicked_checkbox_nospm_mobile_v0_0");
        f55971c = nVar2;
        n nVar3 = new n("CheckboxWithPrefilledEmailAndPhone", 2, "clicked_checkbox_nospm_mobile_v0_1");
        f55972d = nVar3;
        n nVar4 = new n("Implied", 3, "implied_consent_withspm_mobile_v0");
        f55973e = nVar4;
        n nVar5 = new n("ImpliedWithPrefilledEmail", 4, "implied_consent_withspm_mobile_v0_0");
        f55974f = nVar5;
        n nVar6 = new n("PrecheckedOptInBoxPrefilledAll", 5, "prechecked_opt_in_box_prefilled_all");
        f55975g = nVar6;
        n nVar7 = new n("PrecheckedOptInBoxPrefilledSome", 6, "prechecked_opt_in_box_prefilled_some");
        f55976h = nVar7;
        n nVar8 = new n("PrecheckedOptInBoxPrefilledNone", 7, "prechecked_opt_in_box_prefilled_none");
        f55977i = nVar8;
        n nVar9 = new n("SignUpOptInMobileChecked", 8, "sign_up_opt_in_mobile_checked");
        f55978j = nVar9;
        n nVar10 = new n("SignUpOptInMobilePrechecked", 9, "sign_up_opt_in_mobile_prechecked");
        f55979k = nVar10;
        n[] nVarArr = {nVar, nVar2, nVar3, nVar4, nVar5, nVar6, nVar7, nVar8, nVar9, nVar10, new n("EnteredPhoneNumberClickedSaveToLink", 10, "entered_phone_number_clicked_save_to_link")};
        f55980l = nVarArr;
        EnumEntriesKt.a(nVarArr);
    }

    public n(String str, int i5, String str2) {
        this.f55981a = str2;
    }

    public static n valueOf(String str) {
        return (n) Enum.valueOf(n.class, str);
    }

    public static n[] values() {
        return (n[]) f55980l.clone();
    }
}
