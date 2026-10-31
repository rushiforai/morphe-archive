package ou;

import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes4.dex */
public final class m0 {

    /* renamed from: a, reason: collision with root package name */
    public static final m0 f80931a;

    /* renamed from: b, reason: collision with root package name */
    public static final m0 f80932b;

    /* renamed from: c, reason: collision with root package name */
    public static final m0 f80933c;

    /* renamed from: d, reason: collision with root package name */
    public static final /* synthetic */ m0[] f80934d;

    static {
        m0 m0Var = new m0("Automatic", 0);
        f80931a = m0Var;
        m0 m0Var2 = new m0("Never", 1);
        f80932b = m0Var2;
        m0 m0Var3 = new m0("Full", 2);
        f80933c = m0Var3;
        m0[] m0VarArr = {m0Var, m0Var2, m0Var3};
        f80934d = m0VarArr;
        EnumEntriesKt.a(m0VarArr);
    }

    public static m0 valueOf(String str) {
        return (m0) Enum.valueOf(m0.class, str);
    }

    public static m0[] values() {
        return (m0[]) f80934d.clone();
    }
}
