package b3;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes.dex */
public final class l0 {

    /* renamed from: a, reason: collision with root package name */
    public static final l0 f17281a;

    /* renamed from: b, reason: collision with root package name */
    public static final l0 f17282b;

    /* renamed from: c, reason: collision with root package name */
    public static final l0 f17283c;

    /* renamed from: d, reason: collision with root package name */
    public static final l0 f17284d;

    /* renamed from: e, reason: collision with root package name */
    public static final l0 f17285e;

    /* renamed from: f, reason: collision with root package name */
    public static final /* synthetic */ l0[] f17286f;

    static {
        l0 l0Var = new l0("Measuring", 0);
        f17281a = l0Var;
        l0 l0Var2 = new l0("LookaheadMeasuring", 1);
        f17282b = l0Var2;
        l0 l0Var3 = new l0("LayingOut", 2);
        f17283c = l0Var3;
        l0 l0Var4 = new l0("LookaheadLayingOut", 3);
        f17284d = l0Var4;
        l0 l0Var5 = new l0("Idle", 4);
        f17285e = l0Var5;
        l0[] l0VarArr = {l0Var, l0Var2, l0Var3, l0Var4, l0Var5};
        f17286f = l0VarArr;
        EnumEntriesKt.a(l0VarArr);
    }

    public static l0 valueOf(String str) {
        return (l0) Enum.valueOf(l0.class, str);
    }

    public static l0[] values() {
        return (l0[]) f17286f.clone();
    }
}
