package r10;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class n0 {

    /* renamed from: b, reason: collision with root package name */
    public static final n0 f85192b;

    /* renamed from: c, reason: collision with root package name */
    public static final n0 f85193c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ n0[] f85194d;

    /* renamed from: a, reason: collision with root package name */
    public final String f85195a;

    static {
        n0 n0Var = new n0("CROP_CIRCLE", 0, "cropCircle");
        f85192b = n0Var;
        n0 n0Var2 = new n0("PLATE", 1, "commonIcon");
        n0 n0Var3 = new n0("TINT_TO_TEXT_COLOR", 2, "_nova_tintToTextColor");
        f85193c = n0Var3;
        n0[] n0VarArr = {n0Var, n0Var2, n0Var3};
        f85194d = n0VarArr;
        EnumEntriesKt.a(n0VarArr);
    }

    public n0(String str, int i5, String str2) {
        this.f85195a = str2;
    }

    public static n0 valueOf(String str) {
        return (n0) Enum.valueOf(n0.class, str);
    }

    public static n0[] values() {
        return (n0[]) f85194d.clone();
    }
}
