package r3;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class b0 {

    /* renamed from: a, reason: collision with root package name */
    public static final b0 f85396a;

    /* renamed from: b, reason: collision with root package name */
    public static final b0 f85397b;

    /* renamed from: c, reason: collision with root package name */
    public static final b0 f85398c;

    /* renamed from: d, reason: collision with root package name */
    public static final b0 f85399d;

    /* renamed from: e, reason: collision with root package name */
    public static final /* synthetic */ b0[] f85400e;

    static {
        b0 b0Var = new b0("StartInput", 0);
        f85396a = b0Var;
        b0 b0Var2 = new b0("StopInput", 1);
        f85397b = b0Var2;
        b0 b0Var3 = new b0("ShowKeyboard", 2);
        f85398c = b0Var3;
        b0 b0Var4 = new b0("HideKeyboard", 3);
        f85399d = b0Var4;
        b0[] b0VarArr = {b0Var, b0Var2, b0Var3, b0Var4};
        f85400e = b0VarArr;
        EnumEntriesKt.a(b0VarArr);
    }

    public static b0 valueOf(String str) {
        return (b0) Enum.valueOf(b0.class, str);
    }

    public static b0[] values() {
        return (b0[]) f85400e.clone();
    }
}
