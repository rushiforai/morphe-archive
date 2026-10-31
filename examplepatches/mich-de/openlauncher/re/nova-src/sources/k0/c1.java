package k0;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes2.dex */
public final class c1 {

    /* renamed from: a, reason: collision with root package name */
    public static final c1 f70577a;

    /* renamed from: b, reason: collision with root package name */
    public static final c1 f70578b;

    /* renamed from: c, reason: collision with root package name */
    public static final /* synthetic */ c1[] f70579c;

    static {
        c1 c1Var = new c1("Min", 0);
        f70577a = c1Var;
        c1 c1Var2 = new c1("Max", 1);
        f70578b = c1Var2;
        c1[] c1VarArr = {c1Var, c1Var2};
        f70579c = c1VarArr;
        EnumEntriesKt.a(c1VarArr);
    }

    public static c1 valueOf(String str) {
        return (c1) Enum.valueOf(c1.class, str);
    }

    public static c1[] values() {
        return (c1[]) f70579c.clone();
    }
}
