package p1;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class l1 {

    /* renamed from: a, reason: collision with root package name */
    public static final l1 f81493a;

    /* renamed from: b, reason: collision with root package name */
    public static final l1 f81494b;

    /* renamed from: c, reason: collision with root package name */
    public static final l1 f81495c;

    /* renamed from: d, reason: collision with root package name */
    public static final l1 f81496d;

    /* renamed from: e, reason: collision with root package name */
    public static final l1 f81497e;

    /* renamed from: f, reason: collision with root package name */
    public static final l1 f81498f;

    /* renamed from: g, reason: collision with root package name */
    public static final l1 f81499g;

    /* renamed from: h, reason: collision with root package name */
    public static final /* synthetic */ l1[] f81500h;

    static {
        l1 l1Var = new l1("Invalid", 0);
        f81493a = l1Var;
        l1 l1Var2 = new l1("Cancelled", 1);
        f81494b = l1Var2;
        l1 l1Var3 = new l1("InitialPending", 2);
        f81495c = l1Var3;
        l1 l1Var4 = new l1("RecomposePending", 3);
        f81496d = l1Var4;
        l1 l1Var5 = new l1("Recomposing", 4);
        f81497e = l1Var5;
        l1 l1Var6 = new l1("ApplyPending", 5);
        f81498f = l1Var6;
        l1 l1Var7 = new l1("Applied", 6);
        f81499g = l1Var7;
        l1[] l1VarArr = {l1Var, l1Var2, l1Var3, l1Var4, l1Var5, l1Var6, l1Var7};
        f81500h = l1VarArr;
        EnumEntriesKt.a(l1VarArr);
    }

    public static l1 valueOf(String str) {
        return (l1) Enum.valueOf(l1.class, str);
    }

    public static l1[] values() {
        return (l1[]) f81500h.clone();
    }
}
