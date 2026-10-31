package b0;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class r0 {

    /* renamed from: a, reason: collision with root package name */
    public static final r0 f16218a;

    /* renamed from: b, reason: collision with root package name */
    public static final r0 f16219b;

    /* renamed from: c, reason: collision with root package name */
    public static final r0 f16220c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ r0[] f16221d;

    static {
        r0 r0Var = new r0("PreEnter", 0);
        f16218a = r0Var;
        r0 r0Var2 = new r0("Visible", 1);
        f16219b = r0Var2;
        r0 r0Var3 = new r0("PostExit", 2);
        f16220c = r0Var3;
        r0[] r0VarArr = {r0Var, r0Var2, r0Var3};
        f16221d = r0VarArr;
        EnumEntriesKt.a(r0VarArr);
    }

    public static r0 valueOf(String str) {
        return (r0) Enum.valueOf(r0.class, str);
    }

    public static r0[] values() {
        return (r0[]) f16221d.clone();
    }
}
