package ou;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class v0 {

    /* renamed from: a, reason: collision with root package name */
    public static final v0 f80991a;

    /* renamed from: b, reason: collision with root package name */
    public static final v0 f80992b;

    /* renamed from: c, reason: collision with root package name */
    public static final v0 f80993c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ v0[] f80994d;

    static {
        v0 v0Var = new v0("Horizontal", 0);
        f80991a = v0Var;
        v0 v0Var2 = new v0("Vertical", 1);
        f80992b = v0Var2;
        v0 v0Var3 = new v0("Automatic", 2);
        f80993c = v0Var3;
        v0[] v0VarArr = {v0Var, v0Var2, v0Var3};
        f80994d = v0VarArr;
        EnumEntriesKt.a(v0VarArr);
    }

    public static v0 valueOf(String str) {
        return (v0) Enum.valueOf(v0.class, str);
    }

    public static v0[] values() {
        return (v0[]) f80994d.clone();
    }
}
