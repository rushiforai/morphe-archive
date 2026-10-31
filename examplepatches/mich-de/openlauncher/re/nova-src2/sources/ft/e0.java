package ft;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class e0 {

    /* renamed from: b, reason: collision with root package name */
    public static final e0 f55935b;

    /* renamed from: c, reason: collision with root package name */
    public static final e0 f55936c;

    /* renamed from: d, reason: collision with root package name */
    public static final e0 f55937d;

    /* renamed from: e, reason: collision with root package name */
    public static final e0 f55938e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ e0[] f55939f;

    /* renamed from: a, reason: collision with root package name */
    public final String f55940a;

    static {
        e0 e0Var = new e0("LinkCardNotSupported", 0, "link_card_not_supported");
        f55935b = e0Var;
        e0 e0Var2 = new e0("DisabledInElementsSession", 1, "disabled_in_elements_session");
        f55936c = e0Var2;
        e0 e0Var3 = new e0("SignupOptInFeatureNoEmailProvided", 2, "signup_opt_in_feature_no_email_provided");
        f55937d = e0Var3;
        e0 e0Var4 = new e0("AttestationIssues", 3, "attestation_issues");
        e0 e0Var5 = new e0("LinkUsedBefore", 4, "link_used_before");
        f55938e = e0Var5;
        e0[] e0VarArr = {e0Var, e0Var2, e0Var3, e0Var4, e0Var5};
        f55939f = e0VarArr;
        EnumEntriesKt.a(e0VarArr);
    }

    public e0(String str, int i5, String str2) {
        this.f55940a = str2;
    }

    public static e0 valueOf(String str) {
        return (e0) Enum.valueOf(e0.class, str);
    }

    public static e0[] values() {
        return (e0[]) f55939f.clone();
    }
}
