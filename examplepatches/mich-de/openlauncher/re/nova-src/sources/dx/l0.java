package dx;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class l0 {

    /* renamed from: a, reason: collision with root package name */
    public static final l0 f49741a;

    /* renamed from: b, reason: collision with root package name */
    public static final l0 f49742b;

    /* renamed from: c, reason: collision with root package name */
    public static final l0 f49743c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ l0[] f49744d;

    static {
        l0 l0Var = new l0("SMALL", 0);
        f49741a = l0Var;
        l0 l0Var2 = new l0("MEDIUM", 1);
        f49742b = l0Var2;
        l0 l0Var3 = new l0("LARGE", 2);
        f49743c = l0Var3;
        l0[] l0VarArr = {l0Var, l0Var2, l0Var3};
        f49744d = l0VarArr;
        EnumEntriesKt.a(l0VarArr);
    }

    public static l0 valueOf(String str) {
        return (l0) Enum.valueOf(l0.class, str);
    }

    public static l0[] values() {
        return (l0[]) f49744d.clone();
    }
}
