package tx;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class l4 {

    /* renamed from: a, reason: collision with root package name */
    public static final l4 f89868a;

    /* renamed from: b, reason: collision with root package name */
    public static final l4 f89869b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ l4[] f89870c;

    static {
        l4 l4Var = new l4("Both", 0);
        f89868a = l4Var;
        l4 l4Var2 = new l4("BackendOnly", 1);
        f89869b = l4Var2;
        l4[] l4VarArr = {l4Var, l4Var2, new l4("LocalOnly", 2)};
        f89870c = l4VarArr;
        EnumEntriesKt.a(l4VarArr);
    }

    public static l4 valueOf(String str) {
        return (l4) Enum.valueOf(l4.class, str);
    }

    public static l4[] values() {
        return (l4[]) f89870c.clone();
    }
}
