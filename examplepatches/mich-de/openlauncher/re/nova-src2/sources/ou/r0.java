package ou;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class r0 {

    /* renamed from: a, reason: collision with root package name */
    public static final l f80968a;

    /* renamed from: b, reason: collision with root package name */
    public static final r0 f80969b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ r0[] f80970c;

    static {
        r0 r0Var = new r0("Filled", 0);
        r0[] r0VarArr = {r0Var, new r0("Outlined", 1)};
        f80970c = r0VarArr;
        EnumEntriesKt.a(r0VarArr);
        f80968a = new l();
        f80969b = r0Var;
    }

    public static r0 valueOf(String str) {
        return (r0) Enum.valueOf(r0.class, str);
    }

    public static r0[] values() {
        return (r0[]) f80970c.clone();
    }
}
