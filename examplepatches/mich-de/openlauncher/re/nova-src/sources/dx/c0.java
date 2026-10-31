package dx;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class c0 {

    /* renamed from: a, reason: collision with root package name */
    public static final c0 f49689a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ c0[] f49690b;

    static {
        c0 c0Var = new c0("STANDARD", 0);
        c0 c0Var2 = new c0("MEDIUM_RECTANGLE", 1);
        c0 c0Var3 = new c0("ADAPTIVE_INLINE", 2);
        f49689a = c0Var3;
        c0[] c0VarArr = {c0Var, c0Var2, c0Var3};
        f49690b = c0VarArr;
        EnumEntriesKt.a(c0VarArr);
    }

    public static c0 valueOf(String str) {
        return (c0) Enum.valueOf(c0.class, str);
    }

    public static c0[] values() {
        return (c0[]) f49690b.clone();
    }
}
