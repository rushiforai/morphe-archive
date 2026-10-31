package cy;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class e0 {

    /* renamed from: d, reason: collision with root package name */
    public static final h0 f48459d;

    /* renamed from: e, reason: collision with root package name */
    public static final e0 f48460e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ e0[] f48461f;

    /* renamed from: g, reason: collision with root package name */
    public static final /* synthetic */ i70.a f48462g;

    /* renamed from: a, reason: collision with root package name */
    public final String f48463a;

    /* renamed from: b, reason: collision with root package name */
    public final int f48464b;

    /* renamed from: c, reason: collision with root package name */
    public final m0 f48465c;

    static {
        l0 l0Var = l0.f48505c;
        e0 e0Var = new e0("NO_ADS", 0, "no_ads", 2132019070, l0Var);
        e0 e0Var2 = new e0("GESTURES", 1, "gestures", 2132019067, l0Var);
        e0 e0Var3 = new e0("HIDE_APPS", 2, "hide_apps", 2132019068, l0Var);
        e0 e0Var4 = new e0("CUSTOMIZATION", 3, "customization", 2132019064, l0Var);
        k0 k0Var = k0.f48502c;
        e0 e0Var5 = new e0("PRIME_INCLUDED", 4, "prime_included", 2132019073, k0Var);
        f48460e = e0Var5;
        e0[] e0VarArr = {e0Var, e0Var2, e0Var3, e0Var4, e0Var5, new e0("NOVA_AI", 5, "nova_ai", 2132019071, k0Var), new e0("AI_ASSISTANT", 6, "ai_assistant", 2132019062, k0Var)};
        f48461f = e0VarArr;
        f48462g = EnumEntriesKt.a(e0VarArr);
        f48459d = new h0();
    }

    public e0(String str, int i5, String str2, int i11, m0 m0Var) {
        this.f48463a = str2;
        this.f48464b = i11;
        this.f48465c = m0Var;
    }

    public static e0 valueOf(String str) {
        return (e0) Enum.valueOf(e0.class, str);
    }

    public static e0[] values() {
        return (e0[]) f48461f.clone();
    }

    public final int a() {
        return this.f48464b;
    }
}
