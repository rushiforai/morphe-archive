package ft;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class n0 {

    /* renamed from: b, reason: collision with root package name */
    public static final b6.b f55982b;

    /* renamed from: c, reason: collision with root package name */
    public static final n0 f55983c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ n0[] f55984d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ i70.a f55985e;

    /* renamed from: a, reason: collision with root package name */
    public final String f55986a;

    static {
        n0 n0Var = new n0("Automatic", 0, "automatic");
        f55983c = n0Var;
        n0[] n0VarArr = {n0Var, new n0("Manual", 1, "manual")};
        f55984d = n0VarArr;
        f55985e = EnumEntriesKt.a(n0VarArr);
        f55982b = new b6.b();
    }

    public n0(String str, int i5, String str2) {
        this.f55986a = str2;
    }

    public static n0 valueOf(String str) {
        return (n0) Enum.valueOf(n0.class, str);
    }

    public static n0[] values() {
        return (n0[]) f55984d.clone();
    }
}
