package ni;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class c0 {

    /* renamed from: b, reason: collision with root package name */
    public static final c0 f78254b;

    /* renamed from: c, reason: collision with root package name */
    public static final c0 f78255c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ c0[] f78256d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ i70.a f78257e;

    /* renamed from: a, reason: collision with root package name */
    public final int f78258a;

    static {
        c0 c0Var = new c0("DEFAULT", 0, 0);
        f78254b = c0Var;
        c0 c0Var2 = new c0("ENABLED", 1, 1);
        c0 c0Var3 = new c0("DISABLED", 2, 2);
        f78255c = c0Var3;
        c0[] c0VarArr = {c0Var, c0Var2, c0Var3};
        f78256d = c0VarArr;
        f78257e = EnumEntriesKt.a(c0VarArr);
    }

    public c0(String str, int i5, int i11) {
        this.f78258a = i11;
    }

    public static c0[] values() {
        return (c0[]) f78256d.clone();
    }
}
