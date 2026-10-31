package k0;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class p0 {

    /* renamed from: a, reason: collision with root package name */
    public static final p0 f70698a;

    /* renamed from: b, reason: collision with root package name */
    public static final p0 f70699b;

    /* renamed from: c, reason: collision with root package name */
    public static final p0 f70700c;

    /* renamed from: d, reason: collision with root package name */
    public static final p0 f70701d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ p0[] f70702e;

    static {
        p0 p0Var = new p0("Visible", 0);
        f70698a = p0Var;
        p0 p0Var2 = new p0("Clip", 1);
        f70699b = p0Var2;
        p0 p0Var3 = new p0("ExpandIndicator", 2);
        f70700c = p0Var3;
        p0 p0Var4 = new p0("ExpandOrCollapseIndicator", 3);
        f70701d = p0Var4;
        p0[] p0VarArr = {p0Var, p0Var2, p0Var3, p0Var4};
        f70702e = p0VarArr;
        EnumEntriesKt.a(p0VarArr);
    }

    public static p0 valueOf(String str) {
        return (p0) Enum.valueOf(p0.class, str);
    }

    public static p0[] values() {
        return (p0[]) f70702e.clone();
    }
}
