package ft;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class t0 {

    /* renamed from: b, reason: collision with root package name */
    public static final br.a f56033b;

    /* renamed from: c, reason: collision with root package name */
    public static final t0 f56034c;

    /* renamed from: d, reason: collision with root package name */
    public static final t0 f56035d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ t0[] f56036e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ i70.a f56037f;

    /* renamed from: a, reason: collision with root package name */
    public final String f56038a;

    static {
        t0 t0Var = new t0("Card", 0, "card");
        f56034c = t0Var;
        t0 t0Var2 = new t0("BankAccount", 1, "bank_account");
        f56035d = t0Var2;
        t0[] t0VarArr = {t0Var, t0Var2, new t0("Pii", 2, "pii"), new t0("Account", 3, "account"), new t0("CvcUpdate", 4, "cvc_update"), new t0("Person", 5, "person")};
        f56036e = t0VarArr;
        f56037f = EnumEntriesKt.a(t0VarArr);
        f56033b = new br.a(5);
    }

    public t0(String str, int i5, String str2) {
        this.f56038a = str2;
    }

    public static t0 valueOf(String str) {
        return (t0) Enum.valueOf(t0.class, str);
    }

    public static t0[] values() {
        return (t0[]) f56036e.clone();
    }
}
