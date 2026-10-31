package ou;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class t0 {

    /* renamed from: a, reason: collision with root package name */
    public static final t0 f80981a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ t0[] f80982b;

    static {
        t0 t0Var = new t0("OnSession", 0);
        t0 t0Var2 = new t0("OffSession", 1);
        f80981a = t0Var2;
        t0[] t0VarArr = {t0Var, t0Var2, new t0("None", 2)};
        f80982b = t0VarArr;
        EnumEntriesKt.a(t0VarArr);
    }

    public static t0 valueOf(String str) {
        return (t0) Enum.valueOf(t0.class, str);
    }

    public static t0[] values() {
        return (t0[]) f80982b.clone();
    }
}
