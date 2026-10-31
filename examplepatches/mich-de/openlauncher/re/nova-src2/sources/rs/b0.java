package rs;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class b0 {

    /* renamed from: a, reason: collision with root package name */
    public static final b0 f86154a;

    /* renamed from: b, reason: collision with root package name */
    public static final b0 f86155b;

    /* renamed from: c, reason: collision with root package name */
    public static final b0 f86156c;

    /* renamed from: d, reason: collision with root package name */
    public static final b0 f86157d;

    /* renamed from: e, reason: collision with root package name */
    public static final b0 f86158e;

    /* renamed from: f, reason: collision with root package name */
    public static final b0 f86159f;

    /* renamed from: g, reason: collision with root package name */
    public static final b0 f86160g;

    /* renamed from: h, reason: collision with root package name */
    public static final b0 f86161h;

    /* renamed from: i, reason: collision with root package name */
    public static final b0 f86162i;

    /* renamed from: j, reason: collision with root package name */
    public static final b0 f86163j;

    /* renamed from: k, reason: collision with root package name */
    public static final /* synthetic */ b0[] f86164k;

    static {
        b0 b0Var = new b0("Checkbox", 0);
        f86154a = b0Var;
        b0 b0Var2 = new b0("CheckboxWithPrefilledEmail", 1);
        f86155b = b0Var2;
        b0 b0Var3 = new b0("CheckboxWithPrefilledEmailAndPhone", 2);
        f86156c = b0Var3;
        b0 b0Var4 = new b0("Implied", 3);
        f86157d = b0Var4;
        b0 b0Var5 = new b0("ImpliedWithPrefilledEmail", 4);
        f86158e = b0Var5;
        b0 b0Var6 = new b0("DefaultOptInWithAllPrefilled", 5);
        f86159f = b0Var6;
        b0 b0Var7 = new b0("DefaultOptInWithSomePrefilled", 6);
        f86160g = b0Var7;
        b0 b0Var8 = new b0("DefaultOptInWithNonePrefilled", 7);
        f86161h = b0Var8;
        b0 b0Var9 = new b0("SignUpOptInMobileChecked", 8);
        f86162i = b0Var9;
        b0 b0Var10 = new b0("SignUpOptInMobilePrechecked", 9);
        f86163j = b0Var10;
        b0[] b0VarArr = {b0Var, b0Var2, b0Var3, b0Var4, b0Var5, b0Var6, b0Var7, b0Var8, b0Var9, b0Var10};
        f86164k = b0VarArr;
        EnumEntriesKt.a(b0VarArr);
    }

    public static b0 valueOf(String str) {
        return (b0) Enum.valueOf(b0.class, str);
    }

    public static b0[] values() {
        return (b0[]) f86164k.clone();
    }
}
